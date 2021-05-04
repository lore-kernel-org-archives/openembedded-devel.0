Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.58])
 by mx.groups.io with SMTP id smtpd.web08.3923.1620125567346538391
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 May 2021 03:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@detectomat.com header.s=selector2 header.b=LoWdQPhN;
 spf=pass (domain: detectomat.com, ip: 40.107.4.58, mailfrom: harald.brinkmann@detectomat.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0wenWOyQNrjPjtaKkmqhjvcgHnAwtYNdEpGBmKM8ACwAEKYdSovzB+Eus7F130M38h3NF/uTLFfOZMRRmogAhfSSBzLwwuEmVYeQ20iF0UYdGZTKBsM2+BgHQy41elAFLN8WAYXFIVsPUuMLOTE3pCknuIk9RZVYTMBpTPXmpNcNA0/IDEq+ksj/B2TcUigI79hCB/em/xEDVSVKfMxK5k4nAIQErezeORBaNT3lUPeN4vk5aJ31hS3FVePJVHiHzVLQwTArc27UsWpx/9AvVuQ0OkqWvBKqkChobmGJoYm9iYPtrgQca33Gt/xuk9G76tbMGAd8VbeJ9arzcqIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm65Un7fjoAtW57RGCRnJqGkKnzDkZQDkplS5vff7m0=;
 b=a3WpekRViKWtGpaNqtT6P3APG7qXsTySk+m+ZewIwxULdv+BfP8BZ8hHyJJerhxOBHtby8hud/AYh3fJozJIUTQ3CCAmQD+O2UwA/YZOzrpThNIoCZP3q8rCxbLRsNWWf//sxAu41xCb44pAMYu5HW9dcmPmiQ7nvwd/sOhUgySaDo9rNPHr6yMopSn6UDV7fWcK2T31yUOKLLS4QqoMnuure7+fa0jP6XI9yBo+wrFlishu33M2YPx92oQTndA7o+dYz9Eq6nKg1bvr5XeJppL9aWolk5G3mlP6tOHDpACOpQoAmNREycMhG2UBVj7wzlbLVYFjPQmEumT4vIV79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=detectomat.com; dmarc=pass action=none
 header.from=detectomat.com; dkim=pass header.d=detectomat.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=detectomat.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm65Un7fjoAtW57RGCRnJqGkKnzDkZQDkplS5vff7m0=;
 b=LoWdQPhN6JFCyibdvxwkA8qWSXY3Jzn6U5O8NuoDiXdwyiVfIVe0+N/dtfGrU4/LKUbeZymJnZLdybummYE7EEoc9L0Bew1RdF+ZaX3SRoCHxfp/Comgn4WXVJZPz2G1UdCR9G6TyyVB6wBznI++KdfDDEDrmGA7V8eLw+6HvUg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=detectomat.com;
Received: from DB7PR08MB3851.eurprd08.prod.outlook.com (2603:10a6:10:7a::24)
 by DBAPR08MB5591.eurprd08.prod.outlook.com (2603:10a6:10:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 10:52:44 +0000
Received: from DB7PR08MB3851.eurprd08.prod.outlook.com
 ([fe80::1de1:8ed2:1159:e1f1]) by DB7PR08MB3851.eurprd08.prod.outlook.com
 ([fe80::1de1:8ed2:1159:e1f1%5]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 10:52:44 +0000
From: harald.brinkmann@detectomat.com
Subject: [PATCH] Fix parsing revision of SVN repos with redirects
To: openembedded-devel@lists.openembedded.org
Message-ID: <e32ab99e-1a15-aeb1-160d-b1638eda0d7a@detectomat.com>
Date: Tue, 4 May 2021 12:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
X-Originating-IP: [193.32.127.214]
X-ClientProxiedBy: AM0PR04CA0134.eurprd04.prod.outlook.com
 (2603:10a6:208:55::39) To DB7PR08MB3851.eurprd08.prod.outlook.com
 (2603:10a6:10:7a::24)
Return-Path: Harald.Brinkmann@detectomat.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.50] (193.32.127.214) by AM0PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:208:55::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 10:52:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c320633a-8d2a-467b-33a1-08d90eeabf26
X-MS-TrafficTypeDiagnostic: DBAPR08MB5591:
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB5591A646AF398D3618D050ABE95A9@DBAPR08MB5591.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hljpwf6dXexjaJ8HGAzM+t8lUQlfhDErpihms7JXSYMlHa0kD1TqrfnZGp5L9f8eKW+WbNdRE9W+YdnwoWnYTNXzUpI9q8nZJPtdIaugW+VOk6u4mUBIDfOxyEXL3yD+Wm4NS6QeEgXoWAzLi3v/79N1oCk8Uwgx8Fed7S3w1K5Y59aWnPouFIXm5LQPjym9Whni3S7w2w6uBJuSrPae1qYg1N0uirMnGO5QUjQ/5urjtjjBsc8FvHAkWa94b+BG1DFx219hqIb5qLCIR8mJ0C8yISNnfyn30dnSEYjtMJnkRDb7n6tMz4LbEBxcm3e0SQO3rugOZojW2uVOIQVeohQu5AUHrFWP2peUaXIVc+UZIDQ+5VD1ta38CoRBrjVi9CMFMz/lkp7KuWFvW8f+zRaEVP7YugkvVREOtDrKDEPu/JQtBgV+KoTPyJtaI5I0N0hm1qROCSjHtf1HIe3p4/TlsUtCPuDky53aG5lIcU0xe0dessLE+4C+bCfogXTbd2BCrBy/piI24hr13cZH4eS6xbRPnVSM7so1tjzlJ0PyT8kw71gXtsgL5DfHBd/D8jO65a1opKq30oY8TlEtfEtEoLaE8ATCl0dpPKtLBpYOjlKav9xnDCM6J5gS4fwHb1Ck0DHapjfrmw6yznk39VECzSkS0s/2EuTrzvd7aCrpS7Ac++SWxGIGvKJ8W363rvWjZe4MxkN9Nn9iHA125xG81E+SRMC05mQc3z5zvGE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3851.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(396003)(39850400004)(366004)(83380400001)(6486002)(2906002)(186003)(478600001)(16526019)(5660300002)(36756003)(52116002)(316002)(31686004)(31696002)(16576012)(2616005)(86362001)(4744005)(956004)(8676002)(66946007)(8936002)(38100700002)(38350700002)(6916009)(66476007)(66556008)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WTl4bHF0TUFYMmJDN2NDY3l2SnRqSFp2THJ0SU9vN2ZyNVRWdXVBcFZaMHdz?=
 =?utf-8?B?UjkyaUdWeWZMUDhVMHEyRzBqUHkrMXVSWnU3QlVXbFdlVTVGc0oycWtJZHNG?=
 =?utf-8?B?YW1YQm03OFNYb2FqcVFDWTFINGlBSUdJL2xCRGFNZExVRUU2K3pEUmtzY1lj?=
 =?utf-8?B?c05LbXhwOHlpODJYU3J3dTBYOUVieEg3d2JEUVl3UDAraXhtaXJIVForUnZm?=
 =?utf-8?B?d25KNFhNQldBRHllZnRIRDJ2VHNOcTArUkt1UGZNTjFQZ3A2NEFzNzAvTVJw?=
 =?utf-8?B?b0xuenBwWm1XUVFFYzZwSXVKNEtzaWRsZHZkbjM3bFRHZy9vZEszTk9vWlF2?=
 =?utf-8?B?Njg3T1NxRHVURUZRQlRZVit5SmVsS1NPSUJBbFZrL0pIejYwMUhtTWx3ZWlh?=
 =?utf-8?B?Rjl0TXpBWkNBVmZlOTZqenFtZmEyRC96eEF2OXlJWGIzRm9udXlmcVZVN1lu?=
 =?utf-8?B?UFhJYkl3M1Rwak5pbW1Lam9FUVFJUkNUKytlWldnSDZQMUJNVGxQcGtsVkkr?=
 =?utf-8?B?Ylo0Y0N4RTJzem4zQ3cxNC9wYWR1VEZUMnRSTVpVWUtwa2JWL0RnNWNDZ3lI?=
 =?utf-8?B?bzF4cjJnUkpNbVVmMG9rY3BBWFFURTRZU1VaOS9jNVNEcU1qY0JkMEgrM1Rk?=
 =?utf-8?B?L04zZG1vb1BjSjlKU0p5MHQ4UnA5cmFYckRQVjNZb1NiN052eVhlYzd2VzMz?=
 =?utf-8?B?L1RoeksyeUhwSzJvMkNJMTRXZmIxaTBlbk1iZCtNeXRjdkRPTWhSVFpXMHVW?=
 =?utf-8?B?dmxNVERwR1dXTktVOUhVVnRUc094aVRhMm5VYzZKNzFTWVdYOEIwRnBMS3Vm?=
 =?utf-8?B?Mm94ZWxLNVFUMFk0TEJKMHQzTDE0R3N0N3plRVhBMHJrQjFmb0lTN2lSYmVD?=
 =?utf-8?B?Zkdrd1pMUjRtbGtvang0QkQxVlFtUzlBZi9YK0VqS2J5WHR2aGo3eTVydFg0?=
 =?utf-8?B?L3lYNUhYc3RkdmNubWpiR1lZdFIxcjlSRXMycGRHZnJnWU4zRVBlSEJlVUdQ?=
 =?utf-8?B?L2FSd0x1Q1FVT05GSS9tZjhZSlEwRGF6U0oreVNoeFR3N2NqclQya1RXSjNz?=
 =?utf-8?B?Q3BTcUpoYSticW1xREM4RUJMV29oTk12SWtVMkVNWUdtcEhqaDVBRVo4aFht?=
 =?utf-8?B?WjVBdE01SERuU0lXWHR1aStHNXZJNStYWjgvVTZlZnhjZjR6RTUzUzJkb0hn?=
 =?utf-8?B?K0RlODZiQjg1T0RwMXJzN2xHVkgrR2UvU2lsWnhCMHZoa1llREdSWDRtd053?=
 =?utf-8?B?Z2czcWZNZXVEdmp1YlFzalZXVWtWQ1FuR0FkdlNPcTNPcHF2TXA1RmJ1YVgx?=
 =?utf-8?B?SllYSXArN2ViWUJQNHNNeng2ejJDNHJndm9oUHA2RExnSmFpWjJHMDg0Q2Z6?=
 =?utf-8?B?M0Iyc090ZHVWYzVwSVova2lJSFE1UUZtNGcydUZlekFCaDVBT0dTNFBrK0hq?=
 =?utf-8?B?dDFsVGZ5eWd6SFFhZEw3RjkvZXU1K3Z1SzZETmpWL1MvQTlldEFsd24vVlo4?=
 =?utf-8?B?ZDBEUVF4OXlnWkRkWnhGMi9NMjQvZTVNKzNQUEdKNVlOZm1MTjJoQnUzSmF0?=
 =?utf-8?B?SzBMSTQvNXJHZXNRZ2Y0V2hxY1V2RENaZUlCbnpibnErRGd1cmRwOUdrRzlC?=
 =?utf-8?B?OC8wdXdMYk45SFVlZmVYeDVJQVVERTVrL0NKQk5BOFlUb0l1NE9wL1RWVVZx?=
 =?utf-8?B?MUNDZGkvamordmRLTG05TGhvMlJPcjA0TUFVbHpFQWRzSVdyRmF6ZWE4R0VV?=
 =?utf-8?Q?pwpXMfx/B5RxirDTH8RdQdXpL5ofKTvyysyngC5?=
X-OriginatorOrg: detectomat.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c320633a-8d2a-467b-33a1-08d90eeabf26
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3851.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 10:52:44.2413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07587bd1-3a09-4971-a5a0-370e32888812
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMnT1cRufXHpj9qVtUAGLBhb2NMDxI+PebB8wde93nBA5RsOPh6qYhKoUJchO9UeRrtByhsSbyKcIGvpEqaPQq/HNXtBFm9DAp/G724xv2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5591
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

svn was printing a message when encountering HTTP redirects.
This confused the revision parser.

Signed-off-by: Harald Brinkmann <Harald.Brinkmann@detectomat.com>
---
  bitbake/lib/bb/fetch2/svn.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/svn.py b/bitbake/lib/bb/fetch2/svn.py
index 971a5add4a..5c305c4a75 100644
--- a/bitbake/lib/bb/fetch2/svn.py
+++ b/bitbake/lib/bb/fetch2/svn.py
@@ -86,7 +86,7 @@ class Svn(FetchMethod):
          if command == "info":
              svncmd = "%s info %s %s://%s/%s/" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module)
          elif command == "log1":
-            svncmd = "%s log --limit 1 %s %s://%s/%s/" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module)
+            svncmd = "%s log --limit 1 --quiet %s %s://%s/%s/" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module)
          else:
              suffix = ""

-- 
2.26.2
