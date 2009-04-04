Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lq2VD-0001bW-4I
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 11:49:35 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lq2Sf-00020n-Aa
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 09:46:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 09:46:49 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 09:46:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 04 Apr 2009 11:46:34 +0200
Message-ID: <gr7a9q$4ld$1@ger.gmane.org>
References: <1238836674-23507-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238836674-23507-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gstreamer-ti: fix path to codec combos
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
X-List-Received-Date: Sat, 04 Apr 2009 09:49:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-04-09 11:17, Koen Kooi wrote:
> From: Koen Kooi<koen@openembedded.org>

Ignore this one, it depends on other things that haven't been committed yet.



>
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   recipes/dsplink/gstreamer-ti_svn.bb |   10 +++++++++-
>   1 files changed, 9 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/dsplink/gstreamer-ti_svn.bb b/recipes/dsplink/gstreamer-ti_svn.bb
> index e14f262..ab705f3 100644
> --- a/recipes/dsplink/gstreamer-ti_svn.bb
> +++ b/recipes/dsplink/gstreamer-ti_svn.bb
> @@ -4,7 +4,7 @@ SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=
>             "
>   SRCREV = "160"
>
> -PR = "r6"
> +PR = "r7"
>
>   # Again, no '.' in PWD allowed :(
>   PV = "0+svnr${SRCREV}"
> @@ -32,6 +32,14 @@ export XDC_PLATFORM
>   #GCArmv5T.cc.opts = "SEDME_CCARCH";
>   #GCArmv5T.cc.$seal("opts");
>
> +do_configure_prepend() {
> +	for i in ${S}/src/*.cfg ; do
> +		sed -i -e s:\./encodeCombo.x64P:${datadir}/ti-codec-combos/encodeCombo.x64P:g \
> +	           -e s:\./decodeCombo.x64P:${datadir}/ti-codec-combos/decodeCombo.x64P:g \
> +	           $i
> +	done
> +}
> +
>   do_compile_prepend() {
>   	for i in $(find ${S} -name "config.bld") ; do
>   		    sed -i -e s:SEDME_CCARCH:'${TARGET_CCARCH}': $i




