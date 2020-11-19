Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.47])
 by mx.groups.io with SMTP id smtpd.web09.5993.1605771716036161714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 23:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cZp5wbGQ;
 spf=pass (domain: windriver.com, ip: 40.107.92.47, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqO348jOpuiJLLrULTL7gl4Bja1Bvrbz8JnHH01+KrsJE3mvtAr+hQbpHG+G22z29rbS++ACnW9BVhWZ4/LwfqcOI+giuocvkXaqElD0QbTgC9oOMPmqt2QfliF38Dt1oRqUi4vVkoV7HT6pR4zk+ZfyCUUjJQB7WT4UrHVJ+IVQcvSxjUpA1ompTIsrzy4It8KmGLggFs2Ke+nHlntLgj7wwHj/jv1G6x+7Co+vtq9pR5o8VySBXkhd180SfEBonu+/D6y6VZILUyiG7/5t77C5S9lOUVeJcyZGNoSY2LUMJnksQN+p2oEeMlCX47kFqBo2OE01oRVK6sCQJRwZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y54k5oz8LACr7jzYY8jI9WbxaA3SLest4NkASwfoF7E=;
 b=krTfKz+QAVKqYaACaQuq+4sSNYUZ0dsa/C9Xr36iaJ+iVR/vxb4G2cFahGhPnyGp/Da4HPIkUV8fYAuSTHocCGzdhkx6T2d1aZYEY3yxqddeYG8lrzwDM9XqTg5pgE/LBnDZyGWBb5hhI5xlvfLLe4Mmo+9BQdiwMm9uUNypN8yqmxJhsX2S/xg0MTtOVKx/IHM8QaC9r9C5eK+WMopbtFLC4vxfBxC99Xk8S4kiGF5I0QO+EuwhL16r+MYwM2E3YdlkP+8ECTWoT/kq3v/lSKhfC7B+cMKAeFe9KX1+Ou8LuT8Yl4rnUPFcXK0EIUkf2GSj39RFrXFVrkFQ8TAI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y54k5oz8LACr7jzYY8jI9WbxaA3SLest4NkASwfoF7E=;
 b=cZp5wbGQ7JzIw0bfxA4cB4C7hKI7KC1pJli1gNr4VkjCS+Z1P013guJsjkBLSLjZbidFE/X6fT/6iztF7IYIZMY2A5PvMR4FQlt+N5GVG6thVodHB7tw+AA5uNGq8Bdlin2cqhYuCaxbOsaToWFD0LHBVK2qtC1xEZunSN7v/ZI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 07:41:52 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 07:41:51 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 0/4] Update 4 recipes in meta-xfce
Date: Thu, 19 Nov 2020 15:41:30 +0800
Message-Id: <20201119074134.6963-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.11 via Frontend Transport; Thu, 19 Nov 2020 07:41:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d36476c-137a-461e-d2fd-08d88c5e9422
X-MS-TrafficTypeDiagnostic: SN6PR11MB3055:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB30557949A9544C4FB51517EE95E00@SN6PR11MB3055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	blZpDhihVWh8Lttu7g92QGpBAj7sxZrMfeo95BrFDXX9HFM4OMqgmsVBG5cNImA5T8UVB1lZTCdB/dcF9hfqR7pB6avbJTyq5oQY8ikwKRrxLyOQSQY83Re/7to/9BL/Z4ESrzz/JRiNlkb7v1BF8dgctojZS7NlaXc3kF6LZLbW+ezaA4SzQ0B3f0jTNr3DHn8L8Rj2Hb0VbMaXEv6owb00ZDgfZ7YEKxiyRDrsyx6CwmGHjGMOIH7yYGTBTij0swHjHaiFZfd9q03u885t6GWTAS4xC6TWTTYKbGnaeSosix1ujZyMkw/fUavkR595ktMxRsnqM+JAyveOh5dhmg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(9686003)(6666004)(8676002)(2616005)(6916009)(6512007)(956004)(6506007)(6486002)(316002)(1076003)(478600001)(8936002)(83380400001)(5660300002)(16526019)(52116002)(186003)(4326008)(66946007)(26005)(66556008)(2906002)(86362001)(36756003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8UKSmNDM7gVuoRwoY4Tr8m/D5TCSGfUc+CKs+TQgVDWetKo3raQoIgz7CpuOQNOZAhuFCgW8pBlAXcikBw9AKKUvGnsIfCLT0QXtiKApkXKx6sFcKHf6PCTEl/tNwetK5dlBlJFAX/CaDFt9+QBE4aEJcPNgJORjDZmS9TA80zHWzOdO4/7AMH66WPHkEibkXnqLs8oq2ZWOaeQFiwydIuGbNRs/DskvQHstUetvMFrbMK3Uc3XKtSKyKtpd3KSHVbiD31DlzjG1mAf9cyjXCb0eMMpBjLC1e1mH88IqE27QSi9G3zAXInuRK04mOOdOHv8i2e2f0+OhXXITogu1EhE1SQ6HG6UtB9d3gY8rM9Lg/Q4IL20zwz6OFlmGGPgVTomdd1ZwAU/pZxacqeGOtW2rP3ib6ioFIBy76x0WRMwZytRNokG4U9RRMXPx+p10Gpd3kK+3yuPVIflrDRbSFehXXlvM40GBNGwfvQg4jXbjNBUtqjUifu4MCgpVJO1RZ/dv5RKfEAMy1ofyc6JGDuwud30Xfzwf8pd15pe7f5NPuEYguhtjiOkR6Or4tg2eBrU1+MfswItZlco664dyeBFJyvi0wSjX8IhXRx9xH/tEZZ1z6DpscwFMsOJGjEw+7ajxocMgqjvfeEzZm8htSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d36476c-137a-461e-d2fd-08d88c5e9422
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:41:51.8156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqZ7vlGtgGpFntNWoKLFmrhMk5Yns6DDOb8x+wMeAUKAy8Lcg7LxMXdzhYPiafJS6s/MlOaDjkSnE0BkohdGWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3055
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (4):
  xfce4-cpufreq-plugin: 1.2.1 -> 1.2.2
  xfce4-weather-plugin: 0.10.1 -> 0.10.2
  xfce4-mailwatch-plugin: 1.2.0 -> 1.3.0
  tumbler: 0.2.9 -> 0.3.1

 ...ry-leak-and-reduce-cpu-load-slightly.patch |  6 ++---
 ...e4-cpufreq-plugin-1.2.1-gcc10-common.patch | 26 ++++++++++++-------
 ...1.2.1.bb => xfce4-cpufreq-plugin_1.2.2.bb} |  4 +--
 ...2.0.bb => xfce4-mailwatch-plugin_1.3.0.bb} |  5 ++--
 ...10.1.bb => xfce4-weather-plugin_0.10.2.bb} |  3 +--
 .../{tumbler_0.2.9.bb => tumbler_0.3.1.bb}    |  2 +-
 6 files changed, 26 insertions(+), 20 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2.1.bb => xfce4-cpufreq-plugin_1.2.2.bb} (74%)
 rename meta-xfce/recipes-panel-plugins/mailwatch/{xfce4-mailwatch-plugin_1.2.0.bb => xfce4-mailwatch-plugin_1.3.0.bb} (70%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.10.1.bb => xfce4-weather-plugin_0.10.2.bb} (72%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.2.9.bb => tumbler_0.3.1.bb} (92%)

-- 
2.17.1

