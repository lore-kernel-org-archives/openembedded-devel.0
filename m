Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web09.3930.1616114119848647483
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 17:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PCRVY/SG;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: koncept1@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id b5so2564465vsl.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 17:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=6ugfC4ra9MBOZ9dDhSO+EaOvznThau0KIweXv3vmfGw=;
        b=PCRVY/SGICRQ5Cw711BCfBrUSS7wYvYwdOdyIQyGsaNxQr6twvI6l3U+ud/0JIoMSL
         fUKjE4R6+tczr4EUJrYenrXhQGztjtaTgi0LFE+xhckjlCyCSw7F/MitF1+hndGtiF6A
         skyDli8WqNvH1lD33nTEDgskQh7/mim8LVpbjjPz3maA0bWPO0ZtqQY/iDAtn4ZgS6Gq
         9AA7DC+4xkFETzPAycd4uMCxK+ds/8OrfF6xrtRrRK61SozbhRAf+5Rzr5BO9rC5iWkc
         ikwFPbNuDYdpPnAfIlimcag7MphRveKp+k1SjzYp7X9hCxyCL7N+2eDA8XnNjiUHSFI0
         G0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=6ugfC4ra9MBOZ9dDhSO+EaOvznThau0KIweXv3vmfGw=;
        b=R4Fo0v5X84+5e29IlcNwMQCoDrwwmxqjjxZJIqrsemTqIXbwIzlEZwH54ALM7c52gp
         HahLa9ZrbXL8z/Gc16MzbapG6YEAYvJIxiDBJ5bkDhgcxQ4Elbnz8iCYhge690dYHAih
         H+V058oSx2ZvCkMH2JH1s14GibK8ztT/WpDO+MoQfD76z9j4vW6BhLc/7+uBGWlMxk4r
         g3KMIuhUdbeD+VoSjLi2CNsvstuSKcS6d7Kndyxnm884+KaTmMB1BJVU4TqP1kumuOGB
         Mitpy0bZcqJX63PW4t3fbmVSePc/Q0D09INOEU78x+d9rPqBsc5oln1poTFH3SvinkJV
         WK5Q==
X-Gm-Message-State: AOAM5313bAMdgaN8gaMkA5n6rP/w+CVRpOARkUzpJplkXchd/I2PNNVK
	uD0rnUwIy178+ZkEHZ8yg/ZHMjD3iAyvPCXydToY4j49KWk=
X-Google-Smtp-Source: ABdhPJyRkbwZktcdvYafGGJhigduYvFM9Vz8fXpGuKh3a/zHrTOPPxO9cYrQt41m8YktW8vYgaS9iuZNkEyvM3rMy7Q=
X-Received: by 2002:a67:2a85:: with SMTP id q127mr1420427vsq.19.1616114118541;
 Thu, 18 Mar 2021 17:35:18 -0700 (PDT)
MIME-Version: 1.0
From: "Ben Magistro" <koncept1@gmail.com>
Date: Thu, 18 Mar 2021 20:35:07 -0400
Message-ID: <CAKx8PBi4bXBoV_rfXfEPGwa4k52rONdG=s1kBat23+EH47aXXw@mail.gmail.com>
Subject: Backport openocd changes to dunfell
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f3cb9b05bdd8e388"

--000000000000f3cb9b05bdd8e388
Content-Type: text/plain; charset="UTF-8"

While porting another project to Dunfell, I found it necessary to
update openocd.  The changes have already been applied to master.


See:
 * https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg70813.html
 * http://git.openembedded.org/meta-openembedded/commit/?id=0a27b0840f57d64cab091c9a0681582832d72c2d
 * http://git.openembedded.org/meta-openembedded/commit/?id=64bc3a36e4a36f16596c2f6e83998c8dccd717a6


I believe the patch below incorporates all of the relevant changes
from the above commits to a single patch:
```
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
b/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
deleted file mode 100644
index 618ce2689..000000000
--- a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a763610719e7d7f6cdc45569b6fbfdb91bb7c87b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 14:30:08 -0700
-Subject: [PATCH] Do not include syscrtl.h with glibc
-
-glibc 2.30 has deprecated it see [1]
-Fixes
-sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated
and will be removed." [-Werror,-W#warnings]
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/helper/options.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/helper/options.c b/src/helper/options.c
-index 12755e010..4007e37f6 100644
---- a/src/helper/options.c
-+++ b/src/helper/options.c
-@@ -34,7 +34,7 @@
- #if IS_DARWIN
- #include <libproc.h>
- #endif
--#ifdef HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
- #if IS_WIN32 && !IS_CYGWIN
---
-2.22.0
-
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb
b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index e95f1cfa5..05e06a25d 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,14 +9,13 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl
\
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl
\
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink
\
-    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
 "

 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
+SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
-SRCREV_libjaylink = "cfccbc9d6763733f1d14dff3c2dc5b75aaef136b"
+SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
+SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"

 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
@@ -55,3 +54,6 @@ FILES_${PN} = " \
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] =
"--enable-remote-bitbang,--disable-remote-bitbang"
 PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
+
+# Can't be built with ccache
+CCACHE_DISABLE = "1"
```

--000000000000f3cb9b05bdd8e388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-gs" style=3D"margin:0px;padding:0px 0p=
x 20px;width:1119.2px;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-s=
erif;font-size:medium"><div class=3D"gmail-"><div id=3D"gmail-:pn" class=3D=
"gmail-ii gmail-gt" style=3D"font-size:0.875rem;direction:ltr;margin:8px 0p=
x 0px;padding:0px"><div id=3D"gmail-:vh" class=3D"gmail-a3s gmail-aiL" styl=
e=3D"overflow:hidden;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-stretch:normal;font-size:small;line-height:1.5;font-family:Arial,=
Helvetica,sans-serif"><div dir=3D"ltr"><div id=3D"gmail-m_20562887934909589=
52gmail-c0" style=3D"margin-bottom:2em;color:rgb(0,0,0);font-family:Verdana=
,sans-serif"><pre id=3D"gmail-m_2056288793490958952gmail-comment_text_0" st=
yle=3D"white-space:pre-wrap;font-size:medium;width:50em">While porting anot=
her project to Dunfell, I found it necessary to update openocd.  The change=
s have already been applied to master.


See:
 * <a href=3D"https://www.mail-archive.com/openembedded-devel@lists.openemb=
edded.org/msg70813.html" target=3D"_blank" style=3D"color:rgb(0,51,153)">ht=
tps://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg708=
13.html</a>
 * <a href=3D"http://git.openembedded.org/meta-openembedded/commit/?id=3D0a=
27b0840f57d64cab091c9a0681582832d72c2d" target=3D"_blank" style=3D"color:rg=
b(0,51,153)">http://git.openembedded.org/meta-openembedded/commit/?id=3D0a2=
7b0840f57d64cab091c9a0681582832d72c2d</a>
 * <a href=3D"http://git.openembedded.org/meta-openembedded/commit/?id=3D64=
bc3a36e4a36f16596c2f6e83998c8dccd717a6" target=3D"_blank" style=3D"color:rg=
b(0,51,153)">http://git.openembedded.org/meta-openembedded/commit/?id=3D64b=
c3a36e4a36f16596c2f6e83998c8dccd717a6</a>


I believe the patch below incorporates all of the relevant changes from the=
 above commits to a single patch:
```
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-s=
yscrtl.h-with-glibc.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-D=
o-not-include-syscrtl.h-with-glibc.patch
deleted file mode 100644
index 618ce2689..000000000
--- a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.=
h-with-glibc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a763610719e7d7f6cdc45569b6fbfdb91bb7c87b Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
 style=3D"color:rgb(0,51,153)">raj.khem@gmail.com</a>&gt;
-Date: Sat, 27 Jul 2019 14:30:08 -0700
-Subject: [PATCH] Do not include syscrtl.h with glibc
-
-glibc 2.30 has deprecated it see [1]
-Fixes
-sys/sysctl.h:21:2: error: &quot;The &lt;sys/sysctl.h&gt; header is depreca=
ted and will be removed.&quot; [-Werror,-W#warnings]
-
-[1] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D74=
4e829637162bb7d5029632aacf341c64b86990" target=3D"_blank" style=3D"color:rg=
b(0,51,153)">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D744e8=
29637162bb7d5029632aacf341c64b86990</a>
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank" style=3D"color:rgb(0,51,153)">raj.khem@gmail.com</a>&gt;
----
- src/helper/options.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/helper/options.c b/src/helper/options.c
-index 12755e010..4007e37f6 100644
---- a/src/helper/options.c
-+++ b/src/helper/options.c
-@@ -34,7 +34,7 @@
- #if IS_DARWIN
- #include &lt;libproc.h&gt;
- #endif
--#ifdef HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) &amp;&amp; !defined(__GLIBC__)
- #include &lt;sys/sysctl.h&gt;
- #endif
- #if IS_WIN32 &amp;&amp; !IS_CYGWIN
---
-2.22.0
-
diff --git a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git=
.bb/" target=3D"_blank">openocd_git.bb</a> b/meta-oe/recipes-devtools/openo=
cd/<a href=3D"http://openocd_git.bb/" target=3D"_blank">openocd_git.bb</a>
index e95f1cfa5..05e06a25d 100644
--- a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.bb/" t=
arget=3D"_blank">openocd_git.bb</a>
+++ b/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.bb/" t=
arget=3D"_blank">openocd_git.bb</a>
@@ -9,14 +9,13 @@ SRC_URI =3D &quot; \
     git://<a href=3D"http://repo.or.cz/r/git2cl.git;protocol=3Dhttp;destsu=
ffix=3Dtools/git2cl;name=3Dgit2cl" target=3D"_blank">repo.or.cz/r/git2cl.gi=
t;protocol=3Dhttp;destsuffix=3Dtools/git2cl;name=3Dgit2cl</a> \
     git://<a href=3D"http://repo.or.cz/r/jimtcl.git;protocol=3Dhttp;destsu=
ffix=3Dgit/jimtcl;name=3Djimtcl" target=3D"_blank">repo.or.cz/r/jimtcl.git;=
protocol=3Dhttp;destsuffix=3Dgit/jimtcl;name=3Djimtcl</a> \
     git://<a href=3D"http://repo.or.cz/r/libjaylink.git;protocol=3Dhttp;de=
stsuffix=3Dgit/src/jtag/drivers/libjaylink;name=3Dlibjaylink" target=3D"_bl=
ank">repo.or.cz/r/libjaylink.git;protocol=3Dhttp;destsuffix=3Dgit/src/jtag/=
drivers/libjaylink;name=3Dlibjaylink</a> \
-    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
 &quot;

 SRCREV_FORMAT =3D &quot;openocd&quot;
-SRCREV_openocd =3D &quot;ded67990255cc1e63c77832ffd6e6bef9120873d&quot;
+SRCREV_openocd =3D &quot;d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3&quot;
 SRCREV_git2cl =3D &quot;8373c9f74993e218a08819cbcdbab3f3564bbeba&quot;
-SRCREV_jimtcl =3D &quot;dc4ba7770d580800634f90b67a24e077b4a26d98&quot;
-SRCREV_libjaylink =3D &quot;cfccbc9d6763733f1d14dff3c2dc5b75aaef136b&quot;
+SRCREV_jimtcl =3D &quot;0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6&quot;
+SRCREV_libjaylink =3D &quot;9aa7a5957c07bb6e862fc1a6d3153d109c7407e4&quot;

 PV =3D &quot;0.10+gitr${SRCPV}&quot;
 S =3D &quot;${WORKDIR}/git&quot;
@@ -55,3 +54,6 @@ FILES_${PN} =3D &quot; \
 PACKAGECONFIG[sysfsgpio] =3D &quot;--enable-sysfsgpio,--disable-sysfsgpio&=
quot;
 PACKAGECONFIG[remote-bitbang] =3D &quot;--enable-remote-bitbang,--disable-=
remote-bitbang&quot;
 PACKAGECONFIG ??=3D &quot;sysfsgpio remote-bitbang&quot;
+
+# Can&#39;t be built with ccache
+CCACHE_DISABLE =3D &quot;1&quot;
```</pre></div></div></div></div></div></div></div>

--000000000000f3cb9b05bdd8e388--
