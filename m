Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.41])
 by mx.groups.io with SMTP id smtpd.web11.950.1603171750624359391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 22:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hIaOYL8c;
 spf=pass (domain: windriver.com, ip: 40.107.244.41, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg6sjhK6sVZcd0HRrlfTd4HnkJQOSK0NqV68BXJz/U6nTGB2Ct1zWhgUHGtZQhh0phHvlPTw0/WsF6K07bgMQLd97qEemoJZqOPkO0igRAdrPHpNDxCa+kHv+kIhxWAoKefthX4+FuuFj9f8Q/MNksRdOl9wI+fNnkHepQwcP/DJGE1O43/T5GJ25wO4QVZd7M5Hxh8Wi2lFtXTSTlD2vxDX3IlauyerzJpFDHAgXAYj0VLW5ojcDG0PLVD0rnlwh9BISfBGbRD+knyS7sG9SD9GwAD+GMpNMve17e/FeK6DAGzH+SyQyOZcxSy2SYXLg06Q6/RedINfjE298ev0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q4weNGnPlLZwAGGJAdiSbZu2NYVTGikM9ma3PvS4KY=;
 b=fat6ED6q/9yvAyGhZIaVy6GTkHhSgEp0Rcse4jDv/mWoeZ+aUWA3B9J66/JWBeM373eWHZvqdtgqyUzQWjlTHwf9mSGL0NJUWxz/lzAsbv6pBm0HUufzpE3qV1cvibUlm4kc6IdYWrWnpEsqC2YtDw1j0FRe8np1qLmDq7DXePmByu4JvvWLN1QhUmoNvWDZl4kxGYJewrb/h0Csrmv5jgwdhdBSHHCX9feEpBpTmUqVV+MPUsGivcRnbSt6IWYA7tAgzVhSYkyxm1OUcaGCEqUNXT7CCusVYqTeB4S+3C/RgA3Rrt+yA9SKQ0w53+Ocv43HCQ4wCps13BNVHXXL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q4weNGnPlLZwAGGJAdiSbZu2NYVTGikM9ma3PvS4KY=;
 b=hIaOYL8c9JAEEUJ5t3ZUm4eh1KVKj8CpIpvHegCOw6Fllz9gS8GXIBUz0ESXhRE/4Ty611tZuwuSZWLbMBWD/2AObLrmNSiJaXgcdgqRZbtJyubxWBbC6vJL5W+dZLajxdHxfVHhHpcAWYtBL0el4lHJ6Sr+TjxHbhZG/8X92dM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3189.namprd11.prod.outlook.com (2603:10b6:a03:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 20 Oct
 2020 05:29:09 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4%5]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 05:29:09 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] open-isns: use /run instead of /var/run in systemd service file
Date: Tue, 20 Oct 2020 13:28:47 +0800
Message-Id: <20201020052847.34507-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0139.apcprd02.prod.outlook.com
 (2603:1096:202:16::23) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0139.apcprd02.prod.outlook.com (2603:1096:202:16::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 05:29:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51f8f482-305e-4759-5973-08d874b911d6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3189:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31893C741730D6F00651A3F7ED1F0@BYAPR11MB3189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BKJTCb7n4nUlpj73pQ3T5ZwVhz5+wlL6FOFtyPLkib+P9LKSV6WPxsQldT2+luwqlUsjpMTsiN1XOcBfyYt0y4MmlJRm9emTM/oXLP6drknyRKPxUG3THiYiqpE6tqeDrpmO74tzfGe/8Z0PZRT919VKv9xIHg3HWnRRMSP7GieBZXjmqAbLS6KFlZkRgFj578VLbukLEhw6TEVOGWwR1mhxdKXBpCgPRVEbVUAUUMha3lkUmtu53u/vS1BQHXodQ3BjtRujgjgMxedRP2rMltKEL+Syq+WUk/v/3JsllPB2lL0frxc4w6APMidwGcNi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(346002)(396003)(6916009)(6666004)(956004)(6512007)(2616005)(83380400001)(6486002)(1076003)(26005)(186003)(16526019)(316002)(66476007)(66556008)(86362001)(52116002)(36756003)(5660300002)(8676002)(8936002)(478600001)(6506007)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mvy+fKHRKq6Kq3Gm7534mpAZoqb8UnEICexBX58OydB0AITfE6js8jmFitaSOAJAjzaHVjCCrG0fp3MbqeGFq1v6IdPmq2G9vtUk8tC5YtG2YDG/eKqhGgq2H/t6r1DsGcQxdiX0L/m/U1VVP3tl1I6Xg06D+LNhzv75NP4ztoDcb53p6/lBKKd83bT44ZmgZsr/ebsMCo/lMAX7rOhwryimx+76j7aHmiBD0sskNT7J71mIgXnWfdHOITz7CoYBuDoO0CMVzPZq6PHRz42tKyfXgesCKyyEtc+9YJfPGm/+f10gi6FOTXL4PYXlQT3A++Sli5xCk1oMTMHmRtL2wG0zvBjx+Asa7dQyggLDBpm5Sp6A8dpdYWN6Mlf82K3fqpuJsbyZekM7lEjto3AQM5o+J9VITbMqUXsU/1l+Q235+qTxYh6rOmcdHLkMW1dP3ZG/A0KzN3oIg9c6+nO4+Y+xZQdT/Tf5W8EGllz7/NrCmJ3BjVlmLTazYoJbLIMdJAbm7HMl8xWRrqHG9vR0JzyWNDRu/QEJLS05E4Pk4kfly1ovyAbE9N6lopyH/oWZ+Jy3oFMP+dyOz+vCm6n+5fHh0WcrES9Xa6sDd238QJ3njIkWGtTLFxk35FFa9X6c8mbrHyyiaqdRqrZmRP1ZDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f8f482-305e-4759-5973-08d874b911d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 05:29:09.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmDA0nRkkIBND90KJ5pQRwjEHXjS6mK4h3ImViLmXYVjCYfOIr/pBQl58sn8Ygdj/A4bEDZwNv5/gFFSM2hvXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3189
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...sd.socket-use-run-instead-of-var-run.patch | 26 +++++++++++++++++++
 .../open-isns/open-isns_0.99.bb               |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/open-isns/files/0001-isnsd.socket-use-run-instead-of-var-run.patch

diff --git a/meta-networking/recipes-support/open-isns/files/0001-isnsd.socket-use-run-instead-of-var-run.patch b/meta-networking/recipes-support/open-isns/files/0001-isnsd.socket-use-run-instead-of-var-run.patch
new file mode 100644
index 000000000..1dde1cae8
--- /dev/null
+++ b/meta-networking/recipes-support/open-isns/files/0001-isnsd.socket-use-run-instead-of-var-run.patch
@@ -0,0 +1,26 @@
+From 9413921d5af5e5e38541f97fee0f1aa40024a3ed Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 20 Oct 2020 13:21:57 +0800
+Subject: [PATCH] isnsd.socket: use /run instead of /var/run
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ isnsd.socket | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/isnsd.socket b/isnsd.socket
+index 652cd46..7dfcf51 100644
+--- a/isnsd.socket
++++ b/isnsd.socket
+@@ -1,5 +1,5 @@
+ [Socket]
+-ListenStream=/var/run/isnsctl
++ListenStream=/run/isnsctl
+ PassCredentials=true
+ 
+ [Socket]
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.99.bb b/meta-networking/recipes-support/open-isns/open-isns_0.99.bb
index a03b92f5f..eb04dfae3 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.99.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.99.bb
@@ -13,7 +13,9 @@ SECTION = "net"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/open-iscsi/open-isns"
+SRC_URI = "git://github.com/open-iscsi/open-isns \
+           file://0001-isnsd.socket-use-run-instead-of-var-run.patch \
+           "
 
 SRCREV = "cfdbcff867ee580a71bc9c18c3a38a6057df0150"
 
-- 
2.17.1

