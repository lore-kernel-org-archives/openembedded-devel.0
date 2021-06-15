Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.77])
 by mx.groups.io with SMTP id smtpd.web12.11335.1623771684346255804
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=aeV9cEq0;
 spf=pass (domain: de.bosch.com, ip: 40.107.1.77, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFKtJoCmfNjElirdNuqGJFbgnSUsKU/9tTjaYh+2I7h1QIQJvc6jM/r9DLzUMFS+4G4DJFrBEPSdGvZ6LDo9GsGxXHeAV8we6UdNbfCHbipla08/fH81NaH8JWH0RF0717K/9eiPytF0nrz3WDzSmuAestMvkDHoIGLvuRQANoAoC1peV7i9vNtWuRr+w9wgSY5q3AuMpqX536UvitPdQjzw33nXVxWUk7g2Gr02bsFNGQ4LCJnNer+IIWWg4svhBwPonzwXt6fgaA45okBiVvFNCZDrpRFCeqJI+1JwckMdbiicj0sLzRQYpXkFv4BJMt3OEwD0z9cjth2QMYpuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE4D1SCaUGBrA5uyh/ce3QvkOi4eOW6w9uONX6bTpNI=;
 b=iJOjLp0YPNtaAfJN4z7K7RxEVERSQelsAVyO9aR+OKB6I+5O0iwelGZTxiHi+C6NxBMNlG7GpozUi9lLQqEPuEQqqozktQuExOtVQLJbRGwuuufW7nCFyEPpm331hDNTrX13fttbo0XqVLatBi4xGHrjD4DetUIOpWBbj7I3nem75VSgA6BBYl85YxYBYxyfVayHiBtAfiGizAAxe8axizW2TJiWQuqucJJ2bbOyeE3NqRXKN+/0JuhXBce9Qd2y9ZU3l9Zc70PWNLlPMJYZv9qtDno6ct//2UwvT6nkaH7EMUirt9vb846iUwzKkoH7v3EFUah9IFZkaH0fkv1r6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE4D1SCaUGBrA5uyh/ce3QvkOi4eOW6w9uONX6bTpNI=;
 b=aeV9cEq0gHPTzyIcjU6rTjNGVfz8YJ/1SplqhZD9GN745lUA6QUk9X51G49+FZ/83qJ69I/0C76GLE+vL9BQjb5Gr9guoSkVS6E7bgYr/Q8+ZYvGf3OKlMWcp4UGAR8haPttuNDAD60VHRL4HNNhYHGlGG3VHghAsvtYEJ/+tAY=
Received: from AM7PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:20b:130::24)
 by VI1PR10MB3663.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:133::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 15 Jun
 2021 15:41:21 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::fb) by AM7PR03CA0014.outlook.office365.com
 (2603:10a6:20b:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.199) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:21 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Tue, 15 Jun
 2021 17:41:09 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:09 +0200
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:08 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <kevin.zhang3@cn.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-openwrt][PATCH 0/7] Use meta-openwrt for i.MX6 with Poky
Date: Tue, 15 Jun 2021 17:40:42 +0200
Message-ID: <20210615154049.173769-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaef5d40-5c7e-4b12-5343-08d930140653
X-MS-TrafficTypeDiagnostic: VI1PR10MB3663:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB3663A01A50C0D9103FA99463AD309@VI1PR10MB3663.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i0ZqP5cBflqq6Qm+f36O6K/upjdEf36UAg57zWwYHwrPjgmnb2pXAujbwWeBpcvrhRHuqrMO9klIHzNbFMu2+p/h48sMHH0xIgDaS6l6U/8MBdU6fXAQCSoO5T2MUh+FYhSEU7YUIlFmF6qqBl224pTnKJ3Ekb12VQRr3aKuUa3RFjurLZutm2y++R/NQZJ7nJwH/WV+3c44Ab+uSCPVLGX7Iw4gxx8M0TaZRMPGXhSuJYXKJLN6+uZKvdV4TXW7FtfpQhUGF7ZSPWGEDaYZTGEVyZN/73ppBs1oxjQOfz3EUNTNEWjKkIy2/E+Tc9zcl4pCzpW6Wtu+UgWs1UUh7k+W3uTxDId+TrB0aOuEq7zb5tx2BttLwP3H5z3hySNhjuFRYH16lUR2FKVHxFjvBzgvqmXlVOTS89BMJWgPzS2Aikl6EG9R8+bVvTlCUlCXxRaZJKwM0IedIYzWE+7wovLhdl/b5Q2VrVGUmYAzp1Z36VM/8CxyEhRUzD78yQceKzbAEaZ+DyOO0NZGMOegXSpnbIEGColwseJgIWHC51ENYeILN1Ztx2GEFpCYgYl8KwcP2t2gjJaXqquZcjq66/6FS+LAXvFAfvIHH6eJnx+wnsQsiGxqdTExMhUv80XLax+P3kAUUaeHR5CB0uVCnRgHLHOTgjIp+/53Z9LfYO55ePO3SO78S2yTSnX0I+qV
X-Forefront-Antispam-Report: 
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(70586007)(82310400003)(2906002)(7696005)(70206006)(2616005)(86362001)(6666004)(107886003)(4326008)(498600001)(36860700001)(83380400001)(8676002)(44832011)(26005)(110136005)(8936002)(426003)(81166007)(1076003)(54906003)(186003)(336012)(47076005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:21.2219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaef5d40-5c7e-4b12-5343-08d930140653
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3663
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

We made an experiment to build OpenWRT using meta-openwrt and Poky
Dunfell on a i.MX6 Solo platform. For making it build and run we had to
apply the following patches. We hope that the patches help the further
development of meta-openwrt and maybe we get helpful feedback in return.

Kevin Zhang (7):
  layer.conf: Add dunfell to compatible releases
  netifd: Remove dependency on bridge module
  base-files: Do not use /etc/group from OpenWrt
  base-files: Create /run/lock directory
  busybox: Supply patches for different versions
  lucihttp: Add recipe
  luci: Fix error module 'luci.util' not found

 conf/layer.conf                               |  2 +-
 recipes-core/netifd/netifd_git.bb             |  1 -
 recipes-extended/luci/luci/cmake.patch        | 15 +++++-
 recipes-extended/luci/luci_git.bb             |  2 +-
 recipes-extended/lucihttp/lucihttp.bb         | 23 +++++++++
 .../base-files/base-files_3.%.bbappend        |  8 +++-
 ...t_misdetection_triggered_without_LFS.patch | 47 +++++++++++++++++++
 ...t_misdetection_triggered_without_LFS.patch |  0
 ...t_misdetection_triggered_without_LFS.patch | 46 ++++++++++++++++++
 recipes-tweaks/busybox/busybox_%.bbappend     |  1 -
 .../busybox/busybox_1.31.%.bbappend           |  7 +++
 .../busybox/busybox_1.32.%.bbappend           |  7 +++
 .../busybox/busybox_1.33.%.bbappend           |  7 +++
 13 files changed, 160 insertions(+), 6 deletions(-)
 create mode 100644 recipes-extended/lucihttp/lucihttp.bb
 create mode 100644 recipes-tweaks/busybox/busybox-1.31.%/z300-fix_off_t_mi=
sdetection_triggered_without_LFS.patch
 rename recipes-tweaks/busybox/{busybox =3D> busybox-1.32.%}/z300-fix_off_t=
_misdetection_triggered_without_LFS.patch (100%)
 create mode 100644 recipes-tweaks/busybox/busybox-1.33.%/z300-fix_off_t_mi=
sdetection_triggered_without_LFS.patch
 create mode 100644 recipes-tweaks/busybox/busybox_1.31.%.bbappend
 create mode 100644 recipes-tweaks/busybox/busybox_1.32.%.bbappend
 create mode 100644 recipes-tweaks/busybox/busybox_1.33.%.bbappend

--=20
2.25.1

