Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07DCC55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44172.1785766647382335015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 07:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=h+GqNRNJ;
 spf=pass (domain: est.tech, ip: 52.101.66.1, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPKzNBl84nWayPt+TL9oqeMeSlVBHA5AFCqzrDf2xkKV8UFUVufHGCecS/F5GAq+TvPlI2hKw5Me9/2nEqxSgjRwJ6r8olnuxhWO2TkKlJmhYZP+JXW3xg9os6b+b0m3Ck/HwsoUpGk77gXdvmjOS3GU8/NfdDgc74fijzgmyMldaV1GhhzCFc8JaI5lk7Z98gp9eCR5bDXrHhMxWv5YzZEbua7yifFVsON5C+E6z3LmPUSu8fAVtFiSHioGxyuU2fdEDzwTVwSQ8UIGlkD1Wmr7npC3RS/UjRRuu6MsCq8fiiaMmoARftso6SIXO5fEOls5dYPyiOmnLjsMz0+r0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec7Pswxo6LZ9OPU2fiAQZKYJoPKNOoJtFvlWGUW80f0=;
 b=NxX/7WGvYmNe8k0PkFbCPpDC1O0rRqFATDipbfN2FYeFa2cCjItANdkQxhGU8wsGbDPSIFNVdd8DNPa4Dhi89CFKVg2/WcqSDHsfhdr//q2NptbANzrnJI978YaN7j+6XkGsAm9xmPbPBh6Zsg5hpZYkyLfYH+izlX7nr6nAF4grusnvO3+xFyObnztoZmlPM8/6CHW84kra5slCu9bvxZ82apfY2U6OgCr0cGtbxudPMneAlGkhOolYCqB5n/iX3y8c5ogi9ikY8kWhVqGEWggKx6nzQRBwc4LwBtG+KRLJ5qWNgzU17awugYsYbcWFmdDG7sz1VfzphLnX5450ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec7Pswxo6LZ9OPU2fiAQZKYJoPKNOoJtFvlWGUW80f0=;
 b=h+GqNRNJHndUJub083ZaPq5kBR227wLLvC65cxGB3FY9ZgMOz1yykkHo3W16hP/dRyN6QMd6Kyx2rwn9fNY5k7wdRT3G57uu2+EAGIy0dxBWaRBWgJ3oVhnrhRB5FQTbo5O2jae2eGEjq1/3GW3Y6uoY/bwQnT2aI26Vd27vfU4hbW8+ZgxpgE938dD1qxipvtZxHpNdxNYMiaK5mLiSzS788kNgL6heyiLnwupY/rGwVAyOfTkuSKgK0SYXljPlbTaV1g0GHhp4DNbHnCqQ1lpHaBu1PFTC5c3UqJGvlaaHG6WLQXvzALsyq5LIRDQ6xcDF8B7T6jXf+rSFZIxcjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU0P189MB1820.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:344::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 14:17:24 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 14:17:24 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/3] thrift: fix CVE-2026-58023
Date: Mon,  3 Aug 2026 16:17:11 +0200
Message-ID: <20260803141716.853285-3-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803141716.853285-1-adarsh.jagadish.kamini@est.tech>
References: <20260803141716.853285-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: DUZPR01CA0181.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::22) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU0P189MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d77855a-946f-4fea-9a89-08def169f099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|6133799003|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	P9ZHbjNlboh9alAefAducaYf+1eVGA+sU2MRxxIUNJTYxWS1bHiazx5RpqptHvikKaMoT/BHPfUrIrRC0IQGwt4BW8aoYoUtlfVgRO7gO0LPqPc3vpdKjAsyukk7MiATcyMdI2ZXNTpyPhiAabk9CPwWas9NnFjAFdRYdEZHieLFW7US6ASB9eGI2xKlw+MU+PwWyfiIKnfWRIJ9j36Zg8Us54e6bsQyisRbre78WNJzQ8u5vSPJb2Kz3XIi1obqewWB1oOTREEFxy45pV6kgv4oOO39gbKbAFbg4GzsJAY8zvQ0OH7l4O1Cjgrt7EgLT/us+PckDHhwsu8tls4VAykVf5DQetOjk2bdtDvw52xpvqnWrxv1jBaKGWEtccPVjMDEz8NCnTp9/Dk0AfGmeYSHEn0wCuDDl7n9pvCoVNf7mg9NlG8Z3lFdRJ+QvtfspCGq0jbtZ6oLhhFems1WJQ1d58udnTSOZmrwegXCqRBfawFQyBjLWo/iziQVYS4fZF7q/8MczO1fX7BrtYygM0MkKsA/elzVHGQzf5mrwKvQO8Tunq3EYGSMqiqHy6vWiFBofKY4NAIoNVx9DQyOXCd6Ll540MGOE2VRhBRNiz0k/jfhEAdbysWgrliS5Oh4rlmEGYpg8iHn95IseSyCtePYWNabqb2cXw/Z0FwhWws=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(6133799003)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wf1knH5knQ1H0PvA7U+2EbZaX2VcVDNVu0gKXE4EEfPnLqkkqH3avtYqkxXw?=
 =?us-ascii?Q?3yJNnqJM9ZjGhUaaDDYYElFlQi85HF4gUhKI1uidubTHCBPaRZuTIVA4YBGY?=
 =?us-ascii?Q?74OCjVNRvxX8OmkPIVI8q7Ld4jLiHkHJ3GZG4WAkvCCg3UxZ0TbY1CywNfUW?=
 =?us-ascii?Q?HiwO7+703xZRSSMaDUzq/qBErP6syoUsRAaTS0g/GuWn0gCxGAE1rZOhQnLB?=
 =?us-ascii?Q?hqcJcN6/BmQdkYWVR+39e1k9Qgv3qMCWCXku80QYa9MPrlrG66nlYc3AtUun?=
 =?us-ascii?Q?EjRHmAuwBKG3U19VH4bM1Hp+G2Qo5GgrR3+Q7c98anCS0m0dKgUdieXQR2bI?=
 =?us-ascii?Q?QWEUqdPv/Hc7+0wIjv0aXr0i2z2+6J5gxkDY2jnfvgcxZeATBk0cbrXkzBPb?=
 =?us-ascii?Q?fq2qKmERjefTH+pP+meYpN4gJta1N7zUCHvq6HvgSdAjOf4dLzFSAvrVxxvT?=
 =?us-ascii?Q?jkYmyLprvGz3gnCO5TnMEQboocl82PuBSCsIi+lkks2Qdhvjn7XUw0o20R/h?=
 =?us-ascii?Q?Q+TJvzy+q21NveoOjDXLXsUOkgOGSgDFPEsK+jUMdGBylhIqYYjUXwrzgzQO?=
 =?us-ascii?Q?qfv/D8XhpTMvVTQ7o03ssXt1AfE8c14zcnmBvF0UGsIW3z1yQFweT8P/nlcP?=
 =?us-ascii?Q?zwylpMJ2BvNVQlDV0OxBVeMAFOufgRwK4mg7ieNY5nOvoZ6ygYdWQjAM4341?=
 =?us-ascii?Q?2fwt5IsGnbOGBukDyihKgPJSIIgGhEdLM/Epkz6nL1rwVcsujAL3p/owtFj9?=
 =?us-ascii?Q?aI6rimyEFPIfG3tUN9wiHRjTVxIS6xMtnyTebHiGuhAZrN4Qst6yjdyptn5R?=
 =?us-ascii?Q?V5m6ei1TVUHyYjqY/MKAeZ5XKG2010lrHdoauRHL3VmEwU2RXuZVNp5fnbNN?=
 =?us-ascii?Q?4fhIPb7xE5DsIIhobocn84m+CRFOV8MTthYBLNVdF9yeetEni/X1aLCgIeDK?=
 =?us-ascii?Q?7b5XhSYNVveTf9fqUzHFG5kSmbu3wH7kzRtym2tell1uxNLMczQqaCjLxSDM?=
 =?us-ascii?Q?CONNT8AaXhpO1RWEslgpdnzSt1332p/Z8nJs5KWFPtHxC/zOQwUZqbmTr5e3?=
 =?us-ascii?Q?/PRlOHXUE0SZ9wpXAIRlvJclrPGe5NBgOnubc62t3voAmUaVUomUb6rU8hYT?=
 =?us-ascii?Q?5y208SNyrQW336Vx4Lw81ROgZQTD8CfeOSs58x9cPz/xhBawj/JVZNtdE5+J?=
 =?us-ascii?Q?YcPgAq8c8Spbo7JyQghqoDzjs2Oxz8maC1Ikkc3g2jlnUnBD3ImwWn6+HDHq?=
 =?us-ascii?Q?G9QVQOTv6IS0abAegowipugTyx8u23vHHrAyFK3u05uDbCXRA0738Em9SjXf?=
 =?us-ascii?Q?D+aWe8yfLPmKwMFestR8Dr1J7eyIvfyj4QGHr7wRQkOKaZJgVaz3qRlmVdpZ?=
 =?us-ascii?Q?fd4KG3EMaZKqzJ2XdScSNl3m/ykiIkYY0pVOSXRBuruMigsrVo4r8QZY5ir2?=
 =?us-ascii?Q?+Z4Qt2EEXp/pr36v+sICR83LfGrC0lZHoO9kYWdKv5yJ4KrTfQmGjwQ93QjE?=
 =?us-ascii?Q?eIlzgXcc81uW/zovhregW5hsL9kmMG9zLHHHKkeKqjGbiRpFpkoxf30cZsyT?=
 =?us-ascii?Q?MeY0pBt2+/rYg9P+v+nKXVd8GdPQKXO5HFCR4BkxztfBlRj5MaRRBxOGsqBi?=
 =?us-ascii?Q?UhOSLmJk3W0TXzfIWC65gSxemPi0+BzdlhqZ1tXlNv4Snvm5Zafv4NCyIbc6?=
 =?us-ascii?Q?UcXZeZL/CTTg9Dyr5t6dkLZ+NIB8WbRA4Zk/fzd2ftQYs6rLTByQoV39kerJ?=
 =?us-ascii?Q?2dJiIlElcB7tWUdAUxaYNBSUBl1A774WVYw+7CHv/RwxPYodvuhD?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d77855a-946f-4fea-9a89-08def169f099
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:17:24.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtBqslgVLe5plaLtmvbfreJnwTXvt53sG1QMUkGTgBC1BVGNoq9K+RDfFr51u5vYIpwTJhXD3rd+aTkBamtqKDkKudXuL66f+qP91MLEwhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1820
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 14:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128691

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-58023.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58023

Upstream fix:
  https://github.com/apache/thrift/commit/d68305a7308a11df2c1daef16f55dbc19=
dfa6ff0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-58023.patch        | 231 ++++++++++++++++++
 .../thrift/thrift_0.20.0.bb                   |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-580=
23.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
new file mode 100644
index 0000000000..f6cc703369
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
@@ -0,0 +1,231 @@
+From 0459eb08472ea28695e0b78088ca7530ebc34238 Mon Sep 17 00:00:00 2001
+From: Javid Khan <dxbjavid@gmail.com>
+Date: Fri, 26 Jun 2026 21:35:32 +0200
+Subject: [PATCH] copy buffered data not the GByteArray struct in c_glib
+ read_slow Client: c_glib
+
+thrift_framed_transport_read_slow copies leftover bytes from the previous =
frame with memcpy(buf, t->r_buf, t->r_buf->len), passing the GByteArray str=
uct pointer as the source instead of t->r_buf->data. The correct source is =
the buffer's data member, as used by the other memcpy calls in the same fil=
e. thrift_buffered_transport_read_slow contains the same mistake in its lef=
tover path. Both are updated to read from t->r_buf->data, and a regression =
test using a memory buffer exercises the cross-boundary read path in each t=
ransport.
+
+This closes #3607
+
+CVE: CVE-2026-58023
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/d68305a=
7308a11df2c1daef16f55dbc19dfa6ff0]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ .../transport/thrift_buffered_transport.c     |  2 +-
+ .../transport/thrift_framed_transport.c       |  2 +-
+ lib/c_glib/test/Makefile.am                   |  6 +-
+ lib/c_glib/test/testbufferedtransport.c       | 47 ++++++++++++++
+ lib/c_glib/test/testframedtransport.c         | 62 +++++++++++++++++++
+ 5 files changed, 115 insertions(+), 4 deletions(-)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_buffered_transp=
ort.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_buffered_transport.c
+index 30aa95caf..21e3e42d4 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_buffered_transport.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_buffered_transport.c
+@@ -93,7 +93,7 @@ thrift_buffered_transport_read_slow (ThriftTransport *tr=
ansport, gpointer buf,
+   /* first copy what we have in our buffer. */
+   if (have > 0)
+   {
+-    memcpy (buf, t->r_buf, t->r_buf->len);
++    memcpy (buf, t->r_buf->data, t->r_buf->len);
+     want -=3D t->r_buf->len;
+     t->r_buf =3D g_byte_array_remove_range (t->r_buf, 0, t->r_buf->len);
+   }
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_framed_transpor=
t.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_framed_transport.c
+index 3cbb245e0..8deed4119 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_framed_transport.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_framed_transport.c
+@@ -138,7 +138,7 @@ thrift_framed_transport_read_slow (ThriftTransport *tr=
ansport, gpointer buf,
+   /* first copy what we have in our buffer, if there is anything left */
+   if (have > 0)
+   {
+-    memcpy (buf, t->r_buf, t->r_buf->len);
++    memcpy (buf, t->r_buf->data, t->r_buf->len);
+     want -=3D t->r_buf->len;
+     t->r_buf =3D g_byte_array_remove_range (t->r_buf, 0, t->r_buf->len);
+   }
+diff --git a/lib/c_glib/test/Makefile.am b/lib/c_glib/test/Makefile.am
+index f3a0c30df..71cfc7970 100644
+--- a/lib/c_glib/test/Makefile.am
++++ b/lib/c_glib/test/Makefile.am
+@@ -150,7 +150,8 @@ testbufferedtransport_LDADD =3D \
+     $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_socket.o \
+     $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_server_transport.o \
+     $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_server_socket.o \
+-    $(top_builddir)/lib/c_glib/src/thrift/c_glib/libthrift_c_glib_la-thri=
ft_configuration.o=20
++    $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_memory_buffer.o \
++    $(top_builddir)/lib/c_glib/src/thrift/c_glib/libthrift_c_glib_la-thri=
ft_configuration.o
+=20
+ testframedtransport_SOURCES =3D testframedtransport.c
+ testframedtransport_LDADD =3D \
+@@ -158,7 +159,8 @@ testframedtransport_LDADD =3D \
+     $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_socket.o \
+     $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_server_transport.o \
+     $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_server_socket.o \
+-    $(top_builddir)/lib/c_glib/src/thrift/c_glib/libthrift_c_glib_la-thri=
ft_configuration.o=20
++    $(top_builddir)/lib/c_glib/src/thrift/c_glib/transport/libthrift_c_gl=
ib_la-thrift_memory_buffer.o \
++    $(top_builddir)/lib/c_glib/src/thrift/c_glib/libthrift_c_glib_la-thri=
ft_configuration.o
+=20
+ testzlibtransport_SOURCES =3D testzlibtransport.c
+ testzlibtransport_LDADD =3D \
+diff --git a/lib/c_glib/test/testbufferedtransport.c b/lib/c_glib/test/tes=
tbufferedtransport.c
+index d01806d61..7493b7222 100644
+--- a/lib/c_glib/test/testbufferedtransport.c
++++ b/lib/c_glib/test/testbufferedtransport.c
+@@ -25,6 +25,7 @@
+ #include <thrift/c_glib/transport/thrift_socket.h>
+ #include <thrift/c_glib/transport/thrift_server_transport.h>
+ #include <thrift/c_glib/transport/thrift_server_socket.h>
++#include <thrift/c_glib/transport/thrift_memory_buffer.h>
+=20
+ #define TEST_DATA { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' }
+=20
+@@ -306,6 +307,51 @@ test_write_fail(void)
+     }
+ }
+=20
++/* A read larger than the bytes already sitting in the read buffer takes =
the
++   read_slow() path with have > 0. That leftover used to be copied from t=
he
++   GByteArray structure itself rather than its data member, which corrupt=
ed the
++   result and over-read the small struct allocation once more than a hand=
ful of
++   bytes were buffered. Pre-load the buffer and drive the read through a =
memory
++   buffer so the path is exercised without a socket peer. */
++static void
++test_read_across_buffer (void)
++{
++  ThriftBufferedTransport *bt;
++  ThriftTransport *transport;
++  ThriftMemoryBuffer *membuf;
++  guchar leftover[96];
++  guchar tail[4];
++  guchar buf[100];
++  gint32 got;
++  guint i;
++
++  for (i =3D 0; i < sizeof (leftover); i++)
++    leftover[i] =3D (guchar) (0x10 + i);
++  for (i =3D 0; i < sizeof (tail); i++)
++    tail[i] =3D (guchar) (0xc0 + i);
++
++  membuf =3D g_object_new (THRIFT_TYPE_MEMORY_BUFFER, "buf_size", 1024, N=
ULL);
++  thrift_transport_write (THRIFT_TRANSPORT (membuf), tail, sizeof (tail),=
 NULL);
++
++  transport =3D g_object_new (THRIFT_TYPE_BUFFERED_TRANSPORT,
++                            "transport", THRIFT_TRANSPORT (membuf), NULL)=
;
++
++  /* leave 96 bytes already buffered, more than sizeof(GByteArray) */
++  bt =3D THRIFT_BUFFERED_TRANSPORT (transport);
++  g_byte_array_append (bt->r_buf, leftover, sizeof (leftover));
++
++  /* this read exceeds the buffered bytes and must return the real buffer=
ed
++     data followed by the freshly read tail, not the GByteArray structure=
 */
++  got =3D thrift_transport_read (transport, buf, 100, NULL);
++  g_assert (got =3D=3D 100);
++  g_assert (memcmp (buf, leftover, 96) =3D=3D 0);
++  g_assert (memcmp (buf + 96, tail, 4) =3D=3D 0);
++
++  thrift_transport_read_end (transport, NULL);
++  g_object_unref (transport);
++  g_object_unref (membuf);
++}
++
+ int
+ main(int argc, char *argv[])
+ {
+@@ -319,6 +365,7 @@ main(int argc, char *argv[])
+   g_test_add_func ("/testbufferedtransport/OpenAndClose", test_open_and_c=
lose);
+   g_test_add_func ("/testbufferedtransport/ReadAndWrite", test_read_and_w=
rite);
+   g_test_add_func ("/testbufferedtransport/WriteFail", test_write_fail);
++  g_test_add_func ("/testbufferedtransport/ReadAcrossBuffer", test_read_a=
cross_buffer);
+=20
+   return g_test_run ();
+ }
+diff --git a/lib/c_glib/test/testframedtransport.c b/lib/c_glib/test/testf=
ramedtransport.c
+index 008e61e40..581b71067 100644
+--- a/lib/c_glib/test/testframedtransport.c
++++ b/lib/c_glib/test/testframedtransport.c
+@@ -24,6 +24,7 @@
+ #include <thrift/c_glib/transport/thrift_socket.h>
+ #include <thrift/c_glib/transport/thrift_server_transport.h>
+ #include <thrift/c_glib/transport/thrift_server_socket.h>
++#include <thrift/c_glib/transport/thrift_memory_buffer.h>
+=20
+ #define TEST_DATA { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' }
+=20
+@@ -305,6 +306,66 @@ thrift_server (const int port)
+   g_object_unref (tsocket);
+ }
+=20
++/* append a framed message (4-byte big-endian size header + body) */
++static void
++append_frame (GByteArray *wire, const guchar *data, guint32 len)
++{
++  guint32 netlen =3D htonl (len);
++  g_byte_array_append (wire, (const guchar *) &netlen, 4);
++  g_byte_array_append (wire, data, len);
++}
++
++/* A read whose length crosses a frame boundary takes the read_slow() pat=
h
++   while bytes are still buffered from the previous frame. That leftover =
used
++   to be copied from the GByteArray structure itself rather than its data
++   member, corrupting the result and over-reading the heap once more than=
 a
++   handful of bytes remained. Drive it through a memory buffer so the pat=
h is
++   exercised without a socket peer. */
++static void
++test_read_across_frames (void)
++{
++  guchar f1[100];
++  guchar f2[100];
++  guchar buf[100];
++  gint32 got;
++  guint i;
++
++  for (i =3D 0; i < sizeof (f1); i++)
++    {
++      f1[i] =3D (guchar) (0x10 + i);
++      f2[i] =3D (guchar) (0xc0 + i);
++    }
++
++  GByteArray *wire =3D g_byte_array_new ();
++  append_frame (wire, f1, sizeof (f1));
++  append_frame (wire, f2, sizeof (f2));
++
++  ThriftMemoryBuffer *membuf =3D g_object_new (THRIFT_TYPE_MEMORY_BUFFER,
++                                             "buf", wire,
++                                             "buf_size", (guint32) 0,
++                                             NULL);
++  ThriftTransport *transport =3D g_object_new (THRIFT_TYPE_FRAMED_TRANSPO=
RT,
++                                             "transport",
++                                             THRIFT_TRANSPORT (membuf),
++                                             NULL);
++
++  /* consume part of the first frame so 96 bytes stay buffered */
++  got =3D thrift_transport_read (transport, buf, 4, NULL);
++  g_assert (got =3D=3D 4);
++  g_assert (memcmp (buf, f1, 4) =3D=3D 0);
++
++  /* this read spans into the second frame and must return the real buffe=
red
++     bytes, not the bytes of the GByteArray structure */
++  got =3D thrift_transport_read (transport, buf, 100, NULL);
++  g_assert (got =3D=3D 100);
++  g_assert (memcmp (buf, f1 + 4, 96) =3D=3D 0);
++  g_assert (memcmp (buf + 96, f2, 4) =3D=3D 0);
++
++  thrift_transport_read_end (transport, NULL);
++  g_object_unref (transport);
++  g_object_unref (membuf);
++}
++
+ int
+ main(int argc, char *argv[])
+ {
+@@ -318,6 +379,7 @@ main(int argc, char *argv[])
+   g_test_add_func ("/testframedtransport/OpenAndClose", test_open_and_clo=
se);
+   g_test_add_func ("/testframedtransport/ReadAndWrite", test_read_and_wri=
te);
+   g_test_add_func ("/testframedtransport/ReadAfterPeerClose", test_read_a=
fter_peer_close);
++  g_test_add_func ("/testframedtransport/ReadAcrossFrames", test_read_acr=
oss_frames);
+=20
+   return g_test_run ();
+ }
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.20.0.bb
index 23a6debf9a..35482d2471 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "https://archive.apache.org/dist/${BPN}/${PV}=
/${BP}.tar.gz \
            file://0001-thrift-pr2755.patch \
            file://0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t=
-.patch \
            file://CVE-2026-55971.patch \
+           file://CVE-2026-58023.patch \
            "
 SRC_URI[sha256sum] =3D "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd=
2163fa935ff2d6"
=20

