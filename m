Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.60])
 by mx.groups.io with SMTP id smtpd.web08.72.1618675686060337405
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 09:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kjMVkup+;
 spf=pass (domain: windriver.com, ip: 40.107.243.60, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0c5RnabsaKgpn4On29u/UoogkLKTAQ+mFEH5dtyeTjZrJkhtQDsmIZsOvO5DpjxlSGBClgHdWyAGIk8dZn633uc9NgHwL+/j7D2D9ePjdXARUhhAhIi+Qd+K5tIcscqtGydhs8pS6J/UZcXuMeKQr+H+32Ri7PhjnjCHnyl6qMKZU8tvSK80qTBVfTibg94GTTpBFY9tk2Qe4eom5MThlu4/kjqXByvWCZksPX7MCySN6C45suLx/Jygd56UnbW4wSuiG2QT9ICif/DqRNl1Y0gwBEQWe50hHsJ9nMweNWGU0khKK3AWwegXq9SxFm0va2/bQ6O1vCB59hvUHx5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVQQypoZlVOA8vT6b2efMTcug8S7PVwBFDQS85vD0eE=;
 b=etcgTWrdw7c9u6g3Hwbm4zIBjDT+x8ILm8eLbVK+7gYg1MAXcea6EeFvvyZAzdjArEo1fcwVxmA5Y9XoYkjLdjV+fHoc00LqYHp3zVytlYttXT06Zkowzd7FdYzt80+oD0nXJfXHfTNHUkQP/JGzrO2Zfk7jyX4jo/p+WU7ZUkpLe0GY7P92mbjLrDUzJ21JymODJSdr53WXlIcZsXD9q5tQHwTzIZO2bUH482TMCQheDaWkTRt8FVl9nmhKptW0vwEyh9eKVbRWxCIP+YE5CS3foWFWVeq3+MTW6HClCptTVt1ZyabKZqUFUphkJ9y2Xy0czmKRocsbV+OnhdajYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVQQypoZlVOA8vT6b2efMTcug8S7PVwBFDQS85vD0eE=;
 b=kjMVkup+7Fag7+rIeNbAzpOYKvPkMX0/wWJ80N5PSv8mr96iJrZ6dkuzcH7FtAlqcq0DGuiFSLPujad4dynmN6RLeyqORfcMPZHqmLLNQrnxT/P2HhNeA6XWxI27I7LmbEIyyhfR2yEqnFSGDh84j88SBx8Zfvn5trPKhaEyNeU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4492.namprd11.prod.outlook.com (2603:10b6:5:201::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Sat, 17 Apr
 2021 16:08:03 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4042.018; Sat, 17 Apr 2021
 16:08:03 +0000
Subject: Re: [oe] [meta-oe][PATCH v2] syslog-ng: Drop an obsolete patch to add --enable-libnet
To: Yi Fan Yu <yifan.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org,
 Armin Kuster <akuster808@gmail.com>
References: <16766BDD45432255.24242@lists.openembedded.org>
 <20210416233654.13300-1-yifan.yu@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <c0776c8f-9ce6-7806-b77a-28e1327b3a58@windriver.com>
Date: Sat, 17 Apr 2021 12:07:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416233654.13300-1-yifan.yu@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:a03:33e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18 via Frontend Transport; Sat, 17 Apr 2021 16:08:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0793a94c-66a1-44fe-f384-08d901bafa82
X-MS-TrafficTypeDiagnostic: DM6PR11MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB449259B69277A9D96C77E4C7F84B9@DM6PR11MB4492.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k6uFlx99cR88RIeQMGLcXvULXSv3gCJj6O7CrfMId7QF4DyCqKNRNVkhArVozs1DPPybshttXdONmdEATy9vPV+AECHpRgfD4uTnBWXZ7c6rKR+lBHxWoJvBR+0CdOEI9kglHohxfsmMiOUsgXb/qvoQuDKWIF77TbJztaEp38itlNV2EO0mue7ho/MEj9NYtNW36xJrmb/FQY+bZxF5VHKDxiax2kaSGQ0wHu9Xei3H8Avdhu5+A4GSufxs2M5UJf8ew+FXpiatoMpy7XuiXM904ibkIO68TzbzZ40rFe9nmiPNtOyTVMgc1e+AWAQcRd6LU8cb59HQ/7eWPkTIarpkydHVprtjQM1GcPfPv2gJcrpshQsBGxrgV+yn2Y0aFDW1ROyOv5tEnVgNtBYk0bTcRP91OA8i45mOsqS4f925XfBXPmGuYIicoZ7WU+OtjE7M19cXyz/jVmckH7kVDeK3lhq6qwwTnpuw7cc14nPPvpbXEI0qwm0E5+HjqDRtkTblv5rNOgZRsUt1Q9uOUpz8IsZnwjMCyUuu4mfDMccEJtJ0ItMTiXQjkIHL7w5oyNdmGLepjIN7I16mvAIUTBU4cnuAb30Skf5Ln/mBY6bHX/OoALVBrPjfyhNV2le8eIDaIcSH4Ue9CeoCNFA+rZyrud6Nzz781ipTo+iIerIJB0/z/svkFDATgepzcIxi5JD4uh0+oTal1BvkyOtfdWMyG/O9wyqQ9bYjZen+dJttbmWHAcWHkDuzrbvdq/51jd0vYit9G5jWlAm6UL2zScznRc9NZr6xPZq3Ax4PE/k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(478600001)(966005)(26005)(186003)(16526019)(2906002)(2616005)(956004)(38100700002)(8936002)(8676002)(52116002)(53546011)(4326008)(38350700002)(66556008)(83380400001)(16576012)(316002)(6486002)(110136005)(36756003)(5660300002)(31696002)(66476007)(86362001)(66946007)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Z1VHaXNTWTdyVDdDM0daYnNxVzd5dG8rTlgyRThnNlVjdVNxYks0Ymd6dnFh?=
 =?utf-8?B?OG81b3VXZm41czZIV3V5ejhrUVVqa2ZCWXVxamJzMGd6MTFkOGNXNWhZMjh6?=
 =?utf-8?B?MGp5bldmQzB1WThvcEliRjZaR3pkbGNhRFQyeEswN1hIQ3Q5enNGYjAyYWRL?=
 =?utf-8?B?STl2dFptRnJ2NHVtVmF3RmIzQlBGOFFUYjltODIvY1JwVHVPRXA1ZVllL2l1?=
 =?utf-8?B?dThhVTdZcW9BSDRuL0pNaVhqeGplQkxpN24va0gzRjMzQWl3Z3lhNXArSGQ2?=
 =?utf-8?B?bUh6WVNBQytOYUxWMTNLb1Q2NEhNSzExcHBCUHF1elYxTWhIVTRTNFQ3dVF6?=
 =?utf-8?B?QW9mLzYzTVVRZlVSY3AvWGpsRjNXdlBucXBZMjRyNzlWN1pPZkIvZDBrVWpy?=
 =?utf-8?B?OGVGUlI4RVJnUmVLbDlQOFNtT3JkTW85dVplT2F3MkJRS1RwQnRvTis0ZXdK?=
 =?utf-8?B?aS9peTlvQzBuUUxsR2xhMndLL053VW1YSERvb1p0N3VvZUhzbEpWWlBjc1lp?=
 =?utf-8?B?aGVGUm1pbHJJS2JWaGhaeUpuNy9FR2YrUGo5VFRIdGpQN3VxMll0S05uMDV3?=
 =?utf-8?B?UnRJSVhDZWluYUNSM2pQZXZmVDc0clVmMjN0OEhRWmJZTzBVTjR0WUpMWkhE?=
 =?utf-8?B?Z3Bkc3lKY3JwdlhuOEZuVUVGcmFoWlViYWs5eTkyTldERHhwTm1pc3VPS2Jq?=
 =?utf-8?B?Vmx5d1pBT3N4UlcwL1lISUIyTS9tTkJ1NHVrVlNLY3QyMjNFVnEwYkM5WEVu?=
 =?utf-8?B?MU5aeUg0bitFdUdBUDF4UG5RUlg3cnVHa3ZCczRvRG9kZ3hwQnB0a25UTjM4?=
 =?utf-8?B?aUxUMVlaVXlGcnZ1WERSN3NtSkFrQXVGZDhnNFdMVWN2TjNhQ1pSYWdtKzRi?=
 =?utf-8?B?MDdEcFFkeHIrS0doVlUrWG5ldU45cHFXT0xBbHFKcXN6Y0JHVGJJRUpwTjN3?=
 =?utf-8?B?TjVrZ2tmM0ljL0FDeVpXQ1BMMVdndzFqa1BITjAxQWg1MUl6RzhZRXAxSVJH?=
 =?utf-8?B?MnFNVGxrZ2RLNDduWGh2QU5UcG8xcDNHSDAxZWpUa0ZXRndVSWs1bU9iTmho?=
 =?utf-8?B?aXIzSEhNWWQ5MERRamN2ZnFndHRMVW9XT1lJbkxRSlhJaW5XQ3lyRnVZWWRU?=
 =?utf-8?B?SUV2M3dDV0lkUXlNcDZnVHA4QjU3bmNqajhuUG1TWEhWMFpLWXlJOE9Ya3Mx?=
 =?utf-8?B?QWNMZ1IrNlZvMXhBOXZJSjVkNjJtWGN2L2pzbUF5TmpsSDBUbVZON1g3ZVU1?=
 =?utf-8?B?MWNmQlZQTy96QStnYW91ZVd0K2phTHJDbnpHNlVIL0FPT3Y3KytiRXZlak1p?=
 =?utf-8?B?Y3hoanVXc3htY24yK3B5RjA1RUlDbzNFTW1ZZlNsODFUOTVpRU5jNUg3Z2FX?=
 =?utf-8?B?ZzFoblMwQzdVOUlLTFZTeHMwa3JDTVpBb0h2aWN4bUY0N29LTm5OT2M0S0d2?=
 =?utf-8?B?ajlZK1pMOVFIb3YzL3hVTjY4M0drc3hJVSs3aE5jT2VabzZPOC9TcDV5Ry9x?=
 =?utf-8?B?aDJEWjljbU9ON2REUVREbEwxYldvaCtQSnhJTnZBUXFLZGtTUHNRV0FrY29Z?=
 =?utf-8?B?dk5DTFdXZk1KbFdWblErWDZ2U3N0WWo0aHllNWZHWnl5bndCYzZBN1p3OGJt?=
 =?utf-8?B?QTJxVHV5WmIwNUIweHFRd1RDTnVBZjN3a1BORm5maXJheTdxblJhTFA2dGI1?=
 =?utf-8?B?RXhsbEdyWHFQbWhHVDNQZDBXeVZLam5vV3Ntcmg1RFcrWWlWcFhhVWMveE1K?=
 =?utf-8?Q?RuzXdIVysP2LX6ZHqxhoTVRyLJTjd8Kvz36Gx3o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0793a94c-66a1-44fe-f384-08d901bafa82
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2021 16:08:02.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDpk2h0AndedvArbPeXVhjMudHC9gysADYKkMS78QQ/BiC3tkJu97yJD2/WLE0VnKmNEcOoa/DTABbF19GV4fOT6cxJkAN9gt6QdB454Y3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4492
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-04-16 7:36 p.m., Yi Fan Yu wrote:
> libnet is a dependency to --enable-spoof-source.
> 
> The correct flag to enable/disable in ./configure
> is --enable-spoof-source.
> 
> Adjust PACKAGECONFIG accordingly.
> 
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>

These syslog-ng patches are in master now.

Yi Fan please send a request to get them into hardknott.
The old version has load of memory leaks so it's really not usable ...

Armin, Khem,
Did I miss an email about when y'all plan to declare hardknott released
and will stop accepting most package uprevs?

../Randy

> ---
>   ...onfigure.ac-add-libnet-enable-option.patch | 77 -------------------
>   .../recipes-support/syslog-ng/syslog-ng.inc   |  2 +-
>   .../syslog-ng/syslog-ng_3.31.2.bb             |  1 -
>   3 files changed, 1 insertion(+), 79 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch
> 
> diff --git a/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch b/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch
> deleted file mode 100644
> index c9eec65e8..000000000
> --- a/meta-oe/recipes-support/syslog-ng/files/0004-configure.ac-add-libnet-enable-option.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 57b509adfb7c62bbf55ea1709aac3383cab660fa Mon Sep 17 00:00:00 2001
> -From: Ming Liu <ming.liu@windriver.com>
> -Date: Thu, 17 Jul 2014 05:37:08 -0400
> -Subject: [PATCH] configure.ac: add libnet enable option
> -
> -This would avoid a implicit auto-detecting result
> -
> -Signed-off-by: Ming Liu <ming.liu@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> -
> -Update for 3.24.1.
> -Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> -
> -Set it to default yes
> -
> -Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/3650]
> -
> -Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ----
> - configure.ac | 35 ++++++++++++++++++++---------------
> - 1 file changed, 20 insertions(+), 15 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 7aad75f..d575cba 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -144,6 +144,9 @@ AC_CONFIG_HEADERS(config.h)
> - dnl ***************************************************************************
> - dnl Arguments
> -
> -+AC_ARG_ENABLE(libnet,
> -+              [  --enable-libnet      Enable libnet support (default: yes)],, enable_libnet="yes")
> -+
> - AC_ARG_WITH(libnet,
> -    [  --with-libnet=path      use path to libnet-config script],
> -    ,
> -@@ -1073,23 +1076,25 @@ dnl ***************************************************************************
> - dnl libnet headers/libraries
> - dnl ***************************************************************************
> - AC_MSG_CHECKING(for LIBNET)
> --if test "x$with_libnet" = "x"; then
> --        LIBNET_CONFIG="`which libnet-config`"
> --else
> --        LIBNET_CONFIG="$with_libnet/libnet-config"
> --fi
> -+if test "x$enable_libnet" = xyes; then
> -+    if test "x$with_libnet" = "x"; then
> -+            LIBNET_CONFIG="`which libnet-config`"
> -+    else
> -+            LIBNET_CONFIG="$with_libnet/libnet-config"
> -+    fi
> -
> --if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
> --        LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
> --        LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
> --        AC_MSG_RESULT(yes)
> --dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can cause warning during build
> --dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fix till
> --        LIBNET_CFLAGS="$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
> -+    if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
> -+            LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
> -+            LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
> -+            AC_MSG_RESULT(yes)
> -+    dnl libnet-config does not provide the _DEFAULT_SOURCE define, that can cause warning during build
> -+    dnl as upstream libnet-config does uses _DEFAULT_SOURCE this is just a fix till
> -+            LIBNET_CFLAGS="$LIBNET_CFLAGS -D_DEFAULT_SOURCE"
> -
> --else
> --        LIBNET_LIBS=
> --        AC_MSG_RESULT(no)
> -+    else
> -+            LIBNET_LIBS=
> -+            AC_MSG_RESULT(no)
> -+    fi
> - fi
> -
> -
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index e48e5d5e2..80c509973 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -50,7 +50,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
>   PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
>   PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
>   PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
> -PACKAGECONFIG[libnet] = "--enable-libnet --with-libnet=${STAGING_BINDIR_CROSS},--disable-libnet,libnet,"
> +PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
>   PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
>   PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
>   PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> index cbd218c95..5d2b7f77e 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
> @@ -10,7 +10,6 @@ SRC_URI += "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.t
>              file://syslog-ng-tmp.conf \
>              file://syslog-ng.service-the-syslog-ng-service.patch \
>              file://0002-scl-fix-wrong-ownership-during-installation.patch \
> -           file://0004-configure.ac-add-libnet-enable-option.patch \
>              file://0005-.py-s-python-python3-exclude-tests.patch \
>              "
>   SRC_URI[md5sum] = "69ef4dc5628d5e603e9e4a1b937592f8"
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
