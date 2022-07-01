Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C31C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:26 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.88])
 by mx.groups.io with SMTP id smtpd.web08.35523.1656663738806520300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 01:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=pHzzL52S;
 spf=pass (domain: kpit.com, ip: 40.107.239.88,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCzwp+GeZiHK+73Y72q/2gmPGYGH4FwrqEoVNfrywgXsoc3TrLezmXvpeGLBcnIKYcqOj3+T+yx+qQeuehmx81k6uIPYVx2qnzqA0tkWEvGNEYRGTBum3FgZc7WrqwAQl6WdhS3bM75iGXm1Eb7Bw3QregnPTLMFm5P9NYAx6BcQI748EGm4U4/yhsYn/dTGWVU1Fuy1yRh6CHKk97h+DoRENXzkl7ESevPzfU51jFGKUp1TieJsRtEioiSrrJcTYiFa5ezGl0cwmzThcOQhlUNs6PpIYfLEgIKtyCEpMHy2g3QPo5pQ7DUmF7mYN9ffdpTiKkWJP/Y846UlxMCmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yex/WrEXNAw4j8zPRFVD4rQ4Sjs1pCMM2YKxPJud1w=;
 b=VKkb4fs+urH7S1CxUtAbMqBm22iMz6sLPaVwcH7yJVYdW67HUIH9ZlXBK7pXbKnWdpGsWbBjwU47D0eDAwjX8K/bXbJ3djEKSG5o4OoX3dLnCeZPD1qo0QPvyzs/4T2ctYKu2ArvWlf4lGGXE1LpvnhU6k4R+dCM+f4uDxZxlUCVrZ/fqPxquH4srXoLkBsUTPDlr3sqLRRJnhUxcI7bpurLv/Iqrg7vZPAfaeJBHsTwKa9QW7kE6bxZk16ZOGwdntHfAEeM1aqG8pJEw4B40b/eU9XQkAx5udk2vS8Jvn1lmGUn8X/Putx4m2L1x4fXBCMRgbsvcnF5pm0XR6vQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yex/WrEXNAw4j8zPRFVD4rQ4Sjs1pCMM2YKxPJud1w=;
 b=pHzzL52SeqfYbj4LvG1iwyeiUNNt38sxkrjXnCjOXKFVber2j6N674qpNxdMctoWpQLUW6Yo4kc+kFo3uagIVAdf74Ou0+dpNtv0SfjwsNC3ObwDpcz7ENdqDmKVQVrFi++Mkh7CzRY0NZz2Zm9E9MDpZD22mrXLupWoKuQDTAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by BM1PR01MB1044.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 08:22:12 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c183:fc86:d69b:a1e%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:22:12 +0000
From: Ranjith Rathod <ranjitsinh.rathod@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 8/8] ntfs-3g-ntfsprogs: Fix
 CVE-2022-30789
Date: Fri,  1 Jul 2022 13:51:02 +0530
Message-Id: <20220701082102.17835-9-ranjitsinh.rathod@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
References: <20220701082102.17835-1-ranjitsinh.rathod@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 224ead6a-e06f-4d85-84d9-08da5b3acc16
X-MS-TrafficTypeDiagnostic: BM1PR01MB1044:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qEMHsPL13HXaOQZWw09fShLGToGesmNvwZI3/Qp5BEduH94zHK10SKhycYJmRmYg+K6Z0wCmLFAXovNp+EZYRF1kbzfT92r9rjb9DxDCvXZG2JZDrsJtQLOW1sw1Cd1oOv/Nr4Q10RTz0j32jQr6LC57B7MsfDA8u4dgSd19uZL8HMD3spHie5bzesxYs5GNXJ3dkT2hg5ntn6gXA74rCkSc2/a4R53f+i+jwqjxiSh4YoQ9GEzng7kkY0IJCTvhSV6smDqFyPZ2smG0isEz7Ov6B7Q3HwuLeCKda5yEJwu7wGaeYvguXiBHBo1SVBZkmskSxg71Jh9+UjCQRs7zAoGVXuYvvKMhRVInjKSJyRz+GS7MepNtf9UNGcQMQ5J0tJ5568DM8Ov+f9u57Be+Y667s+9MN1GRTyPjKHl+Ci0AZ19maIEn9QkhV64xRmG6bfrtvURsllxxxzc5IuYrkvVNoCPuTLBRNZDlb+rsSwxEPCP74w+lA3cQnGl6Y++EiRh2WSCofh0hoRt2V/jFtXmKOep/7YBEivpBhOsDAAWs+ctYgT314SvXQpk22XSkMpJqDZQqGSjoX3U0XKEhd+0SoBGZHi6R8TbUXlhHVk6u6qqnTjJTLEEf98IwWgTw4jX7K+3uNwKPq9kPFlIiX4FET5fAKYKaD+sFYiteU7+Q3KkgIRF1S12U2nOQ1IYnjvAKu8ZlkSKWandQMM60dXeuLXcu719jwWvsyRWqS7njea5AwhXPAYoKA3MIHvAcvGJPiuPIg/TCvrZvhpk16w9CrODMNCWsVxO+fTcc4w8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(186003)(66574015)(83380400001)(1076003)(66946007)(316002)(6636002)(6666004)(66556008)(8676002)(86362001)(36756003)(4326008)(6512007)(52116002)(107886003)(5660300002)(8936002)(2616005)(6506007)(66476007)(478600001)(6486002)(41300700001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rz3DKX//sbBiEJ68Sqf78yhn5Q/iRiG0Cjd2Pj90jMjaxn7pr7bAgjAE5ebP?=
 =?us-ascii?Q?CHSBRAs9MHZSULvnh9pt5yHfwcHa1uKS73eIFwopJw43Nt5xRpAkQftFGdUt?=
 =?us-ascii?Q?HlM+dEGBCyuFabF4AGV6vt6JLVomiaLCNqFVy53wMMHuL/Hv2kueraJIbsUM?=
 =?us-ascii?Q?X2x9P4OeSQj8+3hRN883mLAI4R87R9LH4V7pt8AjYQYSwIjst4Zz3JzbBwn/?=
 =?us-ascii?Q?I+jzSGZeX+K7I5FjgqNHbsJk+N9oNxuUqLMsBhdGjvuhVyP3jZYMuo6agYn/?=
 =?us-ascii?Q?TlS6qawwOsEF9NknmnlyeUORqdH0OrIy3tC9vNg0+SCO1RmEVc635nkOztrI?=
 =?us-ascii?Q?I06oro6VCumtG49qs7r5Hi2VqLTfEevkxo3g6E1g90sW1m8i6areJHnMEv1K?=
 =?us-ascii?Q?iNkIVrYvAk+tr5WPqtXmgGN2kueZG+5ZEgwvTIxWfAV0X0qv01L1j+EJkOQo?=
 =?us-ascii?Q?gGkTGuR6x+U1pHh/FGI8u1q4sAeoA7u0Ix71v/WcLeJ1fdIKIo9wT98qv5BV?=
 =?us-ascii?Q?rD8Y+OuqLu1jlpva5OiB9wWlNNvODbGQRjTiDrxBuDodh0z5U3YhRCefFbF+?=
 =?us-ascii?Q?iuB0Apb+u8qbMloYH+LXx7uRELCHWvI1J0GZCgsMFzMQUxERq0WFR9Vyagbo?=
 =?us-ascii?Q?YQxmEs1Y6pwEh+ZYW4b4yGPKDTatDOfGNVErGU7WnfH0Fo0DNdf7UvsR2Cfr?=
 =?us-ascii?Q?AAD5T2usVKv45p1IddhTkKco1rOy3zSP9BAK65x028nBOlp/MYU0UmpPsXFE?=
 =?us-ascii?Q?X4egQRg84jtattUQRmuMmcUVQszOsqb2hJXUpPvBwD90mMvUeH6A7Wp0DShp?=
 =?us-ascii?Q?or2yFCpO1Ufijtm8NkEh7Tg2fsTo6I/pzJB2yItBJLG/CUn0kSsTJE5bvaHR?=
 =?us-ascii?Q?MY7W3ZinQcOUodUQdEwWDBwyBsZkFMNoKnZH2XQn8xwqrSmMNazvl+SyRPhA?=
 =?us-ascii?Q?ELyr0407foa4EJEk0QlcoDl92T2N+evTyr4ynRu4qFWj4dnBY3nhtcRpmBZM?=
 =?us-ascii?Q?Ux0G3iHRyUqGDSQNhEeCCqtTCQ3ag0KnStXdbGQiuNwkS/pEhEOQE9mr+w8+?=
 =?us-ascii?Q?eAGgoHBRjnl65lgrdn/3hT07/p3+W+EznQOVb8GZ2y/bOWuBG1KgBR2U0Tr4?=
 =?us-ascii?Q?ZGdR7AWvURlSNrgl0o0OPSlbHCGX1Z/1hhJNmpQypZZicq3F39aFNurao4gI?=
 =?us-ascii?Q?uNcjRbfIWm0yIvYGZ0DaIUMPDS4UEJXY2Z7fkWLfIrCJzh7NYrnIoqnSAH8b?=
 =?us-ascii?Q?R9F2MpS+XCwWwCSFuwYxcB/xO0XZ6tQ6sc84qJtnEKhFqjqNlzASwATK9iqe?=
 =?us-ascii?Q?PyqnUwfWSFaAYrm8YGUiz/SQA35RcD+HA4E5Psz7s469oYwcmLns+ghTct9L?=
 =?us-ascii?Q?yK+pDReroLd4kLFnsPmTDvCaT3om9CyXN9QxeybzfktkS3RDgOi3nLTmYW2G?=
 =?us-ascii?Q?D3VjU9a687dKyQ2u6fqU0x2wvjGUjL8fTLpv5rlRSJFPFe3xNFM9CXj8Mjsa?=
 =?us-ascii?Q?FFPHQsZZ5EWctNNI6OHAt7tVuKcd4pJQryrPs2ejmtYpxIdOx96xsayLsvWS?=
 =?us-ascii?Q?EMufWXUiqCHnE6SwS+FHNrNUezrqFcJvIpQ9MPR2maVUUro6EczL3wuHQlBa?=
 =?us-ascii?Q?GNN3UskbYiZksRV/ra6/5sn7G5qTsCw3INg0TAjX6cugxBdmucIAjlbsirI/?=
 =?us-ascii?Q?EAmJsA=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 224ead6a-e06f-4d85-84d9-08da5b3acc16
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 08:22:12.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3PsnwJq1Wm7Lw6I/kmLAdR3Ju2s5jqrlYQIJDTXrdvgBpkMPi8h74AXpNMnutTAuWp1CAxNpcOHLjMKtVgHElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB1044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 08:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97657

From: Omkar Patil <omkar.patil@kpit.com>

CVE: CVE-2022-30789

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../ntfs-3g-ntfsprogs/CVE-2022-30789.patch    | 68 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2021.8.22.bb            |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/=
ntfs-3g-ntfsprogs/CVE-2022-30789.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs/CVE-2022-30789.patch b/meta-filesystems/recipes-filesystems/ntfs=
-3g-ntfsprogs/ntfs-3g-ntfsprogs/CVE-2022-30789.patch
new file mode 100644
index 000000000..0ee3b7ae3
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs/CVE-2022-30789.patch
@@ -0,0 +1,68 @@
+From 6efc1305c1951c1d72181f449f2fab68fa25fae8 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jean-Pierre=3D20Andr=3DC3=3DA9?=3D <jean-pierre.andre@wa=
nadoo.fr>
+Date: Wed, 20 Oct 2021 09:53:28 +0200
+Subject: [PATCH] Made sure the client log data does not overflow from rest=
art
+ page
+
+Strengthen the consistency check of the length of restart pages, and
+check that log client records are within such a restart page.
+
+CVE: CVE-2022-30789
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/n/nt=
fs-3g/ntfs-3g_2021.8.22-3ubuntu1.1.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
+
+---
+ libntfs-3g/logfile.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/libntfs-3g/logfile.c b/libntfs-3g/logfile.c
+index adc0557f..9c3155e7 100644
+--- a/libntfs-3g/logfile.c
++++ b/libntfs-3g/logfile.c
+@@ -287,9 +287,19 @@ static BOOL ntfs_check_log_client_array(RESTART_PAGE_=
HEADER *rp)
+       LOG_CLIENT_RECORD *ca, *cr;
+       u16 nr_clients, idx;
+       BOOL in_free_list, idx_is_first;
++      u32 offset_clients;
+
+       ntfs_log_trace("Entering.\n");
++              /* The restart area must be fully within page */
++      if ((le16_to_cpu(rp->restart_area_offset) + sizeof(RESTART_AREA))
++                      > le32_to_cpu(rp->system_page_size))
++              goto err_out;
+       ra =3D (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offse=
t));
++      offset_clients =3D le16_to_cpu(rp->restart_area_offset)
++                      + le16_to_cpu(ra->client_array_offset);
++              /* The clients' records must begin within page */
++      if (offset_clients >=3D le32_to_cpu(rp->system_page_size))
++              goto err_out;
+       ca =3D (LOG_CLIENT_RECORD*)((u8*)ra +
+                       le16_to_cpu(ra->client_array_offset));
+       /*
+@@ -308,6 +318,10 @@ static BOOL ntfs_check_log_client_array(RESTART_PAGE_=
HEADER *rp)
+                       idx =3D le16_to_cpu(cr->next_client)) {
+               if (!nr_clients || idx >=3D le16_to_cpu(ra->log_clients))
+                       goto err_out;
++                      /* The client record must be fully within page */
++              if ((offset_clients + (idx + 1)*sizeof(LOG_CLIENT_RECORD))
++                              > le32_to_cpu(rp->system_page_size))
++                      goto err_out;
+               /* Set @cr to the current log client record. */
+               cr =3D ca + idx;
+               /* The first log client record must not have a prev_client.=
 */
+@@ -380,7 +394,14 @@ static int ntfs_check_and_load_restart_page(ntfs_attr=
 *log_na,
+       /*
+        * Allocate a buffer to store the whole restart page so we can mult=
i
+        * sector transfer deprotect it.
++       * For safety, make sure this is consistent with the usa_count
++       * and shorter than the full log size
+        */
++      if ((le32_to_cpu(rp->system_page_size)
++                      > (u32)(le16_to_cpu(rp->usa_count) - 1)*NTFS_BLOCK_=
SIZE)
++         || (le32_to_cpu(rp->system_page_size)
++                      > le64_to_cpu(log_na->data_size)))
++              return (EINVAL);
+       trp =3D ntfs_malloc(le32_to_cpu(rp->system_page_size));
+       if (!trp)
+               return errno;
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g=
-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfs=
progs/ntfs-3g-ntfsprogs_2021.8.22.bb
index 0da80f8ff..c926d6ddd 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfspr=
ogs_2021.8.22.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfspro=
gs-${PV}.tgz \
            file://CVE-2022-30786-2.patch \
            file://CVE-2022-30788-1.patch \
            file://CVE-2022-30788-2.patch \
+           file://CVE-2022-30789.patch \
           "

 S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
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

