Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097BAC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:06:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42531.1785761983669860443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 05:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CH6IiGy4;
 spf=pass (domain: est.tech, ip: 40.107.162.53, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAPcuAcaavO1yeJa+D7XyAsYwm+pKCdmmcngfklk4aU6x6LgqoDs4bFvAduIfy+VNTaXawL5m6R3WAwkErgkdF+OOeFqaBrXQGquQ08kGdH+zg5bEY0x4pcv9W/JdP/71BbZTF05SCRTF2+wilzERbHz0NuQLiaRP5OIF1TxXoOj6QwdkTLL/Oq84UGa8tSogz6M/JXi5B6B/TXuUny5n/wfPzzs+dS8BlxW1/fp+s1wPs0GXmlbz3YP3Cakdxn0sxgbEz/srnAcURHZtXlpX2eJ2yziCJchgpomoQXUukRJLUY7AKXe9l5/AJd6h0ncBB/DojLvKZxARegVj0QNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtJ5tEP2twYceOZ/iikDOSWOo+hi98SSGUm7T8XLyMQ=;
 b=kk/6iqwinMconRX4GL7LvcDht8ivnnbGSeuh9Dr4MU0kzVknA4uvXDUdfk+wg7oKf7DpIa2aNlDw+kThVo1iZIBvaa7QhY/xGqDE8byeOIvtc5sDhHuqcDzeBqbu0HSOVxSrvtsfymqPvYjSkbO3kUCVwf/U2pStS0pmWR4sGniS7RKEaDNKkZR1wgqKGRYLGvDcaXe8rquGoCJ1JzVfV2sfMsHV4QuE5TcZuNIHtK0/mXfZkb+lZSUS4lv4CKDgBui3TgOsu+kCJnP8kucBg1/GuhHu1xl4ojJuajsYCDW3PKSiGjIT6PRnm5vlqFMStF52s+ARnLtKBXUpf5I0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtJ5tEP2twYceOZ/iikDOSWOo+hi98SSGUm7T8XLyMQ=;
 b=CH6IiGy4KeAx2CxoGgJqHC87xkByx0CEj1KuEnxOTH/1siUsgclzkhKou7TkXRO4TwWYHVLA40XUgDxV2I6R4Dxhsqa6BdJDdaukgrOYpjY3bYp6OMi0/IGzkFHTNb8mLuMGuF1r46EEF2b+ds1UeuVmxaZz2xqOoZoiPFwTtWmpcLC7SDXib7XU5ld94pV+Jkop8ga+ZXt+jtGYljAgUNJ9UuZmWZ2sesLQI1UqaJ2vFqsg5Z4tHucHkeCyPK5yOMp2WSfNb4Fthiyd77nxPBkCPTVdLvoZMnVn1tk50r9yJ34ykp0GYWwaWx8XNHNrm1npC3WdeMzuPZXoCHiI5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB9P189MB2050.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:392::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 12:59:40 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 12:59:39 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 2/4] thrift: fix CVE-2026-58023
Date: Mon,  3 Aug 2026 14:59:20 +0200
Message-ID: <20260803125927.831690-3-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
References: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: DU2PR04CA0156.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::11) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB9P189MB2050:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa10ba5-729d-402f-3051-08def15f13c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|12006099003|22082099003|18002099003|11063799006|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lzSMukF0s089PbmRBt2HZpXUxIeCZmwLK65vyYPJ9sMN2L8zizh7m+K9Bl2CcG6MwddiUGKK3AdHiI71b7ps4dzsR0YB+vCusYukytHf2XFFCT0rnJJLhfNIReGoePeb2boC5muJF1d9NrvkRtsFv6xQ2sSCfvErVBykTbjH+N7+MZq3lXeJsOt4nxdEFjWJUqS7dyFsvVgWiyYXM/h1xgixmWwmw+UOp5438iRoVnUI6WtElZj9wfXILCxkZUVtu/ablEr4o5QbzkaFm4l4Kog5vjLWRDjIi9uLVBaashG5XDwCpFcP/kuA5Y2ijROClIa/8cptdrzpuHxhkcRRjhe7J/OUFc7om8YxOxXIy2R/2MrY36OVWUTykZh7RT+4Z4LWvefpt53QWiLoB5BLW7S/v92zp1Mkm/y5YXfHDDupFVqw4Rbk6uPyfbg24zGMl6tlfJFYppi0KW9hUZbiyQsSrjDo+KIM2acLrtSyH2hBgMdTJuLo+GWcbf9Dz/KtYuThBBuGgICe3KpNdsRUYMXyiMBGoZ+fZWWohti0kx4Dtso1d2nUrhH3ZiAok7aujmrRxKNbl70Jn/FJZVWk6WdLK3WRrkZ84hfqD5kPkzjMhZTjei5jQeRviyQ7WnpGZpuK7NfvhEtSLS9/eTfmQ1nroImQzto8hvfpodLEXEw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(12006099003)(22082099003)(18002099003)(11063799006)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qMZHvQ1uExDtaJi5TuAz+dWQDVHvtDS3mh9zRpadlD19uCE2majN5G6yttuU?=
 =?us-ascii?Q?craryqb1PogZ2q/JSf/2X4InzEMtUYDJ+Y/ukpNiX/UhqwqjsfHAeoaTd061?=
 =?us-ascii?Q?GcW0eNBz2dx5TORv8fl67qHgCjoz3rXyYOd5OFmGDxftolE0f5Hh5EwRypza?=
 =?us-ascii?Q?8zhDoI+kYN9WyTOEDzE9UUx22MvwAOIt07IOIE5Bn96Kz0TuHxBGCqJ0TE7M?=
 =?us-ascii?Q?3eu0nKxlQZ+wsRovEQVK8r/9TEEjd9vglMegs35AUdQsaND5kFPGC8XMxp3g?=
 =?us-ascii?Q?T78y84jLDnrnvL6w2C64cnmk2UDIfBqsMfeTDkvoER8lt5n4GUs9T1oK3KWo?=
 =?us-ascii?Q?EQSAkKtX6NWPOwM7fwvVenHi/XuVj1UHUrbYE6GJfQn6XDPEZLo+5lJqRhfh?=
 =?us-ascii?Q?vCl3f/4w5zWYZvXRvJZ0c1Tfmd9mJnSXgiUIwmGZ2KUnK0CyypY0NTD7jSRl?=
 =?us-ascii?Q?A09HDn0KEwxDRwET7VH5bQ3y3QSymzUEhjFWSJSosraNM+oa57zESK5Zsc0j?=
 =?us-ascii?Q?9r9ZbofQmtKRovAtMzqax/3TH4l/N8KfGV2qm931ZVs0qO+2v7nAsspVDzzy?=
 =?us-ascii?Q?PpUvL0CeEND5k6A1GG+N67DU8oEe4tssAmYNVHAfbAijlKW7ymC417ake8dk?=
 =?us-ascii?Q?bDiYHjNfT5OCqkByAZ1SCbSwhm/NOoxAW5FQah64C3ZxTBPQn8sGAR2dQNRm?=
 =?us-ascii?Q?+JkvY/M+3oFcMnvCmBBkK4p3ets0fssPGOl5dFJDIM0DCiUk6E1ZHzmpOUxp?=
 =?us-ascii?Q?poz/YkXxtjbe/Ks19Ngiiu0j1eqNPswLZrL+bu7hOF9aUwSO0F6AMiLR8a/H?=
 =?us-ascii?Q?9qWuu71qicmuuhxv2/OFcNkwcsa2uZBQmqKcayKOAjV+bL1xqGDh3XQ+Q2jl?=
 =?us-ascii?Q?QlakGMbOw1b8RD7zXErMdjQafqgB9LYZhTe4+FOtY62aufxBfEf0baun8hMK?=
 =?us-ascii?Q?evm4WQOLiInmeVC329FvNCQCxAu9ZZk5zFgxqABSVKyaI564fchvbrZveOJn?=
 =?us-ascii?Q?boUfKeW+V3XHXrYrEPKpMJ4ETTWeXxG/IB3iM34rKRahLLjlDsdUXvO86KNS?=
 =?us-ascii?Q?J8HOexaBmA3i12HUALD7wyCdBR4BWXa+I82JY3k3XHrZhjwxj7FXMStbPDnf?=
 =?us-ascii?Q?nvpVyep+hhcvZ76MhZqLrEBDZDNYWuODgQOEgs5k/w4hV3Wo8YABtjzKWkn2?=
 =?us-ascii?Q?6/VHxKXfXOhHA2RNe6634qTxidvGb8AowR6+LuOBFYjKvXcr6CFWJ0NPxf2j?=
 =?us-ascii?Q?urjacAxusTJlDJf7vONvrJ9r6jcNe+qKmPVqXkk6OXSFpdr7ru2eIXnrDY8u?=
 =?us-ascii?Q?8girttQcTpGTM5y0pNPqZn+l5B7rOmAelVQ4Q2Tw5vWDqjyIS/ZI7X4jsc9L?=
 =?us-ascii?Q?tnz1KnQE9Xf9i2InPphYN+GLFjcBP6mga3xQmIe+xJR0P3nrGoOhPIyuXRyI?=
 =?us-ascii?Q?0BAAE/V5630JuBpTdCb8JQb8c/haGkZdnErUNLLFuE9Pf4oBs4AskCG27N+m?=
 =?us-ascii?Q?NYJTvozGN5PRD5Rc/hCExy3mR/Fns35GJsrkZw6Ak3N4aBf6vNYEHb/wYeKV?=
 =?us-ascii?Q?nEMit/ORt1bThj5+VPUUxIz1byQFnfCiuVtLkX/nxJfWZcq7e99YXnnIBrl5?=
 =?us-ascii?Q?O0T3/A+Z3hOc0Tu7JsUzFq7fl9nirIT62L9WZjCrGfkV0rDKSdoK4CJ2mMND?=
 =?us-ascii?Q?dcs7LsZMn0VGlhh6cxq8klG4F1PgBgyd4IprQ5fNtimgd4dLrYXbbZbgcyMD?=
 =?us-ascii?Q?cY8E3l46ZUXhgEtvZho4pqWlOriLdZzT0Fu8kzhgmpjAJ6f1BGMA?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa10ba5-729d-402f-3051-08def15f13c5
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:59:39.1504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMTRBrbbUmhxFWZP2EbQZivfB3BnYDrQcwQETP5ICpeIjRYIqtoR7QEBMFKvojCLYdxIZMQV4uDH0BSgdMUf8EKyRm5qz2O1gBCZUVbUCJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2050
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 13:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128686

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
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-580=
23.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
new file mode 100644
index 0000000000..e3535fb108
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
@@ -0,0 +1,231 @@
+From 2f77969e8f841b225bd74bcfa4eeb341e78c06f7 Mon Sep 17 00:00:00 2001
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
+index 0a5f220ac..a879d9881 100644
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
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index 26849da0c8..b3f420bfe3 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-43868.patch \
            file://CVE-2026-43870.patch \
            file://CVE-2026-55971.patch \
+           file://CVE-2026-58023.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

