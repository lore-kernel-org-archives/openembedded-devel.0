Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lh3Vq-0000nG-E8
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 16:04:58 +0100
Received: by rv-out-0708.google.com with SMTP id b17so2189934rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=GucDY3/s7S+BlpG+uIpeb9X9+IDM05IqiuwI4FhiDOg=;
	b=TrfDQkoHwd+OeySNCnpvLzRab9+iVfhyvKs2zF6xm4d1ijI2ZzEC93MqLGuAhVwRqy
	oCjwUy2X+S5aAYr8VX9EPRQlfiKVpCW0vksjJCFtEWv60NlZTBnkC9gNmzaeCFuINbQB
	3KuVsoSBU4MYryLXgIcfeChHRRkO+raiuJscU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=sEU4mhC3L2JNkwEVTq5zf1HR2Hw5OKwmo31uTq/VEGusg3agsoiZt3FjxPCIXVLsDX
	GXV7yWRzZhJUhcXvcRbpNCUS6cjDPqsOaej0mUyHqe7pirOvZjAVMEgb9WQAORWqlIWf
	ud1vKW/ss2n1lqqZWX93QM2RmabLdLTtgtKTs=
Received: by 10.114.149.2 with SMTP id w2mr4093197wad.182.1236671948057;
	Tue, 10 Mar 2009 00:59:08 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id m25sm14900waf.9.2009.03.10.00.59.07
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Mar 2009 00:59:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2009 00:59:06 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-8-generic; KDE/4.2.1; x86_64; ; )
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-18-git-send-email-openembedded@haerwu.biz>
In-Reply-To: <1236182004-4523-18-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200903100059.06781.raj.khem@gmail.com>
Cc: Marcin Juszkiewicz <openembedded@haerwu.biz>,
	Richard Purdie <richard@openedhand.com>
Subject: Re: [PATCH 17/70] yum-native: Add patch to fix install paths (from Poky)
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
X-List-Received-Date: Tue, 10 Mar 2009 15:04:58 -0000
X-Groupsio-MsgNum: 8327
Content-Type: multipart/signed; boundary="nextPart2458970.g8YJWmgnKY";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2458970.g8YJWmgnKY
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 04 March 2009 07:52:32 Marcin Juszkiewicz wrote:
> From: Richard Purdie <richard@openedhand.com>
>
> git-svn-id: https://svn.o-hand.com/repos/poky@5109
> 311d38ba-8fff-0310-9ca6-ca027cbcb966 ---
>  packages/yum/yum-native/paths.patch |   88
> +++++++++++++++++++++++++++++++++++ packages/yum/yum-native_3.2.18.bb   |=
 =20
>  4 +-
>  2 files changed, 91 insertions(+), 1 deletions(-)
>  create mode 100644 packages/yum/yum-native/paths.patch
>
> diff --git a/packages/yum/yum-native/paths.patch
> b/packages/yum/yum-native/paths.patch new file mode 100644
> index 0000000..ee5c999
> --- /dev/null
> +++ b/packages/yum/yum-native/paths.patch
> @@ -0,0 +1,88 @@
> +Index: yum-3.2.18/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- yum-3.2.18.orig/Makefile	2008-08-23 09:13:56.000000000 +0100
> ++++ yum-3.2.18/Makefile	2008-08-23 09:18:09.000000000 +0100
> +@@ -18,19 +18,19 @@
> + 	for d in $(SUBDIRS); do make PYTHON=3D$(PYTHON) -C $$d; [ $$? =3D 0 ] =
||
> exit 1 ; done +
> + install:
> +-	mkdir -p $(DESTDIR)/usr/share/yum-cli
> ++	mkdir -p $(DESTDIR)$(datadir)/yum-cli
> + 	for p in $(PYFILES) ; do \
> +-		install -m 644 $$p $(DESTDIR)/usr/share/yum-cli/$$p; \
> ++		install -m 644 $$p $(DESTDIR)$(datadir)/yum-cli/$$p; \
> + 	done
> +-	mv $(DESTDIR)/usr/share/yum-cli/yum-updatesd.py
> $(DESTDIR)/usr/share/yum-cli/yumupd.py +-	$(PYTHON) -c "import compileall;
> compileall.compile_dir('$(DESTDIR)/usr/share/yum-cli', 1, '$(PYDIR)', 1)"
> ++	mv $(DESTDIR)$(datadir)/yum-cli/yum-updatesd.py
> $(DESTDIR)$(datadir)/yum-cli/yumupd.py ++	$(PYTHON) -c "import compileall;
> compileall.compile_dir('$(DESTDIR)$(datadir)/yum-cli', 1, '$(PYDIR)', 1)"=
 +
> +-	mkdir -p $(DESTDIR)/usr/bin $(DESTDIR)/usr/sbin
> +-	install -m 755 bin/yum.py $(DESTDIR)/usr/bin/yum
> +-	install -m 755 bin/yum-updatesd.py $(DESTDIR)/usr/sbin/yum-updatesd
> ++	mkdir -p $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir)
> ++	install -m 755 bin/yum.py $(DESTDIR)$(bindir)/yum
> ++	install -m 755 bin/yum-updatesd.py $(DESTDIR)$(sbindir)/yum-updatesd
> +
> +-	mkdir -p $(DESTDIR)/var/cache/yum
> +-	mkdir -p $(DESTDIR)/var/lib/yum
> ++	mkdir -p $(DESTDIR)$(localstatedir)/cache/yum
> ++	mkdir -p $(DESTDIR)$(localstatedir)/lib/yum
> +
> + 	for d in $(SUBDIRS); do make PYTHON=3D$(PYTHON) DESTDIR=3D`cd $(DESTDI=
R);
> pwd` -C $$d install; [ $$? =3D 0 ] || exit 1; done +
> +Index: yum-3.2.18/docs/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- yum-3.2.18.orig/docs/Makefile	2008-08-23 09:19:07.000000000 +0100
> ++++ yum-3.2.18/docs/Makefile	2008-08-23 09:19:37.000000000 +0100
> +@@ -6,9 +6,9 @@
> + 	rm -fr epydoc
> +
> + install:
> +-	mkdir -p $(DESTDIR)/usr/share/man/man{5,8}
> +-	install -m 644 yum.8 $(DESTDIR)/usr/share/man/man8/yum.8
> +-	install -m 644 yum-shell.8 $(DESTDIR)/usr/share/man/man8/yum-shell.8
> +-	install -m 644 yum.conf.5 $(DESTDIR)/usr/share/man/man5/yum.conf.5
> +-	install -m 644 yum-updatesd.8
> $(DESTDIR)/usr/share/man/man8/yum-updatesd.8 +-	install -m 644
> yum-updatesd.conf.5 $(DESTDIR)/usr/share/man/man5/yum-updatesd.conf.5
> ++	mkdir -p $(DESTDIR)$(mandir)/man{5,8}
> ++	install -m 644 yum.8 $(DESTDIR)$(mandir)/man8/yum.8
> ++	install -m 644 yum-shell.8 $(DESTDIR)$(mandir)/man8/yum-shell.8
> ++	install -m 644 yum.conf.5 $(DESTDIR)$(mandir)/man5/yum.conf.5
> ++	install -m 644 yum-updatesd.8 $(DESTDIR)$(mandir)/man8/yum-updatesd.8
> ++	install -m 644 yum-updatesd.conf.5
> $(DESTDIR)$(mandir)/man5/yum-updatesd.conf.5 +Index:
> yum-3.2.18/etc/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- yum-3.2.18.orig/etc/Makefile	2008-08-23 09:19:51.000000000 +0100
> ++++ yum-3.2.18/etc/Makefile	2008-08-23 09:20:28.000000000 +0100
> +@@ -5,20 +5,20 @@
> + 	rm -f *.pyc *.pyo *~
> +
> + install:
> +-	mkdir -p $(DESTDIR)/etc/yum/
> +-	mkdir -p $(DESTDIR)/etc/yum/repos.d
> ++	mkdir -p $(DESTDIR)$(sysconfdir)/yum/
> ++	mkdir -p $(DESTDIR)$(sysconfdir)/yum/repos.d
> +
> +-	install -m 644 yum.conf $(DESTDIR)/etc/yum/yum.conf
> ++	install -m 644 yum.conf $(DESTDIR)$(sysconfdir)/yum/yum.conf
> +
> +-	mkdir -p $(DESTDIR)/etc/logrotate.d
> +-	install -m 644 yum.logrotate $(DESTDIR)/etc/logrotate.d/yum
> ++	mkdir -p $(DESTDIR)$(sysconfdir)/logrotate.d
> ++	install -m 644 yum.logrotate $(DESTDIR)$(sysconfdir)/logrotate.d/yum
> +
> +-	mkdir -p $(DESTDIR)/etc/rc.d/init.d
> +-	install -m 755 yum-updatesd.init $(DESTDIR)/etc/rc.d/init.d/yum-update=
sd
> ++	mkdir -p $(DESTDIR)$(sysconfdir)/rc.d/init.d
> ++	install -m 755 yum-updatesd.init
> $(DESTDIR)$(sysconfdir)/rc.d/init.d/yum-updatesd +
> +-	mkdir -p $(DESTDIR)/etc/dbus-1/system.d/
> +-	install -m 755 yum-updatesd-dbus.conf
> $(DESTDIR)/etc/dbus-1/system.d/yum-updatesd.conf ++	mkdir -p
> $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
> ++	install -m 755 yum-updatesd-dbus.conf
> $(DESTDIR)$(sysconfdir)/dbus-1/system.d/yum-updatesd.conf +
> +-	install -m 755 yum-updatesd.conf $(DESTDIR)/etc/yum/yum-updatesd.conf
> ++	install -m 755 yum-updatesd.conf
> $(DESTDIR)$(sysconfdir)/yum/yum-updatesd.conf +
> +
> diff --git a/packages/yum/yum-native_3.2.18.bb
> b/packages/yum/yum-native_3.2.18.bb index 6657c52..d3098cc 100644
> --- a/packages/yum/yum-native_3.2.18.bb
> +++ b/packages/yum/yum-native_3.2.18.bb
> @@ -1,6 +1,8 @@
>  HOMEPAGE =3D "http://linux.duke.edu/projects/yum/"
>
> -SRC_URI =3D
> "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz" +SRC_U=
RI
> =3D "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \ +=
   =20
>       file://paths.patch;patch=3D1"
> +PR =3D "r1"
>
>  DEPENDS =3D "rpm-native python-native python-iniparse-native
> python-urlgrabber-native yum-metadata-parser-native"

This seems ok to me.
=2D-=20
Khem Raj

--nextPart2458970.g8YJWmgnKY
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm2HcoACgkQHnJKy6V6em61TwCggRac9WbJUPOAv97RZwQRYZeI
P68AoKgSZx5Mi1vYIxkX0ZipneQg3xLF
=jK1G
-----END PGP SIGNATURE-----

--nextPart2458970.g8YJWmgnKY--
