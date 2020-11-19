Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.5993.1605771716036161714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 23:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M3+ZwTBB;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0oTjYwqlGThqv8DL7C2lPsZrKd2VRzR+0hvX/gJXXVxwoYbQ7MwZtyR1/LGGjDan3VfrTYr/jBv90x8vnftC52q+wb4PS/IQTeluXUluaQtdejEbizW66h1hTC+DOzp/deVMOgfRgSKQP8VKmd+EhwP92W0scfC+WJQ22IuXN7XPAXFzdAE+X2XltpWNArftHvqFiwPnoXvvQxmnsdtkYsb45Ab/+XjAvcexiSvtGWNbPIX8AN/KoeVoj+6QDLAhdZ61CIpTAm7GFOurJLNvvjSDdYQ55aMgppZz6aRpa8gU4Fc0llOes7fgbBiGNs2qI2Tqbo7bZllFY+tVDpK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PITuwgU/r9ZBOR2TOkM/LARCP3DXogusdmiVf6i5Cb8=;
 b=h5x8Kx204gTeRfJmA6ZB3d1J0pdekiz5DJ70vUM4SRYvwpZ/8NJN8R2PTlIDiYqUqgB30hCiC0znW1XFDv1cn7QZtsd2aNg/nUqSDWjZWFEd0l4tRP1+4U1QJ3SIyBuhCXJnF9doZzMM7EbJ8VU8+NEK9YsLavVHgKQjRbu7w68ydp89J7BAG0/QmAnIUTnfKOwc77tZusSF5P2MsdBUuQ3rW0QTDUntahYxUxSPYFrcKzqOX0EBfeSUdMvahqjfXxjBMVvYAMyUoM+ZgrqrAx3d3JpPp7X2wy+MH+066w/BtY3GNJ6XaVhfTlw2IylMDHtPjoS6vl34DnLC5ztS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PITuwgU/r9ZBOR2TOkM/LARCP3DXogusdmiVf6i5Cb8=;
 b=M3+ZwTBB94hsI2BFwiZnTLTcrb6QT25+BFtB9DMAieNS6p+1jQW9ai7N/vGdMUzZTIaAV8yyCNUOIcTtUtpbS6lalZhuuzfsMErPu8W2pVB2vLQCKyStq60DxdZXvaRUABQoOz7TgVrkZDyH82ND8QYWcAOjal7l087vj8HZZBs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 07:41:56 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 07:41:56 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 2/4] xfce4-weather-plugin: 0.10.1 -> 0.10.2
Date: Thu, 19 Nov 2020 15:41:32 +0800
Message-Id: <20201119074134.6963-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119074134.6963-1-kai.kang@windriver.com>
References: <20201119074134.6963-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.11 via Frontend Transport; Thu, 19 Nov 2020 07:41:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9546a99-8342-4351-7ad6-08d88c5e96e9
X-MS-TrafficTypeDiagnostic: SN6PR11MB3055:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB30555E46ED2A0C5987C959CF95E00@SN6PR11MB3055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	An8dKiFbmb+hW6EUVZUCnfNeztxCN+toh4SKH74ctdbyL2G2gFEbcNl74tr/1Z5rwiKOzigwTQAK+EVfW7UP8H0RyvZCWezxx2g7ec0Wn0e1nDGMRdFAH1DsUyxNpggV9OOY6FBbyGm/LwMqG33QQzbndEmvvcgr7KxQmrxBpt/y396sj5c7PkoAM+Ty/uUhOMoj6qkUrID41Lbue7JH/qZQivd6OVhrRBcRwapsY1zEMvUu5ym0KvUpgTBmbm3MA/sYbbixwCxqPleeCHq3tJbgAhRhUSeSPTfjlpdV8o6c1JTv4DkcyiH2omCxJf2y7NoaxN0EDfnUeL59DTZ7mg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(9686003)(6666004)(8676002)(2616005)(6916009)(6512007)(956004)(6506007)(6486002)(316002)(1076003)(478600001)(8936002)(83380400001)(5660300002)(16526019)(52116002)(186003)(4326008)(66946007)(26005)(66556008)(2906002)(86362001)(36756003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vyDv5Jvq9K82tCqaRfMelaD9+ITo85gtectSRLh2usNa3yxI/ms2rD47T8LnitUMq9HOQdpDTgNY301HIVBZURK0nIoKi2G1m+pB6wYZFvCBUAHR5MDyTXQj7COeVXxBeviLNTTulBUruq/XJb9IBLQg4PfgaeHe2x1N8INB/+GgR6jSbnPRkpSE9eOZStKXun91DXRZ83ijks5eTfhU0kGB3BySsF47HUU2q6nElNjO+4Ci6ljFuI5YcEAkWK6kua0ETv8jv0vCvyd/DL1NLf8q5Ygo3sf9UxncQmJGyBkik1tGGawEhpr4+pfqCazyF66NUM9ZgGve7V2+r88bKwJChCMXF/9aKOBr1hr8lnKp16F0npZVnC6QXDvIMOyoZemP1lE+5zKDHuF1HEdshX1sTLo6jd+oFAq9i6wvbi4JV0DS0oBbiNWUy1kaxcIxUtrf+YRkwJRjaqGjy6hQQxzz/9VyNI5xjmfPXznLwliV841x0RaT0GZZAmYsxsK4L+0FB9Su1Eqq8ml/W/8Ig0Ap2zicxqPesv9jeMD80tx7qnISMMddDvaa8+Kc7g3py+ZkpWe5iqmf1FH5u0UXeBlCBB0CqnhmGwHhLG40pjJMpxjkZlnWdi5jVyiupCAkxG1e3IC5z1xAMbKGTbQYKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9546a99-8342-4351-7ad6-08d88c5e96e9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:41:56.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHHYyifojuKQTMWpnlfCF/2cOUf5AzwFCcgftmalCNc8Fs4K06imDNBZxk+WE8K7SHaN7AlGIR7Kv4M3j//YVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3055
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

0.10.2
======
- weather-icon: fix use-after-free in get_user_icons_dir
- Fix GTimeVal deprecation
- Update copyright/bugzilla URLs
- Switch to the 2.0 API
- Add basic GitLab pipeline
- Bug #16717: Move from exo-csource to xdt-csource
- Fix unprintable character in summary subtitle (bug #16394)
- Improve contrast in weather report, similar to GTK2 + Adwaita (bug #15806)
- Enable keyboard scrolling in Details pane (bug #15912)
- Support solarnoon and solarmidnight (bug #15771)
- Fix day/night calculation (bug #16091)
- Translation Updates

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...weather-plugin_0.10.1.bb => xfce4-weather-plugin_0.10.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.10.1.bb => xfce4-weather-plugin_0.10.2.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.1.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.2.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.1.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.2.bb
index ad9b6e9e7..404523019 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.1.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.2.bb
@@ -7,7 +7,6 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[md5sum] = "203ad16e74d4823f6fb6e9a18bb7df55"
-SRC_URI[sha256sum] = "afb2af5f3effc2ea6181636ed0e82e6dafd556ec1b8478100802f85a5d167a89"
+SRC_URI[sha256sum] = "9017790b92953090c849b17b357b42fa8c562bf0e25af2fd2e5f53cfebc662c6"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.17.1

