Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C222C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 14:36:02 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.85])
 by mx.groups.io with SMTP id smtpd.web10.37847.1681911390584241638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Apr 2023 06:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=uqlGSMeg;
 spf=pass (domain: spinetix.com, ip: 40.107.23.85, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpLrUNBYXbSPAZKhxzG+3j82OwP819Ye3xoxB9GsaofgzX82kuFFApjxQVfzZaOUJkg4kjqSn0gL+o5qBaPWcVp6qE0PoCb79elNeAPLYi9YVPeYCYX+bcavvL97pUskuqEcxKG9ao4bMgkrOCrvTSs3VZoMHjQ5tcRhuF0o849R0ZUKjX0LKKK5M1rbyLrbu3Ijc6eOWWaqvwKORinNztYtUPEujS09IviTEa9eZCCFBiWgresjrJjBNFE0l7I28sgq1gxog6fb8ikTqpnesX7qZ8cAnXjPnuTVbO3zTmtJbRsuC0jHUGDHKBbIV/MNCU6Ga1HderU+F55nc38TGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7SEOrQygxsC7mQ67W5YAhvcwT7hUiAQoynuO8UnJH0=;
 b=HBGOt3Q/PvlHhI6dfTySs8hCrIKjLu9G3A2T+Q8m4jQm87EwwO2LInO2HepfhhsKpStYY8+EdbUZbSerz1IdH/k0ak6JMRYHuomf5q5mADx6yHj1OIbxF6PiLB/AQ6+IBeLUjjpuQyMXYU2uSgs5DtWCK8OqmBkpT5x6k2oWL8c8tqlVH9LkgeyeTzIvM0JrKNrtKSqDHyzJJwXe/MMS00HwUA2WzXPhAJxZfBlY4NDfC7WewWlCVlfk+segG/tYSDmPqDPSI73Wflv/aOPaAvyzNQmkUN6OW67Q0+vQyZKtzMjMY8OCmu4nsdpMLU6YCoKmNGM9rS26q3e7jZFPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7SEOrQygxsC7mQ67W5YAhvcwT7hUiAQoynuO8UnJH0=;
 b=uqlGSMegvrYe7Z3Pz+4RFDz6NnjRqAl2iLo5e11PrzECl7J0aaUnDaCrYTImNpB7feADsjALL7e7rqbEnNPGOKFyE0rCtmlfvxwpMnFZODi7TjokD3ULHI11wAEOYNEyClrySXadAEbpN84ukBKOuS1l3qLb3DiAZkiHFH6WYGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by GV0P278MB0116.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:1e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 13:36:27 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5e2d:f1c9:c763:a7f6]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5e2d:f1c9:c763:a7f6%6]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 13:36:27 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: Valeria Petrov <valeria.petrov@spinetix.com>
Subject: [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH] apache2: upgrade 2.4.56 -> 2.4.57
Date: Wed, 19 Apr 2023 15:36:08 +0200
Message-ID: <20230419133608.21415-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR0P278CA0057.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::8) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|GV0P278MB0116:EE_
X-MS-Office365-Filtering-Correlation-Id: dd425f6a-28c4-4f70-70f0-08db40db139b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A5XpCAiFUL7lN1T3y0R6/P075eTfO7QS0V80q3DenecBYNdOS57UvGPjRdUrymxc99sE4s04nycHhiA/ohpIb0fjfT0GnGNinqTW5SCFRap9Qt8PnpRG44C5jcQNTXUg9M1ohWjG0E0CiSKsKQscek+pqsmXW9pGa4r9IIRrB42wYSBHsS99tA3iJjIkTTlfAef7qcEk7p5FucPaKIH+Az6Q49QMZN/OONmPyW+lqTuPIbPa/uE+4P4H2IzT+BRUTaXpydQ9eM+KI1bV3Yi5vQRonzGh6Q3in2mf5wX3jF2qJB63jSsWvMg+czyv/VLegzRsYQYe3SDe3Pa3EuvdNAv8i4ImGeqbiDRzpbvOjvVljOcCHD9KBxDyFn/8qxNXo11nQIRoc7BFucOLX9tQYEpSiuAG0yGs+4wzBw/YhMYV9ZiZ8k1Q8kpLl/paKBzF5C1kNA4deW22yGziuHK7p1u5DGgwZSpyisQ4v2o++fB8NypBRD7pnWxHmg/5CV1sQ93tJjoXqX1urf+12bVzmZATxhl/SzukJf3Xuj8BWOdXEUai8T2hAxZ9UfXmhiK5xI3Zmzn7j5EJ+qEd2n/qtTjPL0YeJE7P8qPk/kj/Cu0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(136003)(39840400004)(451199021)(316002)(6916009)(66556008)(66476007)(4326008)(66946007)(26005)(6506007)(6512007)(186003)(107886003)(38350700002)(1076003)(38100700002)(2616005)(83380400001)(5660300002)(8936002)(41300700001)(52116002)(6486002)(478600001)(6666004)(8676002)(86362001)(36756003)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ry6JDwELc2xE8sY7yVCjF/leBYjTMnsXChwSv1QjeqbcgEQBRzvVcH4Bmbxk?=
 =?us-ascii?Q?0uH/cYH46D3QXdg0YCCt5lOqcfKe9UmDaKmKBHAPZo1G8KuPaKeoXtLwoTg+?=
 =?us-ascii?Q?F592FakeZgZ2XdW2qZPHM5NIiO6H+SQZGCQEPvRCfXKaVljnyNQ9B/z62rj1?=
 =?us-ascii?Q?7vupqLELS3ZdUzfcYxc6RM19NTFPDPrgSIRgIGt3yKHLogt0Aa9D4JzaOwpK?=
 =?us-ascii?Q?GEGbE3pA7A1QZfIqJqw6MmVsz8k+6ChmSl76HcyQv8NbQUZVSi7s6ZGs4h0+?=
 =?us-ascii?Q?mfutxqppsfmkIEg/P/bVUIu5oOCkbt6sZ+NssGN/zlDkPMK2ixMWsGAhb+bb?=
 =?us-ascii?Q?qC9uKSl9TMbLq7MaGE33lOP0QDaRuY4A+zGm6uzH/jZFULpAb3wIrC2KRYsP?=
 =?us-ascii?Q?rltTBdB9XVmLZixGgMKJnlBoj1FXySHg0hY8bwYSXkeGS3uQAjxjUwVY4bgK?=
 =?us-ascii?Q?5TABksGf7NLvwLByt/Tw5CEuEX+hGToShN5C/VUqY2Lcr2roGt01XWIYRywF?=
 =?us-ascii?Q?eEzFwJ6hXNA0bdvsg7H9ZFJwk5iJXe5UcHiTqJRGw/k2Fq1KCZy1ZEO6JZR6?=
 =?us-ascii?Q?k/wEJ+7p7HyaQldxiEscLhn+6QumLkmYYMT9Fhz521egA/rvKVY+Ex1m9Bq4?=
 =?us-ascii?Q?QqIYWwV49XuXmSfOfkLHXY3XmmFwglxiNAjwk472Jc+14Qhy9BOjuXMPJ67/?=
 =?us-ascii?Q?pa2ZMQozDVY0DcRxsPqFv9Zy2FJgk6Teif5xsoHrmJffJIvq3jrGZ5g1CRxc?=
 =?us-ascii?Q?Un/4jjjuFeGGYNIBtdaWYb8YpgHF8eWIlwLN2hA8LG0bviKP+0qvbYLmDj0y?=
 =?us-ascii?Q?IHXi7IdLDtQ3WD8F4fwYBX1HAkaPKkD55YIkxBZLubNhcne7KLrmFbtGQSp2?=
 =?us-ascii?Q?3ENqqoBxUbLaEiPFyYGAHKjAA49RDqcEr6HvyjKdXru9H/uG+vZ5KgR1Vlzc?=
 =?us-ascii?Q?MwszAFjWRp5kbwQNPCHmoflbg2QYvlt06pu1RSLYFxjy1SDzR8jW8NU2u0gJ?=
 =?us-ascii?Q?nBC4AwxFrj6/S9Z6FPE4Ch4+0kNGFJcG98cBnwzoQuJ86hUBNfY6zBv9tweb?=
 =?us-ascii?Q?TqPQvY1TeAnBxtHltWNZDlPFdqEC4KJLGKuG8jIe+iEbbW0x2anmyf/X6h+5?=
 =?us-ascii?Q?eYiOzYGw84PnCWqzADV0zmGS97z5bwWiLa2GSBlliwfERVy0VEJNoVBZRhsk?=
 =?us-ascii?Q?zSFRS5pHB6Da9PfC5Mfv4WcAEFwtK+dqNLFu7uH2fDxOOsNq++m3VE6XhfbI?=
 =?us-ascii?Q?VJqMCUwVz3karPil7aSdVxLFCLpm48QFLH+VD3ZyvrRZ4Z1L+LCK91nNqSpZ?=
 =?us-ascii?Q?2SluWePaT+R9yLvUJbC8GEDO8yZpquNGcZs2Y8/CDXKgId2mWLQrjmp1309Q?=
 =?us-ascii?Q?4N+tVG9mmea6uMcoEAAI8U7HQg8B1UahCxOLN1uchDh9brWMCNLVJV8l55Gw?=
 =?us-ascii?Q?0HE1xvS2IRGtoZtwoQxmSHEAaCWkI4RvMFIS7FbUZOw7YZXnOI1JXkJ19IEV?=
 =?us-ascii?Q?H9Zjy+gfH8tFvfOWTSC1+6AtiBYAAqkbBd+od9QVVXLQlrvv8w34VXdlAojn?=
 =?us-ascii?Q?0zL+2CjMWq3RE9KF/rlwu+3g5Igw+bCkoy4Nv9HO6/plkiWlPaioccqA2oa5?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd425f6a-28c4-4f70-70f0-08db40db139b
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:36:27.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dk9/t6EQ+gZwM8DqKYzDScLbOK1wnO9M1iHJYdZ8tc7x3W8IvLuRXJiPaW/lPpbg7JFA0w4GTBpc5baHwF9WH2P2fAub/GZ7KQfhu+5v6cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0116
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 14:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102180

Changelog:
Changes with Apache 2.4.57

  *) mod_proxy: Check before forwarding that a nocanon path has not been
     rewritten with spaces during processing.  [Yann Ylavic]

  *) mod_proxy: In case that AllowEncodedSlashes is set to NoDecode do not
     double encode encoded slashes in the URL sent by the reverse proxy to =
the
     backend. [Ruediger Pluem]

  *) mod_http2: fixed a crash during connection termination. See PR 66539.
     [Stefan Eissing]

  *) mod_rewrite: Fix a 2.4.56 regression for substitutions ending
     in a question mark. PR66547. [Eric Covener]

  *) mod_rewrite: Add "BCTLS" and "BNE" RewriteRule flags. Re-allow encoded
     characters on redirections without the "NE" flag.
     [Yann Ylavic, Eric Covener]

  *) mod_proxy: Fix double encoding of the uri-path of the request forwarde=
d
     to the origin server, when using mapping=3Dencoded|servlet.  [Yann Yla=
vic]

  *) mod_mime: Do not match the extention against possible query string
     parameters in case ProxyPass was used with the nocanon option.
     [Ruediger Pluem]

New patch:
0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
Accepted in upstream, expected to be removed at next apache2 2.4.58 update.
---
 ...config9.m4-Add-server-directory-to-i.patch | 31 +++++++++++++++++++
 .../{apache2_2.4.56.bb =3D> apache2_2.4.57.bb}  |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modul=
es-mappers-config9.m4-Add-server-directory-to-i.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb =3D> apache=
2_2.4.57.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mapp=
ers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-htt=
pd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-=
i.patch
new file mode 100644
index 000000000..996eabf58
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-con=
fig9.m4-Add-server-directory-to-i.patch
@@ -0,0 +1,31 @@
+From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
+From: Valeria Petrov <valeria.petrov@spinetix.com>
+Date: Tue, 18 Apr 2023 15:38:53 +0200
+Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
+ include path if mod_rewrite is enabled.
+
+Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=3Drevision&r=
evision=3D1909241]
+
+---
+ modules/mappers/config9.m4 | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
+index 55a97ab993..7120b729b7 100644
+--- a/modules/mappers/config9.m4
++++ b/modules/mappers/config9.m4
+@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to user-spec=
ific directories, , , mos
+ APACHE_MODULE(alias, mapping of requests to different filesystem parts, ,=
 , yes)
+ APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
+=20
++if test "x$enable_rewrite" !=3D "xno"; then
++    # mod_rewrite needs test_char.h
++    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server])
++fi
++
+ APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
+=20
+ APACHE_MODPATH_FINISH
+--=20
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.57.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
index ed5690a4a..669d27756 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.pa=
tch \
+           file://0011-modules-mappers-config9.m4-Add-server-directory-to-=
i.patch \
           "
=20
 SRC_URI:append:class-target =3D " \
@@ -26,7 +27,7 @@ SRC_URI:append:class-target =3D " \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5=
442d41afdb2d7c"
+SRC_URI[sha256sum] =3D "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83cae=
cb262e5cf94d2a"
=20
 S =3D "${WORKDIR}/httpd-${PV}"
=20
--=20
2.25.1


