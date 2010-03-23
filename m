Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttTh-0002z4-0c
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:04:30 +0100
Received: (qmail 30615 invoked by uid 1003); 23 Mar 2010 02:00:59 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 02:00:59 -0000
Message-ID: <4BA820DA.3070502@balister.org>
Date: Mon, 22 Mar 2010 22:00:58 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-7-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269256016-13155-7-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Tue, 23 Mar 2010 02:04:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>


On 03/22/2010 07:06 AM, Marcin Juszkiewicz wrote:
> From: David-John Willis<John.Willis@Distant-earth.com>
>
> Signed-off-by: Chris Larson<clarson@mvista.com>
> ---
>   recipes/shadow/shadow.inc |   10 ++++++++--
>   1 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> index 83d06c3..4a40151 100644
> --- a/recipes/shadow/shadow.inc
> +++ b/recipes/shadow/shadow.inc
> @@ -11,7 +11,7 @@ LICENSE = "BSD"
>   SECTION = "base"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> -INC_PR = "r6"
> +INC_PR = "r7"
>
>   # Additional Policy files for PAM
>   PAM_SRC_URI = " \
> @@ -23,6 +23,7 @@ PAM_SRC_URI = " \
>              file://pam.d/passwd \
>              file://pam.d/su \
>   "
> +
>   SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
>              file://login_defs_pam.sed \
>              ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> @@ -53,6 +54,10 @@ END
>   }
>
>   do_install_append() {
> +  # Ensure that /etc/skel is created so any default files that we want copied into new users home
> +  # dirs can be put in there later (ideal for .xinitrc for example).
> +  install -d ${D}${sysconfdir}/skel/
> +
>     # Ensure that the image has as /var/spool/mail dir so shadow can put mailboxes there if the user
>     # reconfigures Shadow to default (see sed below).
>     install -d ${D}${SHADOW_MAILDIR}
> @@ -77,7 +82,8 @@ do_install_append() {
>     mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
>     mv ${D}${bindir}/passwd ${D}${bindir}/chpasswd.${PN}
>
> -  install -m 0644 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
> +  # Ensure we add a suitable securetty file to the package that has most common embedded TTYs defined.
> +  install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
>   }
>
>   pkg_postinst_${PN} () {


