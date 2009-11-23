Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NCU1C-0002MU-Su for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 09:11:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NCTzo-0004Va-OQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 09:10:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:10:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:10:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Nov 2009 09:08:40 +0100
Message-ID: <hedfu8$gol$2@ger.gmane.org>
References: <1258928770-18179-1-git-send-email-mok@mnet-online.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1258928770-18179-1-git-send-email-mok@mnet-online.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] e-wm_svn.bb: split ${sysconfdir}/xdg/menus/applications.menu into it's own package
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
X-List-Received-Date: Mon, 23 Nov 2009 08:11:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-11-09 23:26, mok@mnet-online.de wrote:
> From: Klaus Kurzmann<mok@fluxnetz.de>
>
> Signed-off-by: Klaus Kurzmann<mok@fluxnetz.de>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/e17/e-wm_svn.bb |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/e17/e-wm_svn.bb b/recipes/e17/e-wm_svn.bb
> index 83dbd81..a935728 100644
> --- a/recipes/e17/e-wm_svn.bb
> +++ b/recipes/e17/e-wm_svn.bb
> @@ -80,6 +80,7 @@ PACKAGES =+ "\
>     ${PN}-input-methods \
>     ${PN}-sysactions \
>     ${PN}-utils \
> +  ${PN}-menu \
>   "
>
>   RRECOMMENDS_${PN} = "\
> @@ -89,6 +90,7 @@ RRECOMMENDS_${PN} = "\
>     ${PN}-other \
>     ${PN}-input-methods \
>     ${PN}-sysactions \
> +  ${PN}-menu \
>   "
>
>   PACKAGE_ARCH_${PN}-config-default = "all"
> @@ -106,6 +108,7 @@ PACKAGE_ARCH_${PN}-icons = "all"
>   PACKAGE_ARCH_${PN}-other = "all"
>   PACKAGE_ARCH_${PN}-input-methods = "all"
>   PACKAGE_ARCH_${PN}-sysactions = "all"
> +PACKAGE_ARCH_${PN}-menu = "all"
>
>   FILES_${PN} = "\
>     ${bindir}/* \
> @@ -140,6 +143,7 @@ FILES_${PN}-other = "${datadir}/enlightenment/data/other"
>   FILES_${PN}-input-methods = "${datadir}/enlightenment/data/input_methods"
>   FILES_${PN}-sysactions = "${sysconfdir}/enlightenment/sysactions.conf"
>   FILES_${PN}-utils = "${libdir}/enlightenment/utils/*"
> +FILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
>
>   RRECOMMENDS_${PN}-config-default = "${PN}-theme-default"
>   RRECOMMENDS_${PN}-config-illume = "${PN}-theme-illume"
> @@ -165,7 +169,8 @@ FILES_${PN}-doc += "\
>     ${datadir}/enlightenment/doc \
>   "
>
> -CONFFILES_${PN} = "${sysconfdir}/xdg/menus/applications.menu"
> +CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
> +CONFFILES_${PN}-sysactions = "/etc/enlightenment/sysactions.conf"
>
>   ALTERNATIVE_PATH = "${bindir}/enlightenment_start.oe"
>   ALTERNATIVE_NAME = "x-window-manager"




