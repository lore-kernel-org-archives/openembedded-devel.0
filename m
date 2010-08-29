Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpdDy-00068j-F9
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 10:26:49 +0200
Received: by iwn2 with SMTP id 2so3853514iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=DRtUlXBgJA2QoxmtzIo+AJKoifERsKGpNY8YP9a47KM=;
	b=kgNVnOwx/YoPv++i/jUum0p+MZRkVrxdARmAWHN0dUgNjonKLb0pICdfCGRzJWmYcA
	oHQjNsjfZNSf8FqbPjk4k5Cu/zk1KG4aT29R5pdFba2hCEoOGXyKRctUmi1EtfuGvecO
	yY8t95r/b0KIvHj16j6A4vQpM5YwRjmQWMxRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=lAhTFtSOuOf5PbHIjQA3uFBO9j13lgzBtuQtsjbH+sSghLlN9L4Ykx5H81NvddvORW
	qbrsnNCMBlkTjV76aMpAHtwqg/m8UerZO2uBU2Ro7j1xjLA3lTroHlY7+DPh6JcstH1k
	qcjodPcfn94X8XtZ8uDwMKIjme7DprSF3YHRU=
Received: by 10.231.19.6 with SMTP id y6mr3542913iba.16.1283070377182; Sun, 29
	Aug 2010 01:26:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 01:25:57 -0700 (PDT)
In-Reply-To: <AANLkTi=nFg+-yRc7A9L8RSwBo6G7-RZ25K0Zce-bZjB5@mail.gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-2-git-send-email-raj.khem@gmail.com>
	<AANLkTi=nFg+-yRc7A9L8RSwBo6G7-RZ25K0Zce-bZjB5@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 01:25:57 -0700
Message-ID: <AANLkTikMUmr4U=Q0uPg=MXr-zudpYVTQaAW6QyV5u4s4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/23] recipes: Move some recipes to nonworking for getting bitbake world.
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
X-List-Received-Date: Sun, 29 Aug 2010 08:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2010 at 12:16 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Did you also look at the transitive closure of this (so added or fixed
> recipes that DEPEND or RDEPEND on these?
> These are also non-workign now

No I did not have that covered in these patches. Its a step by step
process and it will be taken care of
eventually.

>
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> 2010/8/28 Khem Raj <raj.khem@gmail.com>:
>> * If a recipes has DEPENDS on another recipe which is nonworking
>> =A0then move the recipe in question to nonworking too.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0.../files/mini-browser-desktop-fix.patch =A0 =A0 =A0 =A0 =A0 | =A0 16=
 ----
>> =A0.../gpe-mini-browser-hildon_0.15.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 54 --------------
>> =A0.../gpe-mini-browser-hildon_0.16.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 55 ---------------
>> =A0.../gpe-mini-browser-hildon_0.17.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 25 -------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb =A0| =A0 55 -------=
--------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb =A0| =A0 55 -------=
--------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb =A0| =A0 54 -------=
-------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb =A0| =A0 51 -------=
-------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb =A0| =A0 55 -------=
--------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb =A0| =A0 55 -------=
--------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb =A0| =A0 57 -------=
--------
>> =A0recipes/gpe-mini-browser/gpe-mini-browser_svn.bb =A0 | =A0 55 -------=
--------
>> =A0recipes/gpe-todo/gpe-todo-hildon_0.54.bb =A0 =A0 =A0 =A0 =A0 | =A0 20=
 ------
>> =A0recipes/gpe-todo/gpe-todo-hildon_0.55.bb =A0 =A0 =A0 =A0 =A0 | =A0 20=
 ------
>> =A0recipes/images/maemo-image.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 20 ------
>> =A0recipes/libgpepimc/libgpepimc-hildon_0.5.bb =A0 =A0 =A0 =A0| =A0 30 -=
-------
>> =A0recipes/maemo-mapper/maemo-mapper_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 22=
 ------
>> =A0recipes/maemo/hildon-control-panel_0.9.1-1.2.bb =A0 =A0| =A0 21 -----=
-
>> =A0recipes/maemo/hildon-status-bar/source.patch =A0 =A0 =A0 | =A0 11 ---
>> =A0recipes/maemo/hildon-status-bar_0.8.11-1.bb =A0 =A0 =A0 =A0| =A0 15 -=
---
>> =A0recipes/maemo/lessertunjo_0.0.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 25 -------
>> =A0recipes/maemo/libosso-help_1.0.01.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 24 -------
>> =A0.../maemo/osso-application-installer_1.0.03-1.bb =A0 | =A0 22 ------
>> =A0recipes/maemo4/libosso-help_2.1.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 21 ------
>> =A0recipes/meta/meta-maemo.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 11 ---
>> =A0.../files/mini-browser-desktop-fix.patch =A0 =A0 =A0 =A0 =A0 | =A0 16=
 ++++
>> =A0.../gpe-mini-browser-hildon_0.15.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 54 ++++++++++++++
>> =A0.../gpe-mini-browser-hildon_0.16.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 55 +++++++++++++++
>> =A0.../gpe-mini-browser-hildon_0.17.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 25 +++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_0.15.bb =A0 =A0 =A0| =A0 55 +++=
++++++++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_0.16.bb =A0 =A0 =A0| =A0 55 +++=
++++++++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_0.17.bb =A0 =A0 =A0| =A0 54 +++=
+++++++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_0.18.bb =A0 =A0 =A0| =A0 51 +++=
+++++++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_0.19.bb =A0 =A0 =A0| =A0 55 +++=
++++++++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_0.20.bb =A0 =A0 =A0| =A0 55 +++=
++++++++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_0.21.bb =A0 =A0 =A0| =A0 57 +++=
++++++++++++
>> =A0.../gpe-mini-browser/gpe-mini-browser_svn.bb =A0 =A0 =A0 | =A0 55 +++=
++++++++++++
>> =A0.../nonworking/gpe-todo/gpe-todo-hildon_0.54.bb =A0 =A0| =A0 20 +++++=
+
>> =A0.../nonworking/gpe-todo/gpe-todo-hildon_0.55.bb =A0 =A0| =A0 20 +++++=
+
>> =A0recipes/nonworking/images/maemo-image.bb =A0 =A0 =A0 =A0 =A0 | =A0 20=
 ++++++
>> =A0.../nonworking/libgpepimc/libgpepimc-hildon_0.5.bb | =A0 30 ++++++++
>> =A0.../nonworking/maemo-mapper/maemo-mapper_svn.bb =A0 =A0| =A0 22 +++++=
+
>> =A0.../maemo/hildon-control-panel_0.9.1-1.2.bb =A0 =A0 =A0 =A0| =A0 21 +=
+++++
>> =A0.../maemo/hildon-status-bar/source.patch =A0 =A0 =A0 =A0 =A0 | =A0 11=
 +++
>> =A0.../nonworking/maemo/hildon-status-bar_0.8.11-1.bb | =A0 15 ++++
>> =A0recipes/nonworking/maemo/lessertunjo_0.0.10.bb =A0 =A0 | =A0 25 +++++=
++
>> =A0recipes/nonworking/maemo/libosso-help_1.0.01.bb =A0 =A0| =A0 24 +++++=
++
>> =A0.../maemo/osso-application-installer_1.0.03-1.bb =A0 | =A0 22 ++++++
>> =A0recipes/nonworking/maemo4/libosso-help_2.1.2.bb =A0 =A0| =A0 21 +++++=
+
>> =A0recipes/nonworking/meta/meta-maemo.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 11 +++
>> =A0recipes/nonworking/tasks/task-maemo.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
73 ++++++++++++++++++++
>> =A0recipes/nonworking/ukeyboard/ukeyboard_1.2.bb =A0 =A0 =A0| =A0 17 +++=
++
>> =A0recipes/tasks/task-maemo.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 73 --------------------
>> =A0recipes/ukeyboard/ukeyboard_1.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 17 -----
>> =A054 files changed, 939 insertions(+), 939 deletions(-)
>> =A0delete mode 100644 recipes/gpe-mini-browser/files/mini-browser-deskto=
p-fix.patch
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser-hildon_0=
.15.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser-hildon_0=
.16.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser-hildon_0=
.17.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
>> =A0delete mode 100644 recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
>> =A0delete mode 100644 recipes/gpe-todo/gpe-todo-hildon_0.54.bb
>> =A0delete mode 100644 recipes/gpe-todo/gpe-todo-hildon_0.55.bb
>> =A0delete mode 100644 recipes/images/maemo-image.bb
>> =A0delete mode 100644 recipes/libgpepimc/libgpepimc-hildon_0.5.bb
>> =A0delete mode 100644 recipes/maemo-mapper/maemo-mapper_svn.bb
>> =A0delete mode 100644 recipes/maemo/hildon-control-panel_0.9.1-1.2.bb
>> =A0delete mode 100644 recipes/maemo/hildon-status-bar/source.patch
>> =A0delete mode 100644 recipes/maemo/hildon-status-bar_0.8.11-1.bb
>> =A0delete mode 100644 recipes/maemo/lessertunjo_0.0.10.bb
>> =A0delete mode 100644 recipes/maemo/libosso-help_1.0.01.bb
>> =A0delete mode 100644 recipes/maemo/osso-application-installer_1.0.03-1.=
bb
>> =A0delete mode 100644 recipes/maemo4/libosso-help_2.1.2.bb
>> =A0delete mode 100644 recipes/meta/meta-maemo.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/files/mini-bro=
wser-desktop-fix.patch
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er-hildon_0.15.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er-hildon_0.16.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er-hildon_0.17.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_0.15.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_0.16.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_0.17.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_0.18.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_0.19.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_0.20.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_0.21.bb
>> =A0create mode 100644 recipes/nonworking/gpe-mini-browser/gpe-mini-brows=
er_svn.bb
>> =A0create mode 100644 recipes/nonworking/gpe-todo/gpe-todo-hildon_0.54.b=
b
>> =A0create mode 100644 recipes/nonworking/gpe-todo/gpe-todo-hildon_0.55.b=
b
>> =A0create mode 100644 recipes/nonworking/images/maemo-image.bb
>> =A0create mode 100644 recipes/nonworking/libgpepimc/libgpepimc-hildon_0.=
5.bb
>> =A0create mode 100644 recipes/nonworking/maemo-mapper/maemo-mapper_svn.b=
b
>> =A0create mode 100644 recipes/nonworking/maemo/hildon-control-panel_0.9.=
1-1.2.bb
>> =A0create mode 100644 recipes/nonworking/maemo/hildon-status-bar/source.=
patch
>> =A0create mode 100644 recipes/nonworking/maemo/hildon-status-bar_0.8.11-=
1.bb
>> =A0create mode 100644 recipes/nonworking/maemo/lessertunjo_0.0.10.bb
>> =A0create mode 100644 recipes/nonworking/maemo/libosso-help_1.0.01.bb
>> =A0create mode 100644 recipes/nonworking/maemo/osso-application-installe=
r_1.0.03-1.bb
>> =A0create mode 100644 recipes/nonworking/maemo4/libosso-help_2.1.2.bb
>> =A0create mode 100644 recipes/nonworking/meta/meta-maemo.bb
>> =A0create mode 100644 recipes/nonworking/tasks/task-maemo.bb
>> =A0create mode 100644 recipes/nonworking/ukeyboard/ukeyboard_1.2.bb
>> =A0delete mode 100644 recipes/tasks/task-maemo.bb
>> =A0delete mode 100644 recipes/ukeyboard/ukeyboard_1.2.bb
>>
>> diff --git a/recipes/gpe-mini-browser/files/mini-browser-desktop-fix.pat=
ch b/recipes/gpe-mini-browser/files/mini-browser-desktop-fix.patch
>> deleted file mode 100644
>> index 4912abb..0000000
>> --- a/recipes/gpe-mini-browser/files/mini-browser-desktop-fix.patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> ---- gpe-mini-browser-0.21.old/gpe-mini-browser-0.21//gpe-mini-browser.d=
esktop.in.in =A0 =A02007-01-09 14:53:31.000000000 +0200
>> -+++ gpe-mini-browser-0.21/gpe-mini-browser.desktop.in.in =A0 =A0 =A0 20=
07-12-11 20:45:04.749584640 +0200
>> -@@ -2,9 +2,8 @@
>> - _Name=3DMini Web Browser
>> - _Comment=3DBrowse the web
>> - Exec=3Dgpe-mini-browser
>> --Terminal=3D0
>> -+Terminal=3Dfalse
>> - Type=3DApplication
>> --Icon=3Dgpe-mini-browser.png
>> --Categories=3DApplication;PIM;GPE
>> --StartupNotify=3DTrue
>> --
>> -+Icon=3Dgpe-mini-browser
>> -+Categories=3DX-GPE;X-PIM;X-Internet;X-Browser;
>> -+StartupNotify=3Dtrue
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb b/=
recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
>> deleted file mode 100644
>> index faa9131..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -PR =3D "r0"
>> -
>> -SRC_URI =A0 =A0 =A0=3D "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
>> -DEPENDS =A0 =A0 =A0=3D "osb-nrcit libosso hildon-lgpl hildon-fm libgpew=
idget"
>> -EXTRA_OECONF =3D "--enable-hildon"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications/hil=
don
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/hildon/gpe-mini-brows=
er.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -SRC_URI[md5sum] =3D "b048cee7254d7fe6eb1e2821ce8706df"
>> -SRC_URI[sha256sum] =3D "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd79=
4ecd46fac037c8913"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb b/=
recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
>> deleted file mode 100644
>> index 370017a..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -PR =3D "r0"
>> -
>> -SRC_URI =A0 =A0 =A0=3D "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
>> -DESCRIPTION =A0=3D "A lightweight webbrowser for the GPE platform (Hild=
on UI)"
>> -DEPENDS =A0 =A0 =A0=3D "osb-nrcit libosso hildon-lgpl hildon-fm libgpew=
idget"
>> -EXTRA_OECONF =3D "--enable-hildon"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications/hil=
don
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/hildon/gpe-mini-brows=
er.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -SRC_URI[md5sum] =3D "858f3e7219cde7b18e69293526020416"
>> -SRC_URI[sha256sum] =3D "36d2487895d3579ae3e8693ebe789b5de454506fc572937=
dac2fb7ef512f105f"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb b/=
recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
>> deleted file mode 100644
>> index 692f418..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -PR =3D "r0"
>> -
>> -SRC_URI =A0 =A0 =A0=3D "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
>> -DESCRIPTION =A0=3D "A lightweight webbrowser for the GPE platform (Hild=
on UI)"
>> -DEPENDS =A0 =A0 =A0=3D "osb-nrcit libosso hildon-lgpl hildon-fm libgpew=
idget"
>> -EXTRA_OECONF =3D "--enable-hildon"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications/hil=
don
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/hildon/gpe-mini-brows=
er.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -
>> -
>> -SRC_URI[md5sum] =3D "749c571ec28e2ea4f31602f3d5609e4b"
>> -SRC_URI[sha256sum] =3D "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39=
bfbf364e1da34188c"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb b/recipes=
/gpe-mini-browser/gpe-mini-browser_0.15.bb
>> deleted file mode 100644
>> index 68d8020..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_0.15.bb
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> -DEPENDS =3D "osb-nrcit libgpewidget"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 # =A0 =A0 =A0 install -d ${D}${docdir}/gpe
>> - =A0 =A0 =A0 # =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.html =
=A0${D}${docdir}/gpe/
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -SRC_URI[md5sum] =3D "b048cee7254d7fe6eb1e2821ce8706df"
>> -SRC_URI[sha256sum] =3D "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd79=
4ecd46fac037c8913"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb b/recipes=
/gpe-mini-browser/gpe-mini-browser_0.16.bb
>> deleted file mode 100644
>> index e83467c..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_0.16.bb
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> -DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 # =A0 =A0 =A0 install -d ${D}${docdir}/gpe
>> - =A0 =A0 =A0 # =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.html =
=A0${D}${docdir}/gpe/
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -SRC_URI[md5sum] =3D "858f3e7219cde7b18e69293526020416"
>> -SRC_URI[sha256sum] =3D "36d2487895d3579ae3e8693ebe789b5de454506fc572937=
dac2fb7ef512f105f"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb b/recipes=
/gpe-mini-browser/gpe-mini-browser_0.17.bb
>> deleted file mode 100644
>> index 5499ca3..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_0.17.bb
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> -DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> -RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> -
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -
>> -SRC_URI[md5sum] =3D "749c571ec28e2ea4f31602f3d5609e4b"
>> -SRC_URI[sha256sum] =3D "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39=
bfbf364e1da34188c"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb b/recipes=
/gpe-mini-browser/gpe-mini-browser_0.18.bb
>> deleted file mode 100644
>> index 9c67dcc..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_0.18.bb
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> -DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> -RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> -
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb b/recipes=
/gpe-mini-browser/gpe-mini-browser_0.19.bb
>> deleted file mode 100644
>> index 0a9c78d..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_0.19.bb
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -SRC_URI =3D "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-=
${PV}.tar.gz"
>> -DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> -RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> -
>> -PR =3D "r2"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -
>> -SRC_URI[md5sum] =3D "922640f40f67d15892d9ea8ec6c8ffea"
>> -SRC_URI[sha256sum] =3D "ece034b916a7760cfb854baab474b7931246bdb078c8143=
66bf90a9fbff246af"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb b/recipes=
/gpe-mini-browser/gpe-mini-browser_0.20.bb
>> deleted file mode 100644
>> index 1bff97b..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_0.20.bb
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -SRC_URI =3D "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-=
${PV}.tar.gz"
>> -DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> -RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> -
>> -PR =3D "r2"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -
>> -SRC_URI[md5sum] =3D "1a7a4095cafed9cda21e500842b686a1"
>> -SRC_URI[sha256sum] =3D "ddba5fea0424c9c121269e96ea202014a29568263d478ac=
5682022973d2986f1"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb b/recipes=
/gpe-mini-browser/gpe-mini-browser_0.21.bb
>> deleted file mode 100644
>> index 824a416..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb
>> +++ /dev/null
>> @@ -1,57 +0,0 @@
>> -require gpe-mini-browser.inc
>> -
>> -SRC_URI =3D "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-=
${PV}.tar.gz"
>> -DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> -RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> -
>> -PR =3D "r2"
>> -
>> -SRC_URI +=3D "file://mini-browser-desktop-fix.patch"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> -
>> -inherit autotools
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 fi
>> -}
>> -
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -
>> -SRC_URI[md5sum] =3D "a1297dfd14c008e3415f89b01eef75cd"
>> -SRC_URI[sha256sum] =3D "ec0358d104fa992f1437b37cdf70e83ab152794d2989ef2=
e9715ab8659dc46e3"
>> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb b/recipes/=
gpe-mini-browser/gpe-mini-browser_svn.bb
>> deleted file mode 100644
>> index 0ebff73..0000000
>> --- a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
>> +++ /dev/null
>> @@ -1,55 +0,0 @@
>> -DEPENDS =3D "sqlite gettext gtk+ glib-2.0 osb-nrcit libgpewidget"
>> -RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> -
>> -SRCREV =3D "9900"
>> -PV =3D "0.20+svn${SRCDATE}"
>> -PR =3D "r1"
>> -
>> -inherit autotools
>> -
>> -SRC_URI =3D "${GPE_EXTRA_SVN}"
>> -
>> -S =3D "${WORKDIR}/gpe-mini-browser"
>> -
>> -do_install() {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -d ${D}/usr/share/applications
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${S}/gpe-mini-browser.d=
esktop ${D}/usr/share/applications/gpe-mini-browser.desktop
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -d ${D}/usr/share/pixmaps
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${S}/gpe-mini-browser.p=
ng ${D}/usr/share/pixmaps/gpe-mini-browser.png
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0autotools_do_install
>> -}
>> -
>> -pkg_postinst_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ "x$D" !=3D "x" ]; then
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -pkg_postrm_${PN}-doc () {
>> - =A0 =A0 =A0 =A0#!/bin/sh
>> - =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> - =A0 =A0 =A0 =A0fi
>> - =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> - =A0 =A0 =A0 =A0else
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> - =A0 =A0 =A0 =A0fi
>> -}
>> -
>> -require gpe-mini-browser.inc
>> -
>> -#DEFAULT_PREFERENCE =3D "-1"
>> diff --git a/recipes/gpe-todo/gpe-todo-hildon_0.54.bb b/recipes/gpe-todo=
/gpe-todo-hildon_0.54.bb
>> deleted file mode 100644
>> index 9954d51..0000000
>> --- a/recipes/gpe-todo/gpe-todo-hildon_0.54.bb
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -LICENSE =A0 =A0 =3D "GPL"
>> -PR =A0 =A0 =A0 =A0 =A0=3D "r1"
>> -DESCRIPTION =3D "GPE to-do list"
>> -DEPENDS =A0 =A0 =3D "libgpewidget-hildon libgpepimc-hildon libtododb sd=
k-default-icons libosso"
>> -RDEPENDS_${PN} =A0 =A0=3D "sdk-default-icons"
>> -SECTION =3D "gpe"
>> -PRIORITY =A0 =A0=3D "optional"
>> -
>> -inherit gpe autotools pkgconfig
>> -
>> -EXTRA_OECONF =3D "--enable-hildon"
>> -
>> -SRC_URI=3D"${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
>> -
>> -S =3D "${WORKDIR}/gpe-todo-${PV}"
>> -
>> -FILES_${PN} +=3D "${datadir}/gpe-todo ${libdir}/dbus-1.0"
>> -
>> -SRC_URI[md5sum] =3D "8fdd52954a7a29691013900b65eb5702"
>> -SRC_URI[sha256sum] =3D "b3f51635b3ce6408fdfbd0283e1d8036c23b6ecb5adf0d6=
6882e7e48eb5d97b9"
>> diff --git a/recipes/gpe-todo/gpe-todo-hildon_0.55.bb b/recipes/gpe-todo=
/gpe-todo-hildon_0.55.bb
>> deleted file mode 100644
>> index d71f862..0000000
>> --- a/recipes/gpe-todo/gpe-todo-hildon_0.55.bb
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -LICENSE =A0 =A0 =3D "GPL"
>> -PR =A0 =A0 =A0 =A0 =A0=3D "r1"
>> -DESCRIPTION =3D "GPE to-do list"
>> -DEPENDS =A0 =A0 =3D "libgpewidget-hildon libgpepimc-hildon libtododb sd=
k-default-icons libosso"
>> -RDEPENDS_${PN} =A0 =A0=3D "sdk-default-icons"
>> -SECTION =3D "gpe"
>> -PRIORITY =A0 =A0=3D "optional"
>> -
>> -inherit gpe autotools pkgconfig
>> -
>> -EXTRA_OECONF =3D "--enable-hildon"
>> -
>> -SRC_URI=3D"${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
>> -
>> -S =3D "${WORKDIR}/gpe-todo-${PV}"
>> -
>> -FILES_${PN} +=3D "${datadir}/gpe-todo ${libdir}/dbus-1.0"
>> -
>> -SRC_URI[md5sum] =3D "e8c08165d9723779473e3390a949afac"
>> -SRC_URI[sha256sum] =3D "ec2ef95c967acce5834c8b4985c610014c16242d223d233=
947d67b4514ebe298"
>> diff --git a/recipes/images/maemo-image.bb b/recipes/images/maemo-image.=
bb
>> deleted file mode 100644
>> index c0498bb..0000000
>> --- a/recipes/images/maemo-image.bb
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -#
>> -# Meta package for maemo based system image
>> -#
>> -
>> -GUI_MACHINE_CLASS ?=3D "none"
>> -
>> -MAEMO_EXTRA_DEPENDS =3D "scap dosfstools"
>> -MAEMO_EXTRA_INSTALL =3D "osso-af-services osso-af-base-apps scap dosfst=
ools"
>> -
>> -XSERVER ?=3D "xserver-kdrive-omap"
>> -
>> -DEPENDS =3D "${MACHINE_TASK_PROVIDER} \
>> - =A0 =A0 =A0 =A0 =A0meta-maemo \
>> - =A0 =A0 =A0 =A0 =A0${MAEMO_EXTRA_DEPENDS}"
>> -
>> -IMAGE_INSTALL =3D "${MACHINE_TASK_PROVIDER} maemo-task-base maemo-task-=
theme \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0maemo-task-apps ${MAEMO_EXT=
RA_INSTALL} \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${XSERVER}"
>> -
>> -inherit image
>> diff --git a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb b/recipes/libgp=
epimc/libgpepimc-hildon_0.5.bb
>> deleted file mode 100644
>> index 12155b9..0000000
>> --- a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -LICENSE =A0 =A0 =3D "LGPL"
>> -PR =A0 =A0 =A0 =A0 =A0=3D "r1"
>> -DESCRIPTION =3D "Common code for GPE PIMs (hildon UI version)"
>> -SECTION =3D "gpe/libs"
>> -PRIORITY =A0 =A0=3D "optional"
>> -DEPENDS =A0 =A0 =3D "libgpewidget-hildon gtk+ sqlite hildon-lgpl"
>> -PROVIDES =A0 =A0=3D "libgepepimc"
>> -RPROVIDES_${PN} =A0 =3D "libgepepimc"
>> -
>> -SRC_URI =A0 =A0 =3D "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
>> -
>> -EXTRA_OECONF =3D "--enable-hildon"
>> -S =3D "${WORKDIR}/libgpepimc-${PV}"
>> -
>> -inherit pkgconfig autotools
>> -
>> -headers =3D "pim-categories.h pim-categories-ui.h"
>> -
>> -do_stage () {
>> - =A0 =A0 =A0 oe_libinstall -so libgpepimc ${STAGING_LIBDIR}
>> -
>> - =A0 =A0 =A0 mkdir -p ${STAGING_INCDIR}/gpe
>> - =A0 =A0 =A0 for h in ${headers}; do
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe/$h ${STAGING_INCD=
IR}/gpe/$h
>> - =A0 =A0 =A0 done
>> -}
>> -
>> -
>> -SRC_URI[md5sum] =3D "bbb0efe3359510fc0393f3f305c1c6e7"
>> -SRC_URI[sha256sum] =3D "b0d1236dbb27f054f8b8a6f8ed4d735db89eb466be641be=
d67363f4dd76385ad"
>> diff --git a/recipes/maemo-mapper/maemo-mapper_svn.bb b/recipes/maemo-ma=
pper/maemo-mapper_svn.bb
>> deleted file mode 100644
>> index 713a54a..0000000
>> --- a/recipes/maemo-mapper/maemo-mapper_svn.bb
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -DESCRIPTION =3D "GPS navigation/map display software"
>> -LICENSE =3D "GPL"
>> -DEPENDS =3D "gdbm libconic sqlite3 gtk+ libhildonfm libosso osso-ic-oss=
 libosso-help gnome-vfs dbus bluez-libs"
>> -RDEPENDS_${PN} =3D "bluez-utils"
>> -RRECOMMENDS_${PN} =3D "gpsd flite"
>> -SRCREV =3D "118"
>> -PV =3D "2.0.3+svnr${SRCPV}"
>> -PR =3D "r3"
>> -
>> -SRC_URI =3D "svn://garage.maemo.org/svn/maemo-mapper;proto=3Dhttps;modu=
le=3Dtrunk \
>> - =A0 =A0 =A0 =A0 =A0 file://mapper-hildon1.diff;maxrev=3D108"
>> -
>> -S =3D "${WORKDIR}/trunk"
>> -
>> -inherit autotools pkgconfig
>> -
>> -do_install_append () {
>> - =A0 =A0 =A0 install -d ${D}${datadir}/applications/
>> - =A0 =A0 =A0 mv ${D}/maemo-mapper.desktop ${D}${datadir}/applications/
>> -}
>> -
>> -#FILES_${PN} +=3D "${datadir}/icons"
>> diff --git a/recipes/maemo/hildon-control-panel_0.9.1-1.2.bb b/recipes/m=
aemo/hildon-control-panel_0.9.1-1.2.bb
>> deleted file mode 100644
>> index 3c56364..0000000
>> --- a/recipes/maemo/hildon-control-panel_0.9.1-1.2.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -PR =A0 =A0 =A0 =A0 =3D "r2"
>> -LICENSE =A0 =A0=3D "GPL"
>> -
>> -DEPENDS =3D "hildon-lgpl hildon-base-lib osso-af-settings libosso hildo=
n-libs osso-af-settings libosso-help"
>> -
>> -SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}=
/${PN}_${PV}.tar.gz \
>> - =A0 =A0 =A0 =A0 =A0 file://config-path.patch;striplevel=3D0 \
>> - =A0 =A0 =A0 =A0 =A0 file://noWerror.patch;striplevel=3D0"
>> -
>> -S =3D "${WORKDIR}/hildon-control-panel-0.9.1"
>> -
>> -inherit autotools pkgconfig
>> -
>> -FILES_${PN} +=3D "${libdir}/dbus-1.0 ${datadir}/applications"
>> -
>> -do_stage() {
>> - =A0 =A0 =A0 =A0install -d ${STAGING_INCDIR}/hildon-cp-plugin
>> - =A0 =A0 =A0 =A0install -m 644 *.h ${STAGING_INCDIR}/hildon-cp-plugin
>> -}
>> -SRC_URI[md5sum] =3D "72c8b814ebeec8668cea575e08bb1548"
>> -SRC_URI[sha256sum] =3D "bbe77d297c7560d3fdad343ab49f23c9c0aa1574db77108=
d1b97845fb7bb26d5"
>> diff --git a/recipes/maemo/hildon-status-bar/source.patch b/recipes/maem=
o/hildon-status-bar/source.patch
>> deleted file mode 100644
>> index dd5e82b..0000000
>> --- a/recipes/maemo/hildon-status-bar/source.patch
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> ---- status-bar-launch.sh.old =A0 2005-06-14 17:12:10.000000000 +0200
>> -+++ status-bar-launch.sh =A0 =A0 =A0 2005-06-14 17:12:15.000000000 +020=
0
>> -@@ -21,7 +21,7 @@
>> - # 02110-1301 USA
>> - #
>> -
>> --source af.conf
>> -+. af.conf
>> -
>> - if [ "$1" !=3D "start" ] && [ "$1" !=3D "stop" ] && [ "$1" !=3D "resta=
rt" ]; then
>> - =A0 echo "Usage: $0 {start|stop|restart}"
>> diff --git a/recipes/maemo/hildon-status-bar_0.8.11-1.bb b/recipes/maemo=
/hildon-status-bar_0.8.11-1.bb
>> deleted file mode 100644
>> index 5d6238c..0000000
>> --- a/recipes/maemo/hildon-status-bar_0.8.11-1.bb
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -PR =A0 =A0 =A0 =A0 =3D "r1"
>> -LICENSE =A0 =A0=3D "GPL"
>> -
>> -DEPENDS =3D "hildon-lgpl libosso hildon-libs"
>> -
>> -SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}=
/${PN}_${PV}.tar.gz \
>> - =A0 =A0 =A0 =A0 =A0 file://source.patch;striplevel=3D0"
>> -
>> -S =3D "${WORKDIR}/hildon-status-bar-0.8.11"
>> -
>> -inherit autotools pkgconfig
>> -
>> -
>> -SRC_URI[md5sum] =3D "7948087bfe3b1bf8025a37fbb64bde44"
>> -SRC_URI[sha256sum] =3D "eca16f42de8e4a213acb3ba0978fa56fbdf2f38e5be5882=
163753068ab4a15cd"
>> diff --git a/recipes/maemo/lessertunjo_0.0.10.bb b/recipes/maemo/lessert=
unjo_0.0.10.bb
>> deleted file mode 100644
>> index 691893d..0000000
>> --- a/recipes/maemo/lessertunjo_0.0.10.bb
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -LICENSE =3D =A0 =A0 =A0"LGPL"
>> -
>> -DEPENDS =3D =A0 =A0 =A0"gconf-osso hildon-libs dbus libosso"
>> -SRC_URI =3D =A0 =A0 =A0"http://repository.maemo.org/pool/maemo/ossw/sou=
rce/l/lessertunjo/lessertunjo_${PV}-3.tar.gz"
>> -
>> -inherit =A0pkgconfig
>> -
>> -S =3D "${WORKDIR}/lessertunjo"
>> -LDFLAGS +=3D " -losso -L${STAGING_LIBDIR} -I${STAGING_INCDIR} =A0-I${ST=
AGING_LIBDIR}/dbus-1.0/include -I${STAGING_INCDIR}/dbus-1.0 -I${STAGING_INC=
DIR}/glib-2.0 =A0-I${STAGING_INCDIR}/gconf/2"
>> -
>> -
>> -do_install() {
>> - =A0 =A0 =A0 install -d ${D}${libdir}
>> - =A0 =A0 =A0 install -m 755 *so.0.0.10 =A0${D}${libdir}
>> -}
>> -
>> -do_stage() {
>> - =A0 =A0 =A0 oe_libinstall -so libshadowapp libshadowappd =A0${STAGING_=
LIBDIR}
>> - =A0 =A0 =A0 install -d ${STAGING_INCDIR}
>> - =A0 =A0 =A0 install -m 644 *.h ${STAGING_INCDIR}
>> -
>> -}
>> -
>> -SRC_URI[md5sum] =3D "b6d7ca9e9740286f0ce918da9fb8438b"
>> -SRC_URI[sha256sum] =3D "0ee6a3caee4812827b8e167d4a07dbf859cb08a00a20f09=
568c3baae379d6ce8"
>> diff --git a/recipes/maemo/libosso-help_1.0.01.bb b/recipes/maemo/liboss=
o-help_1.0.01.bb
>> deleted file mode 100644
>> index b80d45a..0000000
>> --- a/recipes/maemo/libosso-help_1.0.01.bb
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -LICENSE =3D =A0 =A0 =A0"LGPL"
>> -PR =3D "r0"
>> -
>> -DEPENDS =3D =A0 =A0 =A0"libosso hildon-lgpl hildon-base-lib hildon-libs=
"
>> -SRC_URI =3D =A0 =A0 =A0"http://repository.maemo.org/pool/maemo/ossw/sou=
rce/libo/${PN}/libosso-help_${PV}.tar.gz \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://no-Werror.patch;striplevel=3D0 =
\
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://help-header-pp.patch;striplevel=
=3D0"
>> -
>> -inherit pkgconfig autotools
>> -
>> -S =3D "${WORKDIR}/libosso-help-sdk-${PV}"
>> -
>> -#FILES_${PN} +=3D "${libdir}/dbus-1.0/services/ ${libdir}/outo/*.so ${l=
ibdir}/outo/*bin ${libdir}/outo/mimedummy.doc"
>> -
>> -do_stage() {
>> - =A0 =A0 =A0 install -d ${STAGING_INCDIR}
>> - =A0 =A0 =A0 install -m 644 helplib/*.h ${STAGING_INCDIR}
>> - =A0 =A0 =A0 install -m644 helplib/.libs/libossohelp.so ${STAGING_LIBDI=
R}
>> - =A0 =A0 =A0 install -m644 helplib/.libs/libossohelp.so.0 ${STAGING_LIB=
DIR}
>> - =A0 =A0 =A0 install -m644 helplib/.libs/libossohelp.so.0.0.0 ${STAGING=
_LIBDIR}
>> -}
>> -
>> -SRC_URI[md5sum] =3D "dbc3c68809e39bd6681aab8ad16ffe3c"
>> -SRC_URI[sha256sum] =3D "ef6f6fda31dfbf7b3186b6f1d0ffd12ee0675d9a057ad29=
94f81b5164213a693"
>> diff --git a/recipes/maemo/osso-application-installer_1.0.03-1.bb b/reci=
pes/maemo/osso-application-installer_1.0.03-1.bb
>> deleted file mode 100644
>> index 3d24f21..0000000
>> --- a/recipes/maemo/osso-application-installer_1.0.03-1.bb
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -PR =A0 =A0 =A0 =A0 =3D "r1"
>> -LICENSE =A0 =A0=3D "GPL"
>> -
>> -DEPENDS =3D "hildon-lgpl hildon-base-lib libosso hildon-libs hildon-con=
trol-panel shared-mime-info"
>> -RDEPENDS_${PN} =3D "shared-mime-info"
>> -
>> -SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}=
/${PN}_${PV}.tar.gz \
>> - =A0 =A0 =A0 =A0 =A0 file://fix-buildsystem.patch"
>> -
>> -S =3D "${WORKDIR}/osso-application-installer-1.0.03"
>> -
>> -inherit autotools pkgconfig
>> -
>> -FILES_${PN} +=3D "${libdir}/dbus-1.0 ${libdir}/hildon-control-panel/*.s=
o ${datadir}/applications ${datadir}/mime"
>> -
>> -pkg_postinst () {
>> - =A0echo "Updating MIME database... this may take a while."
>> - =A0${bindir}/update-mime-database ${datadir}/mime
>> -}
>> -
>> -SRC_URI[md5sum] =3D "05e47346d432bd4c78736b12f262d612"
>> -SRC_URI[sha256sum] =3D "f7129c56cd7e561c10457d101f37ebf3a8b02df83f42a30=
cb90b46eb0de5dede"
>> diff --git a/recipes/maemo4/libosso-help_2.1.2.bb b/recipes/maemo4/libos=
so-help_2.1.2.bb
>> deleted file mode 100644
>> index b7b6de5..0000000
>> --- a/recipes/maemo4/libosso-help_2.1.2.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -LICENSE =3D "LGPL"
>> -DESCRIPTION =3D "Nokia osso help library"
>> -
>> -DEPENDS =3D "libhildonhelp libosso gtkhtml-3.8 libxml2 "
>> -
>> -PR =3D "r0"
>> -
>> -SRC_URI =3D "http://repository.maemo.org/pool/sardine-experimental/main=
.disabled/source/libo/libosso-help/libosso-help_${PV}-2.tar.gz"
>> -
>> -inherit autotools pkgconfig lib_package
>> -
>> -S =3D "${WORKDIR}/2.1.2-2"
>> -
>> -do_configure_prepend() {
>> - =A0 =A0 =A0 # remove Werror from OSSO_CFLAGS
>> - =A0 =A0 =A0 sed -i s:-Werror::g configure.ac
>> - =A0 =A0 =A0 =A0sed -i -e s:AC_CONFIG_SRCDIR:#AC_CONFIG_SRCDIR:g config=
ure.ac
>> -}
>> -
>> -SRC_URI[md5sum] =3D "fc5a1f4598670cec9ac40fb603f80570"
>> -SRC_URI[sha256sum] =3D "ecbff97da422f1498eae8f9b8a17389c0ccdd7eee1ca025=
9f035e712c8e0a405"
>> diff --git a/recipes/meta/meta-maemo.bb b/recipes/meta/meta-maemo.bb
>> deleted file mode 100644
>> index ac0dabe..0000000
>> --- a/recipes/meta/meta-maemo.bb
>> +++ /dev/null
>> @@ -1,11 +0,0 @@
>> -DESCRIPTION =3D "Meta-package for maemo environment"
>> -LICENSE =3D "MIT"
>> -PR =3D "r1"
>> -
>> -RDEPENDS_${PN} =3D "\
>> - =A0 =A0maemo-task-base \
>> - =A0 =A0maemo-task-apps \
>> - =A0 =A0maemo-task-libs-install \
>> - =A0 =A0maemo-task-theme"
>> -
>> -inherit meta
>> diff --git a/recipes/nonworking/gpe-mini-browser/files/mini-browser-desk=
top-fix.patch b/recipes/nonworking/gpe-mini-browser/files/mini-browser-desk=
top-fix.patch
>> new file mode 100644
>> index 0000000..4912abb
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/files/mini-browser-desktop-fix=
.patch
>> @@ -0,0 +1,16 @@
>> +--- gpe-mini-browser-0.21.old/gpe-mini-browser-0.21//gpe-mini-browser.d=
esktop.in.in =A0 =A02007-01-09 14:53:31.000000000 +0200
>> ++++ gpe-mini-browser-0.21/gpe-mini-browser.desktop.in.in =A0 =A0 =A0 20=
07-12-11 20:45:04.749584640 +0200
>> +@@ -2,9 +2,8 @@
>> + _Name=3DMini Web Browser
>> + _Comment=3DBrowse the web
>> + Exec=3Dgpe-mini-browser
>> +-Terminal=3D0
>> ++Terminal=3Dfalse
>> + Type=3DApplication
>> +-Icon=3Dgpe-mini-browser.png
>> +-Categories=3DApplication;PIM;GPE
>> +-StartupNotify=3DTrue
>> +-
>> ++Icon=3Dgpe-mini-browser
>> ++Categories=3DX-GPE;X-PIM;X-Internet;X-Browser;
>> ++StartupNotify=3Dtrue
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon=
_0.15.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.15=
.bb
>> new file mode 100644
>> index 0000000..faa9131
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.15.b=
b
>> @@ -0,0 +1,54 @@
>> +require gpe-mini-browser.inc
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =A0 =A0 =A0=3D "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
>> +DEPENDS =A0 =A0 =A0=3D "osb-nrcit libosso hildon-lgpl hildon-fm libgpew=
idget"
>> +EXTRA_OECONF =3D "--enable-hildon"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications/hil=
don
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/hildon/gpe-mini-brows=
er.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +SRC_URI[md5sum] =3D "b048cee7254d7fe6eb1e2821ce8706df"
>> +SRC_URI[sha256sum] =3D "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd79=
4ecd46fac037c8913"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon=
_0.16.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.16=
.bb
>> new file mode 100644
>> index 0000000..370017a
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.16.b=
b
>> @@ -0,0 +1,55 @@
>> +require gpe-mini-browser.inc
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =A0 =A0 =A0=3D "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
>> +DESCRIPTION =A0=3D "A lightweight webbrowser for the GPE platform (Hild=
on UI)"
>> +DEPENDS =A0 =A0 =A0=3D "osb-nrcit libosso hildon-lgpl hildon-fm libgpew=
idget"
>> +EXTRA_OECONF =3D "--enable-hildon"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications/hil=
don
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/hildon/gpe-mini-brows=
er.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +SRC_URI[md5sum] =3D "858f3e7219cde7b18e69293526020416"
>> +SRC_URI[sha256sum] =3D "36d2487895d3579ae3e8693ebe789b5de454506fc572937=
dac2fb7ef512f105f"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon=
_0.17.bb b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.17=
.bb
>> new file mode 100644
>> index 0000000..692f418
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser-hildon_0.17.b=
b
>> @@ -0,0 +1,25 @@
>> +require gpe-mini-browser.inc
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =A0 =A0 =A0=3D "${GPE_MIRROR}/gpe-mini-browser-${PV}.tar.gz"
>> +DESCRIPTION =A0=3D "A lightweight webbrowser for the GPE platform (Hild=
on UI)"
>> +DEPENDS =A0 =A0 =A0=3D "osb-nrcit libosso hildon-lgpl hildon-fm libgpew=
idget"
>> +EXTRA_OECONF =3D "--enable-hildon"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications/hil=
don
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/hildon/gpe-mini-brows=
er.desktop ${D}/usr/share/applications/hildon/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +
>> +
>> +SRC_URI[md5sum] =3D "749c571ec28e2ea4f31602f3d5609e4b"
>> +SRC_URI[sha256sum] =3D "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39=
bfbf364e1da34188c"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.15.b=
b b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.15.bb
>> new file mode 100644
>> index 0000000..68d8020
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.15.bb
>> @@ -0,0 +1,55 @@
>> +require gpe-mini-browser.inc
>> +
>> +PR =3D "r1"
>> +
>> +SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> +DEPENDS =3D "osb-nrcit libgpewidget"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 # =A0 =A0 =A0 install -d ${D}${docdir}/gpe
>> + =A0 =A0 =A0 # =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.html =
=A0${D}${docdir}/gpe/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +SRC_URI[md5sum] =3D "b048cee7254d7fe6eb1e2821ce8706df"
>> +SRC_URI[sha256sum] =3D "aa9c2dbe8d763b4461a42d46378cc49335a266a7d6dcd79=
4ecd46fac037c8913"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.16.b=
b b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.16.bb
>> new file mode 100644
>> index 0000000..e83467c
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.16.bb
>> @@ -0,0 +1,55 @@
>> +require gpe-mini-browser.inc
>> +
>> +PR =3D "r1"
>> +
>> +SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> +DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 # =A0 =A0 =A0 install -d ${D}${docdir}/gpe
>> + =A0 =A0 =A0 # =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.html =
=A0${D}${docdir}/gpe/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +SRC_URI[md5sum] =3D "858f3e7219cde7b18e69293526020416"
>> +SRC_URI[sha256sum] =3D "36d2487895d3579ae3e8693ebe789b5de454506fc572937=
dac2fb7ef512f105f"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.17.b=
b b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.17.bb
>> new file mode 100644
>> index 0000000..5499ca3
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.17.bb
>> @@ -0,0 +1,54 @@
>> +require gpe-mini-browser.inc
>> +
>> +SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> +DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> +RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> +
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +
>> +SRC_URI[md5sum] =3D "749c571ec28e2ea4f31602f3d5609e4b"
>> +SRC_URI[sha256sum] =3D "19d345571344f65e35b06c3faad6cfc86afeb8a41533d39=
bfbf364e1da34188c"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.18.b=
b b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.18.bb
>> new file mode 100644
>> index 0000000..9c67dcc
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.18.bb
>> @@ -0,0 +1,51 @@
>> +require gpe-mini-browser.inc
>> +
>> +SRC_URI =3D "ftp://ftp.handhelds.org/projects/gpe/source/gpe-mini-brows=
er-${PV}.tar.gz"
>> +DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> +RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> +
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.19.b=
b b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.19.bb
>> new file mode 100644
>> index 0000000..0a9c78d
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.19.bb
>> @@ -0,0 +1,55 @@
>> +require gpe-mini-browser.inc
>> +
>> +SRC_URI =3D "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-=
${PV}.tar.gz"
>> +DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> +RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> +
>> +PR =3D "r2"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +
>> +SRC_URI[md5sum] =3D "922640f40f67d15892d9ea8ec6c8ffea"
>> +SRC_URI[sha256sum] =3D "ece034b916a7760cfb854baab474b7931246bdb078c8143=
66bf90a9fbff246af"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.20.b=
b b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.20.bb
>> new file mode 100644
>> index 0000000..1bff97b
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.20.bb
>> @@ -0,0 +1,55 @@
>> +require gpe-mini-browser.inc
>> +
>> +SRC_URI =3D "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-=
${PV}.tar.gz"
>> +DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> +RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> +
>> +PR =3D "r2"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +
>> +SRC_URI[md5sum] =3D "1a7a4095cafed9cda21e500842b686a1"
>> +SRC_URI[sha256sum] =3D "ddba5fea0424c9c121269e96ea202014a29568263d478ac=
5682022973d2986f1"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.21.b=
b b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.21.bb
>> new file mode 100644
>> index 0000000..824a416
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_0.21.bb
>> @@ -0,0 +1,57 @@
>> +require gpe-mini-browser.inc
>> +
>> +SRC_URI =3D "http://gpe.linuxtogo.org/download/source/gpe-mini-browser-=
${PV}.tar.gz"
>> +DEPENDS =3D "osb-nrcit sqlite libgpewidget"
>> +RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> +
>> +PR =3D "r2"
>> +
>> +SRC_URI +=3D "file://mini-browser-desktop-fix.patch"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser-${PV}"
>> +
>> +inherit autotools
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.desk=
top ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe-mini-browser.png =
${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 fi
>> +}
>> +
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +
>> +SRC_URI[md5sum] =3D "a1297dfd14c008e3415f89b01eef75cd"
>> +SRC_URI[sha256sum] =3D "ec0358d104fa992f1437b37cdf70e83ab152794d2989ef2=
e9715ab8659dc46e3"
>> diff --git a/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_svn.bb=
 b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_svn.bb
>> new file mode 100644
>> index 0000000..0ebff73
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-mini-browser/gpe-mini-browser_svn.bb
>> @@ -0,0 +1,55 @@
>> +DEPENDS =3D "sqlite gettext gtk+ glib-2.0 osb-nrcit libgpewidget"
>> +RRECOMMENDS_${PN} =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-=
pixbuf-loader-jpeg"
>> +
>> +SRCREV =3D "9900"
>> +PV =3D "0.20+svn${SRCDATE}"
>> +PR =3D "r1"
>> +
>> +inherit autotools
>> +
>> +SRC_URI =3D "${GPE_EXTRA_SVN}"
>> +
>> +S =3D "${WORKDIR}/gpe-mini-browser"
>> +
>> +do_install() {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -d ${D}/usr/share/applications
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${S}/gpe-mini-browser.d=
esktop ${D}/usr/share/applications/gpe-mini-browser.desktop
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -d ${D}/usr/share/pixmaps
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0644 ${S}/gpe-mini-browser.p=
ng ${D}/usr/share/pixmaps/gpe-mini-browser.png
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0autotools_do_install
>> +}
>> +
>> +pkg_postinst_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ "x$D" !=3D "x" ]; then
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo gpe-mini-browser=3D /usr/share/doc=
/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo [Help] >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo gpe-mini-browser=3D /usr/share/do=
c/gpe/gpe-mini-browser.html >> /etc/gpe/gpe-help.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +pkg_postrm_${PN}-doc () {
>> + =A0 =A0 =A0 =A0#!/bin/sh
>> + =A0 =A0 =A0 =A0if [ -e /etc/gpe/gpe-help.conf ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed '/^\<gpe-mini-browser\>/d' /etc/gpe=
/gpe-help.conf > /tmp/gpe-help.conf
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv /tmp/gpe-help.conf /etc/gpe/gpe-help=
.conf
>> + =A0 =A0 =A0 =A0fi
>> + =A0 =A0 =A0 =A0if [ -x /usr/bin/gpe-helpindex ]; then
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo generating help-index
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpe-helpindex
>> + =A0 =A0 =A0 =A0else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo not generating index for gpe-mini-=
browser
>> + =A0 =A0 =A0 =A0fi
>> +}
>> +
>> +require gpe-mini-browser.inc
>> +
>> +#DEFAULT_PREFERENCE =3D "-1"
>> diff --git a/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.54.bb b/recip=
es/nonworking/gpe-todo/gpe-todo-hildon_0.54.bb
>> new file mode 100644
>> index 0000000..9954d51
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.54.bb
>> @@ -0,0 +1,20 @@
>> +LICENSE =A0 =A0 =3D "GPL"
>> +PR =A0 =A0 =A0 =A0 =A0=3D "r1"
>> +DESCRIPTION =3D "GPE to-do list"
>> +DEPENDS =A0 =A0 =3D "libgpewidget-hildon libgpepimc-hildon libtododb sd=
k-default-icons libosso"
>> +RDEPENDS_${PN} =A0 =A0=3D "sdk-default-icons"
>> +SECTION =3D "gpe"
>> +PRIORITY =A0 =A0=3D "optional"
>> +
>> +inherit gpe autotools pkgconfig
>> +
>> +EXTRA_OECONF =3D "--enable-hildon"
>> +
>> +SRC_URI=3D"${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
>> +
>> +S =3D "${WORKDIR}/gpe-todo-${PV}"
>> +
>> +FILES_${PN} +=3D "${datadir}/gpe-todo ${libdir}/dbus-1.0"
>> +
>> +SRC_URI[md5sum] =3D "8fdd52954a7a29691013900b65eb5702"
>> +SRC_URI[sha256sum] =3D "b3f51635b3ce6408fdfbd0283e1d8036c23b6ecb5adf0d6=
6882e7e48eb5d97b9"
>> diff --git a/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.55.bb b/recip=
es/nonworking/gpe-todo/gpe-todo-hildon_0.55.bb
>> new file mode 100644
>> index 0000000..d71f862
>> --- /dev/null
>> +++ b/recipes/nonworking/gpe-todo/gpe-todo-hildon_0.55.bb
>> @@ -0,0 +1,20 @@
>> +LICENSE =A0 =A0 =3D "GPL"
>> +PR =A0 =A0 =A0 =A0 =A0=3D "r1"
>> +DESCRIPTION =3D "GPE to-do list"
>> +DEPENDS =A0 =A0 =3D "libgpewidget-hildon libgpepimc-hildon libtododb sd=
k-default-icons libosso"
>> +RDEPENDS_${PN} =A0 =A0=3D "sdk-default-icons"
>> +SECTION =3D "gpe"
>> +PRIORITY =A0 =A0=3D "optional"
>> +
>> +inherit gpe autotools pkgconfig
>> +
>> +EXTRA_OECONF =3D "--enable-hildon"
>> +
>> +SRC_URI=3D"${GPE_MIRROR}/gpe-todo-${PV}.tar.bz2"
>> +
>> +S =3D "${WORKDIR}/gpe-todo-${PV}"
>> +
>> +FILES_${PN} +=3D "${datadir}/gpe-todo ${libdir}/dbus-1.0"
>> +
>> +SRC_URI[md5sum] =3D "e8c08165d9723779473e3390a949afac"
>> +SRC_URI[sha256sum] =3D "ec2ef95c967acce5834c8b4985c610014c16242d223d233=
947d67b4514ebe298"
>> diff --git a/recipes/nonworking/images/maemo-image.bb b/recipes/nonworki=
ng/images/maemo-image.bb
>> new file mode 100644
>> index 0000000..c0498bb
>> --- /dev/null
>> +++ b/recipes/nonworking/images/maemo-image.bb
>> @@ -0,0 +1,20 @@
>> +#
>> +# Meta package for maemo based system image
>> +#
>> +
>> +GUI_MACHINE_CLASS ?=3D "none"
>> +
>> +MAEMO_EXTRA_DEPENDS =3D "scap dosfstools"
>> +MAEMO_EXTRA_INSTALL =3D "osso-af-services osso-af-base-apps scap dosfst=
ools"
>> +
>> +XSERVER ?=3D "xserver-kdrive-omap"
>> +
>> +DEPENDS =3D "${MACHINE_TASK_PROVIDER} \
>> + =A0 =A0 =A0 =A0 =A0meta-maemo \
>> + =A0 =A0 =A0 =A0 =A0${MAEMO_EXTRA_DEPENDS}"
>> +
>> +IMAGE_INSTALL =3D "${MACHINE_TASK_PROVIDER} maemo-task-base maemo-task-=
theme \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0maemo-task-apps ${MAEMO_EXT=
RA_INSTALL} \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${XSERVER}"
>> +
>> +inherit image
>> diff --git a/recipes/nonworking/libgpepimc/libgpepimc-hildon_0.5.bb b/re=
cipes/nonworking/libgpepimc/libgpepimc-hildon_0.5.bb
>> new file mode 100644
>> index 0000000..12155b9
>> --- /dev/null
>> +++ b/recipes/nonworking/libgpepimc/libgpepimc-hildon_0.5.bb
>> @@ -0,0 +1,30 @@
>> +LICENSE =A0 =A0 =3D "LGPL"
>> +PR =A0 =A0 =A0 =A0 =A0=3D "r1"
>> +DESCRIPTION =3D "Common code for GPE PIMs (hildon UI version)"
>> +SECTION =3D "gpe/libs"
>> +PRIORITY =A0 =A0=3D "optional"
>> +DEPENDS =A0 =A0 =3D "libgpewidget-hildon gtk+ sqlite hildon-lgpl"
>> +PROVIDES =A0 =A0=3D "libgepepimc"
>> +RPROVIDES_${PN} =A0 =3D "libgepepimc"
>> +
>> +SRC_URI =A0 =A0 =3D "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
>> +
>> +EXTRA_OECONF =3D "--enable-hildon"
>> +S =3D "${WORKDIR}/libgpepimc-${PV}"
>> +
>> +inherit pkgconfig autotools
>> +
>> +headers =3D "pim-categories.h pim-categories-ui.h"
>> +
>> +do_stage () {
>> + =A0 =A0 =A0 oe_libinstall -so libgpepimc ${STAGING_LIBDIR}
>> +
>> + =A0 =A0 =A0 mkdir -p ${STAGING_INCDIR}/gpe
>> + =A0 =A0 =A0 for h in ${headers}; do
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 ${S}/gpe/$h ${STAGING_INCD=
IR}/gpe/$h
>> + =A0 =A0 =A0 done
>> +}
>> +
>> +
>> +SRC_URI[md5sum] =3D "bbb0efe3359510fc0393f3f305c1c6e7"
>> +SRC_URI[sha256sum] =3D "b0d1236dbb27f054f8b8a6f8ed4d735db89eb466be641be=
d67363f4dd76385ad"
>> diff --git a/recipes/nonworking/maemo-mapper/maemo-mapper_svn.bb b/recip=
es/nonworking/maemo-mapper/maemo-mapper_svn.bb
>> new file mode 100644
>> index 0000000..713a54a
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo-mapper/maemo-mapper_svn.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION =3D "GPS navigation/map display software"
>> +LICENSE =3D "GPL"
>> +DEPENDS =3D "gdbm libconic sqlite3 gtk+ libhildonfm libosso osso-ic-oss=
 libosso-help gnome-vfs dbus bluez-libs"
>> +RDEPENDS_${PN} =3D "bluez-utils"
>> +RRECOMMENDS_${PN} =3D "gpsd flite"
>> +SRCREV =3D "118"
>> +PV =3D "2.0.3+svnr${SRCPV}"
>> +PR =3D "r3"
>> +
>> +SRC_URI =3D "svn://garage.maemo.org/svn/maemo-mapper;proto=3Dhttps;modu=
le=3Dtrunk \
>> + =A0 =A0 =A0 =A0 =A0 file://mapper-hildon1.diff;maxrev=3D108"
>> +
>> +S =3D "${WORKDIR}/trunk"
>> +
>> +inherit autotools pkgconfig
>> +
>> +do_install_append () {
>> + =A0 =A0 =A0 install -d ${D}${datadir}/applications/
>> + =A0 =A0 =A0 mv ${D}/maemo-mapper.desktop ${D}${datadir}/applications/
>> +}
>> +
>> +#FILES_${PN} +=3D "${datadir}/icons"
>> diff --git a/recipes/nonworking/maemo/hildon-control-panel_0.9.1-1.2.bb =
b/recipes/nonworking/maemo/hildon-control-panel_0.9.1-1.2.bb
>> new file mode 100644
>> index 0000000..3c56364
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo/hildon-control-panel_0.9.1-1.2.bb
>> @@ -0,0 +1,21 @@
>> +PR =A0 =A0 =A0 =A0 =3D "r2"
>> +LICENSE =A0 =A0=3D "GPL"
>> +
>> +DEPENDS =3D "hildon-lgpl hildon-base-lib osso-af-settings libosso hildo=
n-libs osso-af-settings libosso-help"
>> +
>> +SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}=
/${PN}_${PV}.tar.gz \
>> + =A0 =A0 =A0 =A0 =A0 file://config-path.patch;striplevel=3D0 \
>> + =A0 =A0 =A0 =A0 =A0 file://noWerror.patch;striplevel=3D0"
>> +
>> +S =3D "${WORKDIR}/hildon-control-panel-0.9.1"
>> +
>> +inherit autotools pkgconfig
>> +
>> +FILES_${PN} +=3D "${libdir}/dbus-1.0 ${datadir}/applications"
>> +
>> +do_stage() {
>> + =A0 =A0 =A0 =A0install -d ${STAGING_INCDIR}/hildon-cp-plugin
>> + =A0 =A0 =A0 =A0install -m 644 *.h ${STAGING_INCDIR}/hildon-cp-plugin
>> +}
>> +SRC_URI[md5sum] =3D "72c8b814ebeec8668cea575e08bb1548"
>> +SRC_URI[sha256sum] =3D "bbe77d297c7560d3fdad343ab49f23c9c0aa1574db77108=
d1b97845fb7bb26d5"
>> diff --git a/recipes/nonworking/maemo/hildon-status-bar/source.patch b/r=
ecipes/nonworking/maemo/hildon-status-bar/source.patch
>> new file mode 100644
>> index 0000000..dd5e82b
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo/hildon-status-bar/source.patch
>> @@ -0,0 +1,11 @@
>> +--- status-bar-launch.sh.old =A0 2005-06-14 17:12:10.000000000 +0200
>> ++++ status-bar-launch.sh =A0 =A0 =A0 2005-06-14 17:12:15.000000000 +020=
0
>> +@@ -21,7 +21,7 @@
>> + # 02110-1301 USA
>> + #
>> +
>> +-source af.conf
>> ++. af.conf
>> +
>> + if [ "$1" !=3D "start" ] && [ "$1" !=3D "stop" ] && [ "$1" !=3D "resta=
rt" ]; then
>> + =A0 echo "Usage: $0 {start|stop|restart}"
>> diff --git a/recipes/nonworking/maemo/hildon-status-bar_0.8.11-1.bb b/re=
cipes/nonworking/maemo/hildon-status-bar_0.8.11-1.bb
>> new file mode 100644
>> index 0000000..5d6238c
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo/hildon-status-bar_0.8.11-1.bb
>> @@ -0,0 +1,15 @@
>> +PR =A0 =A0 =A0 =A0 =3D "r1"
>> +LICENSE =A0 =A0=3D "GPL"
>> +
>> +DEPENDS =3D "hildon-lgpl libosso hildon-libs"
>> +
>> +SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/source/h/${PN}=
/${PN}_${PV}.tar.gz \
>> + =A0 =A0 =A0 =A0 =A0 file://source.patch;striplevel=3D0"
>> +
>> +S =3D "${WORKDIR}/hildon-status-bar-0.8.11"
>> +
>> +inherit autotools pkgconfig
>> +
>> +
>> +SRC_URI[md5sum] =3D "7948087bfe3b1bf8025a37fbb64bde44"
>> +SRC_URI[sha256sum] =3D "eca16f42de8e4a213acb3ba0978fa56fbdf2f38e5be5882=
163753068ab4a15cd"
>> diff --git a/recipes/nonworking/maemo/lessertunjo_0.0.10.bb b/recipes/no=
nworking/maemo/lessertunjo_0.0.10.bb
>> new file mode 100644
>> index 0000000..691893d
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo/lessertunjo_0.0.10.bb
>> @@ -0,0 +1,25 @@
>> +LICENSE =3D =A0 =A0 =A0"LGPL"
>> +
>> +DEPENDS =3D =A0 =A0 =A0"gconf-osso hildon-libs dbus libosso"
>> +SRC_URI =3D =A0 =A0 =A0"http://repository.maemo.org/pool/maemo/ossw/sou=
rce/l/lessertunjo/lessertunjo_${PV}-3.tar.gz"
>> +
>> +inherit =A0pkgconfig
>> +
>> +S =3D "${WORKDIR}/lessertunjo"
>> +LDFLAGS +=3D " -losso -L${STAGING_LIBDIR} -I${STAGING_INCDIR} =A0-I${ST=
AGING_LIBDIR}/dbus-1.0/include -I${STAGING_INCDIR}/dbus-1.0 -I${STAGING_INC=
DIR}/glib-2.0 =A0-I${STAGING_INCDIR}/gconf/2"
>> +
>> +
>> +do_install() {
>> + =A0 =A0 =A0 install -d ${D}${libdir}
>> + =A0 =A0 =A0 install -m 755 *so.0.0.10 =A0${D}${libdir}
>> +}
>> +
>> +do_stage() {
>> + =A0 =A0 =A0 oe_libinstall -so libshadowapp libshadowappd =A0${STAGING_=
LIBDIR}
>> + =A0 =A0 =A0 install -d ${STAGING_INCDIR}
>> + =A0 =A0 =A0 install -m 644 *.h ${STAGING_INCDIR}
>> +
>> +}
>> +
>> +SRC_URI[md5sum] =3D "b6d7ca9e9740286f0ce918da9fb8438b"
>> +SRC_URI[sha256sum] =3D "0ee6a3caee4812827b8e167d4a07dbf859cb08a00a20f09=
568c3baae379d6ce8"
>> diff --git a/recipes/nonworking/maemo/libosso-help_1.0.01.bb b/recipes/n=
onworking/maemo/libosso-help_1.0.01.bb
>> new file mode 100644
>> index 0000000..b80d45a
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo/libosso-help_1.0.01.bb
>> @@ -0,0 +1,24 @@
>> +LICENSE =3D =A0 =A0 =A0"LGPL"
>> +PR =3D "r0"
>> +
>> +DEPENDS =3D =A0 =A0 =A0"libosso hildon-lgpl hildon-base-lib hildon-libs=
"
>> +SRC_URI =3D =A0 =A0 =A0"http://repository.maemo.org/pool/maemo/ossw/sou=
rce/libo/${PN}/libosso-help_${PV}.tar.gz \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://no-Werror.patch;striplevel=3D0 =
\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://help-header-pp.patch;striplevel=
=3D0"
>> +
>> +inherit pkgconfig autotools
>> +
>> +S =3D "${WORKDIR}/libosso-help-sdk-${PV}"
>> +
>> +#FILES_${PN} +=3D "${libdir}/dbus-1.0/services/ ${libdir}/outo/*.so ${l=
ibdir}/outo/*bin ${libdir}/outo/mimedummy.doc"
>> +
>> +do_stage() {
>> + =A0 =A0 =A0 install -d ${STAGING_INCDIR}
>> + =A0 =A0 =A0 install -m 644 helplib/*.h ${STAGING_INCDIR}
>> + =A0 =A0 =A0 install -m644 helplib/.libs/libossohelp.so ${STAGING_LIBDI=
R}
>> + =A0 =A0 =A0 install -m644 helplib/.libs/libossohelp.so.0 ${STAGING_LIB=
DIR}
>> + =A0 =A0 =A0 install -m644 helplib/.libs/libossohelp.so.0.0.0 ${STAGING=
_LIBDIR}
>> +}
>> +
>> +SRC_URI[md5sum] =3D "dbc3c68809e39bd6681aab8ad16ffe3c"
>> +SRC_URI[sha256sum] =3D "ef6f6fda31dfbf7b3186b6f1d0ffd12ee0675d9a057ad29=
94f81b5164213a693"
>> diff --git a/recipes/nonworking/maemo/osso-application-installer_1.0.03-=
1.bb b/recipes/nonworking/maemo/osso-application-installer_1.0.03-1.bb
>> new file mode 100644
>> index 0000000..3d24f21
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo/osso-application-installer_1.0.03-1.bb
>> @@ -0,0 +1,22 @@
>> +PR =A0 =A0 =A0 =A0 =3D "r1"
>> +LICENSE =A0 =A0=3D "GPL"
>> +
>> +DEPENDS =3D "hildon-lgpl hildon-base-lib libosso hildon-libs hildon-con=
trol-panel shared-mime-info"
>> +RDEPENDS_${PN} =3D "shared-mime-info"
>> +
>> +SRC_URI =3D "http://repository.maemo.org/pool/maemo/ossw/source/o/${PN}=
/${PN}_${PV}.tar.gz \
>> + =A0 =A0 =A0 =A0 =A0 file://fix-buildsystem.patch"
>> +
>> +S =3D "${WORKDIR}/osso-application-installer-1.0.03"
>> +
>> +inherit autotools pkgconfig
>> +
>> +FILES_${PN} +=3D "${libdir}/dbus-1.0 ${libdir}/hildon-control-panel/*.s=
o ${datadir}/applications ${datadir}/mime"
>> +
>> +pkg_postinst () {
>> + =A0echo "Updating MIME database... this may take a while."
>> + =A0${bindir}/update-mime-database ${datadir}/mime
>> +}
>> +
>> +SRC_URI[md5sum] =3D "05e47346d432bd4c78736b12f262d612"
>> +SRC_URI[sha256sum] =3D "f7129c56cd7e561c10457d101f37ebf3a8b02df83f42a30=
cb90b46eb0de5dede"
>> diff --git a/recipes/nonworking/maemo4/libosso-help_2.1.2.bb b/recipes/n=
onworking/maemo4/libosso-help_2.1.2.bb
>> new file mode 100644
>> index 0000000..b7b6de5
>> --- /dev/null
>> +++ b/recipes/nonworking/maemo4/libosso-help_2.1.2.bb
>> @@ -0,0 +1,21 @@
>> +LICENSE =3D "LGPL"
>> +DESCRIPTION =3D "Nokia osso help library"
>> +
>> +DEPENDS =3D "libhildonhelp libosso gtkhtml-3.8 libxml2 "
>> +
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "http://repository.maemo.org/pool/sardine-experimental/main=
.disabled/source/libo/libosso-help/libosso-help_${PV}-2.tar.gz"
>> +
>> +inherit autotools pkgconfig lib_package
>> +
>> +S =3D "${WORKDIR}/2.1.2-2"
>> +
>> +do_configure_prepend() {
>> + =A0 =A0 =A0 # remove Werror from OSSO_CFLAGS
>> + =A0 =A0 =A0 sed -i s:-Werror::g configure.ac
>> + =A0 =A0 =A0 =A0sed -i -e s:AC_CONFIG_SRCDIR:#AC_CONFIG_SRCDIR:g config=
ure.ac
>> +}
>> +
>> +SRC_URI[md5sum] =3D "fc5a1f4598670cec9ac40fb603f80570"
>> +SRC_URI[sha256sum] =3D "ecbff97da422f1498eae8f9b8a17389c0ccdd7eee1ca025=
9f035e712c8e0a405"
>> diff --git a/recipes/nonworking/meta/meta-maemo.bb b/recipes/nonworking/=
meta/meta-maemo.bb
>> new file mode 100644
>> index 0000000..ac0dabe
>> --- /dev/null
>> +++ b/recipes/nonworking/meta/meta-maemo.bb
>> @@ -0,0 +1,11 @@
>> +DESCRIPTION =3D "Meta-package for maemo environment"
>> +LICENSE =3D "MIT"
>> +PR =3D "r1"
>> +
>> +RDEPENDS_${PN} =3D "\
>> + =A0 =A0maemo-task-base \
>> + =A0 =A0maemo-task-apps \
>> + =A0 =A0maemo-task-libs-install \
>> + =A0 =A0maemo-task-theme"
>> +
>> +inherit meta
>> diff --git a/recipes/nonworking/tasks/task-maemo.bb b/recipes/nonworking=
/tasks/task-maemo.bb
>> new file mode 100644
>> index 0000000..4a28b08
>> --- /dev/null
>> +++ b/recipes/nonworking/tasks/task-maemo.bb
>> @@ -0,0 +1,73 @@
>> +DESCRIPTION =3D "Task package for maemo environment"
>> +LICENSE =3D "MIT"
>> +ALLOW_EMPTY =3D "1"
>> +PR =3D "r1"
>> +
>> +PACKAGES =3D "\
>> + =A0 =A0maemo-task-base \
>> + =A0 =A0maemo-task-apps \
>> + =A0 =A0maemo-task-libs-install \
>> + =A0 =A0maemo-task-theme"
>> +
>> +RDEPENDS_maemo-base-depends =3D "\
>> + =A0 =A0diet-x11 \
>> + =A0 =A0virtual/xserver \
>> + =A0 =A0xpext \
>> + =A0 =A0xsp"
>> +
>> +RDEPENDS_maemo-task-libs-install =3D "\
>> + =A0 =A0libsqlite \
>> + =A0 =A0hildon-lgpl \
>> + =A0 =A0libhildonbase \
>> + =A0 =A0libhildonwidgets \
>> + =A0 =A0hildon-fm"
>> +
>> +RDEPENDS_maemo-task-base =3D "\
>> + =A0 =A0gdk-pixbuf-loader-png \
>> + =A0 =A0gdk-pixbuf-loader-xpm \
>> + =A0 =A0gdk-pixbuf-loader-jpeg \
>> + =A0 =A0pango-module-basic-x \
>> + =A0 =A0pango-module-basic-fc \
>> + =A0 =A0bluez-utils-dbus \
>> + =A0 =A0matchbox \
>> + =A0 =A0shared-mime-info \
>> + =A0 =A0rxvt-unicode \
>> + =A0 =A0xst \
>> + =A0 =A0xhost \
>> + =A0 =A0xrdb \
>> + =A0 =A0libgtkstylus \
>> + =A0 =A0outo \
>> + =A0 =A0hildon-initscripts \
>> + =A0 =A0libosso \
>> + =A0 =A0osso-af-utils \
>> + =A0 =A0osso-af-startup \
>> + =A0 =A0osso-core-config \
>> + =A0 =A0gnome-vfs \
>> + =A0 =A0osso-thumbnail \
>> + =A0 =A0xauth \
>> + =A0 =A0esd"
>> +
>> +RDEPENDS_maemo-task-theme =3D "\
>> + =A0 =A0xcursor-transparent-theme \
>> + =A0 =A0sdk-default-theme \
>> + =A0 =A0sdk-default-theme-config \
>> + =A0 =A0sdk-default-icons \
>> + =A0 =A0sapwood \
>> + =A0 =A0ttf-bitstream-vera \
>> + =A0 =A0sapwood \
>> + =A0 =A0osso-sounds"
>> +
>> +RDEPENDS_maemo-task-apps =3D "\
>> + =A0 =A0osso-gwobex \
>> + =A0 =A0osso-gwconnect \
>> + =A0 =A0osso-bttools \
>> + =A0 =A0hildon-status-bar \
>> + =A0 =A0hildon-home \
>> + =A0 =A0hildon-navigator \
>> + =A0 =A0hildon-control-panel \
>> + =A0 =A0osso-application-installer \
>> + =A0 =A0osso-app-killer \
>> + =A0 =A0osso-screenshot-tool \
>> + =A0 =A0gpe-todo-hildon \
>> + =A0 =A0gpe-contacts-hildon \
>> + =A0 =A0gpe-mini-browser-hildon"
>> diff --git a/recipes/nonworking/ukeyboard/ukeyboard_1.2.bb b/recipes/non=
working/ukeyboard/ukeyboard_1.2.bb
>> new file mode 100644
>> index 0000000..0891396
>> --- /dev/null
>> +++ b/recipes/nonworking/ukeyboard/ukeyboard_1.2.bb
>> @@ -0,0 +1,17 @@
>> +DESCRIPTION =3D "Additional keyboard layouts for Nokia N800/N810"
>> +SECTION =3D "user/other"
>> +DEPENDS =3D "gtk+ libosso gconf hildon-control-panel"
>> +
>> +SRC_URI =3D "http://upir.cz/maemo/dists/chinook/main/source/ukeyboard_$=
{PV}.tar.gz "
>> +
>> +do_install() {
>> + =A0 =A0oe_runmake install DESTDIR=3D${D}
>> +}
>> +
>> +FILES_${PN} +=3D "${datadir}/X11/xkb \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/scv_layouts \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/hildon-control-panel/libukeyboar=
d-prefs.so"
>> +FILES_${PN}-dbg +=3D "${libdir}/hildon-control-panel/.debug/"
>> +
>> +SRC_URI[md5sum] =3D "cf291d487250e3e9c1cc34389ce49297"
>> +SRC_URI[sha256sum] =3D "1f54d52abc5a53db45bc063948375b947af2c031ee1b810=
686027f7694deb474"
>> diff --git a/recipes/tasks/task-maemo.bb b/recipes/tasks/task-maemo.bb
>> deleted file mode 100644
>> index 4a28b08..0000000
>> --- a/recipes/tasks/task-maemo.bb
>> +++ /dev/null
>> @@ -1,73 +0,0 @@
>> -DESCRIPTION =3D "Task package for maemo environment"
>> -LICENSE =3D "MIT"
>> -ALLOW_EMPTY =3D "1"
>> -PR =3D "r1"
>> -
>> -PACKAGES =3D "\
>> - =A0 =A0maemo-task-base \
>> - =A0 =A0maemo-task-apps \
>> - =A0 =A0maemo-task-libs-install \
>> - =A0 =A0maemo-task-theme"
>> -
>> -RDEPENDS_maemo-base-depends =3D "\
>> - =A0 =A0diet-x11 \
>> - =A0 =A0virtual/xserver \
>> - =A0 =A0xpext \
>> - =A0 =A0xsp"
>> -
>> -RDEPENDS_maemo-task-libs-install =3D "\
>> - =A0 =A0libsqlite \
>> - =A0 =A0hildon-lgpl \
>> - =A0 =A0libhildonbase \
>> - =A0 =A0libhildonwidgets \
>> - =A0 =A0hildon-fm"
>> -
>> -RDEPENDS_maemo-task-base =3D "\
>> - =A0 =A0gdk-pixbuf-loader-png \
>> - =A0 =A0gdk-pixbuf-loader-xpm \
>> - =A0 =A0gdk-pixbuf-loader-jpeg \
>> - =A0 =A0pango-module-basic-x \
>> - =A0 =A0pango-module-basic-fc \
>> - =A0 =A0bluez-utils-dbus \
>> - =A0 =A0matchbox \
>> - =A0 =A0shared-mime-info \
>> - =A0 =A0rxvt-unicode \
>> - =A0 =A0xst \
>> - =A0 =A0xhost \
>> - =A0 =A0xrdb \
>> - =A0 =A0libgtkstylus \
>> - =A0 =A0outo \
>> - =A0 =A0hildon-initscripts \
>> - =A0 =A0libosso \
>> - =A0 =A0osso-af-utils \
>> - =A0 =A0osso-af-startup \
>> - =A0 =A0osso-core-config \
>> - =A0 =A0gnome-vfs \
>> - =A0 =A0osso-thumbnail \
>> - =A0 =A0xauth \
>> - =A0 =A0esd"
>> -
>> -RDEPENDS_maemo-task-theme =3D "\
>> - =A0 =A0xcursor-transparent-theme \
>> - =A0 =A0sdk-default-theme \
>> - =A0 =A0sdk-default-theme-config \
>> - =A0 =A0sdk-default-icons \
>> - =A0 =A0sapwood \
>> - =A0 =A0ttf-bitstream-vera \
>> - =A0 =A0sapwood \
>> - =A0 =A0osso-sounds"
>> -
>> -RDEPENDS_maemo-task-apps =3D "\
>> - =A0 =A0osso-gwobex \
>> - =A0 =A0osso-gwconnect \
>> - =A0 =A0osso-bttools \
>> - =A0 =A0hildon-status-bar \
>> - =A0 =A0hildon-home \
>> - =A0 =A0hildon-navigator \
>> - =A0 =A0hildon-control-panel \
>> - =A0 =A0osso-application-installer \
>> - =A0 =A0osso-app-killer \
>> - =A0 =A0osso-screenshot-tool \
>> - =A0 =A0gpe-todo-hildon \
>> - =A0 =A0gpe-contacts-hildon \
>> - =A0 =A0gpe-mini-browser-hildon"
>> diff --git a/recipes/ukeyboard/ukeyboard_1.2.bb b/recipes/ukeyboard/ukey=
board_1.2.bb
>> deleted file mode 100644
>> index 0891396..0000000
>> --- a/recipes/ukeyboard/ukeyboard_1.2.bb
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -DESCRIPTION =3D "Additional keyboard layouts for Nokia N800/N810"
>> -SECTION =3D "user/other"
>> -DEPENDS =3D "gtk+ libosso gconf hildon-control-panel"
>> -
>> -SRC_URI =3D "http://upir.cz/maemo/dists/chinook/main/source/ukeyboard_$=
{PV}.tar.gz "
>> -
>> -do_install() {
>> - =A0 =A0oe_runmake install DESTDIR=3D${D}
>> -}
>> -
>> -FILES_${PN} +=3D "${datadir}/X11/xkb \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/scv_layouts \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/hildon-control-panel/libukeyboar=
d-prefs.so"
>> -FILES_${PN}-dbg +=3D "${libdir}/hildon-control-panel/.debug/"
>> -
>> -SRC_URI[md5sum] =3D "cf291d487250e3e9c1cc34389ce49297"
>> -SRC_URI[sha256sum] =3D "1f54d52abc5a53db45bc063948375b947af2c031ee1b810=
686027f7694deb474"
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


