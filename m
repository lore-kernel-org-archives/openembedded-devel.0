Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIVCb-0004Dy-JP
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:44:43 +0100
Received: by gwaa11 with SMTP id a11so835153gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=hb5xaZk1xfsNFPJ/VfhWnH/Ms5A8WVGD+NKJAPNrTTk=;
	b=O6iKnZ6cm/x1hwN2BUozeSRx2Pu/FjCS9KFTjp0mlB+wrOFI7Npc01O1Cwkj8IVzDj
	Yu4tm1tEJHdd1YplrLLZiDORkR2OhLnBU9ihMsg917ph8uJ3Q3Z32QcNwr3VM38aox7p
	IQuA667iF4i4bcYsvJCfUyDxFNkdNIAeXRVjI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=jxYZtLFNIulNunMh3hO+c3ovG76SE4JnL1p75P8r+wAD6QwX7DUS2ntePakOkiRx6S
	ZcdxjpLWT7mwE5Oweb8xgvGN2ODsH5RmsjXnpO3G5kRePgQMnGUTTmKLlcXMkNRLG4r+
	n2oA2t1LnnwseiE8sCpMbYHGF2rFwrvzqPJZo=
Received: by 10.91.47.38 with SMTP id z38mr10504014agj.129.1289951015730; Tue,
	16 Nov 2010 15:43:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:43:15 -0800 (PST)
In-Reply-To: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
References: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:43:15 -0800
Message-ID: <AANLkTi=ExuhfwDUtUW0zqk7HNGy7oq8uTR7mAK1PTxmq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 08/11] log4cpp: Added recipe for log4cpp
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
X-List-Received-Date: Tue, 16 Nov 2010 23:44:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 10:24 AM, Camille Moncelier
<moncelier@devlife.org> wrote:
> =C2=A0* Log4cpp is library of C++ classes for flexible logging to files,
> =C2=A0 =C2=A0syslog, IDSA and other destinations. It is modeled after the=
 Log4j
> =C2=A0 =C2=A0Java library, staying as close to their API as is reasonable=
.
>
> Signed-off-by: Camille Moncelier <moncelier@devlife.org>
> ---
> =C2=A0.../log4cpp/log4cpp-1.0/configure_pkgconfig.diff =C2=A0 | =C2=A0 11=
 +++++++++
> =C2=A0recipes/log4cpp/log4cpp-1.0/stl_compile.diff =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 23 ++++++++++++++++++++
> =C2=A0recipes/log4cpp/log4cpp_1.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 22 +++++++++++++++++++
> =C2=A03 files changed, 56 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/log4cpp/log4cpp-1.0/configure_pkgconfig.=
diff
> =C2=A0create mode 100644 recipes/log4cpp/log4cpp-1.0/stl_compile.diff
> =C2=A0create mode 100644 recipes/log4cpp/log4cpp_1.0.bb
>
> diff --git a/recipes/log4cpp/log4cpp-1.0/configure_pkgconfig.diff b/recip=
es/log4cpp/log4cpp-1.0/configure_pkgconfig.diff
> new file mode 100644
> index 0000000..e4a9104
> --- /dev/null
> +++ b/recipes/log4cpp/log4cpp-1.0/configure_pkgconfig.diff
> @@ -0,0 +1,11 @@
> +--- log4cpp-1.0/m4/ac_config_pkgconfig_in.m4 =C2=A0 2004-01-27 11:27:38.=
000000000 +0100
> ++++ log4cpp-1.0.patched/m4/ac_config_pkgconfig_in.m4 =C2=A0 2009-08-24 1=
7:12:26.000000000 +0200
> +@@ -121,7 +121,7 @@
> + fi
> + echo 'Version: @VERSION@' >>$PKGCONFIG_FILE
> + echo 'Libs: -L${libdir} @MODULE_DOWN[]_libs@' >>$PKGCONFIG_FILE
> +-echo 'Cflags: -I${includedir} @MODULE_DOWN[]_cflags@' >>$PKGCONFIG_FILE
> ++echo 'Cflags: -I${includedir}' >>$PKGCONFIG_FILE
> + m4_pushdef([PKGCONFIG_UP], [m4_translit([$1], [a-z], [A-Z])])dnl
> + PKGCONFIG_UP[]_PKGCONFIG=3D"PKGCONFIG_DIR[]$1-config"
> + AC_SUBST(PKGCONFIG_UP[]_PKGCONFIG)
> diff --git a/recipes/log4cpp/log4cpp-1.0/stl_compile.diff b/recipes/log4c=
pp/log4cpp-1.0/stl_compile.diff
> new file mode 100644
> index 0000000..dc4672d
> --- /dev/null
> +++ b/recipes/log4cpp/log4cpp-1.0/stl_compile.diff
> @@ -0,0 +1,23 @@
> +diff -r -u log4cpp-1.0/src/BasicLayout.cpp log4cpp-1.0.new/src/BasicLayo=
ut.cpp
> +--- log4cpp-1.0/src/BasicLayout.cpp =C2=A0 =C2=A02006-09-30 08:03:20.000=
000000 +0200
> ++++ log4cpp-1.0.new/src/BasicLayout.cpp =C2=A0 =C2=A0 =C2=A0 =C2=A02009-=
08-21 16:13:32.000000000 +0200
> +@@ -14,6 +14,7 @@
> + #ifdef LOG4CPP_HAVE_SSTREAM
> + #include <sstream>
> + #endif
> ++#include <memory>
> +
> + namespace log4cpp {
> +
> +diff -r -u log4cpp-1.0/src/PatternLayout.cpp log4cpp-1.0.new/src/Pattern=
Layout.cpp
> +--- log4cpp-1.0/src/PatternLayout.cpp =C2=A02007-08-28 09:54:12.00000000=
0 +0200
> ++++ log4cpp-1.0.new/src/PatternLayout.cpp =C2=A0 =C2=A0 =C2=A02009-08-21=
 16:14:04.000000000 +0200
> +@@ -370,7 +370,7 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 literal =3D "";
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f ((minWidth !=3D 0) || (maxWidth !=3D 0)) {
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0component =3D new FormatModifierComponent(component, std::abs(=
minWidth), maxWidth, minWidth < 0);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0component =3D new FormatModifierComponent(component, std::abs(=
(double)minWidth), maxWidth, minWidth < 0);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 minWidth =3D maxWidth =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=
components.push_back(component);
> diff --git a/recipes/log4cpp/log4cpp_1.0.bb b/recipes/log4cpp/log4cpp_1.0=
.bb
> new file mode 100644
> index 0000000..0243e16
> --- /dev/null
> +++ b/recipes/log4cpp/log4cpp_1.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A library of C++ classes for flexible logging to files,=
 syslog, IDSA and other destinations."
> +HOMEPAGE =3D "http://sourceforge.net/projects/log4cpp/"
> +PRIORITY =3D "optional"
> +PR =3D "r3"


initially you set it to r0
and
what LICENSE does it have ?
> +
> +SRC_URI =3D " \
> + =C2=A0 =C2=A0 http://downloads.sourceforge.net/project/log4cpp/log4cpp-=
1.0.x%20%28current%29/${PN}-${PV}/${PN}-${PV}.tar.gz \
> + =C2=A0 =C2=A0 file://stl_compile.diff;apply=3Dyes \
> + =C2=A0 =C2=A0 file://configure_pkgconfig.diff;apply=3Dyes \
> +"

you dont need apply=3Dyes patching code will figure it out.

> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "\
> + =C2=A0 =C2=A0--enable-doxygen=3Dno \
> + =C2=A0 =C2=A0--enable-dot=3Dno \
> + =C2=A0 =C2=A0--enable-html-docs=3Dno \
> + =C2=A0 =C2=A0--enable-latex-docs=3Dno \
> +"
> +
> +SRC_URI[md5sum] =3D "1face50ead0790d1297dfb04bacf273c"
> +SRC_URI[sha256sum] =3D "b4533324b0a1f46ad74a9e92bf2caa46c246e9353059e1a8=
35e735d41826ed19"
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


