Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LrYWX-0005HJ-CZ
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 16:13:11 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LrYTa-0000yr-7J
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 14:10:02 +0000
Received: from pool-96-240-173-146.ronkva.east.verizon.net ([96.240.173.146])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 14:10:02 +0000
Received: from philip by pool-96-240-173-146.ronkva.east.verizon.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 14:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Philip Balister <philip@balister.org>
Date: Wed, 08 Apr 2009 08:46:42 -0400
Message-ID: <gri6bi$47n$1@ger.gmane.org>
References: <1238848697-20191-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: pool-96-240-173-146.ronkva.east.verizon.net
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
In-Reply-To: <1238848697-20191-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] gstreamer-ti: fix path to codec combos
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Apr 2009 14:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> ---
>     gstreamer-ti_svn.bb     |   11 +++++++++--
>     ti-codec-combos_3.16.bb |    7 +++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
>    
> diff --git a/recipes/dsplink/gstreamer-ti_svn.bb b/recipes/dsplink/gstreamer-ti_svn.bb
> index e14f262..ab705f3 100644
> --- a/recipes/dsplink/gstreamer-ti_svn.bb
> +++ b/recipes/dsplink/gstreamer-ti_svn.bb
> @@ -4,7 +4,7 @@ SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=
>            "
>  SRCREV = "160"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  # Again, no '.' in PWD allowed :(
>  PV = "0+svnr${SRCREV}"
> @@ -32,6 +32,14 @@ export XDC_PLATFORM
>  #GCArmv5T.cc.opts = "SEDME_CCARCH";
>  #GCArmv5T.cc.$seal("opts");
>  
> +do_configure_prepend() {
> +	for i in ${S}/src/*.cfg ; do
> +		sed -i -e s:\./encodeCombo.x64P:${datadir}/ti-codec-combos/encodeCombo.x64P:g \
> +	           -e s:\./decodeCombo.x64P:${datadir}/ti-codec-combos/decodeCombo.x64P:g \
> +	           $i
> +	done
> +}
> +
>  do_compile_prepend() {
>  	for i in $(find ${S} -name "config.bld") ; do
>  		    sed -i -e s:SEDME_CCARCH:'${TARGET_CCARCH}': $i
> diff --git a/recipes/dsplink/ti-codec-combos_3.16.bb b/recipes/dsplink/ti-codec-combos_3.16.bb
> index dd97a57..6bab35a 100644
> --- a/recipes/dsplink/ti-codec-combos_3.16.bb
> +++ b/recipes/dsplink/ti-codec-combos_3.16.bb
> @@ -13,7 +13,7 @@ S = "${WORKDIR}/omap3530_dvsdk_combos_3_16"
>  
>  # Yes, the xdc stuff still breaks with a '.' in PWD
>  PV = "316"
> -PR = "r14"
> +PR = "r15"
>  
>  TARGET = "all"
>  
> @@ -77,6 +77,10 @@ do_install () {
>  do_stage () {
>  	install -d ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos
>  	cp -pPrf ${S}/* ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos
> +	for codec in encode decode ; do
> +		mkdir -p  ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos/packages/ti/sdo/servers/$codec/package/info/${datadir}/ti-codec-combos
> +		ln -sf ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos/packages/ti/sdo/servers/$codec/package/info/$codec* ${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/ti-codec-combos/packages/ti/sdo/servers/$codec/package/info/${datadir}/ti-codec-combos
> +	done
>  }
>  
>  FILES_ti-codec-combos = "${datadir}/ti-codec-combos/*"



