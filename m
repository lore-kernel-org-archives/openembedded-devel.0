Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4091D59F46
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14856.1765552577479725594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=h21WYFyK;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.65, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bS3nYdwE7ReKGNxMxD8Qo/pLYbjLzsb8XeKllyqp+tnYKqT3i0i/8W7xUJF6fE+XbT0BtwIgOYWKUKVzNUdKe0ox3FZ8tB0wtqxdITX/GFsKyF9QJOdMuFJWihiFQbEjOGU79GwQRe9yWCoJzXzCZViUDlHTBzBO90AU72tu7IxRrPkXrYub1UWaz9yNuNrfRNC/nvxIo4QDnrUj5UJI2zK6HXPqQm4qBh+2ya9R1jVQE+8Mxg/WULmTF/a6aUEgP58Ugve/hBz28V681NhxwNTuY8pGsTteJhV9WlyfHSIdlXhriE5i+A2caLEWQto/b71xtzxWyuMBZSNScXjWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHqheRIWs9xYJJpkPwh0cR1xFggJH1i2ga6dLkPQHLM=;
 b=IfhIQMCPlr5j/wpc/Z/nE3XHSgc38QlUffd/gqHa2WWf8WqhMph0kK4GRdmcwCHcRrMuH+zFoORoX+R6gEVESbJDcC4sqXz9+dy4Spxbyc/Of4LjL+cSGqpAvnjoGgwLgp4heF5NURqRncn0LqS8peMT1pphfVA/oqc+ebY3xrXmkLF/amG13LTvdD1tgcNc3cjH4LkLOnIhxbuOrKEzdZtIWomCjdGoL3TldbAoxYX/4oP+MEKHuHZiSyFt9Nk5ulGLzah749EvbongUPE24AVxvOKkuBitsmZ8dpnzceS8bcjGOUIQ1fzDYYwSrmEPkuBlu3GP0Ffic24qwsRSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHqheRIWs9xYJJpkPwh0cR1xFggJH1i2ga6dLkPQHLM=;
 b=h21WYFyKqZfDTL2yExn7HhpHXigNzaPvYcxGjpRIXn3VWATSXVSQrPoqhz46WuIpAwdMxbvMbUm+Li/dfAeMSc4uxqA8MGq0CudLsRW4AXJ0vb1GyT1YNg44lQ8Rp+6eRxeJgtTDAT1P0uLzVNXnEXTZwIti/9UD9L8g7rqjqWmX8PDFq8y5CazxVJEEZ3eshFmK38ZN1/CdBQ8v06NgpYvGiE5EkUCPOpY64Dj3NSGfAhUVq7Y80v/6nlu6+ZZvmJ2nL+1hR9mpYgUgaSmoknN82dtA9MUaPHBrI7wwxsfoByTwraXROKGfUyrnr2ZLveEiGjpAugdX0rbePylVLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:18 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:18 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 08/11] ImageMagick: Fix CVE-2025-57807
Date: Fri, 12 Dec 2025 20:29:44 +0530
Message-ID: <20251212145947.7434-8-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d03139-634c-44c2-1a73-08de398f2a61
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VAIIMwpmJzYnOpOY0X2aBqjrnqYpGrJ9Nx6VnNt5TMsZARRHGya891BVoawR?=
 =?us-ascii?Q?6xdNZMKw7h2EEUULgRnbESJWk96YEuhjTnfZC//MgHhaUYCAcU+UxBBNap2r?=
 =?us-ascii?Q?CyOtkrU4pFLANUsigzY+BN7nqV51R8eVffoxCZe7RsWnGqB1NXsBuh3585YT?=
 =?us-ascii?Q?nFsI3xI6rTOfNNN7684W9ZJFzARGA8aezF+0PywXl4aUtYYnbSYGwugTOmXq?=
 =?us-ascii?Q?yrov+0t2+mJ5nK07ICtyE1z0q6It/o8TlU/6HRgdywAa3GwiAcf6w1AJBRh5?=
 =?us-ascii?Q?jQrjZJlS84iNvDnNxcMO6GBFOSLkEstpa9FJ9mxYp975w6qZiKK2/+VL/hzz?=
 =?us-ascii?Q?d2Tytz8JMAafK495S9mCHBrERcF9OutHoVLNEaUAuXjx1Q7vg1hnDDDZF6Mp?=
 =?us-ascii?Q?ZrZAXPgNElnWX+PTqjcCx8aXU/csnNnHfdbnotGcApPFa5LbAKcXnuuF9LG7?=
 =?us-ascii?Q?DVg9RjXs5n5d3JDUCAqyxSpwniAA2/fftH+s55y7/pPFV0TK5Qk7UoZbYb5T?=
 =?us-ascii?Q?4UqnePanDzGtLlpUlOOGi+ASP2orXfaCZhoKgJObyBL3UvmXwifSPLE/D9HF?=
 =?us-ascii?Q?W/pbQNxktQvaRv3LR45IsdZDSAIeCzyp4Wo6sjaaHUsJS+wylbk7pQT5nbai?=
 =?us-ascii?Q?/gsspjp+CkYYedi2wcIFWuECMZ4hfYAY3aThquaKSfwWUIeKB+25Aqm9i12Q?=
 =?us-ascii?Q?S+iZ5KOHTidzyVVOrjFzqT9caglp5dNijE3qtooSSUBjfgCCPxyoMM97KZZJ?=
 =?us-ascii?Q?b/EVrtafqV6l5eJwtVjSBKlt0RO+bszDY5v1K/tfDMQCvoEwQClLGRi8lrbs?=
 =?us-ascii?Q?8FFrYeBX6d6rVCBqBymT5PDfUv4KBzykEf4f0hjDkso1vAG3a08RQQwfubs8?=
 =?us-ascii?Q?4wH3+zSOZuHl2VWXVVc8Hin49EBkHXvJMTwvQQyQHWHwCoKtxwb9G5fn8Ogf?=
 =?us-ascii?Q?zJuGHH6euKP9pVHhSVZ3ZH6MG7qg4+vNqF31moW6YBiya0KbpZnA25eieZtK?=
 =?us-ascii?Q?4DnJY+lw+j6xPnvqjbWBQ+i6NsJewXwEHCTdFJz3gJfd4DVkICj8W0Tv84c8?=
 =?us-ascii?Q?MNUsIKWEjW0KXWVLx2vQxBWN9QAPjNACJeIh9rb6rb0hWsYtUeYJjEQ3EucL?=
 =?us-ascii?Q?kKQig1dgxoHveDRPdyuZ/BrtqqXA5l7IB1vxmHEY2x6X4Lc+xDFLuumuLpRI?=
 =?us-ascii?Q?iLz5DD6eW6aCboprwdCptQCF+PpoVWQzjNrBCA04l8EE+cXv/eZh/CNdNuPY?=
 =?us-ascii?Q?TQ6ec/b5VU0k5gS6F10ZZRR/Ygar1RPTrCdc9K6TPz7WbyRX36wo5OD1RU21?=
 =?us-ascii?Q?TTw54DnPgodvvzHSpIuNKO41O9ITrR8c3OfzunUB8JgdVzie/ayh8uEwVEG5?=
 =?us-ascii?Q?F7HPf3eQ/FgnRDR1VTL0Cc41zSQXAQldiXdJ72tjPr5Mj3mKYXId0nDEnMb9?=
 =?us-ascii?Q?8ZBDXuDqvH5Z99ZPRx2mq+MmIOYqA9W37dU1+iHl4F457Nm+ZIZOlg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i4RZFxMX3QzFWUaK6ppdQ7RWHUXnAhVEOBO4DZUHwuLS+YfjVLCvwSOhU3gg?=
 =?us-ascii?Q?rct348uryPTIjxm4AI1X1qV5O+PmxpipiCh1pOCqaXEap2iekgoFyXXEMvYd?=
 =?us-ascii?Q?piwfRZoRo8nYlOq8TdwhwhDl7E7JnPFi3WeLLMLxOJlZlltu75kE64xhyRRz?=
 =?us-ascii?Q?36a+TPaKnZ4ZsRfAwslOukQda2h500IkuJgXDHipNUMIHAlymDnzikJilSzi?=
 =?us-ascii?Q?57ZE5qqOVM0FlSwdApyqRS6bPOu+Qx+astDMLqSwO3Xm9Idqa3Bd/pVAbw5g?=
 =?us-ascii?Q?9g1g72e0s1sbisH43Czt9V7ihe63j3DhgNIx2maJIr5gkHBRiLYOhANDFmdx?=
 =?us-ascii?Q?DaPOKxWzWQ6xq9Kvm4XDIhhAHbocpDlh21yDY4m2m4t8iYXuSve/xq0Zw6js?=
 =?us-ascii?Q?V2WxYQzsRZE0ee7QJ2gnHQMtrF/1izz/A6SflqvZTiLoSK+Z8xXiqSbjYpV5?=
 =?us-ascii?Q?R/gaC4oFaLRV/b+uoJiNFB73etZYic/6UFIk7FsNYuiPU+ofh37PosMCUkL6?=
 =?us-ascii?Q?FOQ4jxzZa1PaVNbRy2zx200XWviw41JERsB87KXZZ1bD3PFJnPYEjj5ufpo3?=
 =?us-ascii?Q?1RWg73809ywbA5pBNcfLD81FVbzYFFIxo4PZdWp7jbwFXxxb1NQ256pu8HbV?=
 =?us-ascii?Q?hE7OUJqGpbmhZzDGDbvwnAwQgdlJN53lImYHM7dUngveQys8FoUiLYF5G0HL?=
 =?us-ascii?Q?R2k+md2akgqVPxN9oOeTGuWxCec63jm0qGPGcMfzz7z9bgsTu/qcu3cAtkFo?=
 =?us-ascii?Q?Y59+ZfbYcICBRjqySmjITY4YnUazVpsBmK8n0p+eXCEjU52TceoTEfQcCCbi?=
 =?us-ascii?Q?eCgu/RE6dv6b9Dp46/Kx58JA6LI45NiQzd0BJogCyTTdLN81zf6d40k7SagO?=
 =?us-ascii?Q?q3E7xQhfSEfnXPIzI8n54OtnQgYSxziiMFzUH8ntVqfew4xnwzmTYWGtau58?=
 =?us-ascii?Q?z6ZVRsOCMxIq4VNnCRMdnlO/TciVE46j1uzt0QvSg6Ctf8H9XOVyz4B8ijF6?=
 =?us-ascii?Q?0lfY3LppmqM+NqoTZkCQ2M3Pwy0W9zgSXLH9vWfPW1wAFBUsw1tNn5BKdM6K?=
 =?us-ascii?Q?GjgA7ZpuVoQFInYUHuG4/dISLrUlU+y/BOMfrtJfzsQh78LRo8rHy76xg++3?=
 =?us-ascii?Q?n3JTBU2jTdAPX+qiaORLbajKqqSMA1OJP2eEYEjitRJiFhNgFYvYyYAPrHaA?=
 =?us-ascii?Q?K4QbLYWpJLJBA2SgXvPXpABZjbcltiXlVQp/LdvWpICTrrm/ISjVoHtyaSrC?=
 =?us-ascii?Q?vrJqVFqL6jl2vhbzYRHKtqcbqprDXCWejy0ZxRStnDOYVgENqja1u3/SQNRc?=
 =?us-ascii?Q?+2Tmkp5e3fec+ALaAxHN+dYaG6iSP+5moCfCevmCfZnKT02O8osGymAm/quU?=
 =?us-ascii?Q?lF1l0hnmre4RJl4Fl8zZ50kz6pB3I5u8TdID9P3y9LRi4a5nDUUzfjfpQVsE?=
 =?us-ascii?Q?vZL1L5lKjNfr7ukILKPhoKYz0dWmJ+H6M9yjnhn/kvP4bOtiNqYxUymKCUgJ?=
 =?us-ascii?Q?q+WZvk1K7BpH2nYdMoK+bxmECLYdZCIPuRMUMzqeykLlSOU/9hoySp+OH8WG?=
 =?us-ascii?Q?tJEnsNKPMykX2zo4FbCTfxrWLlB7RsrtK29Gna6Cixl1y8jWu2FfpSDwxXsp?=
 =?us-ascii?Q?1a/NzL4SA6vyT9FkoqIaHfk=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d03139-634c-44c2-1a73-08de398f2a61
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:18.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdI7vRpwv9Ja8QaGHzvbq72kw7JhEGlM7FGAa4y1M/9wgWh+/OXGOeeuzOFDr8wdMaQto9iXUuJoQedSKB0MkjU6x2vVrJZi9pxc6kVib10ByG08MbjivYDJ6YV6k4k5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122625

Backport the fix for CVE-2025-57807

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/077a417a19a5ea8c85559b602754a5b928eef23e]

Add below patch to fix
0008-ImageMagick-Fix-CVE-2025-57807.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0008-ImageMagick-Fix-CVE-2025-57807.patch | 51 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0008-ImageMag=
ick-Fix-CVE-2025-57807.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0008-ImageMagick-Fix=
-CVE-2025-57807.patch b/meta-oe/recipes-support/imagemagick/files/0008-Imag=
eMagick-Fix-CVE-2025-57807.patch
new file mode 100644
index 0000000000..a0aab8afc3
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0008-ImageMagick-Fix-CVE-20=
25-57807.patch
@@ -0,0 +1,51 @@
+From 3d1a6ecbeff10e05d0609125b6feec9ecace7b85 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Fri, 24 Oct 2025 12:37:14 +0530
+Subject: [PATCH 08/18] ImageMagick: Fix CVE-2025-57807
+
+CVE: CVE-2025-57807
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/077a417a19a5ea8c85559b602754a5b928eef23e]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/blob.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/MagickCore/blob.c b/MagickCore/blob.c
+index 6a15d4808..38af749fe 100644
+--- a/MagickCore/blob.c
++++ b/MagickCore/blob.c
+@@ -1598,7 +1598,7 @@ static inline ssize_t WriteBlobStream(Image *image,c=
onst size_t length,
+   extent=3D(MagickSizeType) (blob_info->offset+(MagickOffsetType) length)=
;
+   if (extent >=3D blob_info->extent)
+     {
+-      extent=3Dblob_info->extent+blob_info->quantum+length;
++      extent+=3Dblob_info->quantum+length;
+       blob_info->quantum<<=3D1;
+       if (SetBlobExtent(image,extent) =3D=3D MagickFalse)
+         return(0);
+@@ -5774,12 +5774,15 @@ MagickExport ssize_t WriteBlob(Image *image,const =
size_t length,
+     }
+     case BlobStream:
+     {
+-      if ((blob_info->offset+(MagickOffsetType) length) >=3D
+-          (MagickOffsetType) blob_info->extent)
++      MagickSizeType
++        extent;
++
++      extent=3D(MagickSizeType) (blob_info->offset+(MagickOffsetType) len=
gth);
++      if (extent >=3D blob_info->extent)
+         {
+           if (blob_info->mapped !=3D MagickFalse)
+             return(0);
+-          blob_info->extent+=3Dlength+blob_info->quantum;
++          blob_info->extent=3Dextent+blob_info->quantum+length;
+           blob_info->quantum<<=3D1;
+           blob_info->data=3D(unsigned char *) ResizeQuantumMemory(
+             blob_info->data,blob_info->extent+1,sizeof(*blob_info->data))=
;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 3566932fa2..351e1eaf8c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -32,6 +32,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0006-ImageMagick-Fix-CVE-2025-55004.patch \
     file://0007-ImageMagick-Add-support-patch-to-fix-CVE-2025-57803.patch =
\
     file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
+    file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


