Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B64C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 19:41:32 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web09.2126.1664826086727090965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 12:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=coZVNDTs;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso6894336fac.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=443TB5eRvZAAfw5PW+LJ5C3lNf6/JGo94vFZzldmHkU=;
        b=coZVNDTsWZCH1jiX8E+7D9rEK8vcAzCTyj+FrgQLT4+LI/DIhg1qlZXKBBCpS5+Xyx
         BG2mgVnZmJZ+VJcsTp/jqZU/esA5pM24hWaBwTxCsKtlIOYCpeNEvAcG8Qk/ui2mcKdJ
         ul/nXUzDw20JsPyiJY5JKRp3U22T7mttTt5NcTYsIHBG5OLxoLLLyZOe2AGTfT42OjXp
         GSF36d+NKA512Utoy1gMOSvjUceHZ0u+TgySPI3fF2qWbzj6HsKswDRVgjCEwbI06zvL
         CKGZGrfhSbTIImRAq5be3o3MhEIfQmlEGsaJVawmvGp8SbVmS7oBrIkXrmyqPaGoQvMW
         dg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=443TB5eRvZAAfw5PW+LJ5C3lNf6/JGo94vFZzldmHkU=;
        b=O4FPyANkdlf//CSsn+eDjX5oeZXz0kPEd9bpwWS/zu7HRhbvhfP2MF2cjJv4puStoF
         dTcv2k1bJX0uvqAXk1bSpHs+5kRe0aWRl9ysIuES9fV0y/VF8kFTeD8PlJ3W3+I5MZ0X
         pscJYA9ko/8TzzIZGyjflgvtZSr7VroXuOhuWqYbUWHdUA1s24rRV0mEzbUvQksnAm/a
         1uDzBRABFfMU4J3wONObgbIQlAEalePJxTG8nAkZYHJ32Z0wzlN4qkMQVn9w7BjJVB0j
         VaAVnNdqh7kCcfI5S3oedvALA8ij4WihB7Fg9wjbJoB/Ao4s+qr0Ipe4OunX7h61IRen
         4FMw==
X-Gm-Message-State: ACrzQf3nKrFB6jIeqn0/44UbGLr/9MUZ86/TH9naBQ63fcCL2TudDZx6
	Tqxb5Br2XBdPUzqTM9Xvi1iOkhzSAdNKUYvgMVZJk06tA+c=
X-Google-Smtp-Source: 
 AMsMyM4D1+BFsrfjZKvZzmNqYkSk8itrSiMXk1FPlyUZB2GbvmWNqXHfg/NBH0Ir9fAr0wcsv9YS8GsOnfj3NcWCJaA=
X-Received: by 2002:a05:6870:d1c8:b0:132:1239:2550 with SMTP id
 b8-20020a056870d1c800b0013212392550mr6084567oac.55.1664826085771; Mon, 03 Oct
 2022 12:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221003062716.3759210-1-narpat.mali@windriver.com>
 <CAMKF1srgHEyVMQUr6VPMjhk5cKN_7CmSacwWpFRkmBuvK6muoA@mail.gmail.com>
 <DM4PR11MB55509038ED491A594997F441E45B9@DM4PR11MB5550.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM4PR11MB55509038ED491A594997F441E45B9@DM4PR11MB5550.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Oct 2022 12:41:14 -0700
Message-ID: 
 <CAMKF1spoYEUkoa3W72PG1pkaB31zDYoH0cajaZGkE0hpA-0tKA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5.9.1 ->
 5.9.3
To: "Mali, Narpat" <Narpat.Mali@windriver.com>
Cc: "G Pillai, Hari" <Hari.GPillai@windriver.com>,
	"Polampalli, Archana" <Archana.Polampalli@windriver.com>,
	"Urade, Yogita" <Yogita.Urade@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000748e3905ea2687b4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Oct 2022 19:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99044

--000000000000748e3905ea2687b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok it will be good to add [kirkstone] in subject
So folks know where intend it for

On Mon, Oct 3, 2022 at 10:12 AM Mali, Narpat <Narpat.Mali@windriver.com>
wrote:

> Hi Khem Raj,
>
>
>
> It is the same commit but, we need this patch commit for =E2=80=9Ckirksto=
ne=E2=80=9D
> branch of meta-openembedded.
>
> We observed that the =E2=80=9Cmaster=E2=80=9D branch has =E2=80=9Cnet-snm=
p 5.9.3=E2=80=9D version at
> https://git.openembedded.org/meta-openembedded/tree/meta-networking/recip=
es-protocols/net-snmp
> and the =E2=80=9Ckirkstone=E2=80=9D branch has =E2=80=9Cnet-snmp 5.9.1=E2=
=80=9D at
> https://git.openembedded.org/meta-openembedded/tree/meta-networking/recip=
es-protocols/net-snmp?h=3Dkirkstone
>
>
>
> Since, our product is using =E2=80=9Ckirkstone=E2=80=9D branch of meta-op=
enembedded so,
> CVE-2022-24805 to CVE-2022-24810 are vulnerable for our product.
>
> Could you please let us know, How to get net-snmp upgraded to 5.9.3
> version in =E2=80=9Ckirkstone=E2=80=9D branch ?
>
>
>
> Best Regards,
>
> Narpat Mali
>
>
>
> Sent from Mail <https://go.microsoft.com/fwlink/?LinkId=3D550986> for
> Windows
>
>
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Monday, October 3, 2022 12:29:18 PM
> *To:* Mali, Narpat <Narpat.Mali@windriver.com>
> *Cc:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>; Polampalli, Archana <
> Archana.Polampalli@windriver.com>; Urade, Yogita <
> Yogita.Urade@windriver.com>; G Pillai, Hari <Hari.GPillai@windriver.com>
> *Subject:* Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade
> 5.9.1 -> 5.9.3
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> how different is this from
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Dbf4a826c7de51=
dcdac87f81fa2bd2301629d50db
>
> On Sun, Oct 2, 2022 at 11:27 PM Narpat Mali <narpat.mali@windriver.com>
> wrote:
> >
> > Issue: LIN1022-1131, LIN1022-1132, LIN1022-1133, LIN1022-1134,
> LIN1022-1135
> > Issue: LIN1022-1136
> >
> > Upgrade summary:
> > ----------------
> > - drop 0002-configure-fix-a-cc-check-issue.patch, as it was replaced wi=
th
> >   upstream commit
> https://github.com/net-snmp/net-snmp/commit/dbb49acfa2af
> > - drop 0001-snmpd-always-exit-after-displaying-usage.patch backport
> > - rebase net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch manually
> > - refresh patches with devtool to get rid of fuzz
> >
> > Changelog:
> > ----------
> > *5.9.3*:
> > security:
> >   - These two CVEs can be exploited by a user with read-only credential=
s:
> >       - CVE-2022-24805 A buffer overflow in the handling of the INDEX o=
f
> >         NET-SNMP-VACM-MIB can cause an out-of-bounds memory access.
> >       - CVE-2022-24809 A malformed OID in a GET-NEXT to the
> nsVacmAccessTable
> >         can cause a NULL pointer dereference.
> >   - These CVEs can be exploited by a user with read-write credentials:
> >       - CVE-2022-24806 Improper Input Validation when SETing malformed
> >         OIDs in master agent and subagent simultaneously
> >       - CVE-2022-24807 A malformed OID in a SET request to
> >         SNMP-VIEW-BASED-ACM-MIB::vacmAccessTable can cause an
> >         out-of-bounds memory access.
> >       - CVE-2022-24808 A malformed OID in a SET request to
> >         NET-SNMP-AGENT-MIB::nsLogTable can cause a NULL pointer
> dereference
> >       - CVE-2022-24810 A malformed OID in a SET to the nsVacmAccessTabl=
e
> >         can cause a NULL pointer dereference.
> >   - To avoid these flaws, use strong SNMPv3 credentials and do not shar=
e
> them.
> >     If you must use SNMPv1 or SNMPv2c, use a complex community string
> >     and enhance the protection by restricting access to a given IP
> address
> >     range.
> >   - Thanks are due to Yu Zhang of VARAS@IIE and Nanyu Zhong of VARAS@II=
E
> for
> >     reporting the following CVEs that have been fixed in this release,
> and
> >     to Arista Networks for providing fixes.
> >
> > Windows:
> >   - WinExtDLL: Fix multiple compiler warnings
> >   - WinExtDLL: Make long strings occupy a single line Make it easier to
> >     look up error messages in the source code by making long strings
> >     occupy a single source code line.
> >   - WinExtDLL: Restore MIB-II support Make winExtDLL work on 64-bit
> >     Windows systems") caused snmpd to skip MIB-II on 64-bit systems.
> >
> > IF-MIB: Update ifTable entries even if the interface name has changed
> >     At least on Linux a network interface index may be reused for a
> >     network interface with a different name. Hence this patch that
> >     enables replacing network interface information even if the network
> >     interface name has changed.
> >
> > unspecified:
> >   - Moved transport code into a separate subdirectory in snmplib
> >   - Snmplib: remove inline versions of container funcs".
> >
> > misc:
> >   - snmp-create-v3-user: Fix the snmpd.conf path   @datadir@ is
> >     expanded in ${datarootdir} so datarootdir must be set before
> >     @datadir@ is used.
> >
> > *5.9.2*:
> > skipped due to a last minute library versioning found bug -- use 5.9.3
> instead
> >
> > (master rev: bf4a826c7de51dcdac87f81fa2bd2301629d50db) -- backport
> >
> > Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> > ---
> >  ...ath.m4-keep-consistent-between-32bit.patch |  8 ++-
> >  .../0001-config_os_headers-Error-Fix.patch    |  4 +-
> >  ...1-get_pid_from_inode-Include-limit.h.patch |  6 +-
> >  ...d-always-exit-after-displaying-usage.patch | 55 -------------------
> >  ....c-Don-t-check-for-return-from-EVP_M.patch |  4 +-
> >  .../0002-configure-fix-a-cc-check-issue.patch | 28 ----------
> >  ...004-configure-fix-incorrect-variable.patch |  6 +-
> >  .../net-snmp/fix-libtool-finish.patch         |  6 +-
> >  ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 22 ++++----
> >  ...add-knob-whether-nlist.h-are-checked.patch |  4 +-
> >  .../net-snmp-fix-for-disable-des.patch        |  4 +-
> >  ...ting-add-the-output-format-for-ptest.patch |  2 +-
> >  .../reproducibility-have-printcap.patch       |  4 +-
> >  .../{net-snmp_5.9.1.bb =3D> net-snmp_5.9.3.bb}  |  4 +-
> >  14 files changed, 37 insertions(+), 120 deletions(-)
> >  delete mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exi=
t-after-displaying-usage.patch
> >  delete mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-=
cc-check-issue.patch
> >  rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.1.bb
> =3D> net-snmp_5.9.3.bb} (98%)
> >
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_=
path.m4-keep-consistent-between-32bit.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_=
path.m4-keep-consistent-between-32bit.patch
> > index 4cd729044..ed2ebc6d7 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_=
path.m4-keep-consistent-between-32bit.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_=
path.m4-keep-consistent-between-32bit.patch
> > @@ -1,7 +1,8 @@
> > -From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 2001
> > +From 98c62e24fdd05d7e8bd8149840bad8eb0feb3fb1 Mon Sep 17 00:00:00 2001
> >  From: Mingli Yu <mingli.yu@windriver.com>
> >  Date: Fri, 29 Jan 2021 08:49:15 +0000
> > -Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit
> and 64bit
> > +Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit
> and
> > + 64bit
> >
> >  With configure option "--with-openssl=3D${STAGING_EXECPREFIXDIR}", it
> behaves
> >  differently between 32bit and 64bit system as the openssl lib resides
> under
> > @@ -15,12 +16,13 @@ So add the patch to fix the gap between 32bit and
> 64bit system.
> >  Upstream-Status: Inappropriate [configuration specific]
> >
> >  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > +
> >  ---
> >   m4/ac_add_search_path.m4 | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4
> > -index 8e0a819..961f587 100644
> > +index 8e0a819..e9585bc 100644
> >  --- a/m4/ac_add_search_path.m4
> >  +++ b/m4/ac_add_search_path.m4
> >  @@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS variabl=
es
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_head=
ers-Error-Fix.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_head=
ers-Error-Fix.patch
> > index 05a47f61c..f8a52a63f 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_head=
ers-Error-Fix.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_head=
ers-Error-Fix.patch
> > @@ -1,4 +1,4 @@
> > -From 69d4c517c07f55c505090e48d96ace8cd599fb26 Mon Sep 17 00:00:00 2001
> > +From e86d5fd52f19b85da0b7cce660c6e65ec4c0f9bb Mon Sep 17 00:00:00 2001
> >  From: Li xin <lixin.fnst@cn.fujitsu.com>
> >  Date: Fri, 21 Aug 2015 18:23:13 +0900
> >  Subject: [PATCH] config_os_headers: Error Fix
> > @@ -19,7 +19,7 @@ Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/configure.d/config_os_headers
> b/configure.d/config_os_headers
> > -index f07d512..2363b42 100644
> > +index 01c3376..6edd85f 100644
> >  --- a/configure.d/config_os_headers
> >  +++ b/configure.d/config_os_headers
> >  @@ -395,8 +395,8 @@ then
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_i=
node-Include-limit.h.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_i=
node-Include-limit.h.patch
> > index 22e591556..a7881a871 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_i=
node-Include-limit.h.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_i=
node-Include-limit.h.patch
> > @@ -1,4 +1,4 @@
> > -From 2bf1bbe1d428ed06d57aa76b03e394b72ff2216d Mon Sep 17 00:00:00 2001
> > +From 8097734b27fd146f358a4edd0d1a0d28309bd9a4 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 22 Jul 2016 18:34:39 +0000
> >  Subject: [PATCH] get_pid_from_inode: Include limit.h
> > @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/agent/mibgroup/util_funcs/get_pid_from_inode.c
> b/agent/mibgroup/util_funcs/get_pid_from_inode.c
> > -index aee907d..7abaec2 100644
> > +index 5788e1d..ea380a6 100644
> >  --- a/agent/mibgroup/util_funcs/get_pid_from_inode.c
> >  +++ b/agent/mibgroup/util_funcs/get_pid_from_inode.c
> >  @@ -6,6 +6,7 @@
> > @@ -23,5 +23,5 @@ index aee907d..7abaec2 100644
> >   #include <ctype.h>
> >  +#include <limits.h>
> >   #include <stdio.h>
> > - #if HAVE_STDLIB_H
> > + #ifdef HAVE_STDLIB_H
> >   #include <stdlib.h>
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-e=
xit-after-displaying-usage.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-e=
xit-after-displaying-usage.patch
> > deleted file mode 100644
> > index 4fc9e54b4..000000000
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-e=
xit-after-displaying-usage.patch
> > +++ /dev/null
> > @@ -1,55 +0,0 @@
> > -From 94ca941e06bef157bf0e13251f8ca1471daa9393 Mon Sep 17 00:00:00 2001
> > -From: Kaarle Ritvanen <kaarle.ritvanen@datakunkku.fi>
> > -Date: Fri, 27 Aug 2021 14:21:45 +0300
> > -Subject: [PATCH] snmpd: always exit after displaying usage
> > -
> > -Currently, viewing the help text with -h results in snmpd being starte=
d
> > -in the background, whereas this does not happen with --help. Similarly=
,
> > -when an error is detected in command line syntax, the help text is
> > -displayed but sometimes snmpd gets started anyway, depending on the
> > -execution path.
> > -
> > -This patch makes snmpd consistently terminate whenever the usage
> > -function gets called. It also removes the goto statements no longer
> > -needed.
> > -
> > -Upstream-Status: Backport
> > -[
> https://github.com/net-snmp/net-snmp/commit/94ca941e06bef157bf0e13251f8ca=
1471daa9393
> ]
> > -
> > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ----
> > - agent/snmpd.c | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/agent/snmpd.c b/agent/snmpd.c
> > -index f5aab0af8..90de12d99 100644
> > ---- a/agent/snmpd.c
> > -+++ b/agent/snmpd.c
> > -@@ -289,6 +289,8 @@ usage(char *prog)
> > -            "  -S d|i|0-7\t\tuse -Ls <facility> instead\n"
> > -            "\n"
> > -            );
> > -+    SOCK_CLEANUP;
> > -+    exit(1);
> > - }
> > -
> > - static void
> > -@@ -494,7 +496,6 @@ main(int argc, char *argv[])
> > -         case '-':
> > -             if (strcasecmp(optarg, "help") =3D=3D 0) {
> > -                 usage(argv[0]);
> > --                goto out;
> > -             }
> > -             if (strcasecmp(optarg, "version") =3D=3D 0) {
> > -                 version();
> > -@@ -783,7 +784,6 @@ main(int argc, char *argv[])
> > -             fprintf(stderr, "%s: Illegal argument -X:"
> > -                           "AgentX support not compiled in.\n",
> argv[0]);
> > -             usage(argv[0]);
> > --            goto out;
> > - #endif
> > -             break;
> > -
> > ---
> > -2.25.1
> > -
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytoo=
ls.c-Don-t-check-for-return-from-EVP_M.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytoo=
ls.c-Don-t-check-for-return-from-EVP_M.patch
> > index 42352a6b0..af6334f72 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytoo=
ls.c-Don-t-check-for-return-from-EVP_M.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytoo=
ls.c-Don-t-check-for-return-from-EVP_M.patch
> > @@ -1,4 +1,4 @@
> > -From f3ff99736b8cccbba77349b0d10a3cee366a4c87 Mon Sep 17 00:00:00 2001
> > +From f4e1acd4f509dd26cf88da872bd5adcf884f4a5f Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 18 Sep 2015 00:28:45 -0400
> >  Subject: [PATCH] snmplib/keytools.c: Don't check for return from
> > @@ -17,7 +17,7 @@ Signed-off-by: Ovidiu Panait <
> ovidiu.panait@windriver.com>
> >   1 file changed, 1 insertion(+), 4 deletions(-)
> >
> >  diff --git a/snmplib/keytools.c b/snmplib/keytools.c
> > -index 129a7c0..2fc1efc 100644
> > +index 14a452a..fb1694b 100644
> >  --- a/snmplib/keytools.c
> >  +++ b/snmplib/keytools.c
> >  @@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int
> hashtype_len,
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-=
a-cc-check-issue.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-=
a-cc-check-issue.patch
> > deleted file mode 100644
> > index c973bde72..000000000
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-=
a-cc-check-issue.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From 0a02ac779c51a2b4af3b58cb96967bf3eff80367 Mon Sep 17 00:00:00 2001
> > -From: Wenlin Kang <wenlin.kang@windriver.com>
> > -Date: Wed, 24 May 2017 16:45:34 +0800
> > -Subject: [PATCH] configure: fix a cc check issue.
> > -
> > -When has "." in cc value, the expression
> > -$myperl -V:cc | $myperl -n -e 'print if
> (s/^\s*cc=3D.([-=3D\w\s\/]+).;\s*/$1/);'
> > -can't get corretly the cc's value.
> > -
> > -Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> > -
> > ----
> > - configure.d/config_project_perl_python | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/configure.d/config_project_perl_python
> b/configure.d/config_project_perl_python
> > -index 475c843..22d2ad3 100644
> > ---- a/configure.d/config_project_perl_python
> > -+++ b/configure.d/config_project_perl_python
> > -@@ -87,7 +87,7 @@ if test "x$install_perl" !=3D "xno" ; then
> > -     if test "x$enable_perl_cc_checks" !=3D "xno" ; then
> > -         AC_MSG_CHECKING([for Perl cc])
> > -         changequote(, )
> > --        PERLCC=3D`$myperl -V:cc | $myperl -n -e 'print if
> (s/^\s*cc=3D.([-=3D\w\s\/]+).;\s*/$1/);'`
> > -+        PERLCC=3D`$myperl -V:cc | $myperl -n -e 'print if
> (s/^\s*cc=3D.([-=3D\.\w\s\/]+).;\s*/$1/);'`
> > -         changequote([, ])
> > -         if test "x$PERLCC" !=3D "x" ; then
> > -             AC_MSG_RESULT([$PERLCC])
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-=
incorrect-variable.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-=
incorrect-variable.patch
> > index bfddc63dd..6e224188a 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-=
incorrect-variable.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-=
incorrect-variable.patch
> > @@ -1,4 +1,4 @@
> > -From 011bdcd07f2a289d0cfc1b411c03c0cc7c42dad1 Mon Sep 17 00:00:00 2001
> > +From 6d655ba677563ac9d62d4d8eee59fdb39d486c02 Mon Sep 17 00:00:00 2001
> >  From: Wenlin Kang <wenlin.kang@windriver.com>
> >  Date: Wed, 24 May 2017 17:10:20 +0800
> >  Subject: [PATCH] configure: fix incorrect variable
> > @@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang <
> wenlin.kang@windriver.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/Makefile.in b/Makefile.in
> > -index 912f6b2..a53d1b2 100644
> > +index f1cbbf5..1545be3 100644
> >  --- a/Makefile.in
> >  +++ b/Makefile.in
> > -@@ -174,7 +174,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@
> cleanfeatures perlcleanfeatures pyt
> > +@@ -173,7 +173,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@
> cleanfeatures perlcleanfeatures pyt
> >   #
> >   # override LD_RUN_PATH to avoid dependencies on the build directory
> >   perlmodules: perlmakefiles subdirs
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.=
patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.=
patch
> > index 26dd014ce..409c1e03c 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.=
patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.=
patch
> > @@ -1,4 +1,4 @@
> > -From 27444fbf8323679ea0551a3bd5f04c365143d8c0 Mon Sep 17 00:00:00 2001
> > +From ab1d77c52e84746e75506a2870783806bc77f396 Mon Sep 17 00:00:00 2001
> >  From: "Roy.Li" <rongqing.li@windriver.com>
> >  Date: Fri, 16 Jan 2015 14:14:01 +0800
> >  Subject: [PATCH] net-snmp: fix "libtool --finish"
> > @@ -20,11 +20,11 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/Makefile.top b/Makefile.top
> > -index 6315401..fc0ee06 100644
> > +index a962c54..1ba5607 100644
> >  --- a/Makefile.top
> >  +++ b/Makefile.top
> >  @@ -89,7 +89,7 @@ LIBREVISION =3D 0
> > - LIB_LD_CMD      =3D $(LIBTOOL) --mode=3Dlink $(LINKCC) $(CFLAGS) -rpa=
th
> $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) -o
> > + LIB_LD_CMD      =3D $(LIBTOOL) --mode=3Dlink $(LINKCC) $(CFLAGS) -rpa=
th
> $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE)
> @LD_NO_UNDEFINED@ -o
> >   LIB_EXTENSION   =3D la
> >   LIB_VERSION     =3D
> >  -LIB_LDCONFIG_CMD =3D $(LIBTOOL) --mode=3Dfinish $(INSTALL_PREFIX)$(li=
bdir)
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-=
engineBoots-value-on-SIGHUP.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-=
engineBoots-value-on-SIGHUP.patch
> > index 022eb958f..87f192e5b 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-=
engineBoots-value-on-SIGHUP.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-=
engineBoots-value-on-SIGHUP.patch
> > @@ -1,4 +1,4 @@
> > -From 1e3178835217ba89aa355e2b6b88e490f17be16d Mon Sep 17 00:00:00 2001
> > +From 5ad4eab43c1ea63ff343bba64d576440e8783e75 Mon Sep 17 00:00:00 2001
> >  From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> >  Date: Wed, 9 Jun 2021 15:47:30 +0900
> >  Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
> > @@ -7,6 +7,7 @@ Upstream-Status: Pending
> >
> >  Signed-off-by: Marian Florea <marian.florea@windriver.com>
> >  Signed-off-by: Li Zhou <li.zhou@windriver.com>
> > +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> >
> >  ---
> >   agent/snmpd.c    | 1 +
> > @@ -14,19 +15,18 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >   2 files changed, 3 insertions(+), 2 deletions(-)
> >
> >  diff --git a/agent/snmpd.c b/agent/snmpd.c
> > -index 1af439f..355b510 100644
> > +index 90de12d..1ccc4db 100644
> >  --- a/agent/snmpd.c
> >  +++ b/agent/snmpd.c
> > -@@ -1208,6 +1208,7 @@ receive(void)
> > -           snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
> > -                    netsnmp_get_version());
> > -             update_config();
> > -+          snmp_store(app_name);
> > -             send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
> > - #if HAVE_SIGPROCMASK
> > -             ret =3D sigprocmask(SIG_UNBLOCK, &set, NULL);
> > +     snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
> > +              netsnmp_get_version());
> > +     update_config();
> > ++    snmp_store(app_name);
> > +     send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
> > + #ifdef HAVE_SIGPROCMASK
> > +     ret =3D sigprocmask(SIG_UNBLOCK, &set, NULL);
> >  diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
> > -index 29c2a0f..ada961c 100644
> > +index 7b1746b..4a17e0d 100644
> >  --- a/snmplib/snmpv3.c
> >  +++ b/snmplib/snmpv3.c
> >  @@ -1059,9 +1059,9 @@ init_snmpv3_post_config(int majorid, int minorid=
,
> void *serverarg,
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-w=
hether-nlist.h-are-checked.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-w=
hether-nlist.h-are-checked.patch
> > index f1ebe2bb6..c5a453abe 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-w=
hether-nlist.h-are-checked.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-w=
hether-nlist.h-are-checked.patch
> > @@ -1,4 +1,4 @@
> > -From e507dcf8b29c55011f85d88bf05400d4717e4074 Mon Sep 17 00:00:00 2001
> > +From ad65b106d3cb3c6e595381be1c45a73c1ef6eb5e Mon Sep 17 00:00:00 2001
> >  From: Chong Lu <Chong.Lu@windriver.com>
> >  Date: Thu, 28 May 2020 09:46:34 -0500
> >  Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
> > @@ -15,7 +15,7 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >   1 file changed, 2 insertions(+)
> >
> >  diff --git a/configure.d/config_os_headers
> b/configure.d/config_os_headers
> > -index 76ef58a..f07d512 100644
> > +index b9c8c31..01c3376 100644
> >  --- a/configure.d/config_os_headers
> >  +++ b/configure.d/config_os_headers
> >  @@ -37,6 +37,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h
> ] dnl
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-di=
sable-des.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-di=
sable-des.patch
> > index 2941a3609..c382c02d8 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-di=
sable-des.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-di=
sable-des.patch
> > @@ -1,4 +1,4 @@
> > -From 3ca4335ec1d6b7b384c134fc85d7a9e513c68376 Mon Sep 17 00:00:00 2001
> > +From b1b9980853b1083f0c8b9f628f8b4c3a484d4f91 Mon Sep 17 00:00:00 2001
> >  From: Jackie Huang <jackie.huang@windriver.com>
> >  Date: Thu, 22 Jun 2017 10:25:08 +0800
> >  Subject: [PATCH] net-snmp: fix for --disable-des
> > @@ -15,7 +15,7 @@ Signed-off-by: Jackie Huang <
> jackie.huang@windriver.com>
> >   1 file changed, 2 insertions(+)
> >
> >  diff --git a/snmplib/scapi.c b/snmplib/scapi.c
> > -index 00c9174..c6875e1 100644
> > +index 54fdd5c..0f7e931 100644
> >  --- a/snmplib/scapi.c
> >  +++ b/snmplib/scapi.c
> >  @@ -85,7 +85,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support);
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-ad=
d-the-output-format-for-ptest.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-ad=
d-the-output-format-for-ptest.patch
> > index 807983f61..09ca532a7 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-ad=
d-the-output-format-for-ptest.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-ad=
d-the-output-format-for-ptest.patch
> > @@ -1,4 +1,4 @@
> > -From 972df16e9599dffddf5d714a4cbf43008c771122 Mon Sep 17 00:00:00 2001
> > +From 36a5656db7ea75dd15f35a6c1728937c6e2b901c Mon Sep 17 00:00:00 2001
> >  From: Jackie Huang <jackie.huang@windriver.com>
> >  Date: Wed, 14 Jan 2015 15:10:06 +0800
> >  Subject: [PATCH] testing: add the output format for ptest
> > diff --git
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-hav=
e-printcap.patch
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-hav=
e-printcap.patch
> > index bf1e7bedf..c0b51c51e 100644
> > ---
> a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-hav=
e-printcap.patch
> > +++
> b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-hav=
e-printcap.patch
> > @@ -1,4 +1,4 @@
> > -From 84e362fe97f50fbad69f083bc2d8fe18f83eb2f7 Mon Sep 17 00:00:00 2001
> > +From b923cd38e2503b86aedf66b767fd7f51c9f25645 Mon Sep 17 00:00:00 2001
> >  From: "douglas.royds" <douglas.royds@taitradio.com>
> >  Date: Wed, 21 Nov 2018 13:52:18 +1300
> >  Subject: [PATCH] net-snmp: Reproducibility: Don't check build host for
> > @@ -13,7 +13,7 @@ set in the environment to "yes" or "no" as appropriat=
e
> for the target platform.
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/configure.d/config_os_misc4 b/configure.d/config_os_misc4
> > -index 6f23c8e..8cea75a 100644
> > +index b6864d9..07ca922 100644
> >  --- a/configure.d/config_os_misc4
> >  +++ b/configure.d/config_os_misc4
> >  @@ -99,9 +99,9 @@ if test x$LPSTAT_PATH !=3D x; then
> > diff --git a/meta-networking/recipes-protocols/net-snmp/
> net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/
> net-snmp_5.9.3.bb
> > similarity index 98%
> > rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.b=
b
> > rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
> > index 30c0ce74c..7af514756 100644
> > --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
> > +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
> > @@ -21,15 +21,13 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
> >             file://0001-config_os_headers-Error-Fix.patch \
> >
> file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
> >             file://0001-get_pid_from_inode-Include-limit.h.patch \
> > -           file://0002-configure-fix-a-cc-check-issue.patch \
> >             file://0004-configure-fix-incorrect-variable.patch \
> >             file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
> \
> >             file://net-snmp-fix-for-disable-des.patch \
> >             file://reproducibility-have-printcap.patch \
> >
> file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
> > -           file://0001-snmpd-always-exit-after-displaying-usage.patch =
\
> >             "
> > -SRC_URI[sha256sum] =3D
> "eb7fd4a44de6cddbffd9a92a85ad1309e5c1054fb9d5a7dd93079c8953f48c3f"
> > +SRC_URI[sha256sum] =3D
> "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
> >
> >  UPSTREAM_CHECK_URI =3D "
> https://sourceforge.net/projects/net-snmp/files/net-snmp/"
> >  UPSTREAM_CHECK_REGEX =3D "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#99037):
> https://lists.openembedded.org/g/openembedded-devel/message/99037
> > Mute This Topic: https://lists.openembedded.org/mt/94085410/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000748e3905ea2687b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok it will be good to add [kirkstone] in subject</div><di=
v dir=3D"auto">So folks know where intend it for=C2=A0</div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3, 2=
022 at 10:12 AM Mali, Narpat &lt;<a href=3D"mailto:Narpat.Mali@windriver.co=
m">Narpat.Mali@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">





<div lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:brea=
k-word">
<div class=3D"m_-932456720383352559WordSection1">
<p class=3D"MsoNormal">Hi Khem Raj,</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">It is the same commit but, we need this patch commit=
 for =E2=80=9Ckirkstone=E2=80=9D branch of meta-openembedded.</p>
<p class=3D"MsoNormal">We observed that the =E2=80=9Cmaster=E2=80=9D branch=
 has =E2=80=9Cnet-snmp 5.9.3=E2=80=9D version at
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-network=
ing/recipes-protocols/net-snmp" target=3D"_blank">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp</a> and the =E2=80=9Ckirkstone=E2=80=9D branch has =E2=
=80=9Cnet-snmp 5.9.1=E2=80=9D at
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-network=
ing/recipes-protocols/net-snmp?h=3Dkirkstone" target=3D"_blank">
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-protocols/net-snmp?h=3Dkirkstone</a></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Since, our product is using =E2=80=9Ckirkstone=E2=80=
=9D branch of meta-openembedded so, CVE-2022-24805 to CVE-2022-24810 are vu=
lnerable for our product.
<u></u><u></u></p>
<p class=3D"MsoNormal">Could you please let us know, How to get net-snmp up=
graded to 5.9.3 version in =E2=80=9Ckirkstone=E2=80=9D branch ?</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat Mali</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986" target=3D"_blank">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-932456720383352559divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;<br>
<b>Sent:</b> Monday, October 3, 2022 12:29:18 PM<br>
<b>To:</b> Mali, Narpat &lt;<a href=3D"mailto:Narpat.Mali@windriver.com" ta=
rget=3D"_blank">Narpat.Mali@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt;; Polampalli, Archana &lt;<a hre=
f=3D"mailto:Archana.Polampalli@windriver.com" target=3D"_blank">Archana.Pol=
ampalli@windriver.com</a>&gt;; Urade, Yogita &lt;<a href=3D"mailto:Yogita.U=
rade@windriver.com" target=3D"_blank">Yogita.Urade@windriver.com</a>&gt;; G=
 Pillai, Hari &lt;<a href=3D"mailto:Hari.GPillai@windriver.com" target=3D"_=
blank">Hari.GPillai@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5=
.9.1 -&gt; 5.9.3</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>[Please note: This e-mail is from an EXTERNAL e-mail address]</div></s=
pan></font></div></div><div lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" =
style=3D"word-wrap:break-word"><div><font size=3D"2"><span style=3D"font-si=
ze:11pt"><div><br>
<br>
how different is this from<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3Dbf4a=
826c7de51dcdac87f81fa2bd2301629d50db" target=3D"_blank">https://git.openemb=
edded.org/meta-openembedded/commit/?id=3Dbf4a826c7de51dcdac87f81fa2bd230162=
9d50db</a><br>
<br>
On Sun, Oct 2, 2022 at 11:27 PM Narpat Mali &lt;<a href=3D"mailto:narpat.ma=
li@windriver.com" target=3D"_blank">narpat.mali@windriver.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Issue: LIN1022-1131, LIN1022-1132, LIN1022-1133, LIN1022-1134, LIN1022=
-1135<br>
&gt; Issue: LIN1022-1136<br>
&gt;<br>
&gt; Upgrade summary:<br>
&gt; ----------------<br>
&gt; - drop 0002-configure-fix-a-cc-check-issue.patch, as it was replaced w=
ith<br>
&gt;=C2=A0=C2=A0 upstream commit <a href=3D"https://github.com/net-snmp/net=
-snmp/commit/dbb49acfa2af" target=3D"_blank">
https://github.com/net-snmp/net-snmp/commit/dbb49acfa2af</a><br>
&gt; - drop 0001-snmpd-always-exit-after-displaying-usage.patch backport<br=
>
&gt; - rebase net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch manually=
<br>
&gt; - refresh patches with devtool to get rid of fuzz<br>
&gt;<br>
&gt; Changelog:<br>
&gt; ----------<br>
&gt; *5.9.3*:<br>
&gt; security:<br>
&gt;=C2=A0=C2=A0 - These two CVEs can be exploited by a user with read-only=
 credentials:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CVE-2022-24805 A buffer overflow=
 in the handling of the INDEX of<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NET-SNMP-VACM-MIB can =
cause an out-of-bounds memory access.<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CVE-2022-24809 A malformed OID i=
n a GET-NEXT to the nsVacmAccessTable<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can cause a NULL point=
er dereference.<br>
&gt;=C2=A0=C2=A0 - These CVEs can be exploited by a user with read-write cr=
edentials:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CVE-2022-24806 Improper Input Va=
lidation when SETing malformed<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OIDs in master agent a=
nd subagent simultaneously<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CVE-2022-24807 A malformed OID i=
n a SET request to<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SNMP-VIEW-BASED-ACM-MI=
B::vacmAccessTable can cause an<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out-of-bounds memory a=
ccess.<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CVE-2022-24808 A malformed OID i=
n a SET request to<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NET-SNMP-AGENT-MIB::ns=
LogTable can cause a NULL pointer dereference<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - CVE-2022-24810 A malformed OID i=
n a SET to the nsVacmAccessTable<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can cause a NULL point=
er dereference.<br>
&gt;=C2=A0=C2=A0 - To avoid these flaws, use strong SNMPv3 credentials and =
do not share them.<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 If you must use SNMPv1 or SNMPv2c, use a compl=
ex community string<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 and enhance the protection by restricting acce=
ss to a given IP address<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 range.<br>
&gt;=C2=A0=C2=A0 - Thanks are due to Yu Zhang of VARAS@IIE and Nanyu Zhong =
of VARAS@IIE for<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 reporting the following CVEs that have been fi=
xed in this release, and<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 to Arista Networks for providing fixes.<br>
&gt;<br>
&gt; Windows:<br>
&gt;=C2=A0=C2=A0 - WinExtDLL: Fix multiple compiler warnings<br>
&gt;=C2=A0=C2=A0 - WinExtDLL: Make long strings occupy a single line Make i=
t easier to<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 look up error messages in the source code by m=
aking long strings<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 occupy a single source code line.<br>
&gt;=C2=A0=C2=A0 - WinExtDLL: Restore MIB-II support Make winExtDLL work on=
 64-bit<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 Windows systems&quot;) caused snmpd to skip MI=
B-II on 64-bit systems.<br>
&gt;<br>
&gt; IF-MIB: Update ifTable entries even if the interface name has changed<=
br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 At least on Linux a network interface index ma=
y be reused for a<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 network interface with a different name. Hence=
 this patch that<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 enables replacing network interface informatio=
n even if the network<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 interface name has changed.<br>
&gt;<br>
&gt; unspecified:<br>
&gt;=C2=A0=C2=A0 - Moved transport code into a separate subdirectory in snm=
plib<br>
&gt;=C2=A0=C2=A0 - Snmplib: remove inline versions of container funcs&quot;=
.<br>
&gt;<br>
&gt; misc:<br>
&gt;=C2=A0=C2=A0 - snmp-create-v3-user: Fix the snmpd.conf path=C2=A0=C2=A0=
 @datadir@ is<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 expanded in ${datarootdir} so datarootdir must=
 be set before<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 @datadir@ is used.<br>
&gt;<br>
&gt; *5.9.2*:<br>
&gt; skipped due to a last minute library versioning found bug -- use 5.9.3=
 instead<br>
&gt;<br>
&gt; (master rev: bf4a826c7de51dcdac87f81fa2bd2301629d50db) -- backport<br>
&gt;<br>
&gt; Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver=
.com" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ath.m4-keep-consistent-between-32bit.patch |=C2=A0 8 ++-<br>
&gt;=C2=A0 .../0001-config_os_headers-Error-Fix.patch=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +-<br>
&gt;=C2=A0 ...1-get_pid_from_inode-Include-limit.h.patch |=C2=A0 6 +-<br>
&gt;=C2=A0 ...d-always-exit-after-displaying-usage.patch | 55 -------------=
------<br>
&gt;=C2=A0 ....c-Don-t-check-for-return-from-EVP_M.patch |=C2=A0 4 +-<br>
&gt;=C2=A0 .../0002-configure-fix-a-cc-check-issue.patch | 28 ----------<br=
>
&gt;=C2=A0 ...004-configure-fix-incorrect-variable.patch |=C2=A0 6 +-<br>
&gt;=C2=A0 .../net-snmp/fix-libtool-finish.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-<br>
&gt;=C2=A0 ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 22 ++++----<br>
&gt;=C2=A0 ...add-knob-whether-nlist.h-are-checked.patch |=C2=A0 4 +-<br>
&gt;=C2=A0 .../net-snmp-fix-for-disable-des.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 ...ting-add-the-output-format-for-ptest.patch |=C2=A0 2 +-<br>
&gt;=C2=A0 .../reproducibility-have-printcap.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://net-snmp_5.9.1.bb" target=3D"_blank">net-=
snmp_5.9.1.bb</a> =3D&gt; <a href=3D"http://net-snmp_5.9.3.bb" target=3D"_b=
lank">net-snmp_5.9.3.bb</a>}=C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 14 files changed, 37 insertions(+), 120 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-protocols/net-snmp/ne=
t-snmp/0001-snmpd-always-exit-after-displaying-usage.patch<br>
&gt;=C2=A0 delete mode 100644 meta-networking/recipes-protocols/net-snmp/ne=
t-snmp/0002-configure-fix-a-cc-check-issue.patch<br>
&gt;=C2=A0 rename meta-networking/recipes-protocols/net-snmp/{<a href=3D"ht=
tp://net-snmp_5.9.1.bb" target=3D"_blank">net-snmp_5.9.1.bb</a> =3D&gt; <a =
href=3D"http://net-snmp_5.9.3.bb" target=3D"_blank">net-snmp_5.9.3.bb</a>} =
(98%)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
ac_add_search_path.m4-keep-consistent-between-32bit.patch b/meta-networking=
/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consis=
tent-between-32bit.patch<br>
&gt; index 4cd729044..ed2ebc6d7 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_=
search_path.m4-keep-consistent-between-32bit.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_=
search_path.m4-keep-consistent-between-32bit.patch<br>
&gt; @@ -1,7 +1,8 @@<br>
&gt; -From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 98c62e24fdd05d7e8bd8149840bad8eb0feb3fb1 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Jan 2021 08:49:15 +0000<br>
&gt; -Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit=
 and 64bit<br>
&gt; +Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit=
 and<br>
&gt; + 64bit<br>
&gt;<br>
&gt;=C2=A0 With configure option &quot;--with-openssl=3D${STAGING_EXECPREFI=
XDIR}&quot;, it behaves<br>
&gt;=C2=A0 differently between 32bit and 64bit system as the openssl lib re=
sides under<br>
&gt; @@ -15,12 +16,13 @@ So add the patch to fix the gap between 32bit and =
64bit system.<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [configuration specific]<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0=C2=A0 m4/ac_add_search_path.m4 | 4 ++--<br>
&gt;=C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4=
<br>
&gt; -index 8e0a819..961f587 100644<br>
&gt; +index 8e0a819..e9585bc 100644<br>
&gt;=C2=A0 --- a/m4/ac_add_search_path.m4<br>
&gt;=C2=A0 +++ b/m4/ac_add_search_path.m4<br>
&gt;=C2=A0 @@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS v=
ariables<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-s=
nmp/net-snmp/0001-config_os_headers-Error-Fix.patch<br>
&gt; index 05a47f61c..f8a52a63f 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_=
os_headers-Error-Fix.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_=
os_headers-Error-Fix.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 69d4c517c07f55c505090e48d96ace8cd599fb26 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From e86d5fd52f19b85da0b7cce660c6e65ec4c0f9bb Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Li xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" ta=
rget=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 21 Aug 2015 18:23:13 +0900<br>
&gt;=C2=A0 Subject: [PATCH] config_os_headers: Error Fix<br>
&gt; @@ -19,7 +19,7 @@ Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fn=
st@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;=C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/configure.d/config_os_headers b/configure.d/config_=
os_headers<br>
&gt; -index f07d512..2363b42 100644<br>
&gt; +index 01c3376..6edd85f 100644<br>
&gt;=C2=A0 --- a/configure.d/config_os_headers<br>
&gt;=C2=A0 +++ b/configure.d/config_os_headers<br>
&gt;=C2=A0 @@ -395,8 +395,8 @@ then<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
get_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocol=
s/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch<br>
&gt; index 22e591556..a7881a871 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid=
_from_inode-Include-limit.h.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid=
_from_inode-Include-limit.h.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2bf1bbe1d428ed06d57aa76b03e394b72ff2216d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 8097734b27fd146f358a4edd0d1a0d28309bd9a4 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 22 Jul 2016 18:34:39 +0000<br>
&gt;=C2=A0 Subject: [PATCH] get_pid_from_inode: Include limit.h<br>
&gt; @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/agent/mibgroup/util_funcs/get_pid_from_inode.c b/ag=
ent/mibgroup/util_funcs/get_pid_from_inode.c<br>
&gt; -index aee907d..7abaec2 100644<br>
&gt; +index 5788e1d..ea380a6 100644<br>
&gt;=C2=A0 --- a/agent/mibgroup/util_funcs/get_pid_from_inode.c<br>
&gt;=C2=A0 +++ b/agent/mibgroup/util_funcs/get_pid_from_inode.c<br>
&gt;=C2=A0 @@ -6,6 +6,7 @@<br>
&gt; @@ -23,5 +23,5 @@ index aee907d..7abaec2 100644<br>
&gt;=C2=A0=C2=A0 #include &lt;ctype.h&gt;<br>
&gt;=C2=A0 +#include &lt;limits.h&gt;<br>
&gt;=C2=A0=C2=A0 #include &lt;stdio.h&gt;<br>
&gt; - #if HAVE_STDLIB_H<br>
&gt; + #ifdef HAVE_STDLIB_H<br>
&gt;=C2=A0=C2=A0 #include &lt;stdlib.h&gt;<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
snmpd-always-exit-after-displaying-usage.patch b/meta-networking/recipes-pr=
otocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.pat=
ch<br>
&gt; deleted file mode 100644<br>
&gt; index 4fc9e54b4..000000000<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-a=
lways-exit-after-displaying-usage.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,55 +0,0 @@<br>
&gt; -From 94ca941e06bef157bf0e13251f8ca1471daa9393 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Kaarle Ritvanen &lt;<a href=3D"mailto:kaarle.ritvanen@datakunkk=
u.fi" target=3D"_blank">kaarle.ritvanen@datakunkku.fi</a>&gt;<br>
&gt; -Date: Fri, 27 Aug 2021 14:21:45 +0300<br>
&gt; -Subject: [PATCH] snmpd: always exit after displaying usage<br>
&gt; -<br>
&gt; -Currently, viewing the help text with -h results in snmpd being start=
ed<br>
&gt; -in the background, whereas this does not happen with --help. Similarl=
y,<br>
&gt; -when an error is detected in command line syntax, the help text is<br=
>
&gt; -displayed but sometimes snmpd gets started anyway, depending on the<b=
r>
&gt; -execution path.<br>
&gt; -<br>
&gt; -This patch makes snmpd consistently terminate whenever the usage<br>
&gt; -function gets called. It also removes the goto statements no longer<b=
r>
&gt; -needed.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -[<a href=3D"https://github.com/net-snmp/net-snmp/commit/94ca941e06bef=
157bf0e13251f8ca1471daa9393" target=3D"_blank">https://github.com/net-snmp/=
net-snmp/commit/94ca941e06bef157bf0e13251f8ca1471daa9393</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" t=
arget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - agent/snmpd.c | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/agent/snmpd.c b/agent/snmpd.c<br>
&gt; -index f5aab0af8..90de12d99 100644<br>
&gt; ---- a/agent/snmpd.c<br>
&gt; -+++ b/agent/snmpd.c<br>
&gt; -@@ -289,6 +289,8 @@ usage(char *prog)<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &q=
uot;=C2=A0 -S d|i|0-7\t\tuse -Ls &lt;facility&gt; instead\n&quot;<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &q=
uot;\n&quot;<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );=
<br>
&gt; -+=C2=A0=C2=A0=C2=A0 SOCK_CLEANUP;<br>
&gt; -+=C2=A0=C2=A0=C2=A0 exit(1);<br>
&gt; - }<br>
&gt; -<br>
&gt; - static void<br>
&gt; -@@ -494,7 +496,6 @@ main(int argc, char *argv[])<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case &#39;-&#39;:<br=
>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (strcasecmp(optarg, &quot;help&quot;) =3D=3D 0) {<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 usage(argv[0]);<br>
&gt; --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (strcasecmp(optarg, &quot;version&quot;) =3D=3D 0) {<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 version();<br>
&gt; -@@ -783,7 +784,6 @@ main(int argc, char *argv[])<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 fprintf(stderr, &quot;%s: Illegal argument -X:&quot;<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &quot;AgentX support not compiled in.\n&quot;, argv[0]);<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 usage(argv[0]);<br>
&gt; --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
oto out;<br>
&gt; - #endif<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-=
snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networkin=
g/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-f=
or-return-from-EVP_M.patch<br>
&gt; index 42352a6b0..af6334f72 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib=
-keytools.c-Don-t-check-for-return-from-EVP_M.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib=
-keytools.c-Don-t-check-for-return-from-EVP_M.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From f3ff99736b8cccbba77349b0d10a3cee366a4c87 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From f4e1acd4f509dd26cf88da872bd5adcf884f4a5f Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 18 Sep 2015 00:28:45 -0400<br>
&gt;=C2=A0 Subject: [PATCH] snmplib/keytools.c: Don&#39;t check for return =
from<br>
&gt; @@ -17,7 +17,7 @@ Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:o=
vidiu.panait@windriver.com" target=3D"_blank">ovidiu.panait@windriver.com</=
a>&gt;<br>
&gt;=C2=A0=C2=A0 1 file changed, 1 insertion(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/snmplib/keytools.c b/snmplib/keytools.c<br>
&gt; -index 129a7c0..2fc1efc 100644<br>
&gt; +index 14a452a..fb1694b 100644<br>
&gt;=C2=A0 --- a/snmplib/keytools.c<br>
&gt;=C2=A0 +++ b/snmplib/keytools.c<br>
&gt;=C2=A0 @@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int has=
htype_len,<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-=
configure-fix-a-cc-check-issue.patch b/meta-networking/recipes-protocols/ne=
t-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c973bde72..000000000<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configu=
re-fix-a-cc-check-issue.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,28 +0,0 @@<br>
&gt; -From 0a02ac779c51a2b4af3b58cb96967bf3eff80367 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windriver.com" ta=
rget=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt; -Date: Wed, 24 May 2017 16:45:34 +0800<br>
&gt; -Subject: [PATCH] configure: fix a cc check issue.<br>
&gt; -<br>
&gt; -When has &quot;.&quot; in cc value, the expression<br>
&gt; -$myperl -V:cc | $myperl -n -e &#39;print if (s/^\s*cc=3D.([-=3D\w\s\/=
]+).;\s*/$1/);&#39;<br>
&gt; -can&#39;t get corretly the cc&#39;s value.<br>
&gt; -<br>
&gt; -Signed-off-by: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windrive=
r.com" target=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - configure.d/config_project_perl_python | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/configure.d/config_project_perl_python b/configure.d/con=
fig_project_perl_python<br>
&gt; -index 475c843..22d2ad3 100644<br>
&gt; ---- a/configure.d/config_project_perl_python<br>
&gt; -+++ b/configure.d/config_project_perl_python<br>
&gt; -@@ -87,7 +87,7 @@ if test &quot;x$install_perl&quot; !=3D &quot;xno&q=
uot; ; then<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0 if test &quot;x$enable_perl_cc_checks&quot; =
!=3D &quot;xno&quot; ; then<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_CHECKING([for=
 Perl cc])<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 changequote(, )<br>
&gt; --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PERLCC=3D`$myperl -V:cc |=
 $myperl -n -e &#39;print if (s/^\s*cc=3D.([-=3D\w\s\/]+).;\s*/$1/);&#39;`<=
br>
&gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PERLCC=3D`$myperl -V:cc |=
 $myperl -n -e &#39;print if (s/^\s*cc=3D.([-=3D\.\w\s\/]+).;\s*/$1/);&#39;=
`<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 changequote([, ])<br=
>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test &quot;x$PERL=
CC&quot; !=3D &quot;x&quot; ; then<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 AC_MSG_RESULT([$PERLCC])<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-=
configure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/=
net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch<br>
&gt; index bfddc63dd..6e224188a 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configu=
re-fix-incorrect-variable.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configu=
re-fix-incorrect-variable.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 011bdcd07f2a289d0cfc1b411c03c0cc7c42dad1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 6d655ba677563ac9d62d4d8eee59fdb39d486c02 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windriver.co=
m" target=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 24 May 2017 17:10:20 +0800<br>
&gt;=C2=A0 Subject: [PATCH] configure: fix incorrect variable<br>
&gt; @@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang &lt;<a href=3D"mailto:w=
enlin.kang@windriver.com" target=3D"_blank">wenlin.kang@windriver.com</a>&g=
t;<br>
&gt;=C2=A0=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/Makefile.in b/Makefile.in<br>
&gt; -index 912f6b2..a53d1b2 100644<br>
&gt; +index f1cbbf5..1545be3 100644<br>
&gt;=C2=A0 --- a/Makefile.in<br>
&gt;=C2=A0 +++ b/Makefile.in<br>
&gt; -@@ -174,7 +174,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@ cl=
eanfeatures perlcleanfeatures pyt<br>
&gt; +@@ -173,7 +173,7 @@ OTHERCLEANTODOS=3Dperlclean @PYTHONCLEANTARGS@ cl=
eanfeatures perlcleanfeatures pyt<br>
&gt;=C2=A0=C2=A0 #<br>
&gt;=C2=A0=C2=A0 # override LD_RUN_PATH to avoid dependencies on the build =
directory<br>
&gt;=C2=A0=C2=A0 perlmodules: perlmakefiles subdirs<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-l=
ibtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/f=
ix-libtool-finish.patch<br>
&gt; index 26dd014ce..409c1e03c 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-=
finish.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-=
finish.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 27444fbf8323679ea0551a3bd5f04c365143d8c0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ab1d77c52e84746e75506a2870783806bc77f396 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: &quot;Roy.Li&quot; &lt;<a href=3D"mailto:rongqing.li@windr=
iver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 16 Jan 2015 14:14:01 +0800<br>
&gt;=C2=A0 Subject: [PATCH] net-snmp: fix &quot;libtool --finish&quot;<br>
&gt; @@ -20,11 +20,11 @@ Signed-off-by: Roy.Li &lt;<a href=3D"mailto:rongqi=
ng.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<br=
>
&gt;=C2=A0=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/Makefile.top b/Makefile.top<br>
&gt; -index 6315401..fc0ee06 100644<br>
&gt; +index a962c54..1ba5607 100644<br>
&gt;=C2=A0 --- a/Makefile.top<br>
&gt;=C2=A0 +++ b/Makefile.top<br>
&gt;=C2=A0 @@ -89,7 +89,7 @@ LIBREVISION =3D 0<br>
&gt; - LIB_LD_CMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(LIBTOOL) --mode=3Dlin=
k $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREV=
ISION):$(LIBAGE) -o<br>
&gt; + LIB_LD_CMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(LIBTOOL) --mode=3Dlin=
k $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREV=
ISION):$(LIBAGE) @LD_NO_UNDEFINED@ -o<br>
&gt;=C2=A0=C2=A0 LIB_EXTENSION=C2=A0=C2=A0 =3D la<br>
&gt;=C2=A0=C2=A0 LIB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0 =3D<br>
&gt;=C2=A0 -LIB_LDCONFIG_CMD =3D $(LIBTOOL) --mode=3Dfinish $(INSTALL_PREFI=
X)$(libdir)<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-p=
rotocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.p=
atch<br>
&gt; index 022eb958f..87f192e5b 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7=
.2-fix-engineBoots-value-on-SIGHUP.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7=
.2-fix-engineBoots-value-on-SIGHUP.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1e3178835217ba89aa355e2b6b88e490f17be16d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 5ad4eab43c1ea63ff343bba64d576440e8783e75 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.co=
m" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 9 Jun 2021 15:47:30 +0900<br>
&gt;=C2=A0 Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP<br>
&gt; @@ -7,6 +7,7 @@ Upstream-Status: Pending<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Marian Florea &lt;<a href=3D"mailto:marian.florea=
@windriver.com" target=3D"_blank">marian.florea@windriver.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.c=
om" target=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
&gt; +Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu.panait@wind=
river.com" target=3D"_blank">ovidiu.panait@windriver.com</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0=C2=A0 agent/snmpd.c=C2=A0=C2=A0=C2=A0 | 1 +<br>
&gt; @@ -14,19 +15,18 @@ Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zh=
ou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
&gt;=C2=A0=C2=A0 2 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/agent/snmpd.c b/agent/snmpd.c<br>
&gt; -index 1af439f..355b510 100644<br>
&gt; +index 90de12d..1ccc4db 100644<br>
&gt;=C2=A0 --- a/agent/snmpd.c<br>
&gt;=C2=A0 +++ b/agent/snmpd.c<br>
&gt; -@@ -1208,6 +1208,7 @@ receive(void)<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snmp_log=
(LOG_INFO, &quot;NET-SNMP version %s restarted\n&quot;,<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netsnmp_get_version());<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 update_config();<br>
&gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snmp_store(ap=
p_name);<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);<br>
&gt; - #if HAVE_SIGPROCMASK<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D sigprocmask(SIG_UNBLOCK, &amp;set, NULL);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 snmp_log(LOG_INFO, &quot;NET-SNMP version %s=
 restarted\n&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 netsnmp_get_version());<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 update_config();<br>
&gt; ++=C2=A0=C2=A0=C2=A0 snmp_store(app_name);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC,=
 3);<br>
&gt; + #ifdef HAVE_SIGPROCMASK<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D sigprocmask(SIG_UNBLOCK, &amp;set, N=
ULL);<br>
&gt;=C2=A0 diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c<br>
&gt; -index 29c2a0f..ada961c 100644<br>
&gt; +index 7b1746b..4a17e0d 100644<br>
&gt;=C2=A0 --- a/snmplib/snmpv3.c<br>
&gt;=C2=A0 +++ b/snmplib/snmpv3.c<br>
&gt;=C2=A0 @@ -1059,9 +1059,9 @@ init_snmpv3_post_config(int majorid, int m=
inorid, void *serverarg,<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-pr=
otocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.pat=
ch<br>
&gt; index f1ebe2bb6..c5a453abe 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add=
-knob-whether-nlist.h-are-checked.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add=
-knob-whether-nlist.h-are-checked.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e507dcf8b29c55011f85d88bf05400d4717e4074 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ad65b106d3cb3c6e595381be1c45a73c1ef6eb5e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com" tar=
get=3D"_blank">Chong.Lu@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 28 May 2020 09:46:34 -0500<br>
&gt;=C2=A0 Subject: [PATCH] net-snmp: add knob whether nlist.h are checked<=
br>
&gt; @@ -15,7 +15,7 @@ Signed-off-by: Chong Lu &lt;<a href=3D"mailto:Chong.=
Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;<br>
&gt;=C2=A0=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/configure.d/config_os_headers b/configure.d/config_=
os_headers<br>
&gt; -index 76ef58a..f07d512 100644<br>
&gt; +index b9c8c31..01c3376 100644<br>
&gt;=C2=A0 --- a/configure.d/config_os_headers<br>
&gt;=C2=A0 +++ b/configure.d/config_os_headers<br>
&gt;=C2=A0 @@ -37,6 +37,7 @@ AC_CHECK_HEADERS([getopt.h=C2=A0=C2=A0 pthread=
.h=C2=A0 regex.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] dnl<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/=
net-snmp/net-snmp-fix-for-disable-des.patch<br>
&gt; index 2941a3609..c382c02d8 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix=
-for-disable-des.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix=
-for-disable-des.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 3ca4335ec1d6b7b384c134fc85d7a9e513c68376 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b1b9980853b1083f0c8b9f628f8b4c3a484d4f91 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.=
com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 22 Jun 2017 10:25:08 +0800<br>
&gt;=C2=A0 Subject: [PATCH] net-snmp: fix for --disable-des<br>
&gt; @@ -15,7 +15,7 @@ Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:ja=
ckie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&=
gt;<br>
&gt;=C2=A0=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/snmplib/scapi.c b/snmplib/scapi.c<br>
&gt; -index 00c9174..c6875e1 100644<br>
&gt; +index 54fdd5c..0f7e931 100644<br>
&gt;=C2=A0 --- a/snmplib/scapi.c<br>
&gt;=C2=A0 +++ b/snmplib/scapi.c<br>
&gt;=C2=A0 @@ -85,7 +85,9 @@ netsnmp_feature_child_of(usm_scapi, usm_suppor=
t);<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-s=
nmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes=
-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-pte=
st.patch<br>
&gt; index 807983f61..09ca532a7 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-tes=
ting-add-the-output-format-for-ptest.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-tes=
ting-add-the-output-format-for-ptest.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 972df16e9599dffddf5d714a4cbf43008c771122 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 36a5656db7ea75dd15f35a6c1728937c6e2b901c Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.=
com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 14 Jan 2015 15:10:06 +0800<br>
&gt;=C2=A0 Subject: [PATCH] testing: add the output format for ptest<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/repro=
ducibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp=
/net-snmp/reproducibility-have-printcap.patch<br>
&gt; index bf1e7bedf..c0b51c51e 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibil=
ity-have-printcap.patch<br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibil=
ity-have-printcap.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 84e362fe97f50fbad69f083bc2d8fe18f83eb2f7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b923cd38e2503b86aedf66b767fd7f51c9f25645 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: &quot;douglas.royds&quot; &lt;<a href=3D"mailto:douglas.ro=
yds@taitradio.com" target=3D"_blank">douglas.royds@taitradio.com</a>&gt;<br=
>
&gt;=C2=A0 Date: Wed, 21 Nov 2018 13:52:18 +1300<br>
&gt;=C2=A0 Subject: [PATCH] net-snmp: Reproducibility: Don&#39;t check buil=
d host for<br>
&gt; @@ -13,7 +13,7 @@ set in the environment to &quot;yes&quot; or &quot;n=
o&quot; as appropriate for the target platform.<br>
&gt;=C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/configure.d/config_os_misc4 b/configure.d/config_os=
_misc4<br>
&gt; -index 6f23c8e..8cea75a 100644<br>
&gt; +index b6864d9..07ca922 100644<br>
&gt;=C2=A0 --- a/configure.d/config_os_misc4<br>
&gt;=C2=A0 +++ b/configure.d/config_os_misc4<br>
&gt;=C2=A0 @@ -99,9 +99,9 @@ if test x$LPSTAT_PATH !=3D x; then<br>
&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/<a href=3D"htt=
p://net-snmp_5.9.1.bb" target=3D"_blank">net-snmp_5.9.1.bb</a> b/meta-netwo=
rking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp_5.9.3.bb" targe=
t=3D"_blank">net-snmp_5.9.3.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta-networking/recipes-protocols/net-snmp/<a href=3D"http=
://net-snmp_5.9.1.bb" target=3D"_blank">net-snmp_5.9.1.bb</a><br>
&gt; rename to meta-networking/recipes-protocols/net-snmp/<a href=3D"http:/=
/net-snmp_5.9.3.bb" target=3D"_blank">net-snmp_5.9.3.bb</a><br>
&gt; index 30c0ce74c..7af514756 100644<br>
&gt; --- a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net=
-snmp_5.9.1.bb" target=3D"_blank">net-snmp_5.9.1.bb</a><br>
&gt; +++ b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net=
-snmp_5.9.3.bb" target=3D"_blank">net-snmp_5.9.3.bb</a><br>
&gt; @@ -21,15 +21,13 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/net-snmp/n=
et-snmp-${PV}.tar.gz \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>file://0001-config_os_headers-Error-Fix.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>
file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch</a> =
\<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>file://0001-get_pid_from_inode-Include-limit.h.patch</a> \<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file:=
//0002-configure-fix-a-cc-check-issue.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>file://0004-configure-fix-incorrect-variable.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>
file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>file://net-snmp-fix-for-disable-des.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>file://reproducibility-have-printcap.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>
file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch</a> \=
<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0001-snmpd-always-exit-after-displaying-usage.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;eb7fd4a44de6cddbffd9a92a85ad1309e5c1054f=
b9d5a7dd93079c8953f48c3f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d=
3998dbe02f9462a413a2ef0a&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/=
projects/net-snmp/files/net-snmp/" target=3D"_blank">https://sourceforge.ne=
t/projects/net-snmp/files/net-snmp/</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;/net-snmp/(?P&lt;pver&gt;\d+(\.\d=
+)+)/&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#99037): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/99037" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/99037</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94085410=
/1997914" target=3D"_blank">https://lists.openembedded.org/mt/94085410/1997=
914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</div>

</blockquote></div></div>

--000000000000748e3905ea2687b4--

