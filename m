Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CC5C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:42:08 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37536.1785926218787249639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NMJ8mGyD;
 spf=pass (domain: est.tech, ip: 52.101.72.49, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6KjEVq6ePEIWCZfMIIS9lTg+JTOmR/BeDIqw15weG+Ypplj5ZbTrafzuoTe13R65BNTTexGd9/JZZm2miIKFea1VHQBrgilHPLgKZM0L1MhnAQxre0dVUj64l/3tCSPk/2gnlz/24ZZaHs2fO/F13Qjwcajz1BRAQ3ZGecV1HdzjB5Az3FSqybBnlGYvzCmPatlEJz30u6ME9g4IHLhOkgsqPm/lDZNmu2gLWe5MmpnNE7QR8licsBmU5vEpxUKOjg4yblKD60o22NHMfvVWrd4LNnADBaCc3CQoicTWkMwu0BY8cIRP/7sVQE5eExGjL+r/O/tLkY8zUb9OMOR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPBD41pSssrRMfzvZyVGh3JB3+Ft9ZHAYU89xp3qhwA=;
 b=RrBDgy1gJXALzMlIKyOv9HYsd3GhGqDd4TmVmT6o+YCPHtXjWCSgCZRl5IXcj2meSGEhRSnQNWxQpDErDbAOzAHIhHyM7HxVoQFr3l2oaaMOU4gXayIC/Ju2B8apyqs6RpD+/WyGtNYYs5/7EixR9C86dYEA3gxysQm8vjFSlxGd8btKy7Mwf3PltQSSwRFiYfRBRgAOwVPwgJg/dZs71h7gCfksgXvZZGuYMDVyDer6gCDqKFSSzPzAyH+wN50lE32AIwEhJQGG8K0sOKb8XrDa5A7nB24/pFn62xTZPSIlaOBGOvfWh0cR1DHAozgQR8/lD0jQjOdE1C0aXz5f3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPBD41pSssrRMfzvZyVGh3JB3+Ft9ZHAYU89xp3qhwA=;
 b=NMJ8mGyDAvUwlJQXQ1TvMlaSRvmX3LjQS+xUfcBq1u1YuuASTJkTzg7DS3UhYo7ng628uPWaOjXR53l2fUJlRef8DhY45IJQ6UwyKXWQ9o+HMkyUrdApIAY7XY41A81LUG55YwY8cggDb5LOSj6xJOohQIUVkrY1A9qZlGzPpAsjXVe89DZ9UdKPIL5jJf4ul7lqCSuLaTvDgKlAnqDpZ2T6/iVfFL57Lhf/+mib9vWx45mGGNOXlHBt/R+5yZd1gfxqvyM/+rORAZx8gHvViwuRdasq819xsuo/RBTdTD9OFjVhYu2KcL4hn79sI1ZybjhbvmUPtENE8KqahwxTOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GVXP189MB3386.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.5; Wed, 5 Aug 2026
 10:36:51 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 10:36:51 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] thrift: fix CVE-2026-58389
Date: Wed,  5 Aug 2026 12:36:45 +0200
Message-ID: <20260805103647.983431-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GVXP189MB3386:EE_
X-MS-Office365-Filtering-Correlation-Id: 597bd527-993b-497d-49e8-08def2dd7602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|12006099003|18002099003|11063799006|56012099006|3023799007|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	FyAD21vaNIMnqVQm1JxgDILaQZHOyN7mvyduHKR8yE3z9Ih5AkpIaO8OABr8BzjFhn6pexYP47ZH0hW2XspDW7QT+x0IKIm6/FBIKFcTHYT71YRhLtPeVYpk7QuNA+ULPUu6sJJJ+BG0uEevFJssNCaZVJV3JLwGIuX5dqb9lxEyySCu5VZZxdytEmh775DS3zjVOsU16hQFglSAPmZJqEQlh4K1eCbrv18LEtBAdD3PCAUSqGWHiN819qnE8zEP7rViC6eXFob29vQ0GTRJHDkdrziTqEKXd/fP7c9xqpoDyfsgSG3kH1+cUUnw9Ieu91fOhQ56ARAKnosYHM1A9nx3UJb4fKluGuPCoeCVrN+HrwY0mIPqzJw9SMQB01riNFxwpPVsMWzrhP5BGo9g0/2HtldFiZfzVCxlv1frVtb+5FYrcbNwATkE2gqNYkbGwOyRWk+DVibRKnA6BYZKrnYhAhhsPbaFCSOsfUFqRdwrh6Yq/3/ACsR3aOG+uNq7ST0NmsC1SFlVJ0l4wwGvpRzj5V9bSDgnrpoVK53HszWnBtnnnXfdZjCVHTt1L9ClXAFQOqucARh1wJua57ZIJuf590zwENEQ3giIrJ52pyKLtsyxk0DfMGbR+Unfnh1TxKekrq2KXRur6KWkyOUev2N7NNZO8gjs9A4QnF3+jmo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(12006099003)(18002099003)(11063799006)(56012099006)(3023799007)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hRT3N0lV++NaluN/t4FizIYjo0YJk/JdlvLXq3BCS8zX87tb+GrSqrrkUUg7?=
 =?us-ascii?Q?nfevlUOqJJxf9fb7DUoZFxLmCjkFS3okq229dOPd0FdABJ/+eS8bUglinv4A?=
 =?us-ascii?Q?/EK5jm7XuFNXs/+iSvzvNHmFOWCFW0xIC+CNnPp6rhYRxQRbzBuMjlTIh82O?=
 =?us-ascii?Q?H0CzT3RDE5iSZdsQOb1AOvCdIYarzlbHiUQWxv0ZfiYXeeXEJiC9M3teqccy?=
 =?us-ascii?Q?CKmSAgPaPcHm2EMtdchShoZk523MvmkgDf7cM96TPuQr2vCR/p6uv77Q35GW?=
 =?us-ascii?Q?kbPzDTduPtOLOhPZbbdq/Cz3MnJkOcKyRYf8g13GXO2AnefDZNssgz1XOesI?=
 =?us-ascii?Q?t7uLMv47I9UL1IH4OIGkwyjHZlJH2NMQFByvVFkt96YE9/XU/hR3np2R5vut?=
 =?us-ascii?Q?UpJ0aODiCRuw27iZuI2eJ6mSj98rW0RzoPI1Zl3qWX0KUANaEkuYGWxYBila?=
 =?us-ascii?Q?jcm1VTOTLkNbSDQz3QD26IzggUFUAVqSoFY0C6v4BoAO6g8Wkr9zobbqP1f+?=
 =?us-ascii?Q?BHcz3iNdtLUmjXetbeVXIO5jz0OeG2pOUBsrnSCu8NZnMACJY5s/50I2AyOv?=
 =?us-ascii?Q?OIyuISw2WDwIBkvqe3NRCWwJhYSKt+lxA8D/bEITjo+Gdbtu7ezHtyc8M0Wr?=
 =?us-ascii?Q?bfhUajEknR+mvrh2F865EKA+/ujPmUX7ChQFJMfZuKExorz74UWG30BXZQg/?=
 =?us-ascii?Q?YTj9nbWXzm92t4I4xYqQq86haM7Y3xNFayXafitVYdsgHquToXaFo72DZH9p?=
 =?us-ascii?Q?fMYdc3kkr+gbGV6pIbFgIX1HEMWSS2xVukOXj/dBYwMT1FGaZrT5/mscBDqZ?=
 =?us-ascii?Q?j2HcoYHSQlJ74ksemrXIOq9CHrIJkM9P0MyyAufGwqfNBjiyUgyBfddObYlY?=
 =?us-ascii?Q?B10lulk/VjawQ+dwmbQ7k7ipDobuNG7NOXJq0wNKGL36qs2zIwevERMLasFM?=
 =?us-ascii?Q?fm1CBBOOSv0fqVjyu6Z9ifVMUC+JeGqxdw22+sG7aaSTH0lYNswMgdASlcyY?=
 =?us-ascii?Q?aQToqe5Yyf+FeKNGJDnqmokHOfWmCBAaC4aGWiduFp/5ijwbXo6aN9/IwugA?=
 =?us-ascii?Q?OupzGz8igpLkqgu5BVBWa4S0f/XI1VKGzkf8jqE1i6mtGoA5yt7PUP/1/zxr?=
 =?us-ascii?Q?u+vwmlfIrTYMS7Vfmx3Xni39plsgiNrB1OHOn4vM/SAsmRfn5U24C0i7lUx5?=
 =?us-ascii?Q?ltpeeTUQBiw4tNC7Nsj+dnlrKWy5JvIk/JTWhJJEcgbNDk56vzyyUWs6abd1?=
 =?us-ascii?Q?TYbkhhHo4++2DgoQN2NjbJ4fln2KMRjKQbFnGd2NF18PdbwWu9BSoJUmp1ns?=
 =?us-ascii?Q?0xRebHNAU8SiW8HvNO7HMmrXoYymQ7buVtAKTj9wDjqhD34SesLJIhDY0pNT?=
 =?us-ascii?Q?bYuGxTNnsnMtt4Yjj/Fb+O/lHTr93FMojZkrqSY7f3iX1g2UjHOTraTSx92w?=
 =?us-ascii?Q?7nSAn4FVmR1R1Pi3BpzGTn15pn3eIGW8R5BZCp5oQHIhJwLZD166yRF/M7yq?=
 =?us-ascii?Q?3d95YbSGZYPF6ioAyTYjTaanwdr5dkfkkHzrxYidMCWsfbB+rKXsxvBYMsxg?=
 =?us-ascii?Q?gu5OBD1XEqGw3++4VMqGFCxd+lQDlWFwZbhwukPt9DE9t3LnK1FnNURKpV8V?=
 =?us-ascii?Q?n3+24uAZIh/JjesnTs8rVtVLEAMZra996tDpyfs9s5HlRKKPs7U57ItGs1jV?=
 =?us-ascii?Q?m/LpTvCDIepeNnv/vCsZiEQeAgc/qVBICvMs6aVNXQTi1CaPR+YQ6Gip9So5?=
 =?us-ascii?Q?y8NVx2VPx4emzCirqgfdon+qeQqULQ4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 597bd527-993b-497d-49e8-08def2dd7602
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:36:51.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sO9LBrPTlJxPYuQZxMt+5LbxQuQim5ULZfKaT7L/OiCCvZ/rZ+JnCIs7UcHK3bGG+Np54qEKWc6VLtDsamPPGMvaLJ0VEPQPgpTzPfo/ZC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3386
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128809

Backport patch to fix CVE-2026-58389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58389

Upstream fix:
  https://github.com/apache/thrift/commit/0ab16e3a83637711f4e0f788c205f6657=
6fd0a55

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
- Note on CVE relationship: The patch series that was submitted (https://pa=
tchwork.yoctoproject.org/project/oe/list/?series=3D48481) contains
CVE-2026-43868 fix, that introduces the preliminary container/object size c=
hecks in the Rust client, which CVE-2026-58389 further enhances.
---
 .../thrift/thrift/CVE-2026-58389.patch        | 93 +++++++++++++++++++
 .../thrift/thrift_0.20.0.bb                   |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-583=
89.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
new file mode 100644
index 0000000000..558969f9ce
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
@@ -0,0 +1,93 @@
+From 0a95520b91c1da608e5530f4299c3b4ffb4b550c Mon Sep 17 00:00:00 2001
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
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.20.0.bb
index ded6800bbb..fa01e72ab4 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://archive.apache.org/dist/${BPN}/${PV}=
/${BP}.tar.gz \
            file://CVE-2026-48144.patch \
            file://CVE-2026-43868.patch \
            file://CVE-2026-43870.patch \
+           file://CVE-2026-58389.patch \
            "
 SRC_URI[sha256sum] =3D "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd=
2163fa935ff2d6"
=20

