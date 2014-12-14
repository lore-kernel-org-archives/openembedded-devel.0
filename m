Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9D80372407
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 17:39:36 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id g10so8226945pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 09:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=qFQt6qyLGbaI1BI/RA8fcZEYJN1RHfSA4/df+UTbaLg=;
	b=J+GBw7813YSDLe6bOEY+cZ5Srtvgs+3vvp+IBjSMk04YKaIvJ7Phks4QIFKsT1B3RJ
	kT3FQDk3PjGnRCG7yBFeiTurNyI6cJrNwyPWPH0VsoGKr2TAdniiu/b3l5EaPt5GTxs/
	P0M+mqBchGadv8BgI0XahaEmfost/ei/HXIR8FHSQDZg7E8+ges+9cCwiKeXLY61JxNf
	kodTQhUdNAnfEj9INrxglJZhDZxJCfCk8ojvxZJ4HsvZWYyYhCzX4ZHybqhadJ/cHELI
	HRk3nEiPKxKdzphLkTW47neC+7ZrtBxnYRsq2aI48QoEXx+BngAmv94EctX3FqF10flo
	O1/A==
X-Gm-Message-State: ALoCoQkCARe0/yq2p8Ih0mFvgGmLt/8MpTcvM3WIGmvsaSs+To98hibbf716XUkVUEofg6EUtnVY
X-Received: by 10.67.24.99 with SMTP id ih3mr44231201pad.101.1418578777472;
	Sun, 14 Dec 2014 09:39:37 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:514e:15d4:f5e2:d462?
	([2601:c:9380:601:514e:15d4:f5e2:d462])
	by mx.google.com with ESMTPSA id
	xq16sm7027119pac.31.2014.12.14.09.39.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Dec 2014 09:39:36 -0800 (PST)
Message-ID: <548DCB4D.90004@mvista.com>
Date: Sun, 14 Dec 2014 09:39:25 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1418576074-5207-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1418576074-5207-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-networking][PATCH] netkit-rsh: add new package
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
X-List-Received-Date: Sun, 14 Dec 2014 17:39:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ignore this one. miss fire on send.

On 12/14/2014 08:54 AM, Armin Kuster wrote:
> V2: added PAM config option
>      fixed link bug
>      moved files to PN location
>      fixed BSD license
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   .../netkit-rsh/netkit-rsh/no_pam_build_fix.patch   | 32 ++++++++++++++++++
>   .../netkit-rsh/netkit-rsh/rexec.xinetd.netkit      | 20 ++++++++++++
>   .../netkit-rsh/netkit-rsh/rlogin.xinetd.netkit     | 23 +++++++++++++
>   .../rsh-redone_link_order_file.patch               | 15 ++++++++-
>   .../netkit-rsh/netkit-rsh/rsh.xinetd.netkit        | 21 ++++++++++++
>   .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 38 +++++++++++++---------
>   6 files changed, 132 insertions(+), 17 deletions(-)
>   create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch
>   create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
>   create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
>   rename meta-networking/recipes-netkit/netkit-rsh/{files => netkit-rsh}/rsh-redone_link_order_file.patch (81%)
>   create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
>
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch
> new file mode 100644
> index 0000000..3200a2d
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch
> @@ -0,0 +1,32 @@
> +Index: netkit-rsh-0.17/rshd/rshd.c
> +===================================================================
> +--- netkit-rsh-0.17.orig/rshd/rshd.c
> ++++ netkit-rsh-0.17/rshd/rshd.c
> +@@ -110,9 +110,11 @@ extern	char	**environ;
> + static void error(const char *fmt, ...);
> + static void doit(struct sockaddr *fromp, socklen_t fromlen);
> + static char *getstr(char *, size_t, const char *);
> ++#ifdef USE_PAM
> + static int err_conv(
> + 	int, const struct pam_message **, struct pam_response **, void *
> + );
> ++#endif /* USE_PAM */
> +
> + extern int _check_rhosts_file;
> +
> +@@ -256,6 +258,7 @@ static void stderr_parent(int sock, int
> + }
> +
> +
> ++#ifdef USE_PAM
> + static int err_conv(
> + 	int num_msg, const struct pam_message **msg,
> + 	struct pam_response **resp, void *appdata_ptr
> +@@ -266,6 +269,7 @@ static int err_conv(
> + 	(void) appdata_ptr;
> + 	return PAM_CONV_ERR;
> + }
> ++#endif
> +
> + static struct passwd *doauth(const char *remuser,
> + 			     const char *hostname,
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
> new file mode 100644
> index 0000000..80aed36
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
> @@ -0,0 +1,20 @@
> +# default: off
> +# description:
> +# Rexecd is the server for the rexec program. The server provides remote
> +# execution facilities with authentication based on user names and
> +# passwords.
> +#
> +service exec
> +{
> +	socket_type	= stream
> +	protocol	= tcp
> +	flags		= NAMEINARGS
> +	wait		= no
> +	user		= root
> +	group		= root
> +	log_on_success	+= USERID
> +	log_on_failure	+= USERID
> +	server		= /usr/bin/tcpd
> +	server_args	= /usr/sbin/in.rexecd
> +	disable		= yes
> +}
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
> new file mode 100644
> index 0000000..00dbf93
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
> @@ -0,0 +1,23 @@
> +# default: off
> +# description:
> +# Rlogind is a server for the rlogin program. The server provides remote
> +# execution with authentication based on privileged port numbers from trusted
> +# host
> +#
> +service login
> +{
> +	socket_type	= stream
> +	protocol	= tcp
> +	flags		= NAMEINARGS
> +	wait		= no
> +	user		= root
> +	group		= root
> +	log_on_success	+= USERID
> +	log_on_failure	+= USERID
> +	server		= /usr/bin/tcpd
> +	server_args	= /usr/sbin/in.rlogind -a
> +	disable		= yes
> +}
> +							
> +							
> +							
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
> similarity index 81%
> rename from meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch
> rename to meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
> index bded510..c12ee9b 100644
> --- a/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
> @@ -45,7 +45,7 @@ Index: netkit-rsh-0.17/rlogin/Makefile
>
>    $(PROG): $(OBJS)
>   -	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> -+	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
>
>    install: $(PROG)
>    	install -o root -m$(SUIDMODE) $(PROG) $(INSTALLROOT)$(BINDIR)
> @@ -62,3 +62,16 @@ Index: netkit-rsh-0.17/rlogind/Makefile
>
>    rlogind.o: pathnames.h logwtmp.h rlogind.h ../version.h
>    logwtmp.o: logwtmp.h
> +Index: netkit-rsh-0.17/rexecd/Makefile
> +===================================================================
> +--- netkit-rsh-0.17.orig/rexecd/Makefile
> ++++ netkit-rsh-0.17/rexecd/Makefile
> +@@ -24,7 +24,7 @@ endif
> + CFLAGS += -DRESTRICT_FTP=1
> +
> + rexecd: rexecd.o
> +-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
> ++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
> +
> + install: rexecd
> + 	install -m$(DAEMONMODE) rexecd $(INSTALLROOT)$(SBINDIR)/in.rexecd
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
> new file mode 100644
> index 0000000..ad59b62
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
> @@ -0,0 +1,21 @@
> +# default: off
> +# description:
> +# The rshd server is a server for the rcmd(3) routine and,
> +# consequently, for the rsh(1) program. The server provides
> +# remote execution facilities with authentication based on
> +# privileged port numbers from trusted hosts.
> +#
> +service shell
> +{
> +	socket_type	= stream
> +	protocol	= tcp
> +	flags		= NAMEINARGS
> +	wait		= no
> +	user		= root
> +	group		= root
> +	log_on_success	+= USERID
> +	log_on_failure	+= USERID
> +	server		= /usr/bin/tcpd
> +	server_args	= /usr/sbin/in.rshd -aL
> +	disable		= yes
> +}
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> index 9866b3f..8b42fa7 100644
> --- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
> @@ -1,14 +1,15 @@
>   DESCRIPTION = "netkit-rsh includes the rsh daemon and client."
>   SECTION = "networking"
>   HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
> -LICENSE = "BSD"
> -DEPENDS = "xinetd libpam libgcrypt"
> +LICENSE = "BSD-4-Clause"
> +DEPENDS = "xinetd libgcrypt"
>
>   LIC_FILES_CHKSUM = "file://rsh/rsh.c;beginline=2;endline=3;md5=25737e9d21d9df251dd26b7dcbd8ee29"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=archive \
>               ${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}-15.diff.gz;name=patch15 \
>               file://rsh-redone_link_order_file.patch \
> +            file://no_pam_build_fix.patch \
>               file://rexec.xinetd.netkit \
>               file://rlogin.xinetd.netkit \
>               file://rsh.xinetd.netkit \
> @@ -19,16 +20,22 @@ SRC_URI[archive.sha256sum] = "edcac7fa18015f0bc04e573f3f54ae3b638d71335df1ad7dae
>   SRC_URI[patch15.md5sum] = "655efc0d541b03ca5de0ae506c805ea3"
>   SRC_URI[patch15.sha256sum] = "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e9b1798694d9874733293bc2aa9"
>
> -inherit distro_features_check
> +inherit pkgconfig
>
>   CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
> -LDFLAGS += " -lutil"
> +LDFLAGS += " -L${STAGING_LIBDIR} -lutil -lcrypt"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam", "", d)}"
> +PACKAGECONFIG[pam] = " , --without-pam, libpam, libpam"
>
>   do_configure () {
>       ./configure --prefix=${prefix}
> -    echo "USE_PAM=1" > MCONFIG
> -    echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
> -    echo "INSTALLROOT=${D}" >> MCONFIG
> +    echo "INSTALLROOT=${D}" > MCONFIG
> +
> +    if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
> +        echo "USE_PAM=1" >> MCONFIG
> +    fi
>
>       # didn't want to patch these next changes
>       sed -i 's/netkit-//' ${S}/rsh/pathnames.h
> @@ -40,7 +47,6 @@ do_install () {
>       install -d ${D}${sbindir}
>       install -d ${D}${mandir}/man1
>       install -d ${D}${mandir}/man8
> -    install -d ${D}${sysconfdir}/pam.d
>       install -d ${D}${sysconfdir}/xinetd.d
>
>       oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
> @@ -49,11 +55,13 @@ do_install () {
>       'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
>       'MANDIR=${mandir}' install
>
> -    install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
> -    install -m 0644 debian/pam.d/rexec ${D}/${sysconfdir}/pam.d
> -    install -m 0644 debian/pam.d/rlogin ${D}/${sysconfdir}/pam.d
> -    install -m 0644 debian/pam.d/rsh ${D}/${sysconfdir}/pam.d
> -
> +    if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
> +        install -d ${D}${sysconfdir}/pam.d
> +        install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
> +        install -m 0644 debian/pam.d/rexec ${D}/${sysconfdir}/pam.d
> +        install -m 0644 debian/pam.d/rlogin ${D}/${sysconfdir}/pam.d
> +        install -m 0644 debian/pam.d/rsh ${D}/${sysconfdir}/pam.d
> +    fi
>       cp ${WORKDIR}/rexec.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rexec
>       cp ${WORKDIR}/rlogin.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rlogin
>       cp ${WORKDIR}/rsh.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rsh
> @@ -80,6 +88,4 @@ ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
>   RCONFLICTS_${PN}-client += "inetutils-rshd"
>   RPROVIDES_${PN}-rshd = "rshd"
>
> -RDEPENDS_${PN} = "libpam xinetd"
> -
> -REQUIRED_DISTRO_FEATURES ?= "pam"
> +RDEPENDS_${PN} = "xinetd"
>

