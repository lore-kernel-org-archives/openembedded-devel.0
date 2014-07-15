Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD00704F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:35:02 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1X77Z9-0006Rk-ML for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2014 20:35:03 +0200
Received: from 74-92-165-193-Oregon.hfc.comcastbusiness.net ([74.92.165.193])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 20:35:03 +0200
Received: from stephanoc by 74-92-165-193-Oregon.hfc.comcastbusiness.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 20:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Stephano Cetola <stephanoc@gmail.com>
Date: Tue, 15 Jul 2014 18:33:30 +0000 (UTC)
Message-ID: <loom.20140715T203058-936@post.gmane.org>
References: <1405447315-798-1-git-send-email-stephanoc@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 74.92.165.193 (Mozilla/5.0 (X11;
	Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
	Chrome/35.0.1916.153 Safari/537.36)
Subject: Re: [meta-oe][PATCH] stop trying to remove folders that do not	exist
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
X-List-Received-Date: Tue, 15 Jul 2014 18:35:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Stephano Cetola <stephanoc <at> gmail.com> writes:

> 
> From: Stephano Cetola <scetola <at> reachtech.com>
> 
> The directory ${D}/${TMPDIR} does not exist. This patch removes code
> that was calling rm and rmdir on that location.
> 
> Signed-off-by: Stephano Cetola <scetola <at> reachtech.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-
devtools/php/php.inc
> index b1bf79c..000316b 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
>  <at>  <at>  -90,6 +90,12  <at>  <at>  do_install_append_pn-php() {
>      sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
>      install -m 0755 ${B}/sapi/fpm/init.d.php-fpm 
${D}${sysconfdir}/init.d/php-fpm
>      TMP=`dirname ${D}/${TMPDIR}`
> +    bbwarn "D"
> +    bbwarn ${D}
> +    bbwarn "TMPDIR"
> +    bbwarn ${TMPDIR}
> +    bbwarn "TMP"
> +    bbwarn ${TMP}
>      while test ${TMP} != ${D}; do
>          rmdir ${TMP}
>          TMP=`dirname ${TMP}`;

Sorry for the mixup. I was ssh'd into my testing machine at work and thought 
I was committing from my local machine. I have resubmitted. Sorry for the 
confusion.

-Stephano



