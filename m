Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nth3E-0006JJ-ID for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:48:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nth0B-0001Jl-Ql for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:45:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:45:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Mar 2010 13:34:56 +0100
Message-ID: <ho7o5g$nb2$8@dough.gmane.org>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-7-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <1269256016-13155-7-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] shadow.inc: Correctly install /etc/securetty and add back support for creating /etc/skel as part of the recipe.
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
X-List-Received-Date: Mon, 22 Mar 2010 12:48:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 22-03-10 12:06, Marcin Juszkiewicz wrote:
> From: David-John Willis <John.Willis@Distant-earth.com>
> 
> Signed-off-by: Chris Larson <clarson@mvista.com>
> ---
>  recipes/shadow/shadow.inc |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 83d06c3..4a40151 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE = "BSD"
>  SECTION = "base"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  
> -INC_PR = "r6"
> +INC_PR = "r7"
>  
>  # Additional Policy files for PAM
>  PAM_SRC_URI = " \
> @@ -23,6 +23,7 @@ PAM_SRC_URI = " \
>             file://pam.d/passwd \
>             file://pam.d/su \
>  "
> +
>  SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
>             file://login_defs_pam.sed \
>             ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> @@ -53,6 +54,10 @@ END
>  }
>  
>  do_install_append() {
> +  # Ensure that /etc/skel is created so any default files that we want copied into new users home
> +  # dirs can be put in there later (ideal for .xinitrc for example).
> +  install -d ${D}${sysconfdir}/skel/  
> +  
>    # Ensure that the image has as /var/spool/mail dir so shadow can put mailboxes there if the user
>    # reconfigures Shadow to default (see sed below).
>    install -d ${D}${SHADOW_MAILDIR}
> @@ -77,7 +82,8 @@ do_install_append() {
>    mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
>    mv ${D}${bindir}/passwd ${D}${bindir}/chpasswd.${PN}
>  
> -  install -m 0644 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
> +  # Ensure we add a suitable securetty file to the package that has most common embedded TTYs defined.
> +  install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
>  }
>  
>  pkg_postinst_${PN} () {

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFLp2PwMkyGM64RGpERAhTHAJiaGQ51nWL46FMwHFNAE1RvlZl2AJ4rycS6
0sJk+0OiMu4dSpm658xJDg==
=GHy8
-----END PGP SIGNATURE-----



