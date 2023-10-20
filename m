Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA2CCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 03:25:55 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web11.47048.1697772350272725719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 20:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=eURleAf8;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1697772350; x=1729308350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gUgPpc9W4je9LFg4JMK7PfFbYbyrKu7bTYxlq+7PQ5Q=;
  b=eURleAf8s38It5BI7Duq9H3+2sSHY52dOHavHYF+DpqeoSgrTGP9YG51
   1uCHnHKT4TPTNo+MHi7RRJ6DzXPyGyGEnCxK5xr9kCewyjBW0470MN3r5
   SuiefLfHTg8ryJsQH6BmazcOAZN0C6BEBZTK0e2RtqOC71cQFTvnYDn7i
   69qsjf1nbX+K4QguYMiMVGT4ovsrnGuzvdjfOl6KEZr0omR/BMyI85wtA
   oNf8tq/V4L1/GimNH/luGGb57j/wA0CP+6YFKJMGQS97B2cVA7JPJNXN0
   qnAAPBujaYIFD6FUYyPejajIDlDXdlhGaCBxSxlROtm8XkTPZGU2J91ZI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="11001521"
X-IronPort-AV: E=Sophos;i="6.03,238,1694703600"; 
   d="scan'208";a="11001521"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 12:25:47 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2RpC+PZKeyXEPOxvU8uByaqs3YVyuTS+w2/SCC5L8xeIseWT/bMfb93kXfYKR4xx7EpwJVlzudxJ2uyT7MF2rz63hLzcUVPalpqr9BRCr40k+xtDyLMvO6Cv2czbtGRfYBFZuriT1Rww9HDpafNRfg7AOVBNFoLi69g4d++FXM51kB0SPKGunGZzHm4NMS6z5J3Vhal2ph8MrIvVp4tAm/mEzHzlPQkOjbKknMOfjRWBttCUV5ce6b3U/O3ZKR9vVNMenh4+gzcHoayYxgxeL9jsq6VuDd7wVmOQqrKqwugGZGDolPQN2ovX04xtz8df+oZXkOq6NN1l8NOy7/v/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUgPpc9W4je9LFg4JMK7PfFbYbyrKu7bTYxlq+7PQ5Q=;
 b=TgtRCISHwwN4BYAu8cYjnusqz1k7tAxHYy+K6cmXd0gV6yOgLQx1+ouXPgkXmajmWeNKVg4qLhvJ4aV/r4V0cyfpQccZQlIO1IoUsQt/PG15Pkc+VKaBcVOhWpdfCtageb742fDPJw9KCosPmf0g65rxJ6Yr9Jnc1ORCPvdhqkzkgJiw+mm/jqG89uKKf+sPOCtxtrAMJz2hDBQIaB3jrdAGWlTAh5zegmIwRwYNxJFW1LjlCrki4ygdQs4mAYTKKZc/zuiSIXHfIoTf04qNXvtJwfEZv2H+9pNhUkD5aEGBvej9QG9LpSbmEgx9vU3iMKAHSUoTVqwxvdqWabvt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS3PR01MB9636.jpnprd01.prod.outlook.com (2603:1096:604:1cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 03:25:44 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::286f:2b02:30a1:e44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::286f:2b02:30a1:e44%6]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 03:25:44 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Topic: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Index: AQHaAMrgXUTYe4VH/0y+bWsAqqYi6rBNvWOAgALvFwCAACitgIABMx/w
Date: Fri, 20 Oct 2023 03:25:44 +0000
Message-ID: 
 <OSBPR01MB1845ADFF0CB9654D059FC977DCDBA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1697527418-5791-1-git-send-email-wangmy@fujitsu.com>
 <7F1CE9DA-A95C-4079-9436-F8D233A6A116@arm.com>
 <OSBPR01MB1845965B443CCECAD4B7B5D5DCD4A@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <EA96D0EB-17C1-4946-BE02-7DD224677992@arm.com>
In-Reply-To: <EA96D0EB-17C1-4946-BE02-7DD224677992@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MTUyYmNjZmYtYWQwMC00ZjAwLWE1NDMtNGJjZjE4MDJm?=
 =?utf-8?B?ZGQ1O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjMtMTAtMjBUMDM6MjQ6MjdaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|OS3PR01MB9636:EE_
x-ms-office365-filtering-correlation-id: 5b0905c4-7e4d-4244-0f7d-08dbd11c3e8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iIbQ0rXLhAxNy8XTHeiIoqKfNMV3XnYEfbMAurkTpLhCyKdHc3bh42GWaN/EDOIVrypXFHwZDbI8rb3TNeK9UvONoIKvB7FDUYXCNh68c2QFChOXs6fpa1npe6Wwxztw2HXFrUlzqRNoYx6qCvJBqg0f2uREgv+jVrXO/yOxNl53zKAq45TgyJzCxltfzEWYrHSI7ksrZDi5FG1j1f6/Ot6lVXvjtJqbpOgCVzXUMtfO7Bm0WQAojwDyJGiooAF7FZUmdQ4djl5qi/DT87rCSM8rIlzvHWXiQp421GcwGbRc1yRb8+xaksqW7XKqYirOBdaixNO4eU+9W06NnVdnDPWL32fz7zs4WX0wGXK8xBjBSvQtoNhQYWgPmpQ16wmIKbmzksfcdDI3CLDl65056vFgkAthiQMsQhI4gN5NFcudFCaRGXGtiOYQft6VKC/1arpMBqCUHeyEybv3VwVzA44cVTaMIG+ZwlBU4BuNYx13mNuRpiqZnUC2AX+1kQY/ALXmJMhSjUTHlW1ACBzuXkP7pW8UQk7nc2zeRJeceFTmHARKcP+dgJAfCZOMQJdvZFlNgF0ZZbOgzTUtokAQADlBirMHNl8REaglw7eGeTDRMT+dpRMS8gUdNPjR8J8I
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(1590799021)(1580799018)(55016003)(66446008)(64756008)(38070700009)(76116006)(66556008)(66946007)(316002)(66476007)(6916009)(71200400001)(966005)(8936002)(478600001)(8676002)(33656002)(4326008)(52536014)(2906002)(86362001)(5660300002)(41300700001)(7696005)(38100700002)(6506007)(53546011)(83380400001)(26005)(9686003)(82960400001)(85182001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M0kwN2kzcHRHeHlWU1h1elIzUk9ta3JUOTNWcU9FeTF4TFp2TGRudzJiUi8z?=
 =?utf-8?B?M3BKQVhJamNsbEdDT0kyMnViQ0dzc0Y3R0NCajdSL1BWVHFJazFuanJEUHRv?=
 =?utf-8?B?bnBiSTV1S3IzTXFwcVROTlpISnR3WUp6VFVCNmZNME9IRzF3R1dSV0E3cExI?=
 =?utf-8?B?OTI5K1E4WnJUWHQrbHY0RUJZWVFPcmNnZXFhZGZDTEFsOTFPU1l2ODVLdjA1?=
 =?utf-8?B?Z2kwaGlnaS9vQVRkZjF4Zi9oeEhNcWVJMkc2dnFUSEN3R3hQcWk1ZmVxT3I3?=
 =?utf-8?B?R2dTL01FTkpHTWtzQ0pRdk5XcWdsYjVUV1FRMmdzK0JaaURBeHNsVERTT1F5?=
 =?utf-8?B?YUhhazNzQ0JKVFVva2ZFVGNaVjkvRjB0R1JOOXczQlIxODk5bmFXbURrWnVV?=
 =?utf-8?B?WWVPQm9xUE1MZVIycDhzYmhNcVBBNDBibXNsNTVWL3FrRTZoMVkrdUdhOGY2?=
 =?utf-8?B?QW5GRHBCZ05VUkZSTDUzdDlHWjVqOEVYUWlBYmtvWnZGZW9FejBWaVMxUUpK?=
 =?utf-8?B?NmNBMWtnaXpwMUJXbDAzeHlMb2ZaYlpyYzlTQytRenFUWHJqalFUa0FpRkgv?=
 =?utf-8?B?Q1FKTnY5aWM3Y0ozTjZBVHhqZkFsUWtFbnViRjc5Q1ovbWZnR21oNHBWYlJi?=
 =?utf-8?B?Mkxuc1NWSTdlbDR2dEhoY051Tmp1cjFlQVNuT0RjRmNhTE92eFhHRTB2VC8r?=
 =?utf-8?B?MS9qYTR3ZWJqOHQyd01XWTlaV3dNOGlZSDdGS3htWHdwT2pUQ2dSek9UVmpP?=
 =?utf-8?B?Z0NPNVIwcVdxaWpoellDNytKT3BQSmFxTG9KenVHSjJxbEYxUnFkUXdzcTh2?=
 =?utf-8?B?T1cvUjZuYnNNdjE0bmhJYmtuS2VzM3JMWk9EYlFIc0d4dEZUaFFnZlMrNVRj?=
 =?utf-8?B?WVptTWNmYWNvTHF1WkpmYkN0ZnFxTjdhY2V3WEJlUXAzeDRmMHFQaGVIYUdU?=
 =?utf-8?B?S29QcmNPWHNsZjlvMDkwVnJPS3lMRFcvdytqZk1PWVNjZnZxdnRvcUpJZlVU?=
 =?utf-8?B?bHp4L0RQbE5pWmo3UnFFbFlOdGNQakRHdlVYczJxN1ZOUGtlamQzQk9oSlJJ?=
 =?utf-8?B?cDREWUVIMGNxOHFVQTk3UEhlaFdKbWpzU3U3dGZ4WUFhYnMrVzRnQWk1RGtJ?=
 =?utf-8?B?bVhCYmRqNzZqdjMvcDVFOEo5L3Fsd0drdS9VZ1ZNdyttUHpCWjByeldQd3JV?=
 =?utf-8?B?bi91M0RaSmxZK3prNEhNM3Uza1VKUnpab3N6MWl4M1RVU0JpVmkwcml6Tldt?=
 =?utf-8?B?T0ZkU3BSV29FSEcvclcwa2I5YnlkMmJ5bm5KTVpmVjNLZitrZS9yd1pSYVg0?=
 =?utf-8?B?Zm9lUm5hZ0NmSGtwaWxGRUNxeTVDZk1zNEIvei9ML09NbG9FcUVMVURqK3pE?=
 =?utf-8?B?SDJnd2djWnpDaElrSUtldU9KdU9IbXRHN1RydG9yRWREVUhsTEVtUWRPT0Ru?=
 =?utf-8?B?YmI4Zm5EMWlFdUlYaXgrLy9ZWlNMZlFPSU9HMzg4dVI4a3FkVzdIeXZPWDNW?=
 =?utf-8?B?RkJ0MHhVWVoxZjY4Z3duQW56TFBwQkcxYmczUnFqa044bm9xb21HbXVVUWpo?=
 =?utf-8?B?Tk42L085WUFVcCt5U2FQbDEwZnlzdmZrbjk4ZHJ2dDRXZ1NGTDU3bmxlRzBJ?=
 =?utf-8?B?UnpQWUo5dTFqUGVJSm9YbWNkNXFCTkZ4cjdZV3FCa3Y1NW0wNjdZQmlZamQz?=
 =?utf-8?B?SFVJSFc5NnM4Z3BvRnVSVm5yZnZ1ZVR1VnZkWmtVR2Y1a0d5d3RxK3J1aGR3?=
 =?utf-8?B?UzFRUnBkM1YxVWlIWEVLMEFNM2c3cVNQVEdYMGk4dGoySWRUSFVBcTVEZ2Y1?=
 =?utf-8?B?Um1sbkwyTm9nT1pzVEtsb05GaEVZckVPRC9IN1BOZWZURGJsQVg5dXNMZ28y?=
 =?utf-8?B?ZFpBWi9jMER4Kzl4cUZ5Vys5c1M4bmxRL21aVS9iQnZES1g3b0s5NExQcUNm?=
 =?utf-8?B?QzZhWXZyRERXbkhrVnBaSE5odTN0SEoyc0VHaTlyYkdVUmtsa3JKZkNacElo?=
 =?utf-8?B?Z0N1TzQ1bjc5RGJwRktLY1VZNWt2Ry8xOVRIR09ob3NJUkc3c3BkaE9ZUENu?=
 =?utf-8?B?SkRPNVByS2VmN25iM2J5WjJmOU1zaGlFWVZqYkp3VFpINHhNVjVWOE5LVTB2?=
 =?utf-8?Q?DnRJZfjWFNldccHIaeWo5fP3t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uWwtb3MPUuWqPdZ3/P1kru8goY0h+tZFN73m02nfMlh5R1eqPbvZIJfCRWgc2bZMOOL76IpXohyoOd/hV1RjKV0AescsiBnWAuDOYpETpSHoNXQwBlItpzG0PaxZ1jBzL1p4Cbq9CddwQef3MLtAXTFSrNY+bi8M2rNb+E/sWPCg0n/bs7E4/GzHDMdG945coGQ57xncye8u80Op9lARJBoLG3Tfah96FleFwAbgj10UOkxcIIeFPqgkwItHDbpKNDk93SdJgmxmDbIVS8WEj01nUvEuNtQDbj3qKXVW97aYm6c9Qz8/x8UXJPIewHjATst/y5yQ7qXd4hBxishZ+ynSmx7+vLMY+ohxgHaXJ6pAcnrAGmVFGX5DuDcYOT9Asv3y4E+ZQFNsXYzop0+niFcNVnKb+pSHK1ZrvXSC2PYhs90448pB86K0iot8B2FibSXcErxGq+JbPnaYBjXByXzSXRyuQSaxtoKN8mIDsunyi9opnQlPnx04+3Vgvkga8VMKYM+9FjlYjC5TOusPSOS9SguvdpmhSwXpQDfzHehFsRk0VBZIEyrdBeXISJ1RknAH/ytZwUcRc2IpKqzeFpRSAFL0a/+FxhkXWu9NuTXzJZ31VwlzNAVJDLIhktmmtZ6oURz3WZENrTwCaZ9RXm30W/p530UDe2JqhzpSq4iD6OTMgeUAyOfw4k6sPxZg5x13WTkZL4nUKQMWd5MgzW35LdR1uoG9dqzdyGrGaI+Um8UuF9YbcgoEOs5yVU2mFyaIatbs0/r8gZ3GOibxGywsRs7lOZRCLTq7pJB/SMExl/gz7oU4EPIhEc167NsK
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0905c4-7e4d-4244-0f7d-08dbd11c3e8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 03:25:44.1390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OADImjSMPVJNPvwMM/2D/35pRNh+lJQfpJ6ip2q/OG8LUwoXwigj29zDeuB0eD0mYeRt9Bkth+JOZhH9Fq/mvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9636
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 03:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105606

PiBTb3VuZHMgYSBiaXQgbGlrZSB0aGUgc3ltbGluayBjcmVhdGlvbiBzaG91bGQgYmUgbW92ZWQg
aW50byBiYXNlLWZpbGVzLi4uDQpZZXMsIHdlIGFsc28gdGhpbmsgdGhhdCBpdCBzaG91bGQgYmUg
bW92ZWQgaW50byBiYXNlLWZpbGVzLg0KDQrCoCAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpE
ZXZlbG9wbWVudCBEZXB0LkkNCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBD
by4sIEx0ZC4oRk5TVCkgTm8uIDYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmEN
ClRFTDogKzg2KzI1LTg2NjMwNTY2LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUt
ODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNv
bS9jbi9mbnN0Lw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvc3Mg
QnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAx
OSwgMjAyMyA1OjA1IFBNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1
aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdIFtQQVRDSCB2M10gZG5mLXBsdWdpbi10
dWk6IGNyZWF0ZSBzeW1saW5rcyBmcm9tIC91c3IvDQo+IHRvIC8uDQo+IA0KPiBPbiAxOSBPY3Qg
MjAyMywgYXQgMDc6NTEsIE1pbmd5dSBXYW5nIChGdWppdHN1KSA8d2FuZ215QGZ1aml0c3UuY29t
Pg0KPiB3cm90ZToNCj4gPg0KPiA+PiBJc27igJl0IHRoaXMgd2hhdCBjcmVhdGVfbWVyZ2VkX3Vz
cl9zeW1saW5rcyBpbiBpbWFnZS5iYmNsYXNzIGRvZXM/DQo+ID4+IFdoeSBkb2VzIGEgRE5GIHBs
dWdpbiBuZWVkIHRvIGRvIHRoaXMsIGFuZCBub3QgYW55dGhpbmcgZWxzZT8NCj4gPiBCZWNhdXNl
IGRuZi1wbHVnaW4tdHVpIGlzIHVzZWQgdG8gY3JlYXRlZCByb290ZnMgaW4gYW55IG5hdGl2ZXNk
ayBlbnZpcm9ubWVudC4NCj4gPiBJdCBpcyBub3QgaW4gYSBiaXRiYWtlIGVudmlyb25tZW50LCBz
byBpbWFnZS5iYmNsYXNzIGNhbm5vdCBiZSB1c2VkLg0KPiANCj4gU291bmRzIGEgYml0IGxpa2Ug
dGhlIHN5bWxpbmsgY3JlYXRpb24gc2hvdWxkIGJlIG1vdmVkIGludG8gYmFzZS1maWxlcy4uLg0K
PiANCj4gUm9zcw0KDQo=

