Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.48])
 by mx.groups.io with SMTP id smtpd.web08.4343.1617182982434812875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 02:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=dAKh57i3;
 spf=pass (domain: kpit.com, ip: 40.107.138.48, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZiVdnwz3RTaXWildROmH8U6k6vZ+YaXNFOu1WkcGYtmVtihAIC/IJrSOYPZNyRTwtfs+TuSVw0iql+H9QCm/JyWShiKCV58KxqLXqyWYApqA3pAg7rlaQ7MPB0YfOdqKP2ooWty5pvicas6PTc5uEGLV/qy9DjmY8MNN/Sf6PXmEaiTL/0/zJ6FoRDNpJCrbXxIZbNYS18of2T2jcCy69SsAOfgUtT2y/W/+jSY95NJW+cb14YFFL5SGtvifM8pB76j8Cvua6gGoLNCh+tIy0yhNiemEbBCaxHY/u3fmEQJWzXvjCeOcwP8yi97P4XhewiQRCc3jNTXpx65PTjQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6xyHjqPsYIDHmc01SQOoduhLzXDKVEvxJ5fvrco+N8=;
 b=cR/vn2q9oS4nWKN+XOdAQwJq8+X9MrddqASEUOnzVMB0XBrFq7Kcdz51LN5kx8mK2KVFLRvzmp27Ojv4jtXI1EvkdP6hSCevuD1GPLTmSNgiUe1wGURlef8B1VJs6fOE2OPVOehqmI/sC2u+yHKYMFKUvCgJRgxRAsKL2CC26iUcywTBeCIMVj7CNwt53OqlPoWzT/IU5ulMt7nY+XUPyVSSAkIR13cTu69MBef3PEXdn7Mkw/y99vmpuhfkxauQyV5wVOKJMVWYQuUTxiix6YqeLeBPr8O92r89n/9wBRLAhlrgfcKG0DbRokXeOV0B5psvjJsdJtmB3NQmkLGueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6xyHjqPsYIDHmc01SQOoduhLzXDKVEvxJ5fvrco+N8=;
 b=dAKh57i365Oh0TWc9OH0Z2iOTv3YYbwFQSlCnTjr1Y2Pd47xAkoVU2fxY1j4xlQhO1N0T/sPX1HYRdkH1t6DrMLUOEForpECJMYkD1OsDCfmGFzEVqoVS67UwCBApMcsOl50qpis1+ZdtkxqXyvxAqxf88giwxNIQbZHUfUS9rw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB4712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 09:29:31 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ac31:b2e2:fd3b:6890]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ac31:b2e2:fd3b:6890%7]) with mapi id 15.20.3999.027; Wed, 31 Mar 2021
 09:29:31 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [poky][dunfell][PATCH] qemu: Add fix for CVE-2020-13791
Date: Wed, 31 Mar 2021 14:59:06 +0530
Message-Id: <20210331092906.18788-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [106.213.72.143]
X-ClientProxiedBy: BMXPR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::34) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (106.213.72.143) by BMXPR01CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Wed, 31 Mar 2021 09:29:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2490e589-3076-463c-7a97-08d8f4277c80
X-MS-TrafficTypeDiagnostic: BMXPR01MB4712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB4712710EDD6652A3A8A9D1ACF27C9@BMXPR01MB4712.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qi9urTp3KugkaAbE9K43QzKdzrxxgzEj+faJlgoCYruECd9ERsTLw8+VklCgkGUAR5ouCnPJxyBzbVvLaKHqRO7iqqR8dWia/ARVer3wmCRdFfHVoIxnU5srbfsRKRvng9H9aRW3ZNeSyV7oHES+2sx8jqUJQD+8LGzU6Qc+WvY5JQgrJiFMMwin8ynT5que6Q2PTQF677GePmJWPvW+AMex/7vNZaGtocvmJYfHzWctkkmiS+awUXOEhPNoNSbUT3+TUGif83zT/9M0ETagzr1/2pT6nI/t48SVAoEZ0NP4T8ftWEQBRFVJR50n95iRefMoGVpnYeFRYz2y+730p2pEzV5fP3Le0BzS3bkYq32Wjox6t/23z1cDkafuaPw8uMn5eqmsJa/AQhqNUmndE6q7tlmKc8dZVBwN774HvKMe6HvkY06DV5u63b7QWVsoM0cZe0uFlQF6k4Vr+N/GAK3gEn206FKGlFo+U3T2rCYQC5Ytkh597lwV7+ATkI6JLe40TkOGAeDvV/9VscpzQgK28zZV0JSPfdxjwvtTOFFCWEKuY/xT4HG0kLAzFpM7LhOrx0fgtvn74E2TMyf4uvlEJylOvrLEXtIunUwo1/H51poFROegm6y6phvr/FlwWoWAvXolMutiiOP1GJvl/FB7n+LrmeWVxn4a6Uf+CstYX1xMt3aC3p85EG8andQMbJzammc33lbrnX5+6WdUEhqA8hfqBc5OgZR0n/c5Bx0KYyUx/GzhJXTokh90ekJ2I2j9MPab6qSU+kJn5fykLlAj8ya4CD9Kbsg6QuSbs98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(2906002)(38100700001)(66946007)(6506007)(36756003)(52116002)(66476007)(478600001)(4326008)(86362001)(1076003)(1006002)(6666004)(66556008)(107886003)(5660300002)(26005)(8676002)(956004)(2616005)(316002)(66574015)(83380400001)(186003)(6486002)(16526019)(6512007)(8936002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bjZLWWRoNjBCOEtOVDd5NXkvZFdpa2d4VHZKaGlkMHlXcWw0UmRkV1N6dUl4?=
 =?utf-8?B?MGV4b1dteVFsQVVxYVowVElyVW5EM083MGR4anQzczdySFdVMVNnZWRvb0Jj?=
 =?utf-8?B?M05aTXRwQ1JIVVAwRktnMWszb0MvRUFITmpYQyt3M2VwSk5GRHFXWTdId3Nr?=
 =?utf-8?B?djcwZTdMM01VMTF3OW1ObWNpNGl1ck1sOHRXbkdkL1BKZUZJaG1SVTBhQ2hW?=
 =?utf-8?B?QWhOZHVxTHFLMmhGMGRxdUZ5UVI3NzM1cXRQUzRnOHF6QWYrNHFrYTdpN21U?=
 =?utf-8?B?ZGNrbWJkVUlwRW8xK0RoOVBFU0IzaU8zaWNzU2xTTkZLdklENkx0eXNmZG95?=
 =?utf-8?B?RWpvYnozblpvRjNuV2tQQkZQTE1TZmdPTVlXRnpqdlFIZkIrZzE2SlUyTVhx?=
 =?utf-8?B?MWxnT1RYM2poMDhjdGFQNUpjUzRMUkNNM3NDSCs5NVNaSDg2Rk9FQThROTZz?=
 =?utf-8?B?bHNDME1pWWhJRjdtNU5yUkVLYTNnUCtpWUVvMEJ6MitOT1FwT216Q2h0WFZJ?=
 =?utf-8?B?Yy9BMHEwUjRKZFN3dUlwSmErS0RuSFhxNVZFWWdXamF3b1pMVUdHN2xSMlNh?=
 =?utf-8?B?OEw2eHpHY29zb0tLdFloN0pQZWlSdzVMR1l1Z1VCRlM1eTMySk85M2xpTHZ0?=
 =?utf-8?B?R3lYSGFCeFBTSVY3Z0pLWW42U3VYOUlnTXpQUml3RVdQaS9ULzVycExCSXBM?=
 =?utf-8?B?R1NTSXJGdHhrZGU4M1pyK2ErRDV5QWQxZ2dTbysvRFVaNjg4NUNQbzZrWkVW?=
 =?utf-8?B?cEtkQVpEcHNBb1B4S0xRZU40WGJwL3Y2eG1GV01ZcENhMGZ6WGF6SFJiWW9i?=
 =?utf-8?B?eEdNb1kydEpNMzAwYkYxUFpNMUE4RHhZUU5CSGtDNWx3YmZhY21UeFBiYnBl?=
 =?utf-8?B?MDBBVzd6WTlHUVNtajdKNDF2cldVdHB5VWdUMzhLaWxhR2c1RWx6SS91TGVu?=
 =?utf-8?B?eFEvK3FBVHNRSTFwWlRJY0lMSEJzUVBFZ2hkd3dOdkFtODNxclV5Yk5UMDlO?=
 =?utf-8?B?Q2xZVklERDJHaVlUQktFQVN4cFVpTk0zOCtWenpGemYydUhQOHBoRDhORHdi?=
 =?utf-8?B?cEhJdExaY1ZRUHgvdTMzWmh0dEl2TWhTNmF0cGU1RDJUY2c1Q1lNTm9sQ0ZZ?=
 =?utf-8?B?QjB0U1VmM1lETjJUNGt2anlPaHdaS0YzeGpsQllRYm0rZCtsWkJ4dnJaUG9p?=
 =?utf-8?B?VnlyYWRCOUp3cngya25lbUU3d2dmU2VvQ29HWG83WGlQOWltQllqQ2NZK0h4?=
 =?utf-8?B?aDg1OE5pYVpUbTVaRDNOVkxwZWF4MS9kSzcxYTd3Q1h6K0xoRkhURGFlNWJv?=
 =?utf-8?B?VmFRMTlGTFJvT3grM0RndHlCWTlNb3U0TCtCdnRveCtLalZwOEp6UjEvbkxP?=
 =?utf-8?B?ZjZwKy9iaGhENDBDZlNCWml2N1Fyd0VaTndDOFRUL0xLMGxEMkhvQ3FJcTVu?=
 =?utf-8?B?eTUzUnEzaS9XNHJxMSt1OTdBcnM5T3Jaa2ZEZ0NHeWEyZzA1SXI0VjdITUo3?=
 =?utf-8?B?RExhWjk3VThTS2MxMU51UDEvYkFBRkV1MjNEU2VlRllqVzlxRVBaODBpVVpt?=
 =?utf-8?B?aHVIT2lzWU0xZUJwOHVPNDluYkt1T1FyeTBYUDIrb01LelVhLzkvdjl0K0xt?=
 =?utf-8?B?WC82RjZMNHhUR0JIZWh6ME1JZ1FYV0RLSGpFSyswVkV2SWpEOXFIYlpzdXRG?=
 =?utf-8?B?cnhLaFBrNE4wNml0V21xQjdPbVgwcHNzY0V6N09vSGZqa093V1U5UnBzcHRU?=
 =?utf-8?Q?iuDYO+oYyHZMmZQe3B7eAQtkU3pEgPYelX8UDfx?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2490e589-3076-463c-7a97-08d8f4277c80
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 09:29:30.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxy84pK0TXF4CywktARC7Q9lQA2Sb/BHYn62mx6j07Msiv4IBkmnZA1WoxP9aVHmNBbWQLN6SPtGc75is/7p3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4712
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Rahul Taya <Rahul.Taya@kpit.com>

Added below patch to fix CVE-2020-13791.

CVE-2020-13791.patch

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13791.patch            | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 5e8d3e09ff..01c78f6577 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -54,6 +54,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
           file://CVE-2020-24352.patch \
           file://CVE-2020-25723.patch \
           file://CVE-2021-20203.patch \
+          file://CVE-2020-13791.patch \
           "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/re=
cipes-devtools/qemu/qemu/CVE-2020-13791.patch
new file mode 100644
index 0000000000..6582abce59
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
@@ -0,0 +1,52 @@
+From f7d6a635fa3b7797f9d072e280f065bf3cfcd24d Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 4 Jun 2020 17:05:25 +0530
+Subject: [PATCH] pci: assert configuration access is within bounds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+While accessing PCI configuration bytes, assert that
+'address + len' is within PCI configuration space.
+
+Generally it is within bounds. This is more of a defensive
+assert, in case a buggy device was to send 'address' which
+may go out of bounds.
+
+Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20200604113525.58898-1-ppandit@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+CVE: CVE-2020-13791
+Upstream-Status: Backport[https://github.com/qemu/qemu/commit/f7d6a635fa3b=
7797f9d072e280f065bf3cfcd24d.patch]
+Comment: No hunks refreshed and no warnings were seen while applying patch=
.
+Affected version: >=3D4.2.0 but patch already present in Master and Gatesg=
arth branches.
+Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
+---
+ hw/pci/pci.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/pci/pci.c b/hw/pci/pci.c
+index 70c66965f56..7bf2ae6d92a 100644
+--- a/hw/pci/pci.c
++++ b/hw/pci/pci.c
+@@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
+ {
+     uint32_t val =3D 0;
+
++    assert(address + len <=3D pci_config_size(d));
++
+     if (pci_is_express_downstream_port(d) &&
+         ranges_overlap(address, len, d->exp.exp_cap + PCI_EXP_LNKSTA, 2))=
 {
+         pcie_sync_bridge_lnk(d);
+@@ -1394,6 +1396,8 @@ void pci_default_write_config(PCIDevice *d, uint32_t=
 addr, uint32_t val_in, int
+     int i, was_irq_disabled =3D pci_irq_disabled(d);
+     uint32_t val =3D val_in;
+
++    assert(addr + l <=3D pci_config_size(d));
++
+     for (i =3D 0; i < l; val >>=3D 8, ++i) {
+         uint8_t wmask =3D d->wmask[addr + i];
+         uint8_t w1cmask =3D d->w1cmask[addr + i];
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
