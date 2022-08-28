Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C07ECAAD2
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 16:15:50 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.55])
 by mx.groups.io with SMTP id smtpd.web11.60344.1661703345464734622
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 09:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Lk8hYl3i;
 spf=pass (domain: kpit.com, ip: 40.107.239.55,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpsj5OZqxzwMThFTtE5Yc3RYKqJG9jZKbI+oOXVRz/ZhrzKY9ujDazBtWxBsoGLI5mqHJ4ll9RiRT+xfAIJX8ZAhY58LkhvjDtr6mWTd2scvr5NDkiFXPKI3YiGXXD84jD2E0a4RmbO2ANfgJeIU16RKLHMRgVWk10nrIiDyxAgODcvOU5yo2vnBsQt6EOiue5Nxy/NLvwJ51k9Z/FqpkeQmWlQywnGRPT2HZunD6w8YrgYwOFlsWx4E/0iy2F53Knw4lrtjddftPcA6unkDHAr7ua2MWFXHfP6vfYNT2EpzyyMmybr4in0iYK5sMIrXzCt9ltdYDbhGut72EB+OMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oV9jPGoweffqqVsjgHbdLE1iF5ARyFDTka9P/yKh1nQ=;
 b=VReudPv45B+GBO7mcf8pF5zFcjx00s3h2dmnlD/hPFpCrY9MJqBiw3YIvZkXsHRk8XarglASCAQfrhOpS74gf8+B+L3Cj9Y57cXnvPvHQvWHrweXyHHb24KVWgvZI+X/3QUEkXNkJ78gXjFV8QCBeaPTqdCQRaqzBRvI8n4mkBBd/7kWJiOgUz2KEIx9u5Yq7rV/Xk7LOgtUiNi00Lu7OgSr/U4n2lM5o6Vj44hJgSGQ8mhBVQ7WifDwFge8vrXCgHhUV6peJbL6dq46C2o5VwB2bPzn80wjeCP1i5V5SiZEjD4f+3aUHqs3EUQc3mFQ2Gl+sJNeeoulG/4PnAF9nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oV9jPGoweffqqVsjgHbdLE1iF5ARyFDTka9P/yKh1nQ=;
 b=Lk8hYl3ic/G84DuaqiQqjy6ujpZbQ4AOJa/fJtVe1yYajzGFF8nJwWq2dbTA6B8nVTe/GYZkGk+AnPfnRKkhqfZFa1r9zbWYSnXP/GDvifxfd/14+Y3+maaMefq8wAAHMjzOIJ1SqxYMKcCNbUlmm2xhsXzd06sXvoigo9kWTB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by MA0PR01MB5699.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 16:15:34 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5875:d757:2635:3674%6]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 16:15:34 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [oe][meta-java][dunfell][PATCH 2/3] openjdk: Fix CVE-2022-21540 for
 openjdk
Date: Sun, 28 Aug 2022 21:45:15 +0530
Message-Id: <20220828161515.14337-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::29) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de1a0c37-dbad-4fa5-845c-08da89108938
X-MS-TrafficTypeDiagnostic: MA0PR01MB5699:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WCnRiQiompsNYagqYms5FluEVNne7p2AfSFzUDVB90sBORFUa1tHyR+vUWXCQQMyq7rokp81NKfyyfZ3WbjnIiS9M3ZCKnsjq5daTjP/nf8eFj0UNVF2+iycGkoOl+z2nUwg5SPMY/5xjybdqknxkilFETpcjXxONGZdGMwkROnxfFvuPNfnvhZtC00+atWvAjCXL+NKlcmndxCNCTRYLSy14Qe1rcpi+2HKAMbFOSpvoP+Bpu6A6v5YFULQa1m+jOLNTbrjBXKiFpU4s3nicaFqfUjAKfiSQ7XpJayXO2VpJM32qMJoNj1rn6om/4JJQXXc81TnqKj2LRGxk4pEG0YeBTUUfT8gp/2UwRhpNocPK6qieCN5P2ZhXywGBgxI5WX2gznlB6jk9RpyZXyh724IvZUWEe1QQfY5eUF2snXm9g4JLJvRQb/Eoon3uEHmtIFWm06/ZYAPY8GjsDaJbdqvUkAhpR5CKPj/RghSvm+BQkOsxJXjACmWtp1Nkhlwtf3Zvgg2dVHtdr8aYQcWylDgs9X6EPZ58KjWEFEob95YkiaDC/Mz2ygR/DMgblhHx2EiLOez3ComtA/9etcxr6tUNKUPRgXqMBXwwA6UvLbVt5OjcEg5WoQSolRWk+0H1ZMm5JXC3/PljiqEVU/LNUtHz83m1f0MQknC/X10t+VaAHmwaI7uCHXekA3eH5mtupf8gMEn5sxBfavvHYVmCjqU92GKZV9QS6CnNEwooteSA8jXcObp7mh8bgond9WSWD5IqzoqSHpzBAYOJouGW6oAejbQJss578iZNYRR7KE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(366004)(136003)(39850400004)(107886003)(44832011)(8936002)(4326008)(66556008)(41300700001)(6666004)(66476007)(8676002)(66946007)(6486002)(966005)(86362001)(5660300002)(2616005)(1076003)(186003)(478600001)(2906002)(66574015)(52116002)(6506007)(26005)(6512007)(38350700002)(38100700002)(316002)(6916009)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WfIRTzGgi6EVo0e4QK0ZQVFJtpHl46B67DL7GJHEx2nVRX6EA2wJMjAEAcUu?=
 =?us-ascii?Q?Z4hMlu4TjzQxj5E1Z/aWH6Cuykru5/ZAMOuwWdMK8qxf5iAe+wviBs0/BI7y?=
 =?us-ascii?Q?Gz1cG6KBOxVaeCaOmVtZl9lEjtoBWvU5Rav/cVVDSScj3PxNmbZzZmUNfaBQ?=
 =?us-ascii?Q?n5pejoKwK8TRrHro/z1D/aZ03n6CP9JPn3Iee7gQGIXVWJAcoIHi7RuBloBb?=
 =?us-ascii?Q?w81UJ4STbZejQkanV4TO/v+gpt9z9jdOoC2rpPkbcAHoWgOw/SIqZ4DEnMWO?=
 =?us-ascii?Q?hksigKDHzHzRWBceRfFTp664Iiv8yupnFc8zb27/gz9c2IbO0+n/jaVmKxGy?=
 =?us-ascii?Q?Wzvgf3aP3nhPbqCfJDF/dBRw5ZPV92aQzTETTrxy3LUP3aDgVF++hBqcg6VS?=
 =?us-ascii?Q?iUmiF/RJ+VB2AqcGRz8qoEesnXgihTVI2M+NO8k1H6fTPwxwFiPImeY2IKGC?=
 =?us-ascii?Q?JxOOBhlZCjjq76oLgxc/rPd1SXYJ5ChP7Ieoy00YpdzG6KZe/5eghFbfOlih?=
 =?us-ascii?Q?dFBZ7eQhO6aeP8RH+aGpFlrcrsrf+ZXkOaWgrUrC7rrG1XCLTyG88OnNte+f?=
 =?us-ascii?Q?U5IFIKW3HsiUufHlSFxSZbnWWq/iCV52p9mtKLgaru/4qvh96hfTNr1z1rth?=
 =?us-ascii?Q?SOQx76fUKPcq3+NvBF50C5oVWjA+kWB+McNSTDo3eYAjyCqb0kmjmU42mGwU?=
 =?us-ascii?Q?zDKI4XFCbeVaBTj4r6xBbNbvt0gnFhWDzaSSXcxlV+m4j0mEOkBkNuxikmk4?=
 =?us-ascii?Q?H1s7W1i18ACSEClcRt0qT4UYV3Q/vhih/nZCHUvWfTZ2ciWsSoRViRMLpw0A?=
 =?us-ascii?Q?s7vHwR3J8dagvkol4z6VNsbxOAVwq48q9qcmdt+0PEChmuVpKSsiRTnMSxHW?=
 =?us-ascii?Q?gZERtAY0ES3pNrKSEuSNqlvaJziSKeiLw63QTluWKACx95421lxKMdp9Sszq?=
 =?us-ascii?Q?UsY9NfAxwPMkU8G9baFPyi9hsmL6mU9gDkDl0AAC61RwolmqMKzijJNGLOME?=
 =?us-ascii?Q?Xd+oN3A+lsOSnYzENimW0LV3n6cihRePYsx6yrqNhx78tlRc+GnTeSxIOml7?=
 =?us-ascii?Q?0keKjrnQqOcoDHjSERbqfENy8w9ZOiSzDypVe3T7+A9VR3Z6UqEIbjR1xjs1?=
 =?us-ascii?Q?v7QA51/6k8S993kbHYIqsoDTF1DGEZ0dhohSWLFTh2O0p+u/aeLShe4BjG4N?=
 =?us-ascii?Q?cLi5smTfsvt23f/7LJbygYwMYwqVcLwqWLDGhXQ3fyHfRcaDu5NUeiHUs6wV?=
 =?us-ascii?Q?9GqmfRSWaXghHk7RJB3GsdceIUruJSEIUXIZTzJG6Ym9IbepGATKF24pBAHL?=
 =?us-ascii?Q?8KlVz539HS4zv3FsSB0uelHeHnINFbLT5XZoInCVLxEidZA3IxaMiklSwXoR?=
 =?us-ascii?Q?idA2WFcKvHS0ewP2LWcoexHy382a18/XmWd8X07ZeJ9EiS0vZTyRXKcBcKjc?=
 =?us-ascii?Q?GblMQpqY9D7hkzSeVJHhBZAD/OAtkz/TxFXgg2yNByU8ZPSpqbnKpJCk6v+X?=
 =?us-ascii?Q?8MmbA/eI4sxi5zaGbS47xHfm+/9FwQQIDBhzqB4MRsoFLw0HvavYXx+EZxAO?=
 =?us-ascii?Q?bpQpsBKeC8Ov8SxGb1NRdtjxZZBKWgun0KjHGTBY?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de1a0c37-dbad-4fa5-845c-08da89108938
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2022 16:15:34.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6Id87vKt9weht1JEF/m/PcYQjYgORKF5UtBnC7bmAKRUVIFzk07sYVW2nSDHf5BjpAz4/A0RJACTfRB3QbHWaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5699
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Aug 2022 16:15:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98498

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2022-21540

Reference:
https://github.com/openjdk/jdk/commit/84b4e9bb415de65d8de83925fbf7010ed1650=
064

https://launchpadlibrarian.net/614309983/openjdk-8_8u342~b06-1_8u342-b07-1.=
diff.gz

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../openjdk/openjdk-8-release-common.inc      |  1 +
 .../patches-openjdk-8/CVE-2022-21540.patch    | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/CVE-2022-21540.p=
atch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-co=
re/openjdk/openjdk-8-release-common.inc
index cebbc0b..b50bddc 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -22,6 +22,7 @@ PATCHES_URI =3D "\
     file://2008-jdk-no-unused-deps.patch \
     file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch=
 \
     file://CVE-2022-34169.patch \
+    file://CVE-2022-21540.patch \
 "
 HOTSPOT_UB_PATCH =3D "\
     file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2022-21540.patch b/=
recipes-core/openjdk/patches-openjdk-8/CVE-2022-21540.patch
new file mode 100644
index 0000000..c311e5c
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2022-21540.patch
@@ -0,0 +1,54 @@
+From 84b4e9bb415de65d8de83925fbf7010ed1650064 Mon Sep 17 00:00:00 2001
+From: Tobias Hartmann <thartmann@openjdk.org>
+Date: Fri, 18 Mar 2022 10:08:18 +0000
+Subject: [PATCH] 8281859: Improve class compilation
+
+Co-authored-by: Vladimir Ivanov <vlivanov@openjdk.org>
+Reviewed-by: chagedorn
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+CVE: CVE-2022-21540
+
+Upstream-Status: Backport [https://launchpadlibrarian.net/614309983/openjd=
k-8_8u342~b06-1_8u342-b07-1.diff.gz]
+---
+Index: openjdk/hotspot/src/share/vm/ci/ciEnv.cpp
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/hotspot/src/share/vm/ci/ciEnv.cpp
++++ b/hotspot/src/share/vm/ci/ciEnv.cpp
+@@ -587,7 +587,6 @@ ciKlass* ciEnv::get_klass_by_index(const
+ ciConstant ciEnv::get_constant_by_index_impl(constantPoolHandle cpool,
+                                              int pool_index, int cache_in=
dex,
+                                              ciInstanceKlass* accessor) {
+-  bool ignore_will_link;
+   EXCEPTION_CONTEXT;
+   int index =3D pool_index;
+   if (cache_index >=3D 0) {
+@@ -634,8 +633,8 @@ ciConstant ciEnv::get_constant_by_index_
+       return ciConstant(T_OBJECT, constant);
+     }
+   } else if (tag.is_klass() || tag.is_unresolved_klass()) {
+-    // 4881222: allow ldc to take a class type
+-    ciKlass* klass =3D get_klass_by_index_impl(cpool, index, ignore_will_=
link, accessor);
++    bool will_link;
++    ciKlass* klass =3D get_klass_by_index_impl(cpool, index, will_link, a=
ccessor);
+     if (HAS_PENDING_EXCEPTION) {
+       CLEAR_PENDING_EXCEPTION;
+       record_out_of_memory_failure();
+@@ -643,7 +642,8 @@ ciConstant ciEnv::get_constant_by_index_
+     }
+     assert (klass->is_instance_klass() || klass->is_array_klass(),
+             "must be an instance or array klass ");
+-    return ciConstant(T_OBJECT, klass->java_mirror());
++    ciInstance* mirror =3D (will_link ? klass->java_mirror() : get_unload=
ed_klass_mirror(klass));
++    return ciConstant(T_OBJECT, mirror);
+   } else if (tag.is_method_type()) {
+     // must execute Java code to link this CP entry into cache[i].f1
+     ciSymbol* signature =3D get_symbol(cpool->method_type_signature_at(in=
dex));
+@@ -651,6 +651,7 @@ ciConstant ciEnv::get_constant_by_index_
+     return ciConstant(T_OBJECT, ciobj);
+   } else if (tag.is_method_handle()) {
+     // must execute Java code to link this CP entry into cache[i].f1
++    bool ignore_will_link;
+     int ref_kind        =3D cpool->method_handle_ref_kind_at(index);
+     int callee_index    =3D cpool->method_handle_klass_index_at(index);
+     ciKlass* callee     =3D get_klass_by_index_impl(cpool, callee_index, =
ignore_will_link, accessor);
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

