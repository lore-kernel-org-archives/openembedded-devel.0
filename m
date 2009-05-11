Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M3aBo-0007T0-LR
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 20:25:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M3a5U-0002wd-9D
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 18:18:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 18:18:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 18:18:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 May 2009 20:18:35 +0200
Message-ID: <gu9q5s$o98$1@ger.gmane.org>
References: <1242058903-17716-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <1242058903-17716-1-git-send-email-denis@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] curl: move PACKAGES and FILES_* from the .inc file
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
X-List-Received-Date: Mon, 11 May 2009 18:25:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-05-09 18:21, Denys Dmytriyenko wrote:
> this resolves the lockfile() trying to access the wrong directory
> when building sdk version after target one was built
>
> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
> Acked-by: Tom Rini<trini@embeddedalley.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/curl/{curl.inc =>  curl-common.inc} |   23 -----------------------
>   recipes/curl/curl-native_7.18.2.bb         |    4 ++--
>   recipes/curl/curl-sdk_7.18.2.bb            |    4 ++--
>   recipes/curl/curl-target.inc               |   22 ++++++++++++++++++++++
>   recipes/curl/curl_7.18.2.bb                |    4 +++-
>   recipes/curl/curl_7.19.0.bb                |    6 +++---
>   6 files changed, 32 insertions(+), 31 deletions(-)
>   rename recipes/curl/{curl.inc =>  curl-common.inc} (73%)
>   create mode 100644 recipes/curl/curl-target.inc
>
> diff --git a/recipes/curl/curl.inc b/recipes/curl/curl-common.inc
> similarity index 73%
> rename from recipes/curl/curl.inc
> rename to recipes/curl/curl-common.inc
> index d3edaef..ce4f5f2 100644
> --- a/recipes/curl/curl.inc
> +++ b/recipes/curl/curl-common.inc
> @@ -55,26 +55,3 @@ do_stage () {
>   	install -m 0644 ${S}/include/curl/*.h ${STAGING_INCDIR}/curl/
>   	oe_libinstall -so -a -C lib libcurl ${STAGING_LIBDIR}
>   }
> -
> -PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
> -
> -FILES_${PN} = "${bindir}/curl"
> -
> -FILES_${PN}-certs = "${datadir}/curl/curl-*"
> -PACKAGE_ARCH_${PN}-certs = "all"
> -
> -FILES_${PN}-doc = "${mandir}/man1/curl.1"
> -
> -FILES_lib${PN} = "${libdir}/lib*.so.*"
> -RRECOMMENDS_lib${PN} += "${PN}-certs"
> -FILES_lib${PN}-dev = "${includedir} \
> -                      ${libdir}/lib*.so \
> -                      ${libdir}/lib*.a \
> -                      ${libdir}/lib*.la \
> -                      ${libdir}/pkgconfig \
> -                      ${datadir}/aclocal \
> -                      ${bindir}/*-config"
> -
> -FILES_lib${PN}-doc = "${mandir}/man3 \
> -                      ${mandir}/man1/curl-config.1"
> -
> diff --git a/recipes/curl/curl-native_7.18.2.bb b/recipes/curl/curl-native_7.18.2.bb
> index f0e2b89..c95591b 100644
> --- a/recipes/curl/curl-native_7.18.2.bb
> +++ b/recipes/curl/curl-native_7.18.2.bb
> @@ -1,6 +1,7 @@
> -require curl_${PV}.bb
> +require curl-common.inc
>   inherit native
>   DEPENDS = "zlib-native"
> +PR = "r1"
>
>   do_stage () {
>   	autotools_stage_all
> @@ -9,4 +10,3 @@ do_stage () {
>   do_install() {
>   	:
>   }
> -
> diff --git a/recipes/curl/curl-sdk_7.18.2.bb b/recipes/curl/curl-sdk_7.18.2.bb
> index 816fe64..35b0d88 100644
> --- a/recipes/curl/curl-sdk_7.18.2.bb
> +++ b/recipes/curl/curl-sdk_7.18.2.bb
> @@ -1,6 +1,7 @@
> -require curl_${PV}.bb
> +require curl-common.inc
>   inherit sdk
>   DEPENDS = "zlib-sdk"
> +PR = "r1"
>
>   do_stage () {
>           install -d ${STAGING_INCDIR}/curl
> @@ -11,4 +12,3 @@ do_stage () {
>   do_install() {
>   	:
>   }
> -
> diff --git a/recipes/curl/curl-target.inc b/recipes/curl/curl-target.inc
> new file mode 100644
> index 0000000..88877e5
> --- /dev/null
> +++ b/recipes/curl/curl-target.inc
> @@ -0,0 +1,22 @@
> +PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
> +
> +FILES_${PN} = "${bindir}/curl"
> +
> +FILES_${PN}-certs = "${datadir}/curl/curl-*"
> +PACKAGE_ARCH_${PN}-certs = "all"
> +
> +FILES_${PN}-doc = "${mandir}/man1/curl.1"
> +
> +FILES_lib${PN} = "${libdir}/lib*.so.*"
> +RRECOMMENDS_lib${PN} += "${PN}-certs"
> +FILES_lib${PN}-dev = "${includedir} \
> +                      ${libdir}/lib*.so \
> +                      ${libdir}/lib*.a \
> +                      ${libdir}/lib*.la \
> +                      ${libdir}/pkgconfig \
> +                      ${datadir}/aclocal \
> +                      ${bindir}/*-config"
> +
> +FILES_lib${PN}-doc = "${mandir}/man3 \
> +                      ${mandir}/man1/curl-config.1"
> +
> diff --git a/recipes/curl/curl_7.18.2.bb b/recipes/curl/curl_7.18.2.bb
> index 2c3ec41..3de6da4 100644
> --- a/recipes/curl/curl_7.18.2.bb
> +++ b/recipes/curl/curl_7.18.2.bb
> @@ -1,2 +1,4 @@
> -require curl.inc
> +require curl-common.inc
> +require curl-target.inc
>
> +PR = "r1"
> diff --git a/recipes/curl/curl_7.19.0.bb b/recipes/curl/curl_7.19.0.bb
> index a99a68b..1944efe 100644
> --- a/recipes/curl/curl_7.19.0.bb
> +++ b/recipes/curl/curl_7.19.0.bb
> @@ -1,5 +1,5 @@
> -require curl.inc
> +require curl-common.inc
> +require curl-target.inc
>
>   SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0"
> -PR = "r1"
> -
> +PR = "r2"




