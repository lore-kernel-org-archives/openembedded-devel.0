Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.43])
 by mx.groups.io with SMTP id smtpd.web08.1207.1603399706253039502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 13:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QC8nxru5;
 spf=pass (domain: windriver.com, ip: 40.107.76.43, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fETfp6INWhGoMvCw5tyXThog25RUVFZdK3S8/Dhk6AY7u/I6d1nWsDces4J/iLFFH7Qw9+DlAxqfhr+eYJ2kvIDNal3ErPKiqjvFYgC2RSz9Jzw7nuKtiFVXJkG3KAmABfUxPmg3K0VePLx27m2mWoSQHqzkJEv0My/rpCI1qPrYjRe7ISBwAtkOpnF0YsumHQ+Das2s3u1KmLioeSN6FNJE/sOsJtuHZk/8VEslgsB7H1ebUHlvBkjvWmF9TRpb7EU1y0DrkgrQCp1gG7m3pPwAvUSBgGGLDPDBmELTJ7vc+mq4YZZligKF+nr1q9Ox2anRupwI5q3SRmk/16RH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsxvSmfuFO62i7fjTPH4WeVXWa+AF93bfn+cIrnpwkQ=;
 b=LEWuroGFcqCcq9fXLNec2iKngv4TQTAkx2zdwOefeWHxszhekpyu+9uNfSYjjih4yVC+W3i/ZWEEvHB/mKAroDdsPMv7JGiQA+aoSdDR+mDbBUMY6TBPx3Fer9yAsuVDLyJBwPiToObFsE1S83+kiitgYdkSxEyyGQC+exKAZ/JvmmzIMfTo4aZAPMCP4um5IuLXzzug6oSN5vgx+F+Jxilb0cPqjUfGBFzp2wqhdkJv5NYOTL5Y4bxpzBLpIvUoijOvml1WnI6jc3iYVCrSPvtt+aOedRIQMdUDZGKbjn1BL3JNzOC/nSS6+buVrgWVBpJdpQAIll6KTXt/LnEF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsxvSmfuFO62i7fjTPH4WeVXWa+AF93bfn+cIrnpwkQ=;
 b=QC8nxru5tW/v8fWGLZzqcOpR56qgl0ky/W/LejgF2VigBoTyqmjGv/XyC8U3Pnjm+2iBihk+E80oLD0dAvIxFFtMn+jdbSfPmjEPEF2SPHh8GxmvJjs39+CYmqRRCIN4MP65U0VOtSs4NCMCbL8uBpf9iZRgea8zlTbIwc6r9ZE=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3542.namprd11.prod.outlook.com (2603:10b6:a03:b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 22 Oct
 2020 20:48:25 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::80ee:21bc:b0aa:d35c%7]) with mapi id 15.20.3499.018; Thu, 22 Oct 2020
 20:48:24 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: FW: [meta-oe][PATCH 1/1] multipathd: modify error handling for monitor buffer resizing
Thread-Topic: [meta-oe][PATCH 1/1] multipathd:  modify error handling for
 monitor buffer resizing
Thread-Index: AQHWqLRlXsX6ftNg10quyvbm2aF3A6mkF3/g
Date: Thu, 22 Oct 2020 20:48:24 +0000
Message-ID: 
 <BY5PR11MB3992704203F6798E649D1279881D0@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20201022204617.51780-1-joe.slater@windriver.com>
In-Reply-To: <20201022204617.51780-1-joe.slater@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.5.219.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfe6c3f5-359a-4beb-83eb-08d876cbd227
x-ms-traffictypediagnostic: BYAPR11MB3542:
x-microsoft-antispam-prvs: 
 <BYAPR11MB354284D8E345795C5F0005B9881D0@BYAPR11MB3542.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cLUzWMX8+ItOKxz12BXVbstoDcMKIPM11cFYwUVAbwbtEt4Ea8+8x3odBapPjWCRCxNesh8zZSjixiXbPtw/mWy+72Ocq1slaeK4W8Zkp2DGocTvbnZCD6IaJlwj7599QtGbxfLy/Aq4J/xo+gIzWyiLCVv7ZVB+fX9XnU4TF30osQilApCwN8mCaIk1rxOHGGD4Exh3Kau2C/am+HhHuuLlGMj+pzR5bZQXmxomUSZ28dXdu/QoL1adbl0u/w0568YZJONQo3tgkNWFDcOTSUVJ8+zDvorYYrdCBA5uzcdk/mesj26Wplohp/dllQipzQchKSFUePong2aFx0+YpQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(8676002)(316002)(52536014)(53546011)(5660300002)(26005)(71200400001)(478600001)(55016002)(6506007)(186003)(86362001)(66476007)(66446008)(64756008)(76116006)(66946007)(9686003)(7696005)(6916009)(33656002)(8936002)(2906002)(66556008)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 hJzKJaHFEIv7uNgH5nRCKBi39Ase3GXa2h6UCN0kz2HqI4xPBkLxrpEiTIQMsgaWkR5U5BGU9kXq8FMP0E28bHqQRqpLR1JCXzOKXFiSPZh4vKuopkKIfLimoj5teWMX+SrB7SCdgstFvUJKxT4Aa6Ss/nXAwqf9pczIKE0qJVRk7vi59gXFBpgWBLBaP1J1yQBNS3WxcY+qIdvKD05vbdlXi+nXNmU9d1kqlxqot2JQ8CCc503hVoZDSPbfq+ecjlTMT7wS3laNKLVOW5G1TAhtkcL6PTirHP8SqYAr6U+x/Fz4XkeA/JfeMUmoyeRydnCqaJQ7voFyQhKo+8HSYD1oystqMK/ioBin6MqXD4NC1YJIfuA5Rg33zvc6He5z7F3/FriUTtL2YMWzm6ecUmqPWQANat+OSTj3ywSlXuroXvfebRXWuHadx5LcgLR0K6YMkDotp98J3iTwY1LT9odJGdTlusAFGDRZhkO49QH/ReTtlGpNjtIzdSzmoki6oo9KeT9S9dUs8QtsIvh0TEfEwElpgKd5WJK0PA/TBekuI2bdXrewatxi4Fb4MuH4hOXj+BXQPthGcBqepgPFmFoSAqIYMCiCJlww0rTbYlztP8NfieG2zi52R79PZzBgMQz0fCM9MDQf9h5LL7GG1g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe6c3f5-359a-4beb-83eb-08d876cbd227
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 20:48:24.7639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDFa1y6raraeG5wN7vBqGh1NHbQlptcnZku1cpWhek6szkUYvEeXgXsQWoD8Cy9EgDhikaE8klQ8C/Kr0E/uDGS3N2JIymIbIAx+uMG0ipA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3542
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Joe Slater <joe.slater@windriver.com>=20
Sent: Thursday, October 22, 2020 1:46 PM
To: Slater, Joseph <joe.slater@windriver.com>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>
Subject: [meta-oe][PATCH 1/1] multipathd: modify error handling for monitor=
 buffer resizing

udev_monitor_set_receive_buffer_size() will return a negative value if not =
successful.  The assumption that it will return 0 for success is incorrect.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../files/0001-recbuf-resize.patch            | 24 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-recb=
uf-resize.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-recbuf-resi=
ze.patch b/meta-oe/recipes-support/multipath-tools/files/0001-recbuf-resize=
.patch
new file mode 100644
index 000000000..5e073c4af
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-recbuf-resize.p
+++ atch
@@ -0,0 +1,24 @@
+multipathd:  modify error handling for monitor buffer resizing
+
+udev_monitor_set_receive_buffer_size() will return a negative value if=20
+not successful.  We do not generate a warning message if the failure is=20
+due to not having permission to override kernel size limits.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/libmultipath/uevent.c
++++ b/libmultipath/uevent.c
+@@ -810,7 +810,8 @@ int uevent_listen(struct udev *udev)
+ 	}
+ 	pthread_cleanup_push(monitor_cleanup, monitor);  #ifdef=20
+LIBUDEV_API_RECVBUF
+-	if (udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024))
++	err =3D udev_monitor_set_receive_buffer_size(monitor, 128 * 1024 * 1024)=
;
++	if (err < 0 && err !=3D -EACCES && err !=3D -EPERM)
+ 		condlog(2, "failed to increase buffer size"); #endif
+ 	fd =3D udev_monitor_get_fd(monitor);
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.=
bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 331c0cd01..08b2ce87f 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "git://git.opensvc.com/multipath-tools/.git;p=
rotocol=3Dhttp \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
+           file://0001-recbuf-resize.patch \
            "
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2"
--
2.17.1

