Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26324C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 07:48:41 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29640.1788766964563572350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 00:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JuBBycLH;
 spf=pass (domain: est.tech, ip: 52.101.69.65, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky8O4WTR5OnULc2HUaZJoGBLoFJ+iag4jHDu9cxucJ9loUs6KWBoPNSveGjCaI9HIRBzPPNWThEfFXUXUeAA59fRijHXSQBBMMTjeAvq17GNLSb7jKuF/SKOBIYB6RlAoRejU9Z62O1Z4TeFa7IyCMh4Ab2ezb1A9u9r4yHbl3aRxCe/eIupLa9lwixqlnPGxR4jm0eq7q5KyfHbzKs9gwyN81sJnsnFqCMKwvbupSl+sgAn9Kka98gig39DtlOVyGmCdtodEBmusKLFxdNRlSnQutnXeULMk2J9dlPbGWVhdiTbOWxeEkBIQ+bITgUJVED7m967wmEXngUkiKCIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzFeVZ2QdepWDtl/9OsK6w5x4bFyp31muuVyxK3h2Co=;
 b=bosR+xcX2i1fLqp4IPWM6k+FKN5ocrFmgFm8ywSs5vTGJupC+k9vdlcVrD6zdHtO6cDQT6jOgnkJd9BY/QZASO3xW0gHAEZOa/l91HJlaRHSUH5O34s/S+l6YCYF6GWIq8vJk0tyOasaVqkOadobHwhWFP2kF2q/yQC/irrcFgKQGnFx19jBIKIa03veewHBpw1XWUpQQNIG13lIelAZYTG74Cnte/vGIYmm2pDH+3NVq6iuJeBHtdArG7uDqgVy/A+MsuLS0kf8q5Ety5mCxffz/d9JBikwyJMyBuSwhfRXyqimv3nBQ28uZoHPMWFCCvBOJL0MlSNsuibA4JGdIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzFeVZ2QdepWDtl/9OsK6w5x4bFyp31muuVyxK3h2Co=;
 b=JuBBycLHJsGEzDybOJ+D9I4gkWyzQo/Novrv3ie17rKV1LGolYIcDOGM4jwhhw4njGvxlAEnRnFykGdbExOoIipVFMWbpXGilKAHW0CvJIsEQ7O1Vudv7fOfM+oZV9v7+7edlDkaPL9vwW0KG0QmYP005XC8dHPKzOCAXjwlG+pPTJRJQwWjvyfnmJehqmJgVnzU/1iepyctOoajJuXkQnKqbC6R7jzStsDLofbRuWVbsu8lR70fAERFkzMXaRVMJNE5cwCat894BtJhPt8JmxgSPLAQq9t+ppujAPnBZltbsZRjwmXedlZSSD7N2X0Nhe4O9jbB77Q33G67aP0RMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3558.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 07:42:37 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 07:42:37 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 2/4] thrift: fix CVE-2026-45112
Date: Mon,  7 Sep 2026 09:42:18 +0200
Message-ID: <20260907074231.388316-2-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907074231.388316-1-adarsh.jagadish.kamini@est.tech>
References: <20260907074231.388316-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: LO4P265CA0201.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::10) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV4P189MB3558:EE_
X-MS-Office365-Filtering-Correlation-Id: c667ccea-a6e2-43e7-2827-08df0cb39694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|10067099003|6133799003|3023799007|22082099003|18002099003|12006099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	WEEap+0Z2G4qO9W8B+ymC96sf9AWbcwlswDtkIMv23IucJoYi2D4bRlfxF0Qi/JAIdWoayugbfJ8/g7Jw0jXtMc/ommrro2cyFj/GVQf7n1ZkA2SsfRxaXKOl1UIdS20VRI+UJDTNppaNnmQXealWgGeihQOH3CX2WTyN1NgjMRnK4HrDA2PzyUn1ZkvbBTJ3WwJp5DN073JK9coXTVIqGnwMCZ+uTnbA4ptBins3loLCstkf/vx/4KttDyMjCg+5D+5ar1loWrh9HKXF38oDkGcrZAEugkS52PR7+tTHxp7tKA3Q/TVzPM6XKGKu9F8DAUcYo+snpeo5HNV9UhKJLZHZE7vQXuljioJ4TTkWU+0DTsSYUR4VcvN5Rm5UDnfEuUYMi3VpghKdpg8PhrKSlpO85i7/RleZKCZah7vJ57Y9bZUmpNfHKAbE4Fs8T0XhCBzEDcJNy4hbAuBbo90poMM2CyRF+R7e5AjqknEnPh7rgm/ri+2hlW3aEpPJesFxdCS1nTMsgr7sQIwaGvkKlA6TXOxB1qdh60J96Wr+mPhQ2qFV5PPidlwakpPsj9ZO0PsJG/uLYJun3tTa15SZzmd7zre1Jlv7FJ9AKri6P7xtbYVpoAbMyRM/j65ZiUxWFudPVNk/MyG1l01PC6XJN40Frve+50WNfgZhbKK6RE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(12006099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wg57bgQjXLz63iYRp5vi+wYUwXRsm/TmWIf5jxzXW6sW7KOhrm0W1hbBKLdb?=
 =?us-ascii?Q?zWkxuivcJQyOb3WEJemE4MHmvYM+JI58fI3CCDuIOiYGvqDqUaAy/8yiojOh?=
 =?us-ascii?Q?qLUXbWbbCyL6fXyhr3we9yAeUeqxmfkQiZWBBZchux2hxDqjQsC+VhM7rx9G?=
 =?us-ascii?Q?cclnZncsObC0ERCXNQalqmZsmzwuILrE/+CuqhadnLd/Jqrr1SmsUtJZrO6s?=
 =?us-ascii?Q?ZOhM4PiC2YQt+ZN2ufYroEJ6S1oV7rHz9rOhhLsEZAKGypLmzkiBjX0c1iJj?=
 =?us-ascii?Q?87Ji6L99fNGFujfQWRSv+JGl3VNiETGK0+5E5j9ablB++MT9/VasGzu9qBcf?=
 =?us-ascii?Q?rnagHIDVQCt5V6Tmq7+OYKvTLv1McRHZwMiJIhyj6CSr+5Sy2q/B7uAukO87?=
 =?us-ascii?Q?808WE3t947iuI0AeAZAztbjuGppLrKqFSiTfCjPf6CG0t2svRppBZmscy0mH?=
 =?us-ascii?Q?zhReRXah0WIr/P5ozM1ZTswAWOiR0Q1J97aUe8Od6mQ+VaJzaK/7oNgZxv7d?=
 =?us-ascii?Q?jZHMfq5hoLNLrevf3Q3ayVm9gcTjPTUgRM9hEOL2sjD2CQHmJac+wxEgOI+U?=
 =?us-ascii?Q?xhxkqMQVJsnGCv85keFvMWHpKJiZqr9XbtmIGZQL7gCV/qT0Q4DrdCi2jgj7?=
 =?us-ascii?Q?ctNAxUfZGFX/W1xtVsTW+BsSTXDKxnqukyWyVKTnQG+KpxCqFGm5OA6eQujx?=
 =?us-ascii?Q?WEhD7zBN8y4GLc0csk1RZRH4ix+jf8HAQR0omRJgGf6vG+Q7sRAgKlqdU2yL?=
 =?us-ascii?Q?TZmQilrLiIwBXogB1hitDGeCEddsjRov8OjPvn/pPuBNCf66VLij01gxcGre?=
 =?us-ascii?Q?KodJyIH3NWvf2w0G2BPBMYCwUbEK3ysNdmyZ+9zA9elLu74MMJ65BJfBVR9M?=
 =?us-ascii?Q?tTjIs6fEY1Ld42jU7Rhe/nCa8ZPtD3307gxtNL3KYFxdeuVAd+n3LWP23M1A?=
 =?us-ascii?Q?/ryKOwRp0u1evLkk4/WwX/wLX7MG0UZ+yPa3vZ2Dkc9iUcKSehhg+HyLsnkr?=
 =?us-ascii?Q?/YigxC04LYlesFs551KKRrzmFkRM+au/l/uEO4nyQ80BNKHJVZ8uw1DftXua?=
 =?us-ascii?Q?8tfqyS3XuH3HUDcrwWOywrm8qeAi9k/mur+Fi/Nq+r0dybt7Bi6cQ5NMxyvX?=
 =?us-ascii?Q?Ed+6HKf1oQXjgWayN3jRWXaggcta4PCplqafX4r6D2gPFwc96YgxFW86lh8O?=
 =?us-ascii?Q?xVKJWTq81F1sDr+MFHJXOnjufx6dOJ4cFmFZmfyi6DY5vkJ6knPuwCb6hLlG?=
 =?us-ascii?Q?uPurCgcuzGLT+3V+RWEdIH3sATicWEAo0cOAxN/nN7prnZYy1kVL22y8lUkD?=
 =?us-ascii?Q?edVWBxV7jST1/N92vRX2MOCvTKi+9qfXqIepH92MHWCcQUUe78wY2r1Pu1Gy?=
 =?us-ascii?Q?0UbhiujHWlUC1gqTle8R7pmrAinBRtu1WXDLay9X4xlAgHIUCC5v4M1UQYxL?=
 =?us-ascii?Q?QvtCBtfU0/LndcdmcSXvCoHVALdKQ374s0Ih+fe1eoZHoV8wr4C+dZoAY25w?=
 =?us-ascii?Q?TPJ9qNJyj88KReHGnuZiiDFX3/m8zq/c58xrZg7XYF4N/x/DDyLSZaFuFkgW?=
 =?us-ascii?Q?XMxlqq3Y3uQCtsAmPjXLZitIdgarK+HznMG9NpsNKM5HuT9MlqNjsISS4YxP?=
 =?us-ascii?Q?AEK/XzvULNYhxdqbOwOekNcYCWaQ41j3F7jEl2xzZ56uBuMCEy0RQaowPT2a?=
 =?us-ascii?Q?3CxlRA7//usAjGSQPRfvZex14k7GSCr6zNjevk+f5sv+PmHTQaiGajngEseF?=
 =?us-ascii?Q?9FIODWPGZQmCj2h1yzSMpRRlIifGZ0d/C3cldzZzqS/ohCxrXXFP8kYyGVmt?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	uLNkplR2YIBXzDQytfVLTu/YDpmdFv5Nt8+rpzeP1MyuRXyy2r47KwDw
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c667ccea-a6e2-43e7-2827-08df0cb39694
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 07:42:37.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCPAiJMtFtTaXHLhrqM+L40a6YA1Ru7kEZ31jGfvDKikgccGoEUoNW6UdhZEwkdWCMaU1SObSsEX8Xo6Yc3URhAgK7TVqbsixwHoFUfEPH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3558
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 07:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129804

Backport patch to fix CVE-2026-45112.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-45112

Upstream fix:
  https://github.com/apache/thrift/commit/16b3673827498d1f4b05f8026d5d580b8=
e8f5aa2

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-45112.patch        | 306 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 307 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-451=
12.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-45112.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-45112.patch
new file mode 100644
index 0000000000..7e4fb78911
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-45112.patch
@@ -0,0 +1,306 @@
+From 4d68f215f05905a19dd43865fb97d170b4fc1a3b Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Fri, 8 May 2026 21:24:30 +0200
+Subject: [PATCH] Add message byte tracking to consumeBuffer() in Java
+ transports Client: java
+
+- consumeBuffer() in TMemoryInputTransport and AutoExpandingBufferReadTran=
sport
+  now decrements remainingMessageSize inline so fast-path buffer reads are
+  counted toward the per-message size limit
+- AutoExpandingBufferReadTransport.fill() resets remainingMessageSize at t=
he
+  start of each frame, matching TMemoryInputTransport.reset() behavior in
+  TFramedTransport
+- TBinaryProtocol.readString() now checks stringLengthLimit before the
+  fast-path branch
+- Add TestMessageSizeLimits covering all fixed code paths
+
+Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-45112
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/16b3673=
827498d1f4b05f8026d5d580b8e8f5aa2]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ .../thrift/protocol/TBinaryProtocol.java      |   6 +-
+ .../AutoExpandingBufferReadTransport.java     |   6 +
+ .../transport/TMemoryInputTransport.java      |   7 +-
+ .../protocol/TestMessageSizeLimits.java       | 196 ++++++++++++++++++
+ 4 files changed, 213 insertions(+), 2 deletions(-)
+ create mode 100644 lib/java/src/test/java/org/apache/thrift/protocol/Test=
MessageSizeLimits.java
+
+diff --git a/lib/java/src/main/java/org/apache/thrift/protocol/TBinaryProt=
ocol.java b/lib/java/src/main/java/org/apache/thrift/protocol/TBinaryProtoc=
ol.java
+index 99c3e9302..49e82ee8a 100644
+--- a/lib/java/src/main/java/org/apache/thrift/protocol/TBinaryProtocol.ja=
va
++++ b/lib/java/src/main/java/org/apache/thrift/protocol/TBinaryProtocol.ja=
va
+@@ -458,6 +458,8 @@ public class TBinaryProtocol extends TProtocol {
+   public String readString() throws TException {
+     int size =3D readI32();
+=20
++    checkStringReadLength(size);
++
+     if (trans_.getBytesRemainingInBuffer() >=3D size) {
+       String s =3D
+           new String(trans_.getBuffer(), trans_.getBufferPosition(), size=
, StandardCharsets.UTF_8);
+@@ -465,7 +467,9 @@ public class TBinaryProtocol extends TProtocol {
+       return s;
+     }
+=20
+-    return readStringBody(size);
++    byte[] buf =3D new byte[size];
++    trans_.readAll(buf, 0, size);
++    return new String(buf, StandardCharsets.UTF_8);
+   }
+=20
+   public String readStringBody(int size) throws TException {
+diff --git a/lib/java/src/main/java/org/apache/thrift/transport/AutoExpand=
ingBufferReadTransport.java b/lib/java/src/main/java/org/apache/thrift/tran=
sport/AutoExpandingBufferReadTransport.java
+index d59c657db..53b35c207 100644
+--- a/lib/java/src/main/java/org/apache/thrift/transport/AutoExpandingBuff=
erReadTransport.java
++++ b/lib/java/src/main/java/org/apache/thrift/transport/AutoExpandingBuff=
erReadTransport.java
+@@ -39,6 +39,7 @@ public class AutoExpandingBufferReadTransport extends TE=
ndpointTransport {
+     inTrans.readAll(buf.array(), 0, length);
+     pos =3D 0;
+     limit =3D length;
++    resetConsumedMessageSize(-1);
+   }
+=20
+   @Override
+@@ -70,6 +71,11 @@ public class AutoExpandingBufferReadTransport extends T=
EndpointTransport {
+   @Override
+   public final void consumeBuffer(int len) {
+     pos +=3D len;
++    if (remainingMessageSize >=3D len) {
++      remainingMessageSize -=3D len;
++    } else {
++      remainingMessageSize =3D 0;
++    }
+   }
+=20
+   @Override
+diff --git a/lib/java/src/main/java/org/apache/thrift/transport/TMemoryInp=
utTransport.java b/lib/java/src/main/java/org/apache/thrift/transport/TMemo=
ryInputTransport.java
+index 375e2b72a..2fff0dacc 100644
+--- a/lib/java/src/main/java/org/apache/thrift/transport/TMemoryInputTrans=
port.java
++++ b/lib/java/src/main/java/org/apache/thrift/transport/TMemoryInputTrans=
port.java
+@@ -96,7 +96,6 @@ public final class TMemoryInputTransport extends TEndpoi=
ntTransport {
+     if (amtToRead > 0) {
+       System.arraycopy(buf_, pos_, buf, off, amtToRead);
+       consumeBuffer(amtToRead);
+-      countConsumedMessageBytes(amtToRead);
+     }
+     return amtToRead;
+   }
+@@ -119,7 +118,13 @@ public final class TMemoryInputTransport extends TEnd=
pointTransport {
+     return endPos_ - pos_;
+   }
+=20
++  @Override
+   public void consumeBuffer(int len) {
+     pos_ +=3D len;
++    if (remainingMessageSize >=3D len) {
++      remainingMessageSize -=3D len;
++    } else {
++      remainingMessageSize =3D 0;
++    }
+   }
+ }
+diff --git a/lib/java/src/test/java/org/apache/thrift/protocol/TestMessage=
SizeLimits.java b/lib/java/src/test/java/org/apache/thrift/protocol/TestMes=
sageSizeLimits.java
+new file mode 100644
+index 000000000..ab12a0f70
+--- /dev/null
++++ b/lib/java/src/test/java/org/apache/thrift/protocol/TestMessageSizeLim=
its.java
+@@ -0,0 +1,196 @@
++/*
++ * Licensed to the Apache Software Foundation (ASF) under one
++ * or more contributor license agreements. See the NOTICE file
++ * distributed with this work for additional information
++ * regarding copyright ownership. The ASF licenses this file
++ * to you under the Apache License, Version 2.0 (the
++ * "License"); you may not use this file except in compliance
++ * with the License. You may obtain a copy of the License at
++ *
++ *   http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing,
++ * software distributed under the License is distributed on an
++ * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
++ * KIND, either express or implied. See the License for the
++ * specific language governing permissions and limitations
++ * under the License.
++ */
++package org.apache.thrift.protocol;
++
++import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
++import static org.junit.jupiter.api.Assertions.assertThrows;
++
++import java.util.Arrays;
++import org.apache.thrift.TConfiguration;
++import org.apache.thrift.transport.AutoExpandingBufferReadTransport;
++import org.apache.thrift.transport.TMemoryInputTransport;
++import org.apache.thrift.transport.TTransportException;
++import org.junit.jupiter.api.Test;
++
++/**
++ * Tests that message size limits are enforced in the fast-path buffer re=
ads of
++ * TBinaryProtocol/TCompactProtocol and that consumeBuffer() correctly tr=
acks consumed bytes.
++ */
++public class TestMessageSizeLimits {
++
++  /** Build TBinaryProtocol-encoded bytes for a string: 4-byte big-endian=
 length + raw bytes. */
++  private byte[] encodeBinaryString(String s) {
++    byte[] data =3D s.getBytes(java.nio.charset.StandardCharsets.UTF_8);
++    byte[] out =3D new byte[4 + data.length];
++    int len =3D data.length;
++    out[0] =3D (byte) (len >> 24);
++    out[1] =3D (byte) (len >> 16);
++    out[2] =3D (byte) (len >> 8);
++    out[3] =3D (byte) len;
++    System.arraycopy(data, 0, out, 4, data.length);
++    return out;
++  }
++
++  /**
++   * Build TCompactProtocol-encoded bytes for a string: varint length + r=
aw bytes. Assumes length <
++   * 128 so it fits in one varint byte.
++   */
++  private byte[] encodeCompactString(String s) {
++    byte[] data =3D s.getBytes(java.nio.charset.StandardCharsets.UTF_8);
++    assert data.length < 128 : "test helper only handles single-byte vari=
nts";
++    byte[] out =3D new byte[1 + data.length];
++    out[0] =3D (byte) data.length;
++    System.arraycopy(data, 0, out, 1, data.length);
++    return out;
++  }
++
++  private static String repeat(char c, int n) {
++    char[] chars =3D new char[n];
++    Arrays.fill(chars, c);
++    return new String(chars);
++  }
++
++  @Test
++  public void testBinaryProtocol_stringLengthLimitEnforcedInFastPath() th=
rows Exception {
++    // 100-char string encoded for TBinaryProtocol - all bytes in transpo=
rt so fast path fires
++    byte[] buf =3D encodeBinaryString(repeat('A', 100));
++    TMemoryInputTransport transport =3D new TMemoryInputTransport(buf);
++
++    // Protocol limited to 10 bytes per string
++    TBinaryProtocol proto =3D new TBinaryProtocol(transport, 10L, -1L, fa=
lse, true);
++
++    assertThrows(
++        TProtocolException.class,
++        proto::readString,
++        "stringLengthLimit must be enforced even when the fast path is ta=
ken");
++  }
++
++  @Test
++  public void testBinaryProtocol_stringLengthLimitAllowsValidString() thr=
ows Exception {
++    byte[] buf =3D encodeBinaryString("Hello");
++    TMemoryInputTransport transport =3D new TMemoryInputTransport(buf);
++
++    TBinaryProtocol proto =3D new TBinaryProtocol(transport, 10L, -1L, fa=
lse, true);
++
++    assertDoesNotThrow(
++        proto::readString, "string within stringLengthLimit must be reada=
ble via fast path");
++  }
++
++  @Test
++  public void testCompactProtocol_stringLengthLimitEnforcedInFastPath() t=
hrows Exception {
++    byte[] buf =3D encodeCompactString(repeat('A', 100));
++    TMemoryInputTransport transport =3D new TMemoryInputTransport(buf);
++
++    TCompactProtocol proto =3D new TCompactProtocol(transport, 10L, -1L);
++
++    assertThrows(
++        TProtocolException.class,
++        proto::readString,
++        "TCompactProtocol stringLengthLimit must reject oversized strings=
 in fast path");
++  }
++
++  @Test
++  public void testConsumeBuffer_decrementsRemainingMessageSize() throws E=
xception {
++    // 20-byte transport; updateKnownMessageSize sets remainingMessageSiz=
e =3D 20
++    byte[] buf =3D new byte[20];
++    TMemoryInputTransport transport =3D new TMemoryInputTransport(buf);
++
++    transport.consumeBuffer(15);
++
++    // 5 bytes remain; requesting 5 must succeed
++    assertDoesNotThrow(() -> transport.checkReadBytesAvailable(5));
++
++    // requesting 6 must fail
++    assertThrows(
++        TTransportException.class,
++        () -> transport.checkReadBytesAvailable(6),
++        "checkReadBytesAvailable must reflect bytes consumed via consumeB=
uffer");
++  }
++
++  @Test
++  public void testBinaryProtocol_fastPathReadsDrainRemainingMessageSize()=
 throws Exception {
++    // 10 i32 values =3D 40 bytes; maxMessageSize exactly 40
++    byte[] buf =3D new byte[40];
++    TConfiguration config =3D TConfiguration.custom().setMaxMessageSize(4=
0).build();
++    TMemoryInputTransport transport =3D new TMemoryInputTransport(config,=
 buf);
++    TBinaryProtocol proto =3D new TBinaryProtocol(transport);
++
++    // Reading 8 i32 values via fast path consumes 32 bytes
++    for (int i =3D 0; i < 8; i++) {
++      proto.readI32();
++    }
++
++    // 8 bytes remain =E2=80=94 requesting exactly 8 must succeed
++    assertDoesNotThrow(
++        () -> transport.checkReadBytesAvailable(8),
++        "8 bytes should still be available after 32 consumed via fast pat=
h");
++
++    // requesting 9 must fail =E2=80=94 size limit is properly tracked
++    assertThrows(
++        TTransportException.class,
++        () -> transport.checkReadBytesAvailable(9),
++        "fast-path reads must decrement remaining message size so limits =
can be enforced");
++  }
++
++  @Test
++  public void testRead_doesNotDoubleCountConsumedBytes() throws Exception=
 {
++    // If read() double-counted, consuming 10 bytes via read() on a 20-by=
te transport
++    // would wrongly decrement remainingMessageSize by 20 instead of 10.
++    byte[] buf =3D new byte[20];
++    TMemoryInputTransport transport =3D new TMemoryInputTransport(buf);
++    byte[] dest =3D new byte[10];
++    transport.read(dest, 0, 10);
++
++    // 10 bytes remain; requesting 10 must succeed
++    assertDoesNotThrow(() -> transport.checkReadBytesAvailable(10));
++
++    // requesting 11 must fail
++    assertThrows(
++        TTransportException.class,
++        () -> transport.checkReadBytesAvailable(11),
++        "read() must not double-count consumed bytes after consumeBuffer =
fix");
++  }
++
++  @Test
++  public void testAutoExpandingBufferReadTransport_fillResetsMessageSizeP=
erFrame()
++      throws Exception {
++    // fill() must reset remainingMessageSize so that consumption across =
frames on a long-lived
++    // TFastFramedTransport connection does not accumulate toward the per=
-message limit.
++    TConfiguration config =3D TConfiguration.custom().setMaxMessageSize(8=
0).build();
++    AutoExpandingBufferReadTransport readBuf =3D new AutoExpandingBufferR=
eadTransport(config, 100);
++    TMemoryInputTransport source =3D new TMemoryInputTransport(new byte[2=
00]);
++
++    // Frame 1: fill and consume 70 bytes
++    readBuf.fill(source, 70);
++    readBuf.consumeBuffer(70);
++
++    // Frame 2: fill resets remainingMessageSize to maxMessageSize (80) b=
efore new frame
++    readBuf.fill(source, 70);
++    readBuf.consumeBuffer(70);
++
++    // After two frames of 70 bytes each, 10 bytes of budget must still b=
e available
++    assertDoesNotThrow(
++        () -> readBuf.checkReadBytesAvailable(10),
++        "fill() must reset remainingMessageSize so multi-frame connection=
s stay functional");
++    assertThrows(
++        TTransportException.class,
++        () -> readBuf.checkReadBytesAvailable(11),
++        "remaining budget after fill-reset and 70-byte consume should be =
exactly 10");
++  }
++}
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index b5dee9bd00..ad4e841d7b 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-48144.patch \
            file://CVE-2026-58389.patch \
            file://CVE-2026-41608.patch \
+           file://CVE-2026-45112.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

