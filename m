Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id A4E136612C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 21:02:11 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id k1so4903019vka.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=SX/Czx11xv46MnngoKfJujrQy7IeyPlIR1Wnn5fzaJQ=;
	b=T2GpZo1CDdiAxMtc5yzSKhcQpci8qTIti1ZDenWjowsBeaszV8StFSa4XphFHfpc+a
	0wauAfHhD/t7xE6O7aVCJd2qvkV2sxhxUgW5wRaAybCH3xbG+qZtasw0O30jm5bKEGol
	ULZXKymUAbYvjl0sZmkqfA04QDQOrQWO9i6aLtAd4T+9e6X5dTR2gkLI29M4p2fSF9Zg
	hmrq+Knt3x8OF1Ch1tcd6yPnAv9m73fSmK7/7J6ixhj0KoeQ/FqglH+7aHaqU7Xfie9P
	9Ow4+AOggab5oAMbSziUzdc4gY++BtigP8jbhfTkunMuZw3ho7l1vlivGGyoXSig29qX
	JLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=SX/Czx11xv46MnngoKfJujrQy7IeyPlIR1Wnn5fzaJQ=;
	b=FXi2vu14Qro8KBZg/orJzQ4Kqj85etzjO5Sh5aGLBJA33+OHuo8Pwthyfw/mT2yb6g
	lpnebP03rEwnDnp75uNbM7wR+FF5Mn52hOpsidqusLSeEIn/H21V9hElUPu14sKg1Gs9
	BUJVQs7yw1P3I6h7iEcP3F53pqmMghbs4nyCX5AI2cyDON0PfjmpMAcbL4n0suf2dcaZ
	6xex6nrNkioWgk1+6PI8l/myZFchqlos49yVSMELFrhMYBYcvX/CqVRVvJvDszGPyeUU
	leWoMY3EqJn2j+BtIKKCqzoobx4DstV9WVVcigDdj4oqnT0dI0EGUQfbeEXwdhEbcUli
	sEGA==
X-Gm-Message-State: ALyK8tLNScjl3/ZuYDkxaKUxbe0VlIXMqj72L6xBtfi6yL056z5e5xAr0bl0pMK+iV3Lo5DP4kwJMB7JkYsJeA==
MIME-Version: 1.0
X-Received: by 10.159.38.54 with SMTP id 51mr139316uag.27.1464123731581; Tue,
	24 May 2016 14:02:11 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Tue, 24 May 2016 14:02:11 -0700 (PDT)
In-Reply-To: <20160523185815.GB2560@jama>
References: <1463439882-26273-1-git-send-email-schnitzeltony@googlemail.com>
	<1463439882-26273-3-git-send-email-schnitzeltony@googlemail.com>
	<20160523185815.GB2560@jama>
Date: Tue, 24 May 2016 23:02:11 +0200
Message-ID: <CALbNGRStT57rLv--=xhyfUPc=cRQcga5iJVfATR9guGMVj9UDw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] geany-plugins: initial add 1.27
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 21:02:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2016 at 8:58 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, May 17, 2016 at 01:04:42AM +0200, Andreas M=C3=BCller wrote:
>> geany-plugins comes around as a loose collection of modules. I thought a=
bout
>> using PACKAGES_DYNAMIC but this way seems better maintainable:
>>
>> * a removed plugin will at least complain for license file missing
>> * a new plugin will complain for unpacked files
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../recipes-devtools/geany/geany-plugins_1.27.bb   | 216 ++++++++++++++=
+++++++
>>  1 file changed, 216 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>>
>> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta=
-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> new file mode 100644
>> index 0000000..08f79bb
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> @@ -0,0 +1,216 @@
>> +DESCRIPTION =3D "A fast and lightweight IDE"
>> +HOMEPAGE =3D "http://plugins.geany.org/"
>> +# majority's default
>> +LICENSE =3D "GPLv2"
>> +
>> +DEPENDS =3D "geany lua libxml2 libsoup-2.4 vte enchant intltool-native =
libassuan gpgme"
>> +
>> +inherit autotools pkgconfig gtk-icon-cache
>> +
>> +SRC_URI =3D "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
>> +SRC_URI[md5sum] =3D "31e4aa4b771a4ff8ccfd74efe7ba7b44"
>> +SRC_URI[sha256sum] =3D "03195a0b7a361ddb2ee4138f46fa87b6d9b9801ff006574=
56ab9c8b8908c0ce0"
>
> Now it started failing in world builds with:
> autoreconf: configure.ac: not using Gettext
> autoreconf: running: aclocal --system-acdir=3D
> /tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/build/aclocal-cop=
y/
> -I
> /tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/geany-plugins-1.2=
7/build/
> -I
> /tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/geany-plugins-1.2=
7/build/
> --force -I build/cache -I build -I build/bundled -I geanypy/m4 --install
> build/cache/glib-gettext.m4:39: error: m4_copy: won't overwrite defined
> macro: glib_DEFUN
> build/cache/glib-gettext.m4:39: the top level
> autom4te: m4 failed with exit status: 1
> aclocal: error: echo failed with exit status: 1
> autoreconf: aclocal failed with exit status: 1
> WARNING: exit code 1 from a shell command.
> ERROR: autoreconf execution failed.
> ERROR: Function failed: do_configure (log file is located at
> /tmp-glibc/work/core2-64-oe-linux/geany-plugins/1.27-r0/temp/log.do_confi=
gure.9960)
>
> http://errors.yoctoproject.org/Errors/Details/64645/
>
>> +
>> +FILES_${PN} +=3D "${datadir}/icons"
>> +FILES_${PN}-dev +=3D "${libdir}/geany/*.la ${libdir}/${PN}/*/*.la"
>> +
>> +PLUGINS +=3D "${PN}-addons"
>> +LIC_FILES_CHKSUM +=3D "file://addons/COPYING;md5=3D4325afd396febcb659c3=
6b49533135d4"
>> +FILES_${PN}-addons =3D "${libdir}/geany/addons.so"
>> +RDEPENDS_${PN}-addons =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-autoclose"
>> +LIC_FILES_CHKSUM +=3D "file://autoclose/COPYING;md5=3D751419260aa954499=
f7abaabaa882bbe"
>> +FILES_${PN}-autoclose =3D "${libdir}/geany/autoclose.so"
>> +RDEPENDS_${PN}-autoclose =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-automark"
>> +LIC_FILES_CHKSUM +=3D "file://automark/COPYING;md5=3D751419260aa954499f=
7abaabaa882bbe"
>> +FILES_${PN}-automark =3D "${libdir}/geany/automark.so"
>> +RDEPENDS_${PN}-automark =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-codenav"
>> +LIC_FILES_CHKSUM +=3D "file://codenav/COPYING;md5=3D751419260aa954499f7=
abaabaa882bbe"
>> +FILES_${PN}-codenav =3D "${libdir}/geany/codenav.so"
>> +RDEPENDS_${PN}-codenav =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-commander"
>> +LIC_FILES_CHKSUM +=3D "file://commander/COPYING;md5=3Dd32239bcb673463ab=
874e80d47fae504"
>> +LICENSE_${PN}-commander =3D "GPLv3"
>> +FILES_${PN}-commander =3D "${libdir}/geany/commander.so"
>> +RDEPENDS_${PN}-commander =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-debugger"
>> +LIC_FILES_CHKSUM +=3D "file://debugger/COPYING;md5=3D4325afd396febcb659=
c36b49533135d4"
>> +FILES_${PN}-debugger =3D "${libdir}/geany/debugger.so ${datadir}/${PN}/=
debugger"
>> +RDEPENDS_${PN}-debugger =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-defineformat"
>> +LIC_FILES_CHKSUM +=3D "file://defineformat/COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
>> +FILES_${PN}-defineformat =3D "${libdir}/geany/defineformat.so"
>> +RDEPENDS_${PN}-defineformat =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-devhelp"
>> +LIC_FILES_CHKSUM +=3D "file://devhelp/COPYING;md5=3Dd32239bcb673463ab87=
4e80d47fae504"
>> +LICENSE_${PN}-devhelp =3D "GPLv3"
>> +FILES_${PN}-devhelp =3D "${libdir}/geany/devhelp.so"
>> +RDEPENDS_${PN}-devhelp =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanyctags"
>> +LIC_FILES_CHKSUM +=3D "file://geanyctags/COPYING;md5=3Dc107cf754550e657=
55c42985a5d4e9c9"
>> +FILES_${PN}-geanyctags =3D "${libdir}/geany/geanyctags.so"
>> +RDEPENDS_${PN}-geanyctags =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanydoc"
>> +LIC_FILES_CHKSUM +=3D "file://geanydoc/COPYING;md5=3Dd32239bcb673463ab8=
74e80d47fae504"
>> +LICENSE_${PN}-geanydoc =3D "GPLv3"
>> +FILES_${PN}-geanydoc =3D "${libdir}/geany/geanydoc.so"
>> +RDEPENDS_${PN}-geanydoc =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanyextrasel"
>> +LIC_FILES_CHKSUM +=3D "file://geanyextrasel/COPYING;md5=3Dc107cf754550e=
65755c42985a5d4e9c9"
>> +FILES_${PN}-geanyextrasel =3D "${libdir}/geany/geanyextrasel.so"
>> +RDEPENDS_${PN}-geanyextrasel =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanyinsertnum"
>> +LIC_FILES_CHKSUM +=3D "file://geanyinsertnum/COPYING;md5=3Dc107cf754550=
e65755c42985a5d4e9c9"
>> +FILES_${PN}-geanyinsertnum =3D "${libdir}/geany/geanyinsertnum.so"
>> +RDEPENDS_${PN}-geanyinsertnum =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanylatex"
>> +LIC_FILES_CHKSUM +=3D "file://geanylatex/COPYING;md5=3Dc107cf754550e657=
55c42985a5d4e9c9"
>> +FILES_${PN}-geanylatex =3D "${libdir}/geany/geanylatex.so"
>> +RDEPENDS_${PN}-geanylatex =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanylipsum"
>> +LIC_FILES_CHKSUM +=3D "file://geanylipsum/COPYING;md5=3D4325afd396febcb=
659c36b49533135d4"
>> +FILES_${PN}-geanylipsum =3D "${libdir}/geany/geanylipsum.so"
>> +RDEPENDS_${PN}-geanylipsum =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanylua"
>> +LIC_FILES_CHKSUM +=3D "file://geanylua/COPYING;md5=3D4325afd396febcb659=
c36b49533135d4"
>> +FILES_${PN}-geanylua =3D "${libdir}/geany/geanylua.so ${libdir}/${PN}/g=
eanylua/*.so"
>> +RDEPENDS_${PN}-geanylua =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanymacro"
>> +LIC_FILES_CHKSUM +=3D "file://geanymacro/COPYING;md5=3Dc107cf754550e657=
55c42985a5d4e9c9"
>> +FILES_${PN}-geanymacro =3D "${libdir}/geany/geanymacro.so"
>> +RDEPENDS_${PN}-geanymacro =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanyminiscript"
>> +LIC_FILES_CHKSUM +=3D "file://geanyminiscript/COPYING;md5=3D4325afd396f=
ebcb659c36b49533135d4"
>> +FILES_${PN}-geanyminiscript =3D "${libdir}/geany/geanyminiscript.so"
>> +RDEPENDS_${PN}-geanyminiscript =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanynumberedbookmarks"
>> +LIC_FILES_CHKSUM +=3D "file://geanynumberedbookmarks/COPYING;md5=3Dc107=
cf754550e65755c42985a5d4e9c9"
>> +FILES_${PN}-geanynumberedbookmarks =3D "${libdir}/geany/geanynumberedbo=
okmarks.so"
>> +RDEPENDS_${PN}-geanynumberedbookmarks =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanypg"
>> +LIC_FILES_CHKSUM +=3D "file://geanypg/COPYING;md5=3Db234ee4d69f5fce4486=
a80fdaf4a4263"
>> +FILES_${PN}-geanypg =3D "${libdir}/geany/geanypg.so"
>> +RDEPENDS_${PN}-geanypg =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanyprj"
>> +LIC_FILES_CHKSUM +=3D "file://geanyprj/COPYING;md5=3Dd32239bcb673463ab8=
74e80d47fae504"
>> +LICENSE_${PN}-geanyprj =3D "GPLv3"
>> +FILES_${PN}-geanyprj =3D "${libdir}/geany/geanyprj.so"
>> +RDEPENDS_${PN}-geanyprj =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanysendmail"
>> +LIC_FILES_CHKSUM +=3D "file://geanysendmail/COPYING;md5=3Dc107cf754550e=
65755c42985a5d4e9c9"
>> +FILES_${PN}-geanysendmail =3D "${libdir}/geany/geanysendmail.so"
>> +RDEPENDS_${PN}-geanysendmail =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geanyvc"
>> +LIC_FILES_CHKSUM +=3D "file://geanyvc/COPYING;md5=3Dc107cf754550e65755c=
42985a5d4e9c9"
>> +FILES_${PN}-geanyvc =3D "${libdir}/geany/geanyvc.so"
>> +RDEPENDS_${PN}-geanyvc =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-geniuspaste"
>> +LIC_FILES_CHKSUM +=3D "file://geniuspaste/COPYING;md5=3Dbfc203269f8862e=
bfc1198cdc809a95a"
>> +FILES_${PN}-geniuspaste =3D "${libdir}/geany/geniuspaste.so ${datadir}/=
${PN}/geniuspaste"
>> +RDEPENDS_${PN}-geniuspaste =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-lineoperations"
>> +LIC_FILES_CHKSUM +=3D "file://lineoperations/COPYING;md5=3Dc107cf754550=
e65755c42985a5d4e9c9"
>> +FILES_${PN}-lineoperations =3D "${libdir}/geany/lineoperations.so"
>> +RDEPENDS_${PN}-lineoperations =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-multiterm"
>> +LIC_FILES_CHKSUM +=3D "file://multiterm/COPYING;md5=3Db234ee4d69f5fce44=
86a80fdaf4a4263"
>> +FILES_${PN}-multiterm =3D "${libdir}/geany/multiterm.so"
>> +RDEPENDS_${PN}-multiterm =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-overview"
>> +LIC_FILES_CHKSUM +=3D "file://overview/overview/overviewplugin.c;beginl=
ine=3D4;endline=3D20;md5=3D1aa33522916cdeb46cccac0c629da0d0"
>> +FILES_${PN}-overview =3D "${libdir}/geany/overview.so ${datadir}/${PN}/=
overview"
>> +RDEPENDS_${PN}-overview =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-pairtaghighlighter"
>> +LICENSE_${PN}-pairtaghighlighter =3D "BSD-2-Clause"
>> +LIC_FILES_CHKSUM +=3D "file://pairtaghighlighter/COPYING;md5=3Dd6d92752=
5a612b3a8dbebc4b2e9b47c1"
>> +FILES_${PN}-pairtaghighlighter =3D "${libdir}/geany/pairtaghighlighter.=
so"
>> +RDEPENDS_${PN}-pairtaghighlighter =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-pohelper"
>> +LICENSE_${PN}-pohelper =3D "GPLv3"
>> +LIC_FILES_CHKSUM +=3D "file://pohelper/COPYING;md5=3Dd32239bcb673463ab8=
74e80d47fae504"
>> +FILES_${PN}-pohelper =3D "${libdir}/geany/pohelper.so"
>> +RDEPENDS_${PN}-pohelper =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-pretty-printer"
>> +LIC_FILES_CHKSUM +=3D "file://pretty-printer/src/PrettyPrinter.c;beginl=
ine=3D1;endline=3D17;md5=3D1665115c2fadb17c1b53cdb4e43b2440"
>> +FILES_${PN}-pretty-printer =3D "${libdir}/geany/pretty-printer.so"
>> +RDEPENDS_${PN}-pretty-printer =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-projectorganizer"
>> +LIC_FILES_CHKSUM +=3D "file://projectorganizer/COPYING;md5=3Dc107cf7545=
50e65755c42985a5d4e9c9"
>> +FILES_${PN}-projectorganizer =3D "${libdir}/geany/projectorganizer.so"
>> +RDEPENDS_${PN}-projectorganizer =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-shiftcolumn"
>> +LIC_FILES_CHKSUM +=3D "file://shiftcolumn/COPYING;md5=3D751419260aa9544=
99f7abaabaa882bbe"
>> +FILES_${PN}-shiftcolumn =3D "${libdir}/geany/shiftcolumn.so"
>> +RDEPENDS_${PN}-shiftcolumn =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-scope"
>> +LIC_FILES_CHKSUM +=3D "file://scope/COPYING;md5=3Dc107cf754550e65755c42=
985a5d4e9c9"
>> +FILES_${PN}-scope =3D "${libdir}/geany/scope.so"
>> +RDEPENDS_${PN}-scope =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-spellcheck"
>> +LIC_FILES_CHKSUM +=3D "file://spellcheck/COPYING;md5=3D4325afd396febcb6=
59c36b49533135d4"
>> +FILES_${PN}-spellcheck =3D "${libdir}/geany/spellcheck.so"
>> +RDEPENDS_${PN}-spellcheck =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-tableconvert"
>> +LIC_FILES_CHKSUM +=3D "file://tableconvert/COPYING;md5=3D6753686878d090=
a1f3f9445661d3dfbc"
>> +FILES_${PN}-tableconvert =3D "${libdir}/geany/tableconvert.so"
>> +RDEPENDS_${PN}-tableconvert =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-treebrowser"
>> +LIC_FILES_CHKSUM +=3D "file://treebrowser/README;beginline=3D67;endline=
=3D67;md5=3D52f90857fd1a9672111e472dd056a0d8"
>> +FILES_${PN}-treebrowser =3D "${libdir}/geany/treebrowser.so"
>> +RDEPENDS_${PN}-treebrowser =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-updatechecker"
>> +LIC_FILES_CHKSUM +=3D "file://updatechecker/COPYING;md5=3D4325afd396feb=
cb659c36b49533135d4"
>> +FILES_${PN}-updatechecker =3D "${libdir}/geany/updatechecker.so"
>> +RDEPENDS_${PN}-updatechecker =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-webhelper"
>> +LIC_FILES_CHKSUM +=3D "file://webhelper/COPYING;md5=3Dd32239bcb673463ab=
874e80d47fae504"
>> +LICENSE_${PN}-webhelper =3D "GPLv3"
>> +FILES_${PN}-webhelper =3D "${libdir}/geany/webhelper.so"
>> +RDEPENDS_${PN}-webhelper =3D "${PN}"
>> +
>> +PLUGINS +=3D "${PN}-xmlsnippets"
>> +LIC_FILES_CHKSUM +=3D "file://xmlsnippets/COPYING;md5=3D4325afd396febcb=
659c36b49533135d4"
>> +FILES_${PN}-xmlsnippets =3D "${libdir}/geany/xmlsnippets.so"
>> +RDEPENDS_${PN}-xmlsnippets =3D "${PN}"
>> +
>> +PACKAGES =3D+ "${PLUGINS}"
>> +RDEPENDS_${PN} =3D "${PLUGINS}"
>> +ALLOW_EMPTY_${PN} =3D "1"
>> --
>> 2.5.5
>>
>> --
Aargh - am under project pressure but'll try to reproduce..

Andreas

