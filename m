Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.3351.1587446042797902063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 22:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uoWaOzuO;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id n20so4421791qtp.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 22:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VPKq/LJFXyMSQu1nkjIsXHT5p8OT2ZRcZtdZJBtEMDc=;
        b=uoWaOzuOdUGzSsmNvqdHgJ5OmJtqxS+1BbiCI/1JS3PoFsrhR7mnNMPARy0hu0/IG3
         rSVNeLAcNx18ekt5DMLrg2eiwQpwyjzHbP5yLq+yBEhtd5pSXYwL9zGSDg6Hst3M95yZ
         zW7dK9SzwxmhhOirhBqjQmJ/cxTzCMGjcdpD7cjK9JzxDhJaS17MB0l7OSVVc+A4nT8v
         ptckk+lGcBa5krwKEYWyjQW8VhGSK5uQY5KRszLb34OMdLbNgqcAiGTK1lJMgnlSXT2h
         gyB+QkKAv9/eBB5HQfOsuM4xc8s8+V9s3dt53gCBjYXaPOVYFqoGRvv5lu1lW6YL6/4a
         4wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VPKq/LJFXyMSQu1nkjIsXHT5p8OT2ZRcZtdZJBtEMDc=;
        b=YLqGD5ax10sLodvDKAbpZZ9uO6LloJOz12EHU8doj1/+NK/6GLqFKDkGPHhMixmjmk
         ESm1q35mpFWSp1cATd6tQ5x7d1vqlfOIaBBN5X7zWXH971k1QNc0uWZr5GC79XNkwW2z
         sgemcoG+UJxidOIZpj630qNUw9n03lFqz174eK5Z9KNWxlO49lCZxUBiY+tiZSkFRGrg
         aKlfVRCJ+HqbqL6ft4BNBlQLr0TBy0Jg1Hl8VWULBRnW21r8ZVBe1UHVgI5AgFBstJ90
         Ajs5pt2aMfEpusCqfA6LKZzjXjLLyBKhzACaTne2sibRCgq7rOzPMuZsOEU7Ti6wykG+
         upWw==
X-Gm-Message-State: AGi0Pubkj7ekFn1kCNPrPIBz9vMQc3aWpBmMOWjUohwa1lFXrHTcu3/s
	k+01UoKcaW9f5nzpcMuir9uabLINZLp3WTAd7Ck=
X-Google-Smtp-Source: APiQypJnAR+ROXUO9Q3OlhTmyM7/Q0ZvV3db1MLwV6BvYIkVCmVW7Hh45vLztBTTiDLWxysJRZJt3gaWwRtUP/NYvNM=
X-Received: by 2002:ac8:31aa:: with SMTP id h39mr9391323qte.190.1587446041521;
 Mon, 20 Apr 2020 22:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
 <1585818933-28648-5-git-send-email-wangmy@cn.fujitsu.com> <CAMKF1spX8g-oSj7kBYvX-AxZsvL2Xx69GLp8jMaDOtDij8oTkQ@mail.gmail.com>
 <18ba5de3462945d0853c1312000af085@G08CNEXMBPEKD05.g08.fujitsu.local>
In-Reply-To: <18ba5de3462945d0853c1312000af085@G08CNEXMBPEKD05.g08.fujitsu.local>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 22:13:35 -0700
Message-ID: <CAMKF1sqk=H5eLqGQCJEqDmXX5e3FFR_30WvWGGsLZ0xZtAk78A@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] webmin: upgrade 1.850 -> 1.941
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 10:11 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Do you mean I should make a patch on master-next and then submit it to t=
he master branch?
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: openembedded-devel@lists.openembedded.org <=
openembedded-devel@lists.openembedded.org> =E4=BB=A3=E8=A1=A8 Khem Raj
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2020=E5=B9=B44=E6=9C=882=E6=97=A5 =
14:33
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <=
wangmy@cn.fujitsu.com>
> =E6=8A=84=E9=80=81: openembeded-devel <openembedded-devel@lists.openembe=
dded.org>
> =E4=B8=BB=E9=A2=98: Re: [oe] [meta-webserver][PATCH] webmin: upgrade 1.8=
50 -> 1.941
>
> please rebase on master-next and resend
>

yes preferably but atleast rebase on top of master.

> On Wed, Apr 1, 2020 at 6:45 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote=
:
> >
> > refresh the folloing patches:
> > disable-version-check.patch
> > net-generic.patch
> > net-lib.pl.patch
> >
> > -License-Update: add "BSD 3-Clause License" to license file
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  .../webmin/files/disable-version-check.patch  | 24 +++++++-----
> >  .../webmin/files/net-generic.patch            | 37 ++++++++++--------=
-
> >  .../webmin/files/net-lib.pl.patch             | 17 ++++++---
> >  .../{webmin_1.850.bb =3D> webmin_1.941.bb}      |  6 +--
> >  4 files changed, 49 insertions(+), 35 deletions(-)  rename
> > meta-webserver/recipes-webadmin/webmin/{webmin_1.850.bb =3D>
> > webmin_1.941.bb} (97%)
> >
> > diff --git
> > a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.p
> > atch
> > b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.p
> > atch
> > index 9aad894e0..61b56bf5a 100644
> > ---
> > a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.p
> > atch
> > +++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-che
> > +++ ck.patch
> > @@ -6,12 +6,15 @@ the moment.
> >  Upstream-status: Inappropriate
> >
> >  Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > +---
> > + webmin/webmin-lib.pl | 44
> > +++++++++++++++++++++++----------------------
> > + 1 file changed, 22 insertions(+), 22 deletions(-)
> >
> > -Index: webmin-1.850/webmin/webmin-lib.pl
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- webmin-1.850.orig/webmin/webmin-lib.pl
> > -+++ webmin-1.850/webmin/webmin-lib.pl
> > -@@ -1112,28 +1112,28 @@ my %miniserv;
> > +diff --git a/webmin/webmin-lib.pl b/webmin/webmin-lib.pl index
> > +dad6cfc..73821f0 100755
> > +--- a/webmin/webmin-lib.pl
> > ++++ b/webmin/webmin-lib.pl
> > +@@ -1130,28 +1130,28 @@ my %miniserv;
> >   &load_theme_library();        # So that UI functions work
> >
> >   # Need OS upgrade
> > @@ -24,12 +27,12 @@ Index: webmin-1.850/webmin/webmin-lib.pl
> >  -      my ($minor) =3D split(/\./, $gconfig{'os_version'});
> >  -      if ($realos{'os_type'} eq $gconfig{'os_type'} &&
> >  -          $realminor =3D=3D $minor) {
> > --              # Only the minor version number changed - no need to a=
pply
> > +-              # Only the minor version number changed - just apply s=
ilently
> >  -              &apply_new_os_version(\%realos);
> >  -              }
> >  -      else {
> >  -              # Large enough change to tell the user
> > --              push(@notifs,
> > +-              push(@notifs,
> >  -                  &ui_form_start("$gconfig{'webprefix'}/webmin/fix_o=
s.cgi").
> >  -                  &text('os_incorrect', $realos{'real_os_type'},
> >  -                                        $realos{'real_os_version'}).=
"<p>\n".
> > @@ -46,12 +49,12 @@ Index: webmin-1.850/webmin/webmin-lib.pl
> >  +#     my ($minor) =3D split(/\./, $gconfig{'os_version'});
> >  +#     if ($realos{'os_type'} eq $gconfig{'os_type'} &&
> >  +#         $realminor =3D=3D $minor) {
> > -+#             # Only the minor version number changed - no need to a=
pply
> > ++#             # Only the minor version number changed - just apply s=
ilently
> >  +#             &apply_new_os_version(\%realos);
> >  +#             }
> >  +#     else {
> >  +#             # Large enough change to tell the user
> > -+#             push(@notifs,
> > ++#             push(@notifs,
> >  +#                 &ui_form_start("$gconfig{'webprefix'}/webmin/fix_o=
s.cgi").
> >  +#                 &text('os_incorrect', $realos{'real_os_type'},
> >  +#                                       $realos{'real_os_version'}).=
"<p>\n".
> > @@ -62,3 +65,6 @@ Index: webmin-1.850/webmin/webmin-lib.pl
> >
> >   # Password close to expiry
> >   my $warn_days =3D $config{'warn_days'};
> > +--
> > +2.17.1
> > +
> > diff --git
> > a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
> > b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
> > index 554939285..a995d4b93 100644
> > --- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
> > +++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
> > @@ -1,25 +1,26 @@
> > -# Add support for configuring network interfaces on a generic linux
> > system
> > +# Add support for configuring network interfaces on a generic linux #
> > +system
> >  #
> >  # Upstream-status: Not appropriate [config]  #  # Signed-off-by: Paul
> > Eggleton <paul.eggleton@linux.intel.com>
> > -Index: webmin-1.850/net/module.info
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- webmin-1.850.orig/net/module.info
> > -+++ webmin-1.850/net/module.info
> > -@@ -14,7 +14,7 @@ desc_ko_KR.UTF-8=3D=E9=9B=B1=E3=82=8D=E5=A7=BC=E9=
=9E=97=E5=B2=89=E4=BC=82 =E7=94=91=EE=84=87=E5=8A=9A
> > +---
> > + net/module.info | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/net/module.info b/net/module.info index b23bf2d..8e3628e
> > +100644
> > +--- a/net/module.info
> > ++++ b/net/module.info
> > +@@ -1,7 +1,7 @@
> > + version=3D1.941
> > + longdesc=3DConfigure boot time and active interfaces, DNS, routing a=
nd /etc/hosts.
> >   name=3DNetworking
> > - desc_tr=3DA Yap=E9=BD=A6and=E9=BD=ACmas
> > - desc_de=3DNetzwerkkonfiguration
> >  -os_support=3Dsolaris coherent-linux redhat-linux/5.0-* mandrake-linu=
x
> > united-linux suse-linux/6.0-* open-linux unixware turbo-linux/4.0
> > freebsd/3.2-* openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux
> > gentoo-linux macos/1.5-* trustix-linux slackware-linux/8.0-*
> > openmamba-linux cygwin windows pardus-linux  +os_support=3Dgeneric-lin=
ux
> > solaris coherent-linux redhat-linux/5.0-* mandrake-linux united-linux
> > suse-linux/6.0-* open-linux unixware turbo-linux/4.0 freebsd/3.2-*
> > openbsd debian-linux/2.2-* cobalt-linux/2.2-* msc-linux gentoo-linux
> > macos/1.5-* trustix-linux slackware-linux/8.0-* openmamba-linux cygwin
> > windows pardus-linux
> > - desc_sk=3DKonfigur=E9=86=95ia siete
> > - desc_zh_CN=3D=E7=BD=91=E7=BB=9C=E9=85=8D=E7=BD=AE
> > - risk=3Dlow medium high
> > -Index: webmin-1.850/net/generic-linux-lib.pl
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- /dev/null
> > -+++ webmin-1.850/net/generic-linux-lib.pl
> > -@@ -0,0 +1,2 @@
> > -+do 'linux-lib.pl';
> > -+
> > + readonly=3D1
> > + desc=3DNetwork Configuration
> > + category=3Dnet
> > +--
> > +2.17.1
> > +
> > diff --git
> > a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
> > b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
> > index bdba5e73f..c9c0d3549 100644
> > --- a/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
> > +++ b/meta-webserver/recipes-webadmin/webmin/files/net-lib.pl.patch
> > @@ -3,12 +3,16 @@ Upstream-Status: Inappropriate [config]
> >  XXX: need to work out a better fix.
> >
> >  Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> > +---
> > + net/net-lib.pl | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > -diff -Nru webmin-1.570.orig//net/net-lib.pl
> > webmin-1.570/net/net-lib.pl
> > ---- webmin-1.570.orig//net/net-lib.pl  2011-10-03 09:01:48.000000000
> > +0800
> > -+++ webmin-1.570/net/net-lib.pl        2011-10-28 13:52:56.138873664 =
+0800
> > -@@ -21,7 +21,8 @@
> > -       do "$gconfig{'os_type'}-9.1-ALL-lib.pl";
> > +diff --git a/net/net-lib.pl b/net/net-lib.pl index affa1d1..6671536
> > +100755
> > +--- a/net/net-lib.pl
> > ++++ b/net/net-lib.pl
> > +@@ -26,7 +26,8 @@ elsif ($gconfig{'os_type'} eq 'debian-linux' && -d =
"/etc/netplan") {
> > +       do "netplan-lib.pl";
> >         }
> >   else {
> >  -      do "$gconfig{'os_type'}-lib.pl";
> > @@ -17,3 +21,6 @@ diff -Nru webmin-1.570.orig//net/net-lib.pl webmin-1=
.570/net/net-lib.pl
> >         }
> >
> >   # list_hosts()
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
> > b/meta-webserver/recipes-webadmin/webmin/webmin_1.941.bb
> > similarity index 97%
> > rename from meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
> > rename to meta-webserver/recipes-webadmin/webmin/webmin_1.941.bb
> > index 112365d4b..067c7bf6d 100644
> > --- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
> > +++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.941.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY =3D "Web-based administration interface"
> >  HOMEPAGE =3D "http://www.webmin.com"
> >  LICENSE =3D "BSD-3-Clause"
> > -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D0373ac9f611e542ddebe1ec639=
4afc3c"
> > +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D0a6446108c96d0819d21e40b48=
109507"
> >
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
> >             file://setup.sh \
> > @@ -21,8 +21,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/webadmin/webmin-$=
{PV}.tar.gz \
> >             file://webmin.service \
> >              "
> >
> > -SRC_URI[md5sum] =3D "cd6ee98f73f9418562197675b952d81b"
> > -SRC_URI[sha256sum] =3D "c66caa9e4cb50d5447bc8aceb7989d2284dde060278f4=
04b13e171c7ce1690e1"
> > +SRC_URI[md5sum] =3D "bb8f63068a86a14269726f4d934b8d38"
> > +SRC_URI[sha256sum] =3D "3a19228d92556c7722c6fe56c9d4b73d477a19845b0da=
e3f018fc7fc0306b29a"
> >
> >  UPSTREAM_CHECK_URI =3D "http://www.webmin.com/download.html"
> >  UPSTREAM_CHECK_REGEX =3D "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
> > --
> > 2.17.1
> >
> >
> >
> >
>
>
>
>
>=20
