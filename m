Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E9FCD37AC
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 01:58:44 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26354.1778810319078619734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 18:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cZIwwyty;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd394f4a931so537923266b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 18:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778810317; cv=none;
        d=google.com; s=arc-20240605;
        b=GSBzy/D6pWsBGu7fTR6Bvv685PFz2IH+HPpQg9irecI72HK0KozWRLNSWCZFTKdEkx
         0f0dVOu9BptwG9FGXeinqe+hOrKMz4y4+OCXnHto6LobW9wQZQx1xrKW2Edn6tr3t77Q
         1V6Hqw9HGayeGTc2pacKo6FURTuiXFlfa0P40EptgbE9WIuzBVjBU5j/P5fR+qV1Y2ej
         GitjEaC4qqcxVeY1xog50NtmBX8x/jCIqsfOCp2BDBj2hPjp0D5YkaCclXkTvTq8rWGe
         Qif6IqGqxMNFn7bDOYnfFh3vf6LTQ4gYX/pz5r598oDVTPfUVguXfus4S/Am7ztvHPaK
         E8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iTA9YfsukiNsdSoh/n+AoWNMOwVYevZFdIoiRbm/neY=;
        fh=V1l2ZlQON04gP3HZJ0lRhvaBa0pLJh6iwCfSdrpBYQU=;
        b=N7LIqgHHzCIO7ShvSOPvf1g1dH+bjoOFsZlIBoqBt/42e2Y/7JkSXg1hzP7g0H5Za/
         akyM8GkPm6jlmfw/b4wd/ovM/BBS6ACmdJ7s83Oyfiijsf4PxjwBRyTgNVJtJ6QXThK1
         2zm4qr6pHLB7IXDjfeKQKjRDkco/XifNVm8bwk3svoPfFgJESUvwhuuQkw5/jlAtUNUU
         RLu3h9FV+p62pBoe0EyU/2FQGk/POnOFWobwqK4HrH8ckIbMiQh+CrQBZXGH1jwla9en
         4Ok0a9eZ4p/sUM4XsRL7EBVifKPvxP9qRSS/CT7wojsv5sREYG2iNCF66AQFGJOPnVan
         akYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778810317; x=1779415117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iTA9YfsukiNsdSoh/n+AoWNMOwVYevZFdIoiRbm/neY=;
        b=cZIwwytyFOmI5uEN9lEopL8RlFRpQVmXFaKV2mhyL6xIgRTGnC9MjaRiQKddTqlshy
         mWvHKtOSKR2QT35qkHALPt75xs+yb7oOXqa64ak5aFmig0GJgnsE/T8aEiNTsCgiEv0n
         a3KGF6JbQ8i9tppEvBIwdTCkEZN6rNYEEnCc2C4O4eesXX40hqWbBXMHv0Y8NEtMVwPv
         kPuNa+M+fH7TkVhk3ag7l5Q48IfIfHuHUI2V7dWOvRqjXAwx2tv2HK1utGcq9Vgc48/4
         DifW9WsGk6Gt4xgqO+F1qp91LYmb94d0Rghr775um6m3pCVlDRLu5HzpiATfMZ6fwzoD
         lVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778810317; x=1779415117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTA9YfsukiNsdSoh/n+AoWNMOwVYevZFdIoiRbm/neY=;
        b=fFaWMbquawzLFxlv0iJAiSWkOmNsbaOHBNUsndrYNjh99ajEnRh3PzjoxyKkKTfI6/
         shKzgTszaN9u+JvWJDnbxJRaDm/hcXAxHJp5DulariCRI180afkBgUPEm+xZ848N/AzS
         Ee2QiPMwli3N6A/XSDd96ftREeGwFTCVfOPrgfLUQw8jRz+ggxjOecusDjlo9t+8SVlf
         xyUtohPrm8XcTNiP90WS2x1/8wA7CfPgLZ8tklvj8yNS5WTv2Uy0DJug0WCehkBfW1h4
         686OTriz5G3r/boCZO6XeEy8lmDFSj/WSlTdOB4up834wRjc2F9mr7Mp6DtCYpexFvWS
         S32Q==
X-Gm-Message-State: AOJu0YxQsQadEvGa35OxrXSzc9di3ia0me8AA64ZDOnNPNulru8pUryS
	db5BryWls16muUeVQyKVruhQjhjEow9kBrqhXiu0TwC4HPSwbGpHTL2GzWOwErrxPrUOUyJA5MW
	VkbEoG008IBPeP2KT07RvpzuEwxG7Egc=
X-Gm-Gg: Acq92OFQ7lXk9qTgzCgK1y3MVgAd9oG9QpIRwh1ndpaNlFtmYy6zKU8zNuOcFxHvv6d
	+hWkmXR8WbsodzDKn0I8Shc/ELVkA9FRs0Lnjo6avwCBnwXY53Ha8e0Uxj5fDvN6Ja+t057o9XH
	pGDHig7O8TjgUvvjpzRpv5nFuATfPdCasP2dwAB6tQDucpfVOxRqYsdrx2cCsR3nODDP2X0aqwV
	t6RNrXUQhjkYC0ZuDA+TiLgYC/OVlQICGEFybLFChfDloyZ19z5wThSGNx/ImAFSminipCLDZXz
	TvZlvzlYj852l+gnOEA6+z52t9uHnRwPDFQyWtwnZaw7Z08K5bc3d/W09MBdcX49w8GFOEW0h78
	1jc+1yM5XeWp0XcevldCapZJxo3s0ws47NRyuK0uUazq2AHHkEKIAlS8njiqCHoYArHAUcXH2Tp
	byiEl7
X-Received: by 2002:a17:907:3cc1:b0:bd5:15cb:fa47 with SMTP id
 a640c23a62f3a-bd51780c5ccmr85496266b.9.1778810316754; Thu, 14 May 2026
 18:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sr-mFccrpOTJ3yVitujsrkCCJyS+SFdPyki8Wo0vk+TCA@mail.gmail.com>
 <18AF5238DBAFD59C.2716283@lists.openembedded.org> <40b403e9-44ef-4caf-89cb-47f22f7ce820@windriver.com>
In-Reply-To: <40b403e9-44ef-4caf-89cb-47f22f7ce820@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 May 2026 18:58:22 -0700
X-Gm-Features: AVHnY4K9KTfbVc12S3qIwP2LfWXGk5KAp4hXLmoetwHwJ4GaYQDWUbC5DF5-qKQ
Message-ID: <CAMKF1spT9ZLkuMxF1bQo+ntCQZcE6NrNRnoQW7B6ji-=k1eXxg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH V2] postfix: upgrade 3.10.9 -> 3.11.2
To: Changqing Li <changqing.li@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000d92200651d18d60"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 01:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126995

--0000000000000d92200651d18d60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok send a v3 to make it clear

On Thu, May 14, 2026, 6:44=E2=80=AFPM Changqing Li <changqing.li@windriver.=
com>
wrote:

> Hi, Khem
>
> This is a kind remind.  This is the patch rebased on latest master
> branch,  and sorry this actually should be V3.
>
> but I noticed the old V2 patch is on the master-next:
>
>
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D537241aa1fd027a1ab946955d78b68a56e8896c8
>
> Regards
>
> Changqing
>
> On 5/14/26 11:51, Changqing Li via lists.openembedded.org wrote:
> >   * Refresh patch to mute patch-fuzz
> > * Remove 0001-makedefs-Account-for-linux-7.x-version.patch
> > * This upgrade include the following commit, which make postfix can
> >    compile on latest stable ubuntu 26.04, which have Linux 7.x kernel
> >
> >    Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
> >          makedefs, util/sys_defs.h.
> >
> > Changes:
> > https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >   .../postfix/files/0001-Fix-makedefs.patch     | 25 ++++++++----------=
-
> >   ...tconf-to-a-variable-for-cross-compil.patch |  9 +++----
> >   ...tive-compiler-to-build-makedefs.test.patch | 17 ++++++-------
> >   .../postfix/files/0004-Fix-icu-config.patch   |  9 +++----
> >   ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 +++-----
> >   .../{postfix_3.10.9.bb =3D> postfix_3.11.2.bb}  |  3 +--
> >   6 files changed, 29 insertions(+), 45 deletions(-)
> >   rename meta-networking/recipes-daemons/postfix/{postfix_3.10.9.bb =3D=
>
> postfix_3.11.2.bb} (98%)
> >
> > diff --git
> a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> > index 785fe87452..4e187849dc 100644
> > ---
> a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> > +++
> b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
> > @@ -1,4 +1,4 @@
> > -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
> > +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
> >   From: Li xin <lixin.fnst@cn.fujitsu.com>
> >   Date: Fri, 19 Jun 2015 16:45:54 +0900
> >   Subject: [PATCH] Fix makedefs
> > @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> >    1 file changed, 11 insertions(+), 16 deletions(-)
> >
> >   diff --git a/makedefs b/makedefs
> > -index a740e41..28fb128 100644
> > +index d5103ce..9713327 100644
> >   --- a/makedefs
> >   +++ b/makedefs
> > -@@ -230,9 +230,6 @@ echo "# pie=3D$pie"
> > +@@ -232,9 +232,6 @@ echo "# pie=3D$pie"
> >
> >    # Defaults for most sane systems
> >
> > @@ -32,7 +32,7 @@ index a740e41..28fb128 100644
> >    ARFL=3Drv
> >
> >    # Ugly function to make our error message more visible among the
> > -@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
> > +@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
> >               case "$CCARGS" in
> >                *-DNO_DB*) ;;
> >                *-DHAS_DB*) ;;
> > @@ -48,8 +48,8 @@ index a740e41..28fb128 100644
> >                   else
> >                       # No, we're not going to try db1 db2 db3 etc.
> >                       # On a properly installed system, Postfix builds
> > -@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
> > -                     echo "Install the appropriate db*-devel package
> first." 1>&2
> > +@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
> > +                     echo "Alternatively, build with CCARGS=3D\"-NO_DB
> ...\"" 1>&2
> >                       exit 1
> >                   fi
> >   -               SYSLIBS=3D"-ldb"
> > @@ -63,7 +63,7 @@ index a740e41..28fb128 100644
> >                   do
> >                       test -e $lib/lib$name.a -o -e $lib/lib$name.so &&=
 {
> >                           SYSLIBS=3D"$SYSLIBS -l$name"
> > -@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
> > +@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
> >                      if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
> >                      then
> >                          :
> > @@ -72,7 +72,7 @@ index a740e41..28fb128 100644
> >                      then
> >                          echo CCARGS=3D"$CCARGS -DNO_EPOLL"
> >                      else
> > -@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
> > +@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
> >    }
> >    EOF
> >                          ${CC-gcc} -o makedefs.test makedefs.test.c ||
> exit 1
> > @@ -81,7 +81,7 @@ index a740e41..28fb128 100644
> >                          rm -f makedefs.test makedefs.test.[co]
> >                      fi;;
> >               esac
> > -@@ -644,12 +639,12 @@ EOF
> > +@@ -690,12 +685,12 @@ EOF
> >               case "$CCARGS" in
> >                *-DNO_DB*) ;;
> >                *-DHAS_DB*) ;;
> > @@ -97,8 +97,8 @@ index a740e41..28fb128 100644
> >                   else
> >                       # On a properly installed system, Postfix builds
> >                       # by including <db.h> and by linking with -ldb
> > -@@ -657,12 +652,12 @@ EOF
> > -                     echo "Install the appropriate db*-devel package
> first." 1>&2
> > +@@ -705,12 +700,12 @@ EOF
> > +                     echo "See:
> https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf" 1>&2
> >                       exit 1
> >                   fi
> >   -               SYSLIBS=3D"-ldb"
> > @@ -112,6 +112,3 @@ index a740e41..28fb128 100644
> >                   do
> >                       test -e $lib/lib$name.a -o -e $lib/lib$name.so &&=
 {
> >                           SYSLIBS=3D"$SYSLIBS -l$name"
> > ---
> > -2.25.1
> > -
> > diff --git
> a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> > index d46efb95cb..a74c46fa92 100644
> > ---
> a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> > +++
> b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postcon=
f-to-a-variable-for-cross-compil.patch
> > @@ -1,4 +1,4 @@
> > -From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
> > +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
> >   From: Li xin <lixin.fnst@cn.fujitsu.com>
> >   Date: Fri, 19 Jun 2015 17:14:58 +0900
> >   Subject: [PATCH] Change fixed postconf to a variable for
> cross-compiling
> > @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> >    2 files changed, 11 insertions(+), 9 deletions(-)
> >
> >   diff --git a/Makefile.in b/Makefile.in
> > -index a37f89f..17cb64b 100644
> > +index 8d7501a..d2a85e8 100644
> >   --- a/Makefile.in
> >   +++ b/Makefile.in
> > -@@ -22,7 +22,7 @@ META       =3D meta/main.cf.proto meta/master.cf.pro=
to
> meta/postfix-files \
> > +@@ -23,7 +23,7 @@ META       =3D meta/main.cf.proto meta/master.cf.pro=
to
> meta/postfix-files \
> >    EXPAND     =3D sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
> >           -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
> >    SHLIB_DIR_OVERRIDE =3D \
> > @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
> >        "daemon_directory =3D $daemon_directory" \
> >        "data_directory =3D $data_directory" \
> >        "command_directory =3D $command_directory" \
> > ---
> > -2.25.1
> > -
> > diff --git
> a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> > index 6f8e3e84da..201b4741de 100644
> > ---
> a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> > +++
> b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-=
compiler-to-build-makedefs.test.patch
> > @@ -1,4 +1,4 @@
> > -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
> > +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Sat, 26 Aug 2017 10:29:37 -0700
> >   Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
> > @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >   diff --git a/makedefs b/makedefs
> > -index 28fb128..313b401 100644
> > +index 9713327..e879832 100644
> >   --- a/makedefs
> >   +++ b/makedefs
> > -@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
> > +@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
> >        exit(0);
> >    }
> >    EOF
> > @@ -25,7 +25,7 @@ index 28fb128..313b401 100644
> >                          rm -f makedefs.test makedefs.test.[co]
> >                      fi;;
> >               esac
> > -@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
> > +@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
> >        exit(0);
> >    }
> >    EOF
> > @@ -34,7 +34,7 @@ index 28fb128..313b401 100644
> >                  ./makedefs.test 2>/dev/null ||
> >                       CCARGS=3D"$CCARGS -DNO_SIGSETJMP"
> >                  rm -f makedefs.test makedefs.test.[co]
> > -@@ -903,7 +903,7 @@ int main(int argc, char **argv)
> > +@@ -952,7 +952,7 @@ int main(int argc, char **argv)
> >                                 &error) !=3D 14);
> >    }
> >    EOF
> > @@ -43,7 +43,7 @@ index 28fb128..313b401 100644
> >                       $icu_ldflags >/dev/null 2>&1
> >                   if ./makedefs.test 2>/dev/null ; then
> >                       CCARGS=3D"$CCARGS $icu_cppflags"
> > -@@ -1024,7 +1024,7 @@ int     main(void)
> > +@@ -1088,7 +1088,7 @@ int     main(void)
> >        exit(ferror(stdout) ? 1 : 0);
> >    }
> >    EOF
> > @@ -52,7 +52,7 @@ index 28fb128..313b401 100644
> >        ./makedefs.test || exit 1
> >        rm -f makedefs.test makedefs.test.[co]
> >    }
> > -@@ -1180,7 +1180,7 @@ int     main(void)
> > +@@ -1245,7 +1245,7 @@ int     main(void)
> >        exit(ferror(stdout) ? 1 : 0);
> >    }
> >    EOF
> > @@ -61,6 +61,3 @@ index 28fb128..313b401 100644
> >       parm_val=3D`./makedefs.test` || exit 1
> >       rm -f makedefs.test makedefs.test.[co]
> >       eval ${parm_name}=3D\""\$parm_val"\"
> > ---
> > -2.25.1
> > -
> > diff --git
> a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> > index 0660ee098e..daf5c7089e 100644
> > ---
> a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> > +++
> b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
> > @@ -1,4 +1,4 @@
> > -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
> > +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Sun, 16 Jan 2022 11:21:54 +0800
> >   Subject: [PATCH] Fix icu config
> > @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    1 file changed, 1 deletion(-)
> >
> >   diff --git a/makedefs b/makedefs
> > -index 313b401..e5db212 100644
> > +index e879832..f9c132e 100644
> >   --- a/makedefs
> >   +++ b/makedefs
> > -@@ -906,7 +906,6 @@ EOF
> > +@@ -955,7 +955,6 @@ EOF
> >                   ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c
> $icu_cppflags \
> >                       $icu_ldflags >/dev/null 2>&1
> >                   if ./makedefs.test 2>/dev/null ; then
> > @@ -29,6 +29,3 @@ index 313b401..e5db212 100644
> >                       SYSLIBS=3D"$SYSLIBS $icu_ldflags"
> >                   else
> >                       CCARGS=3D"$CCARGS -DNO_EAI"
> > ---
> > -2.25.1
> > -
> > diff --git
> a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> > index 1571aa844d..c2e640d6ff 100644
> > ---
> a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> > +++
> b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-an=
d-lresolv-to-SYSLIBS-by-default.patch
> > @@ -1,4 +1,4 @@
> > -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
> > +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
> >   From: Yi Zhao <yi.zhao@windriver.com>
> >   Date: Fri, 12 Oct 2018 12:38:02 +0800
> >   Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by defau=
lt
> > @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >    1 file changed, 2 insertions(+), 20 deletions(-)
> >
> >   diff --git a/makedefs b/makedefs
> > -index e5db212..b00049b 100644
> > +index f9c132e..5ebef5b 100644
> >   --- a/makedefs
> >   +++ b/makedefs
> > -@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
> > +@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
> >                   SYSLIBS=3D"$SYSLIBS -ldb"
> >                   ;;
> >               esac
> > @@ -35,7 +35,7 @@ index e5db212..b00049b 100644
> >               # Kernel 2.4 added IPv6
> >               case "$RELEASE" in
> >               2.[0-3].*) CCARGS=3D"$CCARGS -DNO_IPV6";;
> > -@@ -655,16 +646,7 @@ EOF
> > +@@ -703,16 +694,7 @@ EOF
> >                   SYSLIBS=3D"$SYSLIBS -ldb"
> >                   ;;
> >               esac
> > @@ -53,6 +53,3 @@ index e5db212..b00049b 100644
> >               SYSLIBS=3D"$SYSLIBS -ldl"
> >               : ${SHLIB_SUFFIX=3D.so}
> >               : ${SHLIB_CFLAGS=3D-fPIC}
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
> b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> > similarity index 98%
> > rename from meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
> > rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> > index 633e4a7a0d..894e58261b 100644
> > --- a/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
> > +++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
> > @@ -26,11 +26,10 @@ SRC_URI =3D "
> http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
> >
> file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
> >              file://0004-Fix-icu-config.patch \
> >
> file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
> > -           file://0001-makedefs-Account-for-linux-7.x-version.patch \
> >              file://0001-Fix-build-with-musl.patch \
> >              "
> >
> > -SRC_URI[sha256sum] =3D
> "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c759801bc13"
> > +SRC_URI[sha256sum] =3D
> "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
> >
> >   UPSTREAM_CHECK_URI =3D "https://www.postfix.org/announcements.html"
> >   UPSTREAM_CHECK_REGEX =3D "postfix-(?P<pver>\d+(\.\d+)+)"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126984):
> https://lists.openembedded.org/g/openembedded-devel/message/126984
> > Mute This Topic: https://lists.openembedded.org/mt/119308741/3616873
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> changqing.li@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000000d92200651d18d60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok send a v3 to make it clear=C2=A0</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, May 14, 2026, 6:44=E2=80=AFPM Changqing Li &lt;<a href=3D"mailto:=
changqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi, Khem<br>
<br>
This is a kind remind.=C2=A0 This is the patch rebased on latest master <br=
>
branch,=C2=A0 and sorry this actually should be V3.<br>
<br>
but I noticed the old V2 patch is on the master-next:<br>
<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaste=
r-next&amp;id=3D537241aa1fd027a1ab946955d78b68a56e8896c8" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openembedd=
ed/commit/?h=3Dmaster-next&amp;id=3D537241aa1fd027a1ab946955d78b68a56e8896c=
8</a><br>
<br>
Regards<br>
<br>
Changqing<br>
<br>
On 5/14/26 11:51, Changqing Li via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a=
> wrote:<br>
&gt;=C2=A0 =C2=A0* Refresh patch to mute patch-fuzz<br>
&gt; * Remove 0001-makedefs-Account-for-linux-7.x-version.patch<br>
&gt; * This upgrade include the following commit, which make postfix can<br=
>
&gt;=C2=A0 =C2=A0 compile on latest stable ubuntu 26.04, which have Linux 7=
.x kernel<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Postfix works on Linux 7.x kernels. Frank Scheiner. Files=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 makedefs, util/sys_defs.h.<br>
&gt;<br>
&gt; Changes:<br>
&gt; <a href=3D"https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.=
2.HISTORY" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.ftp.=
saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY</a><br>
&gt;<br>
&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com" target=3D"_blank" rel=3D"noreferrer">changqing.li@windriver.com</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../postfix/files/0001-Fix-makedefs.patch=C2=A0 =C2=A0 =C2=
=A0| 25 ++++++++-----------<br>
&gt;=C2=A0 =C2=A0...tconf-to-a-variable-for-cross-compil.patch |=C2=A0 9 ++=
+----<br>
&gt;=C2=A0 =C2=A0...tive-compiler-to-build-makedefs.test.patch | 17 ++++++-=
------<br>
&gt;=C2=A0 =C2=A0.../postfix/files/0004-Fix-icu-config.patch=C2=A0 =C2=A0|=
=C2=A0 9 +++----<br>
&gt;=C2=A0 =C2=A0...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 +++----=
-<br>
&gt;=C2=A0 =C2=A0.../{<a href=3D"http://postfix_3.10.9.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">postfix_3.10.9.bb</a> =3D&gt; <a href=3D"ht=
tp://postfix_3.11.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pos=
tfix_3.11.2.bb</a>}=C2=A0 |=C2=A0 3 +--<br>
&gt;=C2=A0 =C2=A06 files changed, 29 insertions(+), 45 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D=
"http://postfix_3.10.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
postfix_3.10.9.bb</a> =3D&gt; <a href=3D"http://postfix_3.11.2.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">postfix_3.11.2.bb</a>} (98%)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-ma=
kedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-maked=
efs.patch<br>
&gt; index 785fe87452..4e187849dc 100644<br>
&gt; --- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.=
patch<br>
&gt; +++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.=
patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.c=
om" target=3D"_blank" rel=3D"noreferrer">lixin.fnst@cn.fujitsu.com</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0Date: Fri, 19 Jun 2015 16:45:54 +0900<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] Fix makedefs<br>
&gt; @@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao &lt;<a href=3D"mailto:yao.=
zhao@windriver.com" target=3D"_blank" rel=3D"noreferrer">yao.zhao@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 1 file changed, 11 insertions(+), 16 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/makedefs b/makedefs<br>
&gt; -index a740e41..28fb128 100644<br>
&gt; +index d5103ce..9713327 100644<br>
&gt;=C2=A0 =C2=A0--- a/makedefs<br>
&gt;=C2=A0 =C2=A0+++ b/makedefs<br>
&gt; -@@ -230,9 +230,6 @@ echo &quot;# pie=3D$pie&quot;<br>
&gt; +@@ -232,9 +232,6 @@ echo &quot;# pie=3D$pie&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 # Defaults for most sane systems<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -32,7 +32,7 @@ index a740e41..28fb128 100644<br>
&gt;=C2=A0 =C2=A0 ARFL=3Drv<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 # Ugly function to make our error message more visible am=
ong the<br>
&gt; -@@ -563,12 +560,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt; +@@ -608,12 +605,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$CCAR=
GS&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DNO_DB*) ;;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DHAS_DB*) ;;<=
br>
&gt; @@ -48,8 +48,8 @@ index a740e41..28fb128 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0el=
se<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# No, we&#39;re not going to try db1 db2 db3 etc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# On a properly installed system, Postfix builds<br>
&gt; -@@ -577,12 +574,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;Install the appropriate db*-devel package first.&quot; 1&=
gt;&amp;2<br>
&gt; +@@ -623,12 +620,12 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;Alternatively, build with CCARGS=3D\&quot;-NO_DB ...\&quo=
t;&quot; 1&gt;&amp;2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SY=
SLIBS=3D&quot;-ldb&quot;<br>
&gt; @@ -63,7 +63,7 @@ index a740e41..28fb128 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0test -e $lib/lib$name.a -o -e $lib/lib$name.so &amp;&amp; {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0SYSLIBS=3D&quot;$SYSLIBS -l$name&quot;<br>
&gt; -@@ -602,7 +599,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt; +@@ -648,7 +645,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ `expr &quot;X$CCARGS&quot; : &quot;X.*-DNO_EPOLL&quot;` -gt 0 ]=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 :<br>
&gt; @@ -72,7 +72,7 @@ index a740e41..28fb128 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 echo CCARGS=3D&quot;$CCARGS -DNO_EPOLL&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else<br>
&gt; -@@ -626,8 +623,6 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv=
)<br>
&gt; +@@ -672,8 +669,6 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv=
)<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1<b=
r>
&gt; @@ -81,7 +81,7 @@ index a740e41..28fb128 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fi;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; -@@ -644,12 +639,12 @@ EOF<br>
&gt; +@@ -690,12 +685,12 @@ EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$CCAR=
GS&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DNO_DB*) ;;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-DHAS_DB*) ;;<=
br>
&gt; @@ -97,8 +97,8 @@ index a740e41..28fb128 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0el=
se<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# On a properly installed system, Postfix builds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# by including &lt;db.h&gt; and by linking with -ldb<br>
&gt; -@@ -657,12 +652,12 @@ EOF<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;Install the appropriate db*-devel package first.&quot; 1&=
gt;&amp;2<br>
&gt; +@@ -705,12 +700,12 @@ EOF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;See: <a href=3D"https://www.postfix.org/NON_BERKELEYDB_RE=
ADME.html#build-conf" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://www.postfix.org/NON_BERKELEYDB_README.html#build-conf</a>&quot; 1&gt;&am=
p;2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SY=
SLIBS=3D&quot;-ldb&quot;<br>
&gt; @@ -112,6 +112,3 @@ index a740e41..28fb128 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0test -e $lib/lib$name.a -o -e $lib/lib$name.so &amp;&amp; {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0SYSLIBS=3D&quot;$SYSLIBS -l$name&quot;<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change=
-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/reci=
pes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cros=
s-compil.patch<br>
&gt; index d46efb95cb..a74c46fa92 100644<br>
&gt; --- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-=
postconf-to-a-variable-for-cross-compil.patch<br>
&gt; +++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-=
postconf-to-a-variable-for-cross-compil.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.c=
om" target=3D"_blank" rel=3D"noreferrer">lixin.fnst@cn.fujitsu.com</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0Date: Fri, 19 Jun 2015 17:14:58 +0900<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] Change fixed postconf to a variable for c=
ross-compiling<br>
&gt; @@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao &lt;<a href=3D"mailto:yao.=
zhao@windriver.com" target=3D"_blank" rel=3D"noreferrer">yao.zhao@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 2 files changed, 11 insertions(+), 9 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/Makefile.in b/Makefile.in<br>
&gt; -index a37f89f..17cb64b 100644<br>
&gt; +index 8d7501a..d2a85e8 100644<br>
&gt;=C2=A0 =C2=A0--- a/Makefile.in<br>
&gt;=C2=A0 =C2=A0+++ b/Makefile.in<br>
&gt; -@@ -22,7 +22,7 @@ META=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D meta/main.cf.pro=
to meta/master.cf.proto meta/postfix-files \<br>
&gt; +@@ -23,7 +23,7 @@ META=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D meta/main.cf.pro=
to meta/master.cf.proto meta/postfix-files \<br>
&gt;=C2=A0 =C2=A0 EXPAND=C2=A0 =C2=A0 =C2=A0=3D sed -e &quot;s;\$${LIB_PREF=
IX};$(LIB_PREFIX);&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;s;\$${LIB_SUFFIX};$(L=
IB_SUFFIX);&quot;<br>
&gt;=C2=A0 =C2=A0 SHLIB_DIR_OVERRIDE =3D \<br>
&gt; @@ -102,6 +102,3 @@ index 563ee27..00d4651 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;daemon_directory =3D $daemon_director=
y&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;data_directory =3D $data_directory&qu=
ot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;command_directory =3D $command_direct=
ory&quot; \<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makede=
fs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recip=
es-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedef=
s.test.patch<br>
&gt; index 6f8e3e84da..201b4741de 100644<br>
&gt; --- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-=
native-compiler-to-build-makedefs.test.patch<br>
&gt; +++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-=
native-compiler-to-build-makedefs.test.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Sat, 26 Aug 2017 10:29:37 -0700<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] makedefs: Use native compiler to build ma=
kedefs.test<br>
&gt; @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/makedefs b/makedefs<br>
&gt; -index 28fb128..313b401 100644<br>
&gt; +index 9713327..e879832 100644<br>
&gt;=C2=A0 =C2=A0--- a/makedefs<br>
&gt;=C2=A0 =C2=A0+++ b/makedefs<br>
&gt; -@@ -622,7 +622,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv=
)<br>
&gt; +@@ -668,7 +668,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 EOF<br>
&gt; @@ -25,7 +25,7 @@ index 28fb128..313b401 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fi;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; -@@ -865,7 +865,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv=
)<br>
&gt; +@@ -914,7 +914,7 @@ int=C2=A0 =C2=A0 =C2=A0main(int argc, char **argv=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(0);<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 EOF<br>
&gt; @@ -34,7 +34,7 @@ index 28fb128..313b401 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./makede=
fs.test 2&gt;/dev/null ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CCARGS=3D&quot;$CCARGS -DNO_SIGSETJMP&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ma=
kedefs.test makedefs.test.[co]<br>
&gt; -@@ -903,7 +903,7 @@ int main(int argc, char **argv)<br>
&gt; +@@ -952,7 +952,7 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error) !=3D 14);<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 EOF<br>
&gt; @@ -43,7 +43,7 @@ index 28fb128..313b401 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0$icu_ldflags &gt;/dev/null 2&gt;&amp;1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 ./makedefs.test 2&gt;/dev/null ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CCARGS=3D&quot;$CCARGS $icu_cppflags&quot;<br>
&gt; -@@ -1024,7 +1024,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
&gt; +@@ -1088,7 +1088,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(ferror(stdout) ? 1 : 0);<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 EOF<br>
&gt; @@ -52,7 +52,7 @@ index 28fb128..313b401 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./makedefs.test || exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f makedefs.test makedefs.test.[co]<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt; -@@ -1180,7 +1180,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
&gt; +@@ -1245,7 +1245,7 @@ int=C2=A0 =C2=A0 =C2=A0main(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(ferror(stdout) ? 1 : 0);<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 EOF<br>
&gt; @@ -61,6 +61,3 @@ index 28fb128..313b401 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parm_val=3D`./makedefs.test` || exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f makedefs.test makedefs.test.[co]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0eval ${parm_name}=3D\&quot;&quot;\$parm_val&=
quot;\&quot;<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-ic=
u-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu=
-config.patch<br>
&gt; index 0660ee098e..daf5c7089e 100644<br>
&gt; --- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-confi=
g.patch<br>
&gt; +++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-confi=
g.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Sun, 16 Jan 2022 11:21:54 +0800<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] Fix icu config<br>
&gt; @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 1 file changed, 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/makedefs b/makedefs<br>
&gt; -index 313b401..e5db212 100644<br>
&gt; +index e879832..f9c132e 100644<br>
&gt;=C2=A0 =C2=A0--- a/makedefs<br>
&gt;=C2=A0 =C2=A0+++ b/makedefs<br>
&gt; -@@ -906,7 +906,6 @@ EOF<br>
&gt; +@@ -955,7 +955,6 @@ EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${=
BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0$icu_ldflags &gt;/dev/null 2&gt;&amp;1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 ./makedefs.test 2&gt;/dev/null ; then<br>
&gt; @@ -29,6 +29,3 @@ index 313b401..e5db212 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0SYSLIBS=3D&quot;$SYSLIBS $icu_ldflags&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0el=
se<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CCARGS=3D&quot;$CCARGS -DNO_EAI&quot;<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makede=
fs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recip=
es-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-d=
efault.patch<br>
&gt; index 1571aa844d..c2e640d6ff 100644<br>
&gt; --- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-=
lnsl-and-lresolv-to-SYSLIBS-by-default.patch<br>
&gt; +++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-=
lnsl-and-lresolv-to-SYSLIBS-by-default.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">yi.zhao@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Fri, 12 Oct 2018 12:38:02 +0800<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLI=
BS by default<br>
&gt; @@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zh=
ao@windriver.com" target=3D"_blank" rel=3D"noreferrer">yi.zhao@windriver.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 20 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/makedefs b/makedefs<br>
&gt; -index e5db212..b00049b 100644<br>
&gt; +index f9c132e..5ebef5b 100644<br>
&gt;=C2=A0 =C2=A0--- a/makedefs<br>
&gt;=C2=A0 =C2=A0+++ b/makedefs<br>
&gt; -@@ -577,16 +577,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt; +@@ -623,16 +623,7 @@ case &quot;$SYSTEM.$RELEASE&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SY=
SLIBS=3D&quot;$SYSLIBS -ldb&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; @@ -35,7 +35,7 @@ index e5db212..b00049b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Kernel 2.4 add=
ed IPv6<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$RELE=
ASE&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.[0-3].*) CCARG=
S=3D&quot;$CCARGS -DNO_IPV6&quot;;;<br>
&gt; -@@ -655,16 +646,7 @@ EOF<br>
&gt; +@@ -703,16 +694,7 @@ EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SY=
SLIBS=3D&quot;$SYSLIBS -ldb&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; @@ -53,6 +53,3 @@ index e5db212..b00049b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSLIBS=3D&quot;=
$SYSLIBS -ldl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: ${SHLIB_SUFFIX=
=3D.so}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: ${SHLIB_CFLAGS=
=3D-fPIC}<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-daemons/postfix/<a href=3D"http:/=
/postfix_3.10.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">postfix=
_3.10.9.bb</a> b/meta-networking/recipes-daemons/postfix/<a href=3D"http://=
postfix_3.11.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">postfix_=
3.11.2.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta-networking/recipes-daemons/postfix/<a href=3D"http://=
postfix_3.10.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">postfix_=
3.10.9.bb</a><br>
&gt; rename to meta-networking/recipes-daemons/postfix/<a href=3D"http://po=
stfix_3.11.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">postfix_3.=
11.2.bb</a><br>
&gt; index 633e4a7a0d..894e58261b 100644<br>
&gt; --- a/meta-networking/recipes-daemons/postfix/<a href=3D"http://postfi=
x_3.10.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">postfix_3.10.9=
.bb</a><br>
&gt; +++ b/meta-networking/recipes-daemons/postfix/<a href=3D"http://postfi=
x_3.11.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">postfix_3.11.2=
.bb</a><br>
&gt; @@ -26,11 +26,10 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.porcupine.=
org/mirrors/postfix-release/official/postfix-$%7BP" rel=3D"noreferrer noref=
errer" target=3D"_blank">http://ftp.porcupine.org/mirrors/postfix-release/o=
fficial/postfix-${P</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-makedefs-U=
se-native-compiler-to-build-makedefs.test.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Fix-icu-co=
nfig.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-makedefs-a=
dd-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-makedefs-Account=
-for-linux-7.x-version.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-=
with-musl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001=
ea054f7f2a601c759801bc13&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;daed65b08c9288cdb386a914f3e52cdddd449354=
07b5ce5aee8bcc3aa4207778&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.postfi=
x.org/announcements.html" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://www.postfix.org/announcements.html</a>&quot;<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_REGEX =3D &quot;postfix-(?P&lt;pver&gt;\d+(=
\.\d+)+)&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#126984): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/126984" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/126=
984</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11930874=
1/3616873" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/119308741/3616873</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:changqin=
g.li@windriver.com" target=3D"_blank" rel=3D"noreferrer">changqing.li@windr=
iver.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000000d92200651d18d60--

