Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.83])
 by mx.groups.io with SMTP id smtpd.web12.496.1592421355481917816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 12:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=lN20eyOn;
 spf=pass (domain: xevo.com, ip: 40.107.237.83, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMugkNZs9UwAw1w0VQu2KXHaz7btGVzltw5eiE0dz0qMjGdFjEvJJd1SDY6Z4OTCHGcJ2O5BGfpKNVJihwpkvWkc3/uryX7grJt0PL1u6PpQBu6RSAQJuvM6zncQtzpW0BXf9mpDMaT+8RMgLWsq6mljtnUJzZn4TTWFIA8CJXkhwIwuJDqEx7h9f9/NhOQF3uLHu8p2Tl4O8gqFQajSO2Ujk8A7JlRZSHsjRJjUhI7I94xy/Nq0yw6PLGIXZK/lwynwuISOsk17JCSFrFeMNWjXnTdPfchDG0UepwXD8ScTHDMFjU3Ezp+79z3j/a34CDFz6QHAgH8R44Afuvc/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJjn8jZ/BPCbWYpl5Ug/FV3IQndCmf70Q9Jyzcs2g7Q=;
 b=NnngMeMcrL14gcBIp7RihKZGDhiCP+pbMWDnISypLzNigcu2OUb6ELwB1pX3JolDBVGms338697jtCLWTMZ9P4SseupSRJ8bYX8EHGjglne5zn6idVwj+VjKg84tW/wxR6UEKrsWsROLXNG01MlMNVFryiCzFGlWEor6NCg4RSBXznDQVLrnO8EP1eBD95EQcAUb+ZwRpv13emS1YfNQXki6O7FIBab3pZiEFjvRiVzwaeTOzOIgIqLWRskNbTmiIwF16fD0rVZNUJ2RyIaWn/Y9jYbKo/XZ0fAubIp11nXa/uKo8yl/SG3/gV/WuHSYEm+AEXQ3rI1rK7RNridGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJjn8jZ/BPCbWYpl5Ug/FV3IQndCmf70Q9Jyzcs2g7Q=;
 b=lN20eyOn6vnp8flMPFsDIFcwxM9NISKNuw5xjEsSwScuFi5H9KYIGqTj/SIHoSBnQIXd0GA6Tyls6IDTKXq+dnRCQ1X0DA6cjuXSKFp7juz09ZV8BW1V+Xs93FfyNNDSsehFYTHmDXDxYTTEtnwDxK4eX2W1Nx2YDG4dG5d4mhQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MW3PR18MB3498.namprd18.prod.outlook.com (2603:10b6:303:5f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 19:15:54 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050%5]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 19:15:54 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com,
	mkelly@xevo.com,
	Ryan Rowe <rrowe@xevo.com>
Subject: [meta-python][PATCH v2 1/2] add python3-dynamic-dispatch
Date: Wed, 17 Jun 2020 12:15:50 -0700
Message-Id: <20200617191551.49812-1-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-ClientProxiedBy: CO2PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:104:6::24) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by CO2PR04CA0098.namprd04.prod.outlook.com (2603:10b6:104:6::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 19:15:53 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2490a159-539d-42b8-fd8a-08d812f2db18
X-MS-TrafficTypeDiagnostic: MW3PR18MB3498:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR18MB3498444065D1C5E1404F8534CC9A0@MW3PR18MB3498.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oZPcsFfG9SH6wB71Ws17rPxL6n7QWSquG8uVtAR0A19MtVJPrZQU+pWmAOXvFVrQRYRGGu3f9m+p/7N4JtqW5qpBWZFCjGydmY7y6stJwwX4QuRIr6zBxvQ/efIAHOv5+b8SjhRZ0W+59lo3J/9QWF/a7cdABPh5rFdPhf1Oflm2amdpwKD+vmeEgzqhx/KKFLJJOrCwNxFsDQld5bCK4ApIMwlIKNFb1UbKOiclud33eDODQqmsDZUFN076vhHDbpbO7i3ou/8ZI9LaycS/wV/mzIkXinbRQXqBh2z6ogUtaps0t8c1Mpxp1xVYUBV32AV0iL1QckhhAwiMQh07erIF7AwXLLhukWTCVjb/dZ9bvGRQN+UC1GtK2JCMLd+d
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(396003)(346002)(376002)(39840400004)(2906002)(4326008)(186003)(316002)(86362001)(107886003)(5660300002)(478600001)(26005)(16526019)(52116002)(8676002)(36756003)(2616005)(66946007)(956004)(66556008)(66476007)(6916009)(6506007)(6512007)(8936002)(6486002)(1076003)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pPRrg8mXoth+ZSUnL2WhGgwgijBv8CM/wA3vlmCEpCjc6aLnAd8XfSJCVEnXwv+DNBsdpF4uSifxRtTW8UMNmKOK5V6Dm0VZUd/FbmxZRTj/PyoVxQe/kANgwQ3yQL8OECkL9o8fgHB2e9B+4JKdOEOitGcD9zzFWOZbVFn4pPZv5Hol3qrJaG+PCc1HVbmPvF80OoLLBq9hnS+g6Ur5NmMLWsV+g7QtizKIzjNxXgVVxyiIBjN1z4pemR+yFgbDSiGehOQi0NiemlSE3Yzn5qnVVG1CaVkb/KONv/8qukgstI3WCgcTVcOXPoK7HEEk+arBI3T+M/1RleDdFu78DOvaVh6xcAzUkMXEBBdrFMwW0oTbjkFLAw7Y1kWN/TqUd5HrRbVvrKLg3HYXGKpCcfRvC/qhiT67mUfvx7QoPXaWGOeL+mtABxYEYoob+prE96uVrgj6EnYf9q2DLNwDqC5DjryS4hBAL5AlOn2A/6s=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2490a159-539d-42b8-fd8a-08d812f2db18
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 19:15:54.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAFDMSBVFDvO5+u2bzzrqNNlvQmbRvrXh0GvCS8ksZHGjr6FHJjcYAke8gC71h2e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3498
Content-Type: text/plain

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 .../python/python3-dynamic-dispatch_1.0.2.bb   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
new file mode 100644
index 000000000..6485f9d57
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "dynamic dispatch decorator for classes and functions"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "0e29d2afa806b9b87dadfbed6a0afd6d"
+SRC_URI[sha256sum] = "ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d"
+
+PYPI_PACKAGE = "dynamic_dispatch"
+
+DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS_${PN} += "\
+  python3-typing \
+  python3-typeguard \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.2 (Apple Git-113)

