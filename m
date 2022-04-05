Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99C7C433FE
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 20:23:32 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.107])
 by mx.groups.io with SMTP id smtpd.web11.129.1649188710134041527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 12:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@victronenergy.com
 header.s=selector2 header.b=N8f+BD0P;
 spf=pass (domain: victronenergy.com, ip: 40.107.4.107,
 mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6l0OQWII3qGcSIU9T+GKxU+TJTiEQYFRQDBaVy+6cQpndeigdWXu2mweMC4fzJX0Nr4g4gb0+6bVFZMBXCliSjdB9fkxV7y3EI5oL4Yrd1S+f+ahYG10Fa4+BsgZrpn1ONSVRtagzyJFKCzamD+29lYi8EpSaoScjjnGQg+itcFYKMwuLLoeLW+n9kop/EGWNcSHJ1oHs+7WTOCD+oWK51apoiwFed6gLWgOfia42bDPHK6lZK5u2utYfDW3QxHnHABtXXbE6V2h2eHN36kJGtQW2HOnvCJgEFovgYXjzT1pKbY9Uu5drkNMYVJHi0VLqWnx0PNMr6VDH4NmqSHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JUjebPHhYd18a/OoNYhPRAmitOjigiwwotqwsDWuu8=;
 b=e03RhLkfwgXb2tZoYupERLJugQfzkLyOjmB0+RWk+h87K0IOg3ly3GtQsdyRJ12yZwMD8br6GcgezM6DiurOwovkyS3Oz2tNQwsUaQjGHfGqQKKM3pg3tWfl62dj7MfsDchgz1jxOks9QmONCXxb2nLVoHLzQuuHftqjf3Hi1jVuSKtzXqdl3PoOOEsYQZc8Nn/qup+NJnwemBnvhS76HmPdKTzQm8DJH/ckNBMUJn+RKVuUWOVV4iFME1DK4/Fip8fEpoL7o8gYQDI7JpFn7GFm8DJoV5sNhHBdHsTkH9JbiuJ6LOV4AFf2iJfDeVact1EhmMZIhTM/6+CTN5nG2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JUjebPHhYd18a/OoNYhPRAmitOjigiwwotqwsDWuu8=;
 b=N8f+BD0PQs92Bku2c9kHZWyeOdRk+0chHZxJyspOvbML3225JUgUWreZgcyGshsE5fUMa+VpSnLtZmdP46rLMe/XZt4KNlyAlZafTQPdc3vugM6UdKdxyv36pZWToSzbPV2scDpowRmdheTtPKESAsuwGSeupOipHic/3d4fAu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from AM5PR0701MB2979.eurprd07.prod.outlook.com
 (2603:10a6:203:48::13) by AM7PR07MB6594.eurprd07.prod.outlook.com
 (2603:10a6:20b:1ac::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Tue, 5 Apr
 2022 19:58:26 +0000
Received: from AM5PR0701MB2979.eurprd07.prod.outlook.com
 ([fe80::3da3:88:4224:24af]) by AM5PR0701MB2979.eurprd07.prod.outlook.com
 ([fe80::3da3:88:4224:24af%3]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 19:58:20 +0000
Message-ID: <1c71df2b-9a17-3780-bf67-dee94539ef65@victronenergy.com>
Date: Tue, 5 Apr 2022 21:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [oe][meta-oe][dunfell][PATCH] php: move to version v7.4.28
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::20) To AM5PR0701MB2979.eurprd07.prod.outlook.com
 (2603:10a6:203:48::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cc6b7ea-0a27-42b8-66a4-08da173ea276
X-MS-TrafficTypeDiagnostic: AM7PR07MB6594:EE_
X-Microsoft-Antispam-PRVS: 
	<AM7PR07MB65945F9554DC391CBA70BC71C0E49@AM7PR07MB6594.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	khSj50msxG2UXGBZM1WNBzTWIsGnc2Vm7XBJIZYAygmLSPzDgNwwP8wcATLfFgS2DEyf/DSmh/TekKOkamzFxSqsEXMVFPRSgj5/L1Tl+DN8HWUmr5OajhRSQrBkfupw2KbuwyXBd7x5FVbu74RyLGIMk/tztDMRuEsLJE1Mb9EXypEYihInFUAqQXhJLLSgO01ooeLg8J8U8lNDbJtvWPUU/07TMabjqtNI/Ghk6EWjGQIcgaiUW42+DjE7MYGyFVDoy/CgbCEfVZdmgsKXykuml6JkofV0VICsQQKdXjNnuV3HXY79j+r8m88OLoWiFtCmBJg1j7CqZmrZ501Phx3BmR5SyrFPXakrUXhM1Y9SU3vnWRRc9E8QzrEWZnGfqfVaYSP7e3Z2nfwG/yNEg98ZpIoen064eznGsmUGTXNDJNtTpbw0iNh+BxIY4e3pD6Er8vbCuM3WIcIdbncKvmyvjcHh3sy5ZkbIgxaCkG55+d2k2gB0wJWfnRR+Mm1yEA9P05Ae76uSa7zCi2aaAydWQ9W7vt/NW0coGjcGiJw8muNPYwEbeSekdX23WfK7JoqESshgpvlPVAiqgU5oQRF83otgPi8wViwCmvwahicgCg9KY38fEGVIRnhthsNxUmn5wsy1C2pulerpPrhnKOH9sNRvUFdqGWUQLgc+FvDo28kv1afF2Jr3l+kMbj6Lo6Y3LZM4mCQ5DOiZLmeTGaL+s8zeiE4q2Ia9e6i0GMjgyNqNyVEr7ZrvTd8+WP5EDi4l6UiQvxA3T7x8cFYbAH56b7zQGTZAVePBD4xMthY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0701MB2979.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(508600001)(86362001)(6486002)(6506007)(316002)(6512007)(6916009)(186003)(6666004)(2616005)(2906002)(8676002)(36756003)(66556008)(66946007)(66476007)(5660300002)(83380400001)(8936002)(31686004)(38100700002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?msSDh1bZ/Qi28KkoBx1ucqhUPwTgpvpGvzaQNDUyQgRD4Zo8cXB2myVHspOu?=
 =?us-ascii?Q?Y8fo/9/WeFDLkHFCSYYedrIdGz/82qA117h0ECNBJVxEl4KqfhGtuz3ixXHX?=
 =?us-ascii?Q?K4ZXJlfJFCGehQxvsHGudgFkQKMdYjR55lif87yKi3FqR2scmyh8B1rl6nEP?=
 =?us-ascii?Q?X9AFDwF5IwrU1LrGCSCPpXzTzNg2bzvOBrXJG5STO9UYx0EAlnWzzgNLRFjr?=
 =?us-ascii?Q?+AszjZgrrGTgZA7ksaXzvbWDb2Uw7zeCN1E+quZMZe67VRvF7zdBrE2oVaZX?=
 =?us-ascii?Q?X+WvaXscKwBTKGq5vkonbAmtAfcaUth2IIpw/+66EYclpIj6nBkUKsxG8cyE?=
 =?us-ascii?Q?O0aLTV822q+mcFttVtqQFcHPpCIc5ERgFKCifvLTfzM4frq5XoUcnEQMMeer?=
 =?us-ascii?Q?GyOg2nPOaaz/WlShmcTZ8trCl22ODcqnYpxc1gHQWmm/rtAIiUwjoKQxzeGm?=
 =?us-ascii?Q?6Au8Q2IFr5bNDlWgZzIDtgbu9Mk9l+bTsBEPaEqCGLcZBzPMheILmOwvFP9f?=
 =?us-ascii?Q?ZKTAxWSN02OQzJmE/79sJ+wXrW4Oy8NSKG+S+k2kDYHJu0AYCByN6ZpDz8+H?=
 =?us-ascii?Q?jhF5N54N9To1ti1m4QOhxbt9hwkwjOO5VLkbarKUReGyabbQW3qZVkJbFQlr?=
 =?us-ascii?Q?3xk7uJDOPuxBCtoBwDs38pW5lOMWYpAIlae7o398/xcWgcbMqBUxW+VY2CtR?=
 =?us-ascii?Q?kB7Krc23wkUPJHfTooj2b3sddaZRaA1UvxwYsoenXM5kScYgtezb6zVU9n6N?=
 =?us-ascii?Q?5wzLTCcYV6I0FOCIZ0eT/D0OVjKirvyT+MnJ/YcwIqyi9Uan0RflO3FjXRfZ?=
 =?us-ascii?Q?2l8H5GxUPrcoDo0sFzoqsV98BR4FK2tSIpOVC8nrylR5nOAn/g4oHLSivDgM?=
 =?us-ascii?Q?/R+BvO/+2xRog0b7ztD5Lg3F+rsTslai4CIR+akK0S7dkGXXdikIjr+g8WEI?=
 =?us-ascii?Q?eteyqczE/MVxu4LxnfMRQ8ztLDPGGVAPPunGO8GTvpHCfM7UdkNsFO0tGvEZ?=
 =?us-ascii?Q?UiYbNLTib+uINVd0Ta0/JPc63/EbjdFn7BpBf9Qq/bc2TOOFvMjcqrsiWvcl?=
 =?us-ascii?Q?2VLXlVtSJJ6upgan84nycqr88OHFvJfxYY/lM+I/4+zaMbUJYyM+/cZmXV81?=
 =?us-ascii?Q?a59VzPkk0Q8CyHBu/jC1nj5LVIbaFVrIJ2/nqguf/XXHazJxk/dcZsztPaQv?=
 =?us-ascii?Q?UJa1GntndZjysO0ihZzPo74RbFxJKdJthNabW4ZTvpXHHAuzej8j5AcCQ6+h?=
 =?us-ascii?Q?T6exI9p0P+tl+ofcZz2J76UXKYvN3BVJ2PeS5x9kJOt27Ey5ZmRMHYc53Q0Z?=
 =?us-ascii?Q?I7pdL9sUi+VihokPSjP15IzzMvUDiqJxXcdzOi++1Qk9+ezBjkhEtYqM5Tz2?=
 =?us-ascii?Q?RdGB/uGpQekTHcX+v5ceLXo5k0cV+k82qo12AvYt3RAqpw1O+Zw59sZb3FvN?=
 =?us-ascii?Q?9JAY1qCtxJm0gOcxOy2buI/mxNQElevKBncK8B8ZoEtBrpthD/Uki7fMIVzm?=
 =?us-ascii?Q?Rm5Df6NpKk1upfMf4yROanXpJSXMkD7LAPqBtIyePfA1v2fFPd+EnE8FTljp?=
 =?us-ascii?Q?glKLJEqqkxjOwZQwUuEB1GYJ9aY97eI/UN1xPHPPEtF9n09lnKkVLN6oGVOq?=
 =?us-ascii?Q?mWbSEf2sSjNg1CYht//D1k938JvVhwpHnCRU895V+IQeiXTfBDyT1meta0IW?=
 =?us-ascii?Q?1xW9RjQrTu4pPp1IwA3HDbQFJTOwMR1BfPsn3WwbWc8bPdXZmEt1hT1paFTw?=
 =?us-ascii?Q?GDNhqggrxkPh77rR1zjzurWOFY/2F+oFUkK06FXMJIHHkvU2mV+7520yEpGJ?=
X-MS-Exchange-AntiSpam-MessageData-1: XzR89fkK7qgIkicexs3X5rdrDVVoQBBNgls=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0cc6b7ea-0a27-42b8-66a4-08da173ea276
X-MS-Exchange-CrossTenant-AuthSource: 
 AM5PR0701MB2979.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 19:58:20.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eIhET69QCZYbUGueKzVt9+UL8qdf/lQy+CiUO4S2+Utc8bsig/s5Szyu4gWItTUCuIM+5kei4xZvMmnu+jByXDVYWQlvhqjm4W5IFfLoDsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6594
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 20:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96434

CVE: CVE-2021-21703 CVE-2021-21706 CVE-2021-21707 CVE-2021-21708

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 =C2=A0meta-oe/recipes-devtools/php/{php_7.4.21.bb =3D> php_7.4.28.bb} | 2 =
+-
 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
 =C2=A0rename meta-oe/recipes-devtools/php/{php_7.4.21.bb =3D> php_7.4.28.b=
b} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb=20
b/meta-oe/recipes-devtools/php/php_7.4.28.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_7.4.21.bb
rename to meta-oe/recipes-devtools/php/php_7.4.28.bb
index c7c00ac30..3970ce097 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.21.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.28.bb
@@ -33,7 +33,7 @@ SRC_URI_append_class-target =3D " \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "

 =C2=A0S =3D "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] =3D=20
"36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
+SRC_URI[sha256sum] =3D=20
"2085086a863444b0e39547de1a4969fd1c40a0c188eb58fab2938b649b0c4b58"


 =C2=A0inherit autotools pkgconfig python3native gettext
--=20
2.25.1


