Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ED4C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 13:18:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29746.1737897508286866797
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jan 2025 05:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3121b86422=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QDF2vS015810
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 05:18:28 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44cv48gt6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 05:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOS8FuZ0d6Qh1qjI/EABO4z2eIqCXhwdzELSRR3A/6t+JtIPzBcqPDomOfyWqrUfEPvJEbCwYmNvw9O5EJPOc+2ebw7ah5+u2xazkAX1ckFZHQsTCae4nt0LTQNOw/202L33LKYr/VYfyH9Er7xBY5dyA0TqIMKDTeghWkmzwU3IAewASPp2ZMZLF0zN0yd5moQIqZex+0LZf9ZJzRbqORA66kd/GkyMx3ZtulbZQZxoIQXuEWx4tbULHA0SeSYAFIwETCFu97+MIVMs2O3mekVCXwx/zzsupX4SjFqTqJ9aHXiPUKgkIfqhw8rU1vuJteMVisg4Bh71gznzE2lMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENz8rFE1pGZ0Mz/di5ptD1qvsW0XwPPgSu45CeUbmi4=;
 b=fhCb8ffDISWcjFvbwC/pSXX5ajcyqbXx/tt0GOVVXQOlTqNzO6K7MPihURZCtMcGx+AAW+Yv/jLcNuTDwAhOtc7r0Enrqw3sH9wq800Qvw1sUbsaLUk4HpeGthfgsZtep+1Bx5HcrhJ2DwV0jcIwvwIFEMDS/8Vao9yMlJWRwtH2vjvE7Trq4WUntXp1h3BfjwZetoOxllSR1aCrPyOAv2dI/ZsPi47LPEh69e49rp2mJqtOPwZBbZXUzrvLY8lWmUVFEXtKAmdPpx9LMhtieKVVRiYjXk6TpDlg1KGD6ngBLs7g/usiiyremQ7MuWHeUarqcQYZ2rfK7sUJkYpv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6907.namprd11.prod.outlook.com (2603:10b6:510:203::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sun, 26 Jan
 2025 13:18:23 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 13:18:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 4.0.2 -> 4.0.3
Date: Sun, 26 Jan 2025 21:17:03 +0800
Message-Id: <20250126131703.3624175-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0177.apcprd04.prod.outlook.com
 (2603:1096:4:14::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: e67a24de-e493-4ab8-c7a7-08dd3e0be907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cOm20tydOAjXpLAWSs+y5lSwEJ3m5p0rxuqlnLyx3MRtUmdKW4MU/8pB7dcm?=
 =?us-ascii?Q?aFd5uqmM47oxa54jHaHBptZcYP7TqOorgBS/g/rESFYIuDfb99zJX+6+K1n4?=
 =?us-ascii?Q?fAGvBwK6wycGbQ5ykEurt3AD05J/O0hG+1MCT5TyUCjvtUU6R2eU/KR/yaMA?=
 =?us-ascii?Q?juJA3LGAH7rfRjBuWx9W4z0Ex5PqfamFum0Ld7287upR+Iazpuj6/TqZkSeu?=
 =?us-ascii?Q?d6evpjlmpkYGhC8GSxfi4JK6WXhzexntuQJca0gUb8I/ax3gcUM8SYANMrzG?=
 =?us-ascii?Q?CStHeJS57Kdup/xUXJlmE6gI+Cekm5a8p1WoGWlfSRA3yNtBq3fhHXdDqfE4?=
 =?us-ascii?Q?IBEiQYWZwXjL8pVmiATj3B1/Lud9uEsb3kflMdrRQIr5p4/RbjOUmPfW6+ZA?=
 =?us-ascii?Q?YaLwMv6tWZwddj1X9wFadsjY1oa49deANgV5gjOX/xRA/VncF75kVM1H8TL2?=
 =?us-ascii?Q?zpwEC74+kgWiBMVufFTIkP9yP07xeC/NyfDPkGiWkPyvp1mBIsZcPCKHu2nO?=
 =?us-ascii?Q?5Io2Kv3AYhdm0sc1tsrVL/v0LIIb8Myuo/G+m7nHMmNTqk4FUiFDXqm6bXdA?=
 =?us-ascii?Q?NFGIlCREb0UxvBbj97CR4YY8HLy4xQl1rRLrzl8fJutE35Kpvk8Ds1SpbRpG?=
 =?us-ascii?Q?+afHGY/H7uqyNq8aSx5oksoVuJOdjV36qSKzPcDv8D6WUdzTbQb69VMQ2om0?=
 =?us-ascii?Q?A20yIf6JKyw6Z1+DlatR3LFe0ypUhqtJ4c0T5gDtihtheJK/yodMdxSBR589?=
 =?us-ascii?Q?04fBZWFMR0CV5nJ3NOEwb/jbGHVhYXN6LhMt6+cJF2x6j2jj3IU3LeRiS8pL?=
 =?us-ascii?Q?g+YXZTWBZf3lCmUEO9w83CZzYY3JI95QCTCIrXHZxOAWoLaU/Je5RQv7CSb+?=
 =?us-ascii?Q?fsjkxKf+zFN+LjCLekkQQAIw9C1LLElGFyEhIFAhTjoOwW82Vq3bqpTkbNG+?=
 =?us-ascii?Q?6CDElyO1MMQ9BSqCAewuLW+JN4VrPBeHtZmqH3+W2RGWC6ukNUQ+z27m4H9q?=
 =?us-ascii?Q?cpCCYxl0H5LblkmV7rqm5FDKNrqD/qrHelNs/9yTEuLqVlU8oLyoxmnsETS0?=
 =?us-ascii?Q?o6gmisgM8uT8OXjCEQ+Dh2Jt0q277C76ZXDWTY5WoIRG7v7WB6+/B9+gwvIA?=
 =?us-ascii?Q?gF2pUnVo2v9soS3kqaCgaHFlDyY/Q8fVngT1WuD5V/6xHddpJHUyFyNEKpwQ?=
 =?us-ascii?Q?zJLG9DQynEjNHMQVC0HXVNoXkIv6kCZEMQyDQ7PzH6ldVr8+Hfz/Q4dlnVwn?=
 =?us-ascii?Q?n5S4JqXE0Uxczm/7OjBAmLafTdmYeSYIFs30saJMnBuOzDv/6hoeSiMu+k4J?=
 =?us-ascii?Q?uQENY6hapR6vf4+vE9QSvOuESDK0gmbm4/GGjTgidsllqRGTjYDlL54My53m?=
 =?us-ascii?Q?DV1qG4OlCPQnh61rrTErQvvlQKfK9dpWZ8dbm3xrNgK7A3oRYtyTHAeNrGAh?=
 =?us-ascii?Q?1VGhJ0mhIb8fw1JNDPvRidV3qfjUiFsQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+x4kLAUf0CQKSOCu3kUBd7I4vVqAfdz7B6mHsZ6BK3foTShQK1B6rOoXmB7B?=
 =?us-ascii?Q?2ogCso/+foZ+butIqk/nOtFTMiHwr4mI0wjhBot4yKVqFdfNZtjmIIVBWjAu?=
 =?us-ascii?Q?n021Ayz00+rqw2v3112/a8k4UWou6vK84b7czuoDdxkj6h1JfVe+KmY0v1Ng?=
 =?us-ascii?Q?Cwn5RyyZ6sB3TJf/xQ4pf82R7Z+47bAVN98NBEa8l5wwHgP7Q2FOT2GTXANv?=
 =?us-ascii?Q?gYwkHjPFdrj66Lfh8bCVWCE7StRG6I933/UKFeM3YkTvOoJG0gz1fdThU/lE?=
 =?us-ascii?Q?qGMl0EVuVjeFaGYqiccvuDTn1B38uHQnJW7WeVmWwTaZT/sSssDeX+ANuzyO?=
 =?us-ascii?Q?77tHWe7RjIVK/wH8XNCe+hd66ucwKbQjmUAQcNvXMgN8EJ5bC6C/ftuk91tE?=
 =?us-ascii?Q?wjiZcZvqylMb0z3Mt043sbo/HWsiieH580RBh24YCeWmQx0nD0RxKaZoYn1j?=
 =?us-ascii?Q?kvf66Q8Uk4PN8iKLxVetusDK6oAqbARTbA3sQ8q5HLxbehoIdcrAXoEpRUP4?=
 =?us-ascii?Q?Jya+++QXY2fEfKmQeg9l0qdMHYpUV+hZfOAEjbj/J3ReO9MwYWjqwxrUH3+d?=
 =?us-ascii?Q?+JtuHG4kArzrefvUFY5oEovkWk6yF0kEVey1Cd9i47/TK3A6ja97AiGG7URJ?=
 =?us-ascii?Q?6XdTHefY5ZDcfP/E4fov010T2VlPQ41veG8SUq7UsT1qiVQqOftsLaJCFpZQ?=
 =?us-ascii?Q?RmIN/Ey8KGqG7JT8rpWQq4H42p2wbRMrLo5igAs3O2pUm6x3syb70AxBQG10?=
 =?us-ascii?Q?HgMvlyh+Xen7oahZ1JQZMxc0372wP7GucUD0bE7kzibKxHr4L3MPNe7lYA2z?=
 =?us-ascii?Q?GJeboQ8reQQfZSS6C+Sxr6Bcy/FEn9BYIYKxCePcneFt6fb8I4DUdg3kTtp3?=
 =?us-ascii?Q?PH9+EsWJt3uO2v/e/0N1cRt2YvLZi0sAVgn9gmtoRLjEpZl8QbEgaa1sv/Eg?=
 =?us-ascii?Q?TDKnGhATW5NhyI9kfBsurxtWcZVQwWZRsMINxZNnQtN8BO1OTMEwC5glYC4v?=
 =?us-ascii?Q?OBEHviSDi9U5e3lgWABE01fLxT/cM5GgPgnCUe97Ru7RfZMdvTgn+I7bg3QI?=
 =?us-ascii?Q?IMmQHHu7TNZPs5hb77MjDKQ1C3Wkxue1vuBCj02G3/w8RittT64j23NkIRBQ?=
 =?us-ascii?Q?CQwy2Az61VQThxKPATpdVIuUlE8g2yPzREzET7Jh/oKJqObdmEsYFsJjxqQm?=
 =?us-ascii?Q?mVtV45Wmw7UIvqxnyy5RH1NuD0XqKztj+v7X3wvbJ4m15n3c73eB1VI6HilD?=
 =?us-ascii?Q?qpogvrP3BlcjGxG/ErI6DfGGA4DKSucVfYLCTvrXIl7/3ra3Ts6Uiz5RAnqx?=
 =?us-ascii?Q?1uDSsMOAxSflPCaFQFjOCo/X4hgpUWvvy5Iu2g26C2ux+m6v9kxRnfhbJqdh?=
 =?us-ascii?Q?eQ35uFVrY5ct4KTmNKjhNNY75IgBoSP3z/Y5V4BjeS4PPq/WBmUcPfhZxyWo?=
 =?us-ascii?Q?tYheHv03gXGmGmafLdyA1ja3r5Dj+3lfqUXzQKNH5WZQfh4AMCUkWqbFmKQv?=
 =?us-ascii?Q?s3zpUYldPD7i3/n0VwmIbOHLwL/y2edNsGI8A6BCC519xP/mN025PYz+ORTb?=
 =?us-ascii?Q?U6YhcskoamaADQ5yHVZrLOKUSoeqHULLHxEichou?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67a24de-e493-4ab8-c7a7-08dd3e0be907
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 13:18:23.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mac99TTd09p5IAvrmrguPhjz3aFy+ni9x6qxyDMt4pAWtgp2bFNSEc+NXzQeKqnVYW7DXBNIhv5WZSOgwvGuIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6907
X-Authority-Analysis: v=2.4 cv=Rd9qC0tv c=1 sm=1 tr=0 ts=67963623 cx=c_pps a=IJ1r+pqWkCYy+K3OX67zYw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=RGY9wo_zjhW_8iQOMtkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CgV104pgorjpTzD0YwmB5HFzo9KIE8bB
X-Proofpoint-GUID: CgV104pgorjpTzD0YwmB5HFzo9KIE8bB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_05,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501260107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 13:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115102

ChangeLog:
- Remove a RHEL4 flag table since it's been unsupported for a while
- Change dependency from Requires to Wants for audit-rules.service
- Disable ProtectKernelModules by default in auditd.service
- Skip plugin configs that do not have .conf suffix
- audisp-filter: iterate records correctly when forwarding
- Update syscall table for missing syscalls
- Modify ausearch checkpoint code to address 64 inode and device numbers
- Fix potential segfault interpreting relative paths
- Add audit_set_enabled & audit_is_enabled back to the libaudit python bindings
- Log runlevel changes to console during boot
- Add audit-tmpfiles.conf to ensure /var/log/audit exists
- Propagate event format to the audisp-af_unix plugin
- Add support for RISC-V - riscv32, riscv64

* Enable riscv support
* Use its own volatile file for systemd.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../audit/audit/audit-volatile.conf            |  1 -
 .../audit/{audit_4.0.2.bb => audit_4.0.3.bb}   | 18 +++++++-----------
 2 files changed, 7 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/audit-volatile.conf
 rename meta-oe/recipes-security/audit/{audit_4.0.2.bb => audit_4.0.3.bb} (84%)

diff --git a/meta-oe/recipes-security/audit/audit/audit-volatile.conf b/meta-oe/recipes-security/audit/audit/audit-volatile.conf
deleted file mode 100644
index 9cbe1547a3..0000000000
--- a/meta-oe/recipes-security/audit/audit/audit-volatile.conf
+++ /dev/null
@@ -1 +0,0 @@
-d  /var/log/audit 0750 root root -
diff --git a/meta-oe/recipes-security/audit/audit_4.0.2.bb b/meta-oe/recipes-security/audit/audit_4.0.3.bb
similarity index 84%
rename from meta-oe/recipes-security/audit/audit_4.0.2.bb
rename to meta-oe/recipes-security/audit/audit_4.0.3.bb
index 4f1507923a..9501787e09 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.3.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
            file://0001-Fixed-swig-host-contamination-issue.patch \
            file://auditd \
-           file://audit-volatile.conf \
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "4e6deae41d4646d28bb3ba9524a8a227a38ccd0b"
+SRCREV = "51d154c5b7ec91831cbb89fe6ca54d8eb7ba344c"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
@@ -33,6 +32,7 @@ EXTRA_OECONF = " \
         --with-python3 \
         --with-arm \
         --with-aarch64 \
+        --with-riscv \
         --without-golang \
         --disable-gssapi-krb5 \
         --disable-zos-remote \
@@ -57,7 +57,9 @@ PACKAGES =+ "audispd-plugins"
 PACKAGES += "auditd ${PN}-python"
 
 FILES:${PN} = "${sysconfdir}/libaudit.conf ${libdir}/libau*.so.*"
-FILES:auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/* ${datadir}/audit-rules/* ${libexecdir}/*"
+FILES:auditd = "${bindir}/* ${base_sbindir}/* ${sysconfdir}/* \
+                ${datadir}/audit-rules/* ${libexecdir}/* \
+                ${nonarch_libdir}/tmpfiles.d/*.conf"
 FILES:audispd-plugins = "${sysconfdir}/audit/audisp-remote.conf \
         ${sysconfdir}/audit/plugins.d/au-remote.conf \
         ${sysconfdir}/audit/plugins.d/syslog.conf \
@@ -87,19 +89,13 @@ do_install:append() {
     # Based on the audit.spec "Copy default rules into place on new installation"
     install -m 0640 ${D}/etc/audit/rules.d/audit.rules ${D}/etc/audit/audit.rules
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -D -m 0644 ${UNPACKDIR}/audit-volatile.conf ${D}${sysconfdir}/tmpfiles.d/audit.conf
-    fi
-
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -D -m 0755 ${UNPACKDIR}/auditd ${D}/etc/init.d/auditd
     fi
 
     if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        rm -rf ${D}${libdir}/systemd
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${B}/init.d/auditd.service      ${D}${systemd_unitdir}/system/
-        install -m 0644 ${B}/init.d/audit-rules.service ${D}${systemd_unitdir}/system/
+        rm -rf ${D}${nonarch_libdir}/systemd
+        rm -rf ${D}${nonarch_libdir}/tmpfiles.d
     fi
 
     # Create /var/spool/audit directory for audisp-remote
-- 
2.25.1


