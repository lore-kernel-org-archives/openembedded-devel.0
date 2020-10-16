Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.60])
 by mx.groups.io with SMTP id smtpd.web12.9090.1602829096172880547
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 23:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nu7IXYFx;
 spf=pass (domain: windriver.com, ip: 40.107.70.60, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gd1rmwcPJyBF0T7ZsNudioq7w/mJfBlB4yLlMdU4TQeXQBV0TE2h5vAiTNiTZYpv5xpCOcYRG4KfLWyVfp+XrBddRfm9Y6gjw7qVtjwc1+Zj/2/Iftv88aF16f31EpOy3268RXqRecZe7QBBx2DD9wCilq4rL0EZJ7fSuGDg6H7Tn3rCvJGCEyCN9UlRxUHBCgMn9nUMvzDvozMlrvUjN6/tqpFzkkCcjiQKZwAXN2QGS4kKEhNvYN1vKe3vuFv996B1O1CMW3OD397KnVqkX824M2mQjBRanTK015dCnl2xEh6OyuB3mrU+iKxNEK/Ilz+ieKCBCzDzBbllugVIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QIR7ZxUeUB394EWLdleBsjku/gedzn2gK8Ln+Pf43g=;
 b=OqY2tUDt6dIsKCC+jaV7NZLqz6xpPMVfYvKrnO92VzQNoHPSXm9CsBIcPPtuZcDkNQ+RJM+a2X9E5yVPedWr2rJZ1XiGBswluo/l/p6MgUMOm92p6gMJbuMB4kbpPhpArXjbkLTrw1K4JcUG/elH10JnCBnkQlHjhdu5wKhzopeGMnNBgSeHXEBCX3pSJpWlyo2qi1rs4lFlIRWf9iCKVjXPkMCqk3RFSdtd0i6hlSGfEkEmhusplujZ2Hk0gH9iEk/U27SzzWM3Ba/KVUnGrGL8kG7j7EgcSjNoktgefoOiBxgJUCwIfSB0BSLQb8s7t0IUSUdzVLgr9nNiI5ZnLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QIR7ZxUeUB394EWLdleBsjku/gedzn2gK8Ln+Pf43g=;
 b=nu7IXYFx78oPSQFtVyqr7UuvBbYR9zwHHZrTTyRHl0O5JdMGcULwSKc5+CrepiGkjSxZHyWuBAiU+mXd6q5nbAlyuJA5GqsXvRNUK5FXLp227Sbm/W9QwGshw9HNDuqEzuvhgQWgS2Qd2QfPc1ElwEX/6edJkWpuEBoMZY7ZKHY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 16 Oct
 2020 06:18:15 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3455.031; Fri, 16 Oct 2020
 06:18:14 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] php: use /run instead /var/run in systemd service file
Date: Fri, 16 Oct 2020 14:17:47 +0800
Message-Id: <20201016061747.40695-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:202:2e::14) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR06CA0002.apcprd06.prod.outlook.com (2603:1096:202:2e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 06:18:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d1a6b86-4fe9-4cbb-5d87-08d8719b43d2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226C77FE1D4BE59656799FAED030@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HiPP968nf289LQwtwLVBZNBOykWy7IrZpiqDK7AbHskfUetJvGufXVUY6bXohY+s0MlKn32Bh3mShcPLS3WQ6yai8YfQW3weWsu4h5DwFqC/kawrhmn0WCZ/PSmAUY1tLGfOW+k4i44y67O8kCh/NwKM3mxiKLfsjfqvX/coJsZBot/gHtoe/5DiL9WCAk9uOAPR5qFi/dRdV9t4hG17Zg+iKa9vEPPBHYZDKXgRJzbdOpCW0u2CVuJGiIlemi6J3Ty9HZ9AMo9Fx6+QUXldogqV54TG1qftuJEO1bHt7SbTiHh5mm3Qrky0RMbMgI08ANeA/vuovpR/O4/wmhG9doINe09H6D0543SAowAqjxcA0aX4O4m0SbP3buRnPUB0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(396003)(366004)(6666004)(34490700002)(66556008)(1076003)(36756003)(8936002)(2906002)(956004)(66946007)(8676002)(316002)(6506007)(26005)(52116002)(186003)(6512007)(4744005)(86362001)(66476007)(5660300002)(6486002)(478600001)(6916009)(83380400001)(2616005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+y777P5cfnF/LXDhjpEWhsTjftcKJ1Kwl8vWyhtmBKHDHKhkIs9JgvFu4zYpylayWSn0sFV98lJk0CG1Z6U3S0GoR7xyoXzgWWxeKMM8BB7TolUanumB90QzPxC4015ivFgqW0OLbTyUIovS8o1iIF5t7orYmZEgVAwb/dAnJJGNPtHDsu+ZuQXvbzImxH0qxS8AgYjih+it6ujUiCD+mE41FZAFIuTF4fC8XVjAR0D9c39MmkI1ReBQA7RdbagZoA6PHy3JbhLe+2f8e45WkDU6T18y7qzdw1YLcVP2TjT161hKaRxyLVn4uzD4B/0Xi9FQlgJ84BWw3gFdAGFoF8VjfwmYlQOzGrChTi+cm0Rb1GSCp+mK8yhX01TFJpLSWvNttpzNLbGP/q1l19RyO72WS6hHLjiCOUuF34jSd5qAzpsC//vY0yPBQfX8gYDdgK5/grSwRKxuDzKTmVzPkfhfw0zKwpWmqscZDFaxpwS2Judi5RUs87M3HIMCO7neDWvGeNp9KQ8UKfOLo9bz13C2NVKX2vnacUtvVejbV7kYHE+Bl6cfbHt3CHXfvlkO3j+zrDCkVVhnVNWqIoML1cRICeD1kdYeUO4braou1ozwr9y/zDg3993oXP9cZhH9AgE13jiteNauBiQ3bY1DcQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1a6b86-4fe9-4cbb-5d87-08d8719b43d2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 06:18:14.8022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DraSJ5+pbeIrdszh95c+L7GBgooADclGoeB0t1ac8SGMbDM7tdT6+rW6EC83KqA5qz8FsMX1gk/UPKG95be04A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-devtools/php/php/php-fpm.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php/php-fpm.service b/meta-oe/recipes-devtools/php/php/php-fpm.service
index ac79dc931..eec76fb56 100644
--- a/meta-oe/recipes-devtools/php/php/php-fpm.service
+++ b/meta-oe/recipes-devtools/php/php/php-fpm.service
@@ -3,7 +3,7 @@ Description=PHP-FPM
 After=network.target
 [Service]
 Type=forking
-PIDFile=@LOCALSTATEDIR@/run/php-fpm.pid
+PIDFile=/run/php-fpm.pid
 ExecStart=@SYSCONFDIR@/init.d/php-fpm start
 ExecStop=@SYSCONFDIR@/init.d/php-fpm stop
 [Install]
-- 
2.17.1

