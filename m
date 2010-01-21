Received: from mail-iw0-f203.google.com ([209.85.223.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NY5qH-0004F6-E2
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:49:36 +0100
Received: by iwn41 with SMTP id 41so454201iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 14:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=D6EvxuhMmWDSYcPg2mYwD92vHzpNfrD3Pf9qL3W4b90=;
	b=dbZp0t3wQoOtBMbNWjnTGlPEH8QKbpcL3poXBRiVJKpu4YoOefuJRuvCAoQWXHSO5l
	nge9n1jymLU/HKdIBjfedQMfy4liGzQ4pcCE9wXixSn2NwiwqwrosEQVzIrl82oj76tY
	jrg+ie/24E4Bqt5XNoku9VvLkEDOY40/ffuQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vdRozcWCl9cZTEDtq7XHRqGTzQBHVm4WTekIa1qfNryUlYWmrOzUiuvxhRRy/LQXWu
	85nUecYtwLvwqdqEfFvqLyqq12gDD+pzLSCZO2JF0zLppAjo/hqak2lrFd1KhcOnsQde
	Lf9ogIl5Ip+bpktxi04eJklH2FPiw3KDvt/jY=
MIME-Version: 1.0
Received: by 10.231.153.69 with SMTP id j5mr3410794ibw.33.1264114035532; Thu, 
	21 Jan 2010 14:47:15 -0800 (PST)
In-Reply-To: <4B56384B.10402@irobot.com>
References: <4B56384B.10402@irobot.com>
Date: Thu, 21 Jan 2010 14:47:15 -0800
Message-ID: <19c1b8a91001211447w4892750et4414587220a70e4b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.203
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] added new recipe for olsrd_0.5.6-r8
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
X-List-Received-Date: Thu, 21 Jan 2010 22:49:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2010 at 2:55 PM, Adam Wozniak <awozniak@irobot.com> wrote:
> The latest release version of olsrd is 0.5.6-r8
>
> Signed-off-by: Adam Wozniak <awozniak@irobot.com>
> ---
> .../olsrd/files/olsrd-0.5.6-unbreak-makefile.patch | =A0 59
> ++++++++++++++++++++
> recipes/olsrd/olsrd_0.5.6-r8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A06 ++
> 2 files changed, 65 insertions(+), 0 deletions(-)
> create mode 100644 recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
> create mode 100644 recipes/olsrd/olsrd_0.5.6-r8.bb
>
> diff --git a/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
> b/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
> new file mode 100644
> index 0000000..479448d
> --- /dev/null
> +++ b/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
> @@ -0,0 +1,59 @@
> +--- a/Makefile =A0 =A02010-01-19 14:01:15.264703049 -0800
> ++++ b/Makefile =A0 =A02010-01-19 14:10:38.765700100 -0800
> +@@ -103,9 +103,8 @@ uberclean: =A0 =A0clean clean_libs
> + install: install_olsrd
> +
> + install_bin:
> +- =A0 =A0 =A0 =A0mkdir -p $(SBINDIR)
> +- =A0 =A0 =A0 =A0install -m 755 $(EXENAME) $(SBINDIR)
> +- =A0 =A0 =A0 =A0$(STRIP) $(SBINDIR)/$(EXENAME)
> ++ =A0 =A0 =A0 =A0mkdir -p $(INSTALL_PREFIX)$(SBINDIR)
> ++ =A0 =A0 =A0 =A0install -m 755 $(EXENAME) $(INSTALL_PREFIX)$(SBINDIR)
> +
> + install_olsrd: =A0 =A0install_bin
> + =A0 =A0 =A0 =A0 @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D C O N F I G U R A T I=
 O N - F I L E =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +@@ -117,17 +116,16 @@ install_olsrd: =A0 =A0install_bin
> + =A0 =A0 =A0 =A0 @echo per default.
> + =A0 =A0 =A0 =A0 @echo can be found at files/olsrd.conf.default.lq
> + =A0 =A0 =A0 =A0 @echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +- =A0 =A0 =A0 =A0mkdir -p $(ETCDIR)
> +- =A0 =A0 =A0 =A0-cp -i files/olsrd.conf.default.lq $(CFGFILE)
> ++ =A0 =A0 =A0 =A0mkdir -p $(INSTALL_PREFIX)$(ETCDIR)
> + =A0 =A0 =A0 =A0 @echo -------------------------------------------
> + =A0 =A0 =A0 =A0 @echo Edit $(CFGFILE) before running olsrd!!
> + =A0 =A0 =A0 =A0 @echo -------------------------------------------
> + =A0 =A0 =A0 =A0 @echo Installing manpages $(EXENAME)\(8\) and $(CFGNAME=
)\(5\)
> + ifneq ($(MANDIR),)
> +- =A0 =A0 =A0 =A0mkdir -p $(MANDIR)/man8/
> +- =A0 =A0 =A0 =A0cp files/olsrd.8.gz $(MANDIR)/man8/$(EXENAME).8.gz
> +- =A0 =A0 =A0 =A0mkdir -p $(MANDIR)/man5/
> +- =A0 =A0 =A0 =A0cp files/olsrd.conf.5.gz $(MANDIR)/man5/$(CFGNAME).5.gz
> ++ =A0 =A0 =A0 =A0mkdir -p $(INSTALL_PREFIX)$(MANDIR)/man8/
> ++ =A0 =A0 =A0 =A0cp files/olsrd.8.gz
> $(INSTALL_PREFIX)$(MANDIR)/man8/$(EXENAME).8.gz
> ++ =A0 =A0 =A0 =A0mkdir -p $(INSTALL_PREFIX)$(MANDIR)/man5/
> ++ =A0 =A0 =A0 =A0cp files/olsrd.conf.5.gz
> $(INSTALL_PREFIX)$(MANDIR)/man5/$(CFGNAME).5.gz
> + endif
> +
> + tags:
> +@@ -160,10 +158,10 @@ endif
> + endif
> +
> + libs:
> +- =A0 =A0 =A0 =A0set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir
> LIBDIR=3D$(LIBDIR);done
> ++ =A0 =A0 =A0 =A0set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir
> LIBDIR=3D$(INSTALL_PREFIX)$(LIBDIR);done
> +
> + libs_clean clean_libs:
> +- =A0 =A0 =A0 =A0-for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir LIBDI=
R=3D$(LIBDIR)
> clean;done
> ++ =A0 =A0 =A0 =A0-for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir
> LIBDIR=3D$(INSTALL_PREFIX)$(LIBDIR) clean;done
> + ifeq ($(OS), win32)
> + =A0 =A0 =A0 =A0 -rm -f lib/pgraph/olsrd_pgraph.dll
> + =A0 =A0 =A0 =A0 -rm -f lib/txtinfo/olsrd_txtinfo.dll
> +@@ -174,7 +172,7 @@ ifeq ($(OS), win32)
> + endif
> +
> + libs_install install_libs:
> +- =A0 =A0 =A0 =A0set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir
> LIBDIR=3D$(LIBDIR) install;done
> ++ =A0 =A0 =A0 =A0set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir
> LIBDIR=3D$(INSTALL_PREFIX)$(LIBDIR) install;done
> +
> + httpinfo:
> + =A0 =A0 =A0 =A0 $(MAKECMD) -C lib/httpinfo clean
> diff --git a/recipes/olsrd/olsrd_0.5.6-r8.bb
> b/recipes/olsrd/olsrd_0.5.6-r8.bb
> new file mode 100644
> index 0000000..366474c
> --- /dev/null
> +++ b/recipes/olsrd/olsrd_0.5.6-r8.bb
> @@ -0,0 +1,6 @@
> +require olsrd.inc
> +
> +PR =3D "r2"
> +
> +SRC_URI +=3D "file://olsrd-0.5.6-unbreak-makefile.patch;patch=3D1"
> +
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

this patch seems corrupt. Please resend it without line wrapping (
teach your mail client not to muck with patches)
best is to use git format-patch and git send-email combo

Thx
-Khem


