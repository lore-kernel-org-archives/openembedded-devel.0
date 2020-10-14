Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.47])
 by mx.groups.io with SMTP id smtpd.web11.6099.1602659061444817275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SRgpHrem;
 spf=pass (domain: windriver.com, ip: 40.107.220.47, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5q5qK2gIg6Vm+x2/CpltDvu5hlwMX9r3Pyd/V8+npNZvxey7+C8wO+ZGospYPgwJB/VVq9pXfMynVetapV1LxP8LH15QyFjKmAS86MToZAKrJoXhH56PB+7QaPaPje9NRkMDbXnsDZNsN1U0uQPOJ6pkqJUlRGbdg+3AhiiKQma7a4omnOjDtvWWBA8nwhj7BI99BectXhi/9KtPgYMwFKisI8jRB2Wj0glyJeMzd7QSOMhYD9A9iUk2m7Zut0DgX5AhDJ0BUFeRjZz7vbiDwxoMs5/7wf78dG6BMoaWkh9YAA6dDRVPspz+Whd8MxemJVWdGDoIU8TDESseOGAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HPd+LS+I+ilzm4ZFN8FXBDsbFujA0GjPwbFX5e0n0c=;
 b=AU4t/ax2Y1Cox6tDFvblk4RKZqDjl8Op5CGHDAxH3Xwl/fqKzY7RzB94Rj2g3IPIDprzAUQ7IQHm1p4gj74+KjGGP3r4Fzpq1i2E5dEh131fFIMZG8CEHJoO2TtdSaWJereTUpJIwbE2fyKDGu1muLJ1C3Fe+NUfLRZ11S3VS4i2cfe/YUwAF1Tqy2enRnPY5if7qBkeU3pBth1sT55Zi7+9/JsvqcLlGmeLQelqOpisyDt4OYLaUeA2nT2UsC1juoxBw79FF74BmUtrzjE5K93G9fqnlmWRFVBqa80y8LElpJAaZtfPnWL+ZLph5wMGAEqdflIEnni1ljMUYSi6yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HPd+LS+I+ilzm4ZFN8FXBDsbFujA0GjPwbFX5e0n0c=;
 b=SRgpHremg4ek9l+jJvwhoD3Pog5aXstma42R1jfY8bfVVMm7HWNVdcrAcHepk132NQ0pF8CU653YEXdhNJ7hPUGR8fH74ETCNz8+mK0JtZj2sCppXm97VCDDHv8MdDdeCjbXSe5vGvCqK7ZwcNdflgXInLQXBdXCGzFDmj5HFGo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Wed, 14 Oct
 2020 07:04:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 07:04:20 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] networkmanager: remove PACKAGECONFIG[dhclient]
Date: Wed, 14 Oct 2020 15:04:08 +0800
Message-Id: <20201014070408.21621-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014070408.21621-1-yi.zhao@windriver.com>
References: <20201014070408.21621-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 07:04:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aff0d5f0-ea84-484e-0beb-08d8700f5f84
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1632ED38FBFF237007BB96E5F9050@MWHPR11MB1632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/dWcwc1UHpLztN+OzS9P5nyiiHnvaccc5rWqXbDHdZtYIuBWYtxqjZy8BXsrzEqQwDDCEhupk7ppeiLTYUU0Yeo4noKVMnvepDGa3APlpJvrJAK+k1xvADwama2vjYkFYKpDQSqR5huPku9NBqatXtOsVGkhoJQ7/9S9CPgBPU/++fDwbZEFRe5KR8KIgiGQDKFOC2zhEG2KaEdtemOWNz6THlpz2KzWoVTD7PXVBbpfgFs+lmzGAhuv/GLEoIDbv8j7nzqbgmDmAuohOOSjfetH/e6CtX3QlBjRR8WXFmVLPjq1quWlv9iawcoZwXqZgHVijiwQG692L5Q/LVIDF2w6+5Tz2N+iTKIndPNP1aVvNnoxzo5DbxAjVsMSD0nP4bq3lmV4hqVLnUIpTn++NQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39850400004)(136003)(346002)(6916009)(83380400001)(44832011)(2906002)(956004)(2616005)(83080400001)(16526019)(6666004)(52116002)(186003)(6512007)(26005)(6506007)(36756003)(66556008)(478600001)(8936002)(86362001)(8676002)(6486002)(966005)(1076003)(316002)(66946007)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GG/dP+SR2RHX5/I4kw6dF710KU2FYQ3OQKJYexDZEMiaA75DboIKPY44e7LfnJT9ogT2/vvwaYZ5dEy4d2qRCMQTYgG4z++Py0M2erzL1DiPoFOGvKzMXDa3DhmiPhOM5j+jfWVF/RTECtxqDqC1uFYbRws+1DsVVvxE2j3nOTIbe2YLIEgJLD72W5Kl8tdkEaMNPr2A+DybdrNB/Uf8wbzE+QTyKHXOEqTxvSD8GlLWG8TP//xEVVsNAFNhyNN9dNxLO4New0QieS80Hdw0IGzK3gjVvJxoxqbzwaGTv+8v91q92l8Uvxf7g2arDsy1saoSKHbgXsUZcBtEZ2p5zjx2cdxjmjgr0jCmA1V8w8S1s/pgpt1z7LO6zYHH4iZi7giF7S5dnHqeW3VlN6vXcxtqR7T4nem1Csqxwo79uEItZFlY6xSqQTjj0K5IThy5oQoq1NLe7wZaPXNcib1YYX8DhFXZBKAooLnQrHNgW9ssjlQzu8Nvuarl1zMhxVLlke2liB4GVeypLe2u7ZgKOriVB/xc+VLSL+3tfqwzmNzY6kVzZBnD+NEdr3fJntBQq3vWMsD2/VqRcWmXRzeqWrz5iDJH0XMB7T+hegxxo1CXZbZYhUKY99oLinENiGjOvtMlobBmUSdCVampkgH+UQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff0d5f0-ea84-484e-0beb-08d8700f5f84
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 07:04:20.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVfdWYddIolhiUd0p9c/a0nhNYCQMNEA6/cg2qgkyg0TnXoEYNsuJlhQ85K1atLrNvqJrAqShwKuSplM5Q4fNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1632
Content-Type: text/plain

The dhcp-client has been removed from oe-core and the current
networkmanager does not support dhcpcd >= 9.0 (See bug report:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/410)

Remove the PACKAGECONFIG[dhclient] and pass --with-dhclient/dhcpcd=no
explicitly to EXTRA_OECONF. Otherwise it will search the host path when
configure.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../networkmanager/networkmanager_1.22.14.bb              | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
index ac2282ea1..2613076a7 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
@@ -45,6 +45,10 @@ EXTRA_OECONF = " \
     --with-tests \
     --with-nmtui=yes \
     --with-udev-dir=${nonarch_base_libdir}/udev \
+    --with-dhclient=no \
+    --with-dhcpcd=no \
+    --with-dhcpcanon=no \
+    --with-netconfig=no \
 "
 
 # stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template
@@ -58,7 +62,7 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
 }
 
-PACKAGECONFIG ??= "nss ifupdown dhclient dnsmasq \
+PACKAGECONFIG ??= "nss ifupdown dnsmasq \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
@@ -73,8 +77,6 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
-# Use full featured dhcp client instead of internal one
-PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcpcd"
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "--with-resolvconf=${base_sbindir}/resolvconf,,,resolvconf"
-- 
2.17.1

