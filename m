Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A63C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:06:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42531.1785761983669860443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bRe6Tk02;
 spf=pass (domain: est.tech, ip: 40.107.162.53, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJvNBpJsXiYcuWFTGEBYDLo/hBq2yiNV2hLEr9WiKXZBgHzKn9cu2pnMbSopJDLbyIxrvEkeMryVvWiJy42WRuzTYOexOD5MPFOXZV+PFwISLbdq46AXY6i3inpK6mD2Wm7GKs1C850CpmpAS8Tdyg8WcSxxV0jsG0vJBYPaxAqFEHRFGOE6XhXXN8BKfXDS4oBIxeCMl8sFP/To9oTw7Xxx0t0IFAanbSxd4uX7C8Zrz4DrYEdI5HtX449WEF+IIrxmbD7+BU8YQGDz2HIm9PEFIU8iYEWOjgRMF3W1V86fasCgLtr2RB5MjztBDWnCoNfbY5WlZAc0Gir488XCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+5BsXcnUqL9XlvXRHSaVa9UZZEDcZom+wPDIp8MfUc=;
 b=VJ59cJmfOseDibflbLxq0xOPVaMbQDBeOxklykjCDKZHrUaycT4PeARCuqyXfMJifhLka/fA7g1aKWRxq5UpMwra7AqyvBhv7UQ0eL67uASh4Gmd4PqZEKxbgfArAVxPWbBZe3jaL08taxmJv4RMWdKrAAqYBSNuwjJQ9mnNk4zjuTn6e/YKqYhD+pmhP5FBCWKrfLaf1mzuqajxAseINssyvdvBitQh/xm7dKrbVBF4papz2rdB7w/w19njMPjqACfBDrCF29wwnfAN3jnXOhypkZHy5ZAfVB1MG92y1UzlDnF0ttm/SwKIEal1XbGuvfxPpznH0YuCVq0Sx4xwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+5BsXcnUqL9XlvXRHSaVa9UZZEDcZom+wPDIp8MfUc=;
 b=bRe6Tk02KlNlCeD/Iox4SkAYyuI6G2SAetVqHNud9+ASYwOTRq6ZfWUpGUll75rvc2kt8oIdU2XwY8DBccmG9mUN75gxsEbEwf8tcDzGASn8w86bxTlEfDL0H654fGrfR51/obra8c2zK/+mvN/vnD45/hJclE2y02MSI6P7jZ/ZFetODHcNKmy+HOvUNrCUxo0Tg2/o0lkom+/+A3sSArL4SSAjj4Yz+PhFuR5IN1LQ7Db8lQe/+a7UpnvCmSv3p83+V0yqltApaIAYBRYhaY0hOUhRvuVpHZFCZvzxSWfw5O9E0RQESx/SnXfjV3JsdwodrpqifzWbXwds0/z/EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB9P189MB2050.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:392::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 12:59:42 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 12:59:42 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 4/4] thrift: fix CVE-2026-58389
Date: Mon,  3 Aug 2026 14:59:22 +0200
Message-ID: <20260803125927.831690-5-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
References: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: DU7PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::24) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB9P189MB2050:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1ead74-9e4c-4cd2-1009-08def15f15af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|12006099003|22082099003|18002099003|11063799006|3023799007|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lG6farCqWr8XuVognUJOcz4Kadl6KNOQM0rdDsSYpneVSPWmQhMFWo06RBbvJX1BWuWf8b9KfXEi8zP9o/6sHsUigPjjsYpheuIqZyvTTXeaKtC0PgalG4hUpm87wTPos9huu4X/wWdxDwB3Na/6FVOeKHGf4Gzdx7vUZlxUmeMWK/L5i9bbmXEtZWErFiHFVmoB2v65cguV/ZYsJHypgtdZxbSlvLjhnf1JlFfIsVqkPaCwDaL4r49lX65n0PQIxi4EgZkTABJlrfCYUyOXD4QL52SNtLiLjPtO6YRRvaluMiaQzKPgb9pMzBk/hGki+DvQSMC6qgxHckrtQTdeW12i1edlkLHhADT5qyKhvhonMumFpZwtFzW6eo/TCONWxmT5fQgvhsw8CrbIV449d8qDmFgkY+vfghRdpnkXLdxZtYCNDqVAw1LTireoLG/JEkMXxYljnsrIcyJsK+QnkXWPAlhWAFCim9shLa6dH+fDtI7AV3U69UrNIbmgXWSq02SK6latDH7RF6VUWGThwzgk6vyPb2GOubgmQn7nXxbuELRaz8jXSSRCjbrQn5e0Aki3IL/2TExFyCxtUgr789oZNbd2kaQlHBD9K/Z3PPFaSLME3MVguR0FdtNuLvz20w81s6nSag5M+10P0U7Z1umbc/LpDCdf2EV0OfRtteI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(12006099003)(22082099003)(18002099003)(11063799006)(3023799007)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XkaB9qQLRqyj6muLxeilqBM9bnRrzLsLKXRod48GlLalaJih31Ott40oEZgB?=
 =?us-ascii?Q?MSJroU1k6ZaorWK7YU/PZiY9F2k91JGF442f+4Un7AB+RrSnJlYRR5cT4wpf?=
 =?us-ascii?Q?fGP4iH3FPceZfdC/E6ilWr+nmB4sVmTDqXAFckpFrgTGkUm/VpyQS52ebOk5?=
 =?us-ascii?Q?7woFIMrNVdAHx0dtYcwNix0h56lXM0ea8157Sm8xKaow1NNGL3oqTafAGOWe?=
 =?us-ascii?Q?Z4o2mj8lLUpIsUachSkML86iX13EsJYQuyRAoUuapjatiNMsYCFJj4siYBmx?=
 =?us-ascii?Q?iPrZ8LfcM1uSELqrpjXv/JzoYiabsiXwFBkDnaDIZKewmSyVe8KkBiNg9aWr?=
 =?us-ascii?Q?OGwoO4Eh2oBfMHgLOIL9f5BTzdzKRtuLImnX8BtP7wxUpzSFYwdSy5hsMHDg?=
 =?us-ascii?Q?4r6f48qH44Pqe76VSPbQMb1hAd2OepjsUyVqAVIY2oqc4iHuR9jO8P8MgLW8?=
 =?us-ascii?Q?1GvPAHjKykqYrWwvQ9O0yxAKMQyrmMkJlROLPOCGEblhzpjgvyZm3/9viOsq?=
 =?us-ascii?Q?C3eZQd5ipwBOgpWMeR773fLIyGK0pkFNngBP/o/xp8xPwzraT4tCmy862IJA?=
 =?us-ascii?Q?x1pUllvaSLHSvOFlfi/yY414zh/y97lle2i1T/f3NgUVTib9vn9SttB2ZTH9?=
 =?us-ascii?Q?VDPN3xO0N9JZk++jbR88cMlYBeJoD48byM1k4emxd9Xjza8G8nIxsa1C+uPJ?=
 =?us-ascii?Q?kIR6yi+NsxOr+ZjhVBNqHwc4toR6d4Ppi0MVAwUu7/bohUKqI2VMRYM5JDL6?=
 =?us-ascii?Q?3a+kiGzUf2YZit6g2j17XcwJQjpKdMT3/KvtRH41n++LuIbtf6BKgfTwB0vI?=
 =?us-ascii?Q?UA47OuCLOwYBBR5BsDi2iUwy657dmWXD6+3vAVIx2NvvfTXd7JvWoIxtijR7?=
 =?us-ascii?Q?th01ePbWUtlSbUSwzM1YHXn1wvtMuzlQ+r8ha120GVewq8O5NBcYV46GPmmj?=
 =?us-ascii?Q?FKWv2/2EJheLXj8FJMElx/qdTilyjL6WavTzWMPPOCi9QmCR8MLmJkMxfyN0?=
 =?us-ascii?Q?llXLShvhQbdJ+Pekhe+udFwKOPjfz8oPScyLs9u3pAtkWxfz+lGNIb3hVZ+6?=
 =?us-ascii?Q?y3LD1Ts1j3KQYte1oCtTA13GiU0M15smuzN97p3dmv8M/DihlokNrS4pzub6?=
 =?us-ascii?Q?TiW/kavtWgM/RpRSGndAM5mshoa6pTCiQ/k4ftyPe2g7ZUChP9KUjlqxQ92P?=
 =?us-ascii?Q?Frkn4BCYMZOqxb37o4ri/pLi9Gl0JFXx1bKaaTpLZsD59Bq4YfLiqVVdcNOu?=
 =?us-ascii?Q?Zt2KcOpT3ja9UqBnoyBVcCYkaFbz8IdhmUqsnzDsKgwVPhxlxodJc/E1oKO9?=
 =?us-ascii?Q?rF55B/Ha5j4oBugnJJI0dv/bv6OxeY8LyWIx3Ve0EsukzBG7dMLqdNV9Zr98?=
 =?us-ascii?Q?P+LMI+osXXcNMhF1vMNgepk5LUZyuIkkjVwAPlIJmLHWEXbxZtOnOOpUa9Ut?=
 =?us-ascii?Q?0ZjHElBf0kxII60OYjVV2w0VgZO3MM5OGTdIPLmXXbupDEJaGiOehIzH9gir?=
 =?us-ascii?Q?FvJsqA54a5Pq0JwwVL6+tDaoQ5F8Rq/PVXXnvm0BzEl2dRfUu2xzIjYOgQKn?=
 =?us-ascii?Q?iKzJXlfS7Th+e9Det5/rrAy6pBTEdSx/yQMiJrHlLv74V32O7+hf2Znp5+tc?=
 =?us-ascii?Q?86Lq7o4FkuA/3FBGlI4WJMl5eD+gh4pT9LeAUvqHnf7dtBMUVvUVHVHB9tkj?=
 =?us-ascii?Q?FYADoKfyEZzEa9wcAVlGG+DREpThq+YpRmVv1o4NZpp6DWdng1BFsZjsfNr4?=
 =?us-ascii?Q?xFxXR/+EmIPLDEw2Llpml/OLf/ETrwUZ044fbeKK2UJpcg3j6dt3?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1ead74-9e4c-4cd2-1009-08def15f15af
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:59:42.2148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5gZkoul+v0VRzi5VNBXX5XHAceFGtezsK/s2jJAnkxOZm5BYcr09pDS0POBoPVPWAuD3IACv2s2NxeHUMmbOubZAiylRtnSMPvdzQqF/9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2050
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 13:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128687

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-58389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58389

Upstream fix:
  https://github.com/apache/thrift/commit/0ab16e3a83637711f4e0f788c205f6657=
6fd0a55

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-58389.patch        | 93 +++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-583=
89.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
new file mode 100644
index 0000000000..964a20b793
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
@@ -0,0 +1,93 @@
+From 44c46c076527db5a4b97c55f09a6f73ab9443cee Mon Sep 17 00:00:00 2001
+From: Javid Khan <dxbjavid@gmail.com>
+Date: Mon, 29 Jun 2026 19:51:49 +0530
+Subject: [PATCH] enforce max_string_size on non-strict binary message name
+
+
+CVE: CVE-2026-58389
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/0ab16e3=
a83637711f4e0f788c205f66576fd0a55]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/rs/src/protocol/binary.rs | 61 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 61 insertions(+)
+
+diff --git a/lib/rs/src/protocol/binary.rs b/lib/rs/src/protocol/binary.rs
+index 596285fb9..38f528571 100644
+--- a/lib/rs/src/protocol/binary.rs
++++ b/lib/rs/src/protocol/binary.rs
+@@ -137,6 +137,17 @@ where
+                 // is the message name. strings (byte arrays) are length-=
prefixed,
+                 // so we've just read the length in the first 4 bytes
+                 let name_size =3D BigEndian::read_i32(&first_bytes) as us=
ize;
++                if let Some(max_size) =3D self.config.max_string_size() {
++                    if name_size > max_size {
++                        return Err(crate::Error::Protocol(ProtocolError::=
new(
++                            ProtocolErrorKind::SizeLimit,
++                            format!(
++                                "Message name size {} exceeds maximum all=
owed size of {}",
++                                name_size, max_size
++                            ),
++                        )));
++                    }
++                }
+                 let mut name_buf: Vec<u8> =3D vec![0; name_size];
+                 self.transport.read_exact(&mut name_buf)?;
+                 let name =3D String::from_utf8(name_buf)?;
+@@ -1227,6 +1238,56 @@ mod tests {
+         }
+     }
+=20
++    #[test]
++    fn must_enforce_string_size_limit_on_non_strict_message_name() {
++        let mem =3D TBufferChannel::with_capacity(100, 100);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(1000))
++            .build()
++            .unwrap();
++        // non-strict: the first 4 bytes are the (positive) message-name =
length
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, false=
, config);
++
++        w_mem.set_readable_bytes(&[0x00, 0x00, 0x07, 0xD0]);
++
++        let result =3D i_prot.read_message_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::SizeLimit);
++                assert!(e
++                    .message
++                    .contains("Message name size 2000 exceeds maximum all=
owed size of 1000"));
++            }
++            _ =3D> panic!("Expected protocol error with SizeLimit"),
++        }
++    }
++
++    #[test]
++    fn must_allow_non_strict_message_name_at_limit() {
++        let mem =3D TBufferChannel::with_capacity(100, 100);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(5))
++            .build()
++            .unwrap();
++        // non-strict: the first 4 bytes are the (positive) message-name =
length
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, false=
, config);
++
++        // name length 5 (=3D=3D limit), name "hello", message type Call,=
 sequence 0
++        w_mem.set_readable_bytes(&[
++            0x00, 0x00, 0x00, 0x05, b'h', b'e', b'l', b'l', b'o', 0x01, 0=
x00, 0x00, 0x00, 0x00,
++        ]);
++
++        let ident =3D i_prot.read_message_begin().unwrap();
++        assert_eq!(ident.name, "hello");
++        assert_eq!(ident.message_type, TMessageType::Call);
++        assert_eq!(ident.sequence_number, 0);
++    }
++
+     #[test]
+     fn must_allow_strings_within_limit() {
+         let mem =3D TBufferChannel::with_capacity(100, 100);
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index 882e72442a..0128de8519 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-55971.patch \
            file://CVE-2026-58023.patch \
            file://CVE-2026-48144.patch \
+           file://CVE-2026-58389.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

