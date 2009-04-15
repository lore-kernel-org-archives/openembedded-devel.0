Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lu3UB-00027l-Us
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 13:41:14 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lu3QX-00037c-RU
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 11:37:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 11:37:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Apr 2009 11:37:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Apr 2009 13:37:01 +0200
Message-ID: <gs4gst$pi6$1@ger.gmane.org>
References: <1239795062-31939-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <1239795062-31939-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clamav: add 0.94.2 version recipe
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
X-List-Received-Date: Wed, 15 Apr 2009 11:41:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-04-09 13:31, Roman I Khimov wrote:
> ---
>   conf/checksums.ini              |    4 ++++
>   recipes/clamav/clamav.inc       |    4 ++--
>   recipes/clamav/clamav_0.90.2.bb |    2 ++
>   recipes/clamav/clamav_0.90.3.bb |    2 ++
>   recipes/clamav/clamav_0.91.1.bb |    2 ++
>   recipes/clamav/clamav_0.94.2.bb |    3 +++
>   6 files changed, 15 insertions(+), 2 deletions(-)
>   create mode 100644 recipes/clamav/clamav_0.94.2.bb

looks good to me.


>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 909a0e0..9f11943 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -3538,6 +3538,10 @@ sha256=f98edecae40473c142fe49a0e02f5ff7fb28d778c4bd510dad747d208d20cb00
>   md5=60152bf1e24b3fbdf0473794199e5215
>   sha256=f98edecae40473c142fe49a0e02f5ff7fb28d778c4bd510dad747d208d20cb00
>
> +[http://downloads.sourceforge.net/clamav/clamav-0.94.2.tar.gz]
> +md5=1181e6d62341b84708f126cc353f7ebf
> +sha256=1aec7fecff375958d067aceeb9782d3ff0be7c13bed0eecf6240fb089f8d268c
> +
>   [http://memberwebs.com/nielsen/software/clamsmtp/clamsmtp-1.8.tar.gz]
>   md5=04da6aab94934641fcf9e7a7598346fb
>   sha256=c09b24c82f858845e235df4c8b2639240a7b786de66b595e351be86ab60663a5
> diff --git a/recipes/clamav/clamav.inc b/recipes/clamav/clamav.inc
> index 49b8023..5b2069e 100644
> --- a/recipes/clamav/clamav.inc
> +++ b/recipes/clamav/clamav.inc
> @@ -19,7 +19,6 @@ RRECOMMENDS_${PN}-daemon = "${PN}-freshclam"
>   RPROVIDES_${PN}-freshclam = "${PN}-data"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/clamav/clamav-${PV}.tar.gz \
> -          file://cross-compile-fix.patch;patch=1 \
>             file://clamav-daemon.init \
>             file://clamav-freshclam.init \
>             file://clamd.conf \
> @@ -67,10 +66,11 @@ do_stage () {
>   PACKAGES += "${PN}-freshclam ${PN}-daemon ${PN}-conf ${PN}-data ${PN}-lib \
>                ${PN}-clamconf"
>
> +LEAD_SONAME = "libclamav.so.*"
>   FILES_${PN} = "${bindir}/clamscan \
>                  ${bindir}/sigtool \
>                  ${bindir}/clamdscan"
> -FILES_${PN}-lib = "${libdir}/libclamav.so.*"
> +FILES_${PN}-lib = "${libdir}/libclamav.so.* ${libdir}/libclamunrar.so* ${libdir}/libclamunrar_iface.so*"
>   FILES_${PN}-conf = "${sysconfdir}/clamd.conf"
>   FILES_${PN}-clamconf = "${bindir}/clamconf"
>   FILES_${PN}-freshclam = "${bindir}/freshclam \
> diff --git a/recipes/clamav/clamav_0.90.2.bb b/recipes/clamav/clamav_0.90.2.bb
> index 9592adf..740c02a 100644
> --- a/recipes/clamav/clamav_0.90.2.bb
> +++ b/recipes/clamav/clamav_0.90.2.bb
> @@ -1,3 +1,5 @@
>   require clamav.inc
>
> +SRC_URI += "file://cross-compile-fix.patch;patch=1"
> +
>   PR = "r2"
> diff --git a/recipes/clamav/clamav_0.90.3.bb b/recipes/clamav/clamav_0.90.3.bb
> index e721558..2227f01 100644
> --- a/recipes/clamav/clamav_0.90.3.bb
> +++ b/recipes/clamav/clamav_0.90.3.bb
> @@ -1,3 +1,5 @@
>   require clamav.inc
>
> +SRC_URI += "file://cross-compile-fix.patch;patch=1"
> +
>   PR = "r1"
> diff --git a/recipes/clamav/clamav_0.91.1.bb b/recipes/clamav/clamav_0.91.1.bb
> index e721558..2227f01 100644
> --- a/recipes/clamav/clamav_0.91.1.bb
> +++ b/recipes/clamav/clamav_0.91.1.bb
> @@ -1,3 +1,5 @@
>   require clamav.inc
>
> +SRC_URI += "file://cross-compile-fix.patch;patch=1"
> +
>   PR = "r1"
> diff --git a/recipes/clamav/clamav_0.94.2.bb b/recipes/clamav/clamav_0.94.2.bb
> new file mode 100644
> index 0000000..12fad7a
> --- /dev/null
> +++ b/recipes/clamav/clamav_0.94.2.bb
> @@ -0,0 +1,3 @@
> +require clamav.inc
> +
> +EXTRA_OECONF += "--program-transform-name=''"




