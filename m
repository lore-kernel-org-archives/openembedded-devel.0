Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttTJ-0002qt-QE
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:04:28 +0100
Received: (qmail 8990 invoked by uid 1003); 23 Mar 2010 02:00:49 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 02:00:48 -0000
Message-ID: <4BA820CF.2060705@balister.org>
Date: Mon, 22 Mar 2010 22:00:47 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-6-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269256016-13155-6-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] shadow: reorg into .inc, pull some mvl6 changes over, use a 'pam' distro feature.
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
> From: Chris Larson<clarson@mvista.com>
>
> Signed-off-by: Chris Larson<clarson@mvista.com>
> ---
>   recipes/shadow/shadow.inc        |   91 ++++++++++++++++++++++++++++++++++++++
>   recipes/shadow/shadow_4.1.4.1.bb |    3 +
>   recipes/shadow/shadow_4.1.4.2.bb |   55 +----------------------
>   recipes/shadow/shadow_4.1.4.bb   |   12 +----
>   4 files changed, 98 insertions(+), 63 deletions(-)
>   create mode 100644 recipes/shadow/shadow.inc
>   create mode 100644 recipes/shadow/shadow_4.1.4.1.bb
>
> diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
> new file mode 100644
> index 0000000..83d06c3
> --- /dev/null
> +++ b/recipes/shadow/shadow.inc
> @@ -0,0 +1,91 @@
> +# Configuration parameters
> +SHADOW_MAILFILE ?= "Mailbox"
> +SHADOW_MAILDIR ?= "${localstatedir}/spool/mail"
> +SHADOW_UTMPDIR ?= "${localstatedir}/utmp"
> +SHADOW_LOGDIR ?= "${localstatedir}/log"
> +
> +# Metadata
> +DESCRIPTION = "Tools to change and administer password and group data."
> +HOMEPAGE = "http://pkg-shadow.alioth.debian.org/"
> +LICENSE = "BSD"
> +SECTION = "base"
> +DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +
> +INC_PR = "r6"
> +
> +# Additional Policy files for PAM
> +PAM_SRC_URI = " \
> +           file://pam.d/chfn \
> +           file://pam.d/chpasswd \
> +           file://pam.d/chsh \
> +           file://pam.d/login \
> +           file://pam.d/newusers \
> +           file://pam.d/passwd \
> +           file://pam.d/su \
> +"
> +SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
> +           file://login_defs_pam.sed \
> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> +           file://securetty \
> +"
> +
> +inherit autotools gettext
> +
> +EXTRA_OECONF += "\
> +    --disable-account-tools-setuid \
> +    --without-audit \
> +    --without-selinux \
> +    --without-libcrack \
> +    ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
> +"
> +
> +CFLAGS += "-I../include"
> +
> +do_configure_prepend () {
> +    export CONFIG_SITE="${CONFIG_SITE} ${B}/cachedpaths"
> +    cat<<END>${B}/cachedpaths
> +shadow_cv_maildir=${SHADOW_MAILDIR}
> +shadow_cv_mailfile=${SHADOW_MAILFILE}
> +shadow_cv_utmpdir=${SHADOW_UTMPDIR}
> +shadow_cv_logdir=${SHADOW_LOGDIR}
> +shadow_cv_passwd_dir=${bindir}
> +END
> +}
> +
> +do_install_append() {
> +  # Ensure that the image has as /var/spool/mail dir so shadow can put mailboxes there if the user
> +  # reconfigures Shadow to default (see sed below).
> +  install -d ${D}${SHADOW_MAILDIR}
> +
> +  if [ -e ${WORKDIR}/pam.d ]; then
> +      install -d ${D}${sysconfdir}/pam.d/
> +      install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
> +  fi
> +
> +  # Remove defaults that are not used when supporting PAM
> +  ${@base_contains('DISTRO_FEATURES', 'pam', 'sed -i -f ${WORKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs', '', d)}
> +
> +  # Enable CREATE_HOME by default.
> +  sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
> +
> +  # As we are on an embedded system ensure the users mailbox is in ~/ not
> +  # /var/spool/mail by default as who knows where or how big /var is.
> +  # The system MDA will set this later anyway.
> +  sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
> +  sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
> +
> +  mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
> +  mv ${D}${bindir}/passwd ${D}${bindir}/chpasswd.${PN}
> +
> +  install -m 0644 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
> +}
> +
> +pkg_postinst_${PN} () {
> +    update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 100
> +    update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> +    update-alternatives --remove passwd passwd.${PN}
> +    update-alternatives --remove chpasswd chpasswd.${PN}
> +}
> diff --git a/recipes/shadow/shadow_4.1.4.1.bb b/recipes/shadow/shadow_4.1.4.1.bb
> new file mode 100644
> index 0000000..7f9d403
> --- /dev/null
> +++ b/recipes/shadow/shadow_4.1.4.1.bb
> @@ -0,0 +1,3 @@
> +require shadow.inc
> +
> +PR = "${INC_PR}.0"
> diff --git a/recipes/shadow/shadow_4.1.4.2.bb b/recipes/shadow/shadow_4.1.4.2.bb
> index b53f89f..7f9d403 100644
> --- a/recipes/shadow/shadow_4.1.4.2.bb
> +++ b/recipes/shadow/shadow_4.1.4.2.bb
> @@ -1,54 +1,3 @@
> -DESCRIPTION = "login/password and account utilities"
> -LICENSE = "GPL"
> +require shadow.inc
>
> -DEPENDS = "libpam"
> -
> -PR = "r6"
> -
> -EXTRA_OECONF += " --enable-shared  --enable-static --with-libpam --without-libcrack"
> -
> -inherit autotools
> -
> -HOMEPAGE = "http://pkg-shadow.alioth.debian.org/"
> -SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
> -           file://login_defs_pam.sed \
> -"
> -
> -# Additional Policy files for PAM
> -SRC_URI_append = " \
> -           file://pam.d/chfn \
> -           file://pam.d/chpasswd \
> -           file://pam.d/chsh \
> -           file://pam.d/login \
> -           file://pam.d/newusers \
> -           file://pam.d/passwd \
> -           file://pam.d/su \
> -           file://securetty \
> -"
> -
> -S = "${WORKDIR}/shadow-${PV}"
> -
> -CFLAGS_append = " -I../include"
> -
> -do_install_append() {
> -  # Ensure that the image has as /var/spool/mail dir so shadow can put mailboxes there if the user
> -  # reconfigures Shadow to default (see sed below).
> -  install -d ${D}${localstatedir}/spool/mail/
> -
> -  install -d ${D}${sysconfdir}/pam.d/
> -  install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
> -
> -  # Remove defaults that are not used when supporting PAM
> -  sed -i -f ${WORKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
> -
> -  # Enable CREATE_HOME by default.
> -  sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
> -
> -  # As we are on an embedded system ensure the users mailbox is in ~/ not
> -  # /var/spool/mail by default as who knows where or how big /var is.
> -  # The system MDA will set this later anyway.
> -  sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
> -  sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
> -
> -  install -m 0644 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
> -}
> +PR = "${INC_PR}.0"
> diff --git a/recipes/shadow/shadow_4.1.4.bb b/recipes/shadow/shadow_4.1.4.bb
> index 393edce..7f9d403 100644
> --- a/recipes/shadow/shadow_4.1.4.bb
> +++ b/recipes/shadow/shadow_4.1.4.bb
> @@ -1,11 +1,3 @@
> -DESCRIPTION = "login/password utilities"
> -LICENSE = "GPL"
> -
> -inherit autotools
> -
> -SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.gz"
> -
> -S = "${WORKDIR}/shadow-${PV}"
> -
> -CFLAGS_append = " -I../include"
> +require shadow.inc
>
> +PR = "${INC_PR}.0"


