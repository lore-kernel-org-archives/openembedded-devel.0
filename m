Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F7FECAAD2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 16:55:00 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.83])
 by mx.groups.io with SMTP id smtpd.web10.61073.1661705696865129914
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 09:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=w95RlIQj;
 spf=pass (domain: kpit.com, ip: 40.107.239.83,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U933RgQl3zM0eWG1056FBi3Dl6fe9Jy984EMEiHdeQqx42La4thJAljn9niI/3Jf8f2cwf46AAamUm5Bvv+BEx+0KvXVSMRDF9TJNWqGXj8zhcwNy5KtlHg0pOhdFy7R3FiW2J6hOWXOez16hjQ1Xv/ZA8Crx87JKxqSSbPl3xDvPo1bO0W0+2gihwMEni7XaKskA+jtzAfZu1j3ckumoVZPPaspsZYfZ8MBTX1Eq1Me6Uc9xf10Mu5yLqeNltXF7lDYfTs0Q+IerGZ+fVxgc0qqeesA/mQ4lqJ9Ucxq1/j1ICeDrKgcIEhdLGbGlcrieYJvuIJBR/28WZA3NV2LIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWKyOkLptmGGRBEfVmSOwCQCvoCSTgdfD8ha3RbkYSg=;
 b=QSbjxDeedM4sNjgkA9yqx1Fn41J9uC2meo9jBo7IZCiS7PS6JtF6MQqcddPPxxnMhD9yB444sMobgVgawFrGh+6efwloIXjsXLMAYgm0X8J15HBBW4A9hf9Mg0Y96u/qnjwkPj2Bd8lhEcMXeqr0I7IvcgOpQVDBc+IVhR39piQmNw+72OpEW5B+9/S2Y3LZT3v/t5l0NrlwWFNxIrh0SfQ+4WcX2eh4JDPDCawXo1luRkgAH8T9Bv9/WEK5WA1U8FQAzA7cQSVRyvZYu9wja6tfVCW55yCaUye3e5w7VUPTW4XuJNYxBGKTRD2sbHrDKhIUZUIiH2EbOwTuufQbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWKyOkLptmGGRBEfVmSOwCQCvoCSTgdfD8ha3RbkYSg=;
 b=w95RlIQjBUEQE9Sa9cVHdb/cIhQgF3UactUS/scmWwbo5oWK5nDHSlRFX94bEC5DAH6cfXRBg0wJ0t3KmIvOi6yzEccgD+BOx190S5Rk6++iTflsk0mB2a6DFQuQ+2xS5t2YmWlW8Ezv2Q5nwZ1b/VLjDTgEMllpKHdKHjp3hXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MA1PR0101MB1157.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:2c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Sun, 28 Aug
 2022 16:54:48 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674%6]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 16:54:48 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [oe][meta-java][dunfell][PATCH 3/3] openjdk: Fix CVE-2022-21541 for
 openjdk
Date: Sun, 28 Aug 2022 22:24:30 +0530
Message-Id: <20220828165430.13112-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc778548-ac5b-45c6-d660-08da89160432
X-MS-TrafficTypeDiagnostic: MA1PR0101MB1157:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	liwWJn4WLO5U+XU3yE948oalEG8ptPKWIgg2FTESgD+74rL9aNRFHfhE49qPlQMLRK2rHudOxFC2IEgjVjUh02Q1ZvkxTy0arbyEtWUXeCmD1F+uU5Lb++j2e0dPEQSxkb4mBngsTrACz/v2hjMvEutsz6wavEsdiPxYrGyTaXJQa3bIiXE46FmFpDUiq4+ypEb8yNJWHSLog+8fNw/E5Ig9OUI09A7OXP7Vn5IbKKuyI1uHIMAD9nIw5OomyioIH1vdF7J8zlBraxj+9ldok+FFPbtd//fwjZukD4Cihw2FeEdX/ZA26qGQBZtgYIjvDnNkYDpEHcYRCR8or9tILnSOD1nqqUTbnjrn6ZseTfF7WTwE8W6iElWMk+Vi1X3mJTtfQulRkDi+tiiIHPnVjljwqARp0rDTXVp3mdYVA36ilwqMzFYWic9nmsMq/TR3E6w0yw66OzIfbw+sADVZ375lfsjqUuSj2Vqzik7hSnjpnEoPOif1uPvdUKQdD0JIGzPpEYBeKKmAnJJQC+8cZZHE1XSIMi/hPCu5PxAA67Nq7LhuBL/URCYzDBe+eTtrYj8K82E0SnTFSMRMECDGDbtJpuCA4VkC06WGcy4wOmGHxYfFABEkspd0oQ94F4O8NjGLaTQQHMyRRei/sJKxasC8S+cCiQ3lVsIOj4LIuLwi98oiqrbE+T0DdHmx2qlJsEilT9NPeC+dVMyCseF1upnuWGX+YzsIaek7JRS6hS2TisanbNPf3fXo5jnxLHsXBvOmQ6ayAPl7sob3xHHe7yG8hMvnw1zCiSkNy42x1VI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39830400003)(136003)(366004)(376002)(346002)(2906002)(4326008)(66946007)(8676002)(66476007)(66556008)(8936002)(26005)(6506007)(6512007)(6666004)(316002)(6916009)(478600001)(966005)(41300700001)(6486002)(52116002)(107886003)(38350700002)(66574015)(186003)(1076003)(2616005)(83380400001)(86362001)(5660300002)(36756003)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nra6BXAM9dUsxMugV9NQ/78zNHNmvCTIKuiX6T5NUNLAskdYPfit8/ST6byJ?=
 =?us-ascii?Q?n+p/9y05TAQswwvtGUaZ5B2fG7yTogMtLAe10JHU6TX8w/74yr2JK6GZ5EUo?=
 =?us-ascii?Q?ADJoZNp0xPN9H1BDbvsv6tXJLYyGLS9MEbgsCiHz1LIyAZlyBIfvgzggzYnE?=
 =?us-ascii?Q?ydLZnLt3OfvUgU54x9UqH7KUIQootLuN8+bKlE01qoP0w+qUqGA2oe5Z2vbm?=
 =?us-ascii?Q?G/qpDbcKy+Df6x4SwwGaY+lGV/PNd2HZCbPilpNM7IKGPuwGcfr2FnkW5PHk?=
 =?us-ascii?Q?0nw/rP9pBvOOwPtHIHtcL7fqprPre7df2J1tXUQwVzRVF05rlSA47N/UM/0J?=
 =?us-ascii?Q?j+vb70zJZj8Wsb08t0hzpv9MNfQ29e1ZP+SgMmruJQKMA+zgKlAT5gWcWclH?=
 =?us-ascii?Q?Erg1Sl+whMlVqUTCdTIqeDJmrzmYbfVx60G+xq5Ier3j6lXAwHU5F1r7RlzV?=
 =?us-ascii?Q?r++PV6RSCgwc3M9yC11VoyjY0bVVYGjUjNMlYFSrNWeI3EKOUzseg3wnqOFs?=
 =?us-ascii?Q?2+L1U1kTb6LIBXF01j2BKRLukrjeLcQDDuWrsaZydpWX3OWYkef6lFbu6iNV?=
 =?us-ascii?Q?AyjWF/28Z55IvZHq0O0EM10wF0fWh+EAc/cYYCsc0Sijfi5lAa+Dezj3aAbv?=
 =?us-ascii?Q?SdKn6Q4CwxBbTItHF8vIRTXoVoKFX0CsmUCwlZyV65GxZ46AHkvOIRlp7ove?=
 =?us-ascii?Q?y8Qh6PwbzGdz1sei+pCikYgHMustfy0IRw2lcxAvI4u6ZNfwW1FzhClxUzTv?=
 =?us-ascii?Q?zjz3+dGN3xaICtPkKNcBsIWa4PahMaib28s51a6Q4hLdVi/n/vhiqrZHWVVf?=
 =?us-ascii?Q?HX88PFLvu52QH+NIh1JDSdfSAq6f0aXuSAoEJvPHOIumy8n1AQDjIaQc4ggf?=
 =?us-ascii?Q?+17S5eZRvm1Yc7JIXvAIJ0dKBP1dtWJnDBZR3K9uiyxKBjmoZfChh2ohMvPf?=
 =?us-ascii?Q?3oyMQ4uVZarZ8oZRk004e2rXdykPuVr6Yzb4vhIswfuSsDYEbXkr42DXoIDc?=
 =?us-ascii?Q?2BSEswQTZlzvxXxuKSQ+oM7ja5KZY88BqupNkmiSZOdeYF6A6N7bavhjcwdy?=
 =?us-ascii?Q?Snzml88m0unJycm82jp98+YdXQ2bFaz5pQJQXOfTdLY1WpnpCOgu5xI0zNRP?=
 =?us-ascii?Q?yRr/DmKBUVodxQ3Et6aZoRYwacXUDuVeeE3BrliksgXBjLCwLCRHZ0rxMNQG?=
 =?us-ascii?Q?YufwoOT4hquA9vxFuFtBxRULl7Dy4qDGT8bAve0OggKLiexX1stmwNBz4eqQ?=
 =?us-ascii?Q?WEVo/wqhmSE9UvaOCrxuNNKf84UIC57U1NOQKtHHTcOxnUXYXpOYSARuzLSC?=
 =?us-ascii?Q?gvj1VdMX5uWneJBeQ2CUlt+jx8hdIyeFH+IMTGdqvR6IQAKqjVbJCWvNYzDU?=
 =?us-ascii?Q?pvPXTAYUWgcRLqFieATSzovgXe32QjJvzEJcL1QLvJXaGbdXNJeQkE/caOs8?=
 =?us-ascii?Q?AMdxH4t14JJr6tDLw75xN5iMTCUlCGAHPKFzYna8/T56BGHyXw8fNO8vqx/E?=
 =?us-ascii?Q?3cedQ1PGITCYxamKxJFLkM4T2m7C2tLH3EXTPV5YOd5DMU9uCOLHZLaEq4mM?=
 =?us-ascii?Q?l3GbWDhWGMombQKacalj/bje+t/9XgAG71SbojTI?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc778548-ac5b-45c6-d660-08da89160432
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2022 16:54:48.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8fRiJ64NWfDB5+cQe74Wf+sTxrzt9TZ8/x8/B2czrIDlJOkpfFcsDKk28+J4SqVsTtFN7SlTrlly96xOfRvdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR0101MB1157
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Aug 2022 16:55:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98499

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2022-21541

Reference:
https://github.com/openjdk/jdk/commit/632d2d2690ee68b5e2928e8c253ad4b099f31=
ed9

https://launchpadlibrarian.net/614309983/openjdk-8_8u342~b06-1_8u342-b07-1.=
diff.gz

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../openjdk/openjdk-8-release-common.inc      |   1 +
 .../patches-openjdk-8/CVE-2022-21541.patch    | 126 ++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/CVE-2022-21541.p=
atch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-co=
re/openjdk/openjdk-8-release-common.inc
index b50bddc..cfea0b9 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -23,6 +23,7 @@ PATCHES_URI =3D "\
     file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch=
 \
     file://CVE-2022-34169.patch \
     file://CVE-2022-21540.patch \
+    file://CVE-2022-21541.patch \
 "
 HOTSPOT_UB_PATCH =3D "\
     file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2022-21541.patch b/=
recipes-core/openjdk/patches-openjdk-8/CVE-2022-21541.patch
new file mode 100644
index 0000000..2bf57d4
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2022-21541.patch
@@ -0,0 +1,126 @@
+From 632d2d2690ee68b5e2928e8c253ad4b099f31ed9 Mon Sep 17 00:00:00 2001
+From: Tobias Hartmann <thartmann@openjdk.org>
+Date: Wed, 23 Mar 2022 11:55:03 +0000
+Subject: [PATCH] 8281866: Enhance MethodHandle invocations
+
+Co-authored-by: Vladimir Ivanov <vlivanov@openjdk.org>
+Reviewed-by: chagedorn
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2022-21541
+
+Upstream-Status: Backport [https://launchpadlibrarian.net/614309983/openjd=
k-8_8u342~b06-1_8u342-b07-1.diff.gz]
+---
+Index: openjdk/hotspot/src/share/vm/interpreter/linkResolver.cpp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/hotspot/src/share/vm/interpreter/linkResolver.cpp
++++ b/hotspot/src/share/vm/interpreter/linkResolver.cpp
+@@ -1580,22 +1580,41 @@ void LinkResolver::resolve_invokehandle(
+     ResourceMark rm(THREAD);
+     tty->print_cr("resolve_invokehandle %s %s", method_name->as_C_string(=
), method_signature->as_C_string());
+   }
+-  resolve_handle_call(result, resolved_klass, method_name, method_signatu=
re, current_klass, CHECK);
++  resolve_handle_call(result, resolved_klass, method_name, method_signatu=
re, current_klass, true, CHECK);
+ }
+
+ void LinkResolver::resolve_handle_call(CallInfo& result, KlassHandle reso=
lved_klass,
+                                        Symbol* method_name, Symbol* metho=
d_signature,
+-                                       KlassHandle current_klass,
++                                       KlassHandle current_klass, bool ch=
eck_access,
+                                        TRAPS) {
+   // JSR 292:  this must be an implicitly generated method MethodHandle.i=
nvokeExact(*...) or similar
+   assert(resolved_klass() =3D=3D SystemDictionary::MethodHandle_klass(), =
"");
+   assert(MethodHandles::is_signature_polymorphic_name(method_name), "");
+   methodHandle resolved_method;
+-  Handle       resolved_appendix;
+-  Handle       resolved_method_type;
++  Handle resolved_appendix;
++  Handle resolved_method_type;
+   lookup_polymorphic_method(resolved_method, resolved_klass,
+                             method_name, method_signature,
+                             current_klass, &resolved_appendix, &resolved_=
method_type, CHECK);
++  if (check_access) {
++    vmIntrinsics::ID iid =3D MethodHandles::signature_polymorphic_name_id=
(method_name);
++    if (MethodHandles::is_signature_polymorphic_intrinsic(iid)) {
++      // Check if method can be accessed by the referring class.
++      // MH.linkTo* invocations are not rewritten to invokehandle.
++      assert(iid =3D=3D vmIntrinsics::_invokeBasic, err_msg("%s", vmIntri=
nsics::name_at(iid)));
++
++      assert(current_klass.not_null(), "current_klass should not be null"=
);
++      check_method_accessability(current_klass,
++                                 resolved_klass,
++                                 resolved_method->method_holder(),
++                                 resolved_method,
++                                 CHECK);
++    } else {
++      // Java code is free to arbitrarily link signature-polymorphic invo=
kers.
++      assert(iid =3D=3D vmIntrinsics::_invokeGeneric, err_msg("not an inv=
oker: %s", vmIntrinsics::name_at(iid)));
++      assert(MethodHandles::is_signature_polymorphic_public_name(resolved=
_klass(), method_name), "not public");
++    }
++  }
+   result.set_handle(resolved_method, resolved_appendix, resolved_method_t=
ype, CHECK);
+ }
+
+Index: openjdk/hotspot/src/share/vm/interpreter/linkResolver.hpp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/hotspot/src/share/vm/interpreter/linkResolver.hpp
++++ b/hotspot/src/share/vm/interpreter/linkResolver.hpp
+@@ -179,7 +179,7 @@ class LinkResolver: AllStatic {
+   static void resolve_special_call  (CallInfo& result, Handle recv, Klass=
Handle resolved_klass, Symbol* method_name, Symbol* method_signature, Klass=
Handle current_klass, bool check_access, TRAPS);
+   static void resolve_virtual_call  (CallInfo& result, Handle recv, Klass=
Handle recv_klass, KlassHandle resolved_klass, Symbol* method_name, Symbol*=
 method_signature, KlassHandle current_klass, bool check_access, bool check=
_null_and_abstract, TRAPS);
+   static void resolve_interface_call(CallInfo& result, Handle recv, Klass=
Handle recv_klass, KlassHandle resolved_klass, Symbol* method_name, Symbol*=
 method_signature, KlassHandle current_klass, bool check_access, bool check=
_null_and_abstract, TRAPS);
+-  static void resolve_handle_call   (CallInfo& result,                   =
                   KlassHandle resolved_klass, Symbol* method_name, Symbol*=
 method_signature, KlassHandle current_klass, TRAPS);
++  static void resolve_handle_call   (CallInfo& result,                   =
                   KlassHandle resolved_klass, Symbol* method_name, Symbol*=
 method_signature, KlassHandle current_klass, bool check_access, TRAPS);
+   static void resolve_dynamic_call  (CallInfo& result,                   =
                   Handle bootstrap_specifier, Symbol* method_name, Symbol*=
 method_signature, KlassHandle current_klass, TRAPS);
+
+   // same as above for compile-time resolution; but returns null handle i=
nstead of throwing an exception on error
+Index: openjdk/hotspot/src/share/vm/prims/methodHandles.cpp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/hotspot/src/share/vm/prims/methodHandles.cpp
++++ b/hotspot/src/share/vm/prims/methodHandles.cpp
+@@ -389,6 +389,24 @@ vmIntrinsics::ID MethodHandles::signatur
+   return vmIntrinsics::_none;
+ }
+
++// Returns true if method is signature polymorphic and public
++bool MethodHandles::is_signature_polymorphic_public_name(Klass* klass, Sy=
mbol* name) {
++  if (is_signature_polymorphic_name(klass, name)) {
++    InstanceKlass* iklass =3D InstanceKlass::cast(klass);
++    int me;
++    int ms =3D iklass->find_method_by_name(name, &me);
++    assert(ms !=3D -1, "");
++    for (; ms < me; ms++) {
++      Method* m =3D iklass->methods()->at(ms);
++      int required =3D JVM_ACC_NATIVE | JVM_ACC_VARARGS | JVM_ACC_PUBLIC;
++      int flags =3D m->access_flags().as_int();
++      if ((flags & required) =3D=3D required && ArgumentCount(m->signatur=
e()).size() =3D=3D 1) {
++        return true;
++      }
++    }
++  }
++  return false;
++}
+
+ // convert the external string or reflective type to an internal signatur=
e
+ Symbol* MethodHandles::lookup_signature(oop type_str, bool intern_if_not_=
found, TRAPS) {
+@@ -672,7 +690,7 @@ Handle MethodHandles::resolve_MemberName
+         } else if (mh_invoke_id !=3D vmIntrinsics::_none) {
+           assert(!is_signature_polymorphic_static(mh_invoke_id), "");
+           LinkResolver::resolve_handle_call(result,
+-                        defc, name, type, caller, THREAD);
++                        defc, name, type, caller, caller.not_null(), THRE=
AD);
+         } else if (ref_kind =3D=3D JVM_REF_invokeSpecial) {
+           LinkResolver::resolve_special_call(result,
+                         Handle(), defc, name, type, caller, caller.not_nu=
ll(), THREAD);
+Index: openjdk/hotspot/src/share/vm/prims/methodHandles.hpp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/hotspot/src/share/vm/prims/methodHandles.hpp
++++ b/hotspot/src/share/vm/prims/methodHandles.hpp
+@@ -124,6 +124,7 @@ class MethodHandles: AllStatic {
+   static bool is_signature_polymorphic_name(Klass* klass, Symbol* name) {
+     return signature_polymorphic_name_id(klass, name) !=3D vmIntrinsics::=
_none;
+   }
++  static bool is_signature_polymorphic_public_name(Klass* klass, Symbol* =
name);
+
+   enum {
+     // format of query to getConstant:
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

