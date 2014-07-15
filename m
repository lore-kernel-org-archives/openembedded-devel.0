Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id DD3BD704C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 22:39:34 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1X7BNj-00029v-I1 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jul 2014 00:39:31 +0200
Received: from 74-92-165-193-Oregon.hfc.comcastbusiness.net ([74.92.165.193])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 00:39:31 +0200
Received: from stephanoc by 74-92-165-193-Oregon.hfc.comcastbusiness.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 00:39:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Stephano Cetola <stephanoc@gmail.com>
Date: Tue, 15 Jul 2014 22:39:17 +0000 (UTC)
Message-ID: <loom.20140716T003708-65@post.gmane.org>
References: <1405447671-23272-1-git-send-email-stephanoc@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 74.92.165.193 (Mozilla/5.0 (X11;
	Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
	Chrome/35.0.1916.153 Safari/537.36)
Subject: Re: [meta-oe][PATCH] php: stop removing directories that do not	exist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 22:39:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Stephano Cetola <stephanoc <at> gmail.com> writes:

> 
> The directory ${D}/${TMPDIR} does not exist. This patch removes code
> that was calling rm and rmdir on that location.
> 
> Signed-off-by: Stephano Cetola <stephanoc <at> gmail.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc |    6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-
devtools/php/php.inc
> index b1bf79c..011eea7 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
>  <at>  <at>  -74,7 +74,6  <at>  <at>  do_install_append_pn-php() {
>      if [ -d ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ];then
>           mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* 
${D}/${sysconfdir}/
>      fi
> -    rm -rf ${D}/${TMPDIR}
>      rm -rf ${D}/.registry
>      rm -rf ${D}/.channels
>      rm -rf ${D}/.[a-z]*
>  <at>  <at>  -89,11 +88,6  <at>  <at>  do_install_append_pn-php() {
>      sed -i 's:=/etc:=${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
>      sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
>      install -m 0755 ${B}/sapi/fpm/init.d.php-fpm 
${D}${sysconfdir}/init.d/php-fpm
> -    TMP=`dirname ${D}/${TMPDIR}`
> -    while test ${TMP} != ${D}; do
> -        rmdir ${TMP}
> -        TMP=`dirname ${TMP}`;
> -    done
>  }
> 
>  PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 
${PN}-pear ${PN}-dev
> ${PN}-staticdev ${PN}-doc ${PN}"

Please disregard this patch. It is only a partial fix.

I think I am beginning to understand the comment at the beginning of 
do_install_append_pn-php. I will dig into this further.

Kind Regards,
Stephano




