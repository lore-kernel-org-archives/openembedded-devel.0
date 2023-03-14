Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9026C74A5B
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 13:06:21 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (CHE01-GV0-obe.outbound.protection.outlook.com [40.107.23.81])
 by mx.groups.io with SMTP id smtpd.web10.6302.1678793381185644508
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 04:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=fEYXUcyL;
 spf=pass (domain: spinetix.com, ip: 40.107.23.81, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXmO/aR8jK6gSbK+Pt19LjqDEaSX5IZ1ZOncVazafGmQQqtfidu6ef30DhIVjL7uKcK4Pa+vKe55cn1L5ejYFWFFBVFctgLWz6T51OpvQQ4jPcOj1qCDGNY0Z1DowLZ7pFEvf6NGk1e0BmOrbb9GOiWNJTFWcOQz3z6Lwt0wCXmB6DzwRk3P03751w3QpeEVTWEwV+EgKVcnPh/K6DM7Pxrz/6g9tsmRpksDpHoQnYXXA/Y+Q7cGxk07l0FmUpN+6emS3IeJPHmH2dX9sY4b4OAUHGMxhW7pueU6x98/j4+6iEa74NlQ356fcE9/ECVkdGYzc0ysMTEkMWclfy3qKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoeuaYl/e7mPsisMUOA/PaUxLQanrsE48Ai/N89Jk28=;
 b=d/3Jrzvp8gZvtkcvewHAu+w1X4roSmxjgLI/6P4d7VV0lwp1/EJzgHNVcM6Aw3cOK5FNiRPTImB8Qo+F97fzZSFQLf3dFRhJGTozEjpQYuRbgbQSXMRrNXp5yar7DbXdfg/ZzEx8lgjuZnX6DRPiyTo+YRYGT+l4/nqOLMk+jrLdYeXDDDEgRV9al3Z/4voJE2kFHvnazHIp+vDlwPmss4j+gJjn3JiT0HkpYxeOB2BsCFiLkQus+IAnggaeWPvBTcOIMuuIRap2TBS5n4iwpbgFix0dIksPgWJqxwK9eKz4L+f3RAk9z4nI2ajr+BcJc2935FpcX4iDYTOHzG/VXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoeuaYl/e7mPsisMUOA/PaUxLQanrsE48Ai/N89Jk28=;
 b=fEYXUcyLPDa6bNdrL3AmhHDwqnN0yIOHjMOjzpQIYhGnfDJ6ZmXZs7uHiYz27Ebad7CJxwLXKdatrsrfPjndM3g30kjD78rhEauWtaSapebYfaBHLFE6PIxxiowSxKKpvpa/bRo5k2YDWwJ/ptlFvM9ZNiSFof6tJeTC3i0918U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZR0P278MB0123.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:19::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:29:38 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2353:2e57:6e90:ab36]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2353:2e57:6e90:ab36%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:29:37 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.55 -> 2.4.56
Date: Tue, 14 Mar 2023 12:28:19 +0100
Message-ID: <20230314112819.24301-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR0P278CA0172.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::6) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZR0P278MB0123:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f2c79a-80ae-44b8-4488-08db247f650f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uJjgnlIFSgr3Pelyd8WVDxNEzp389yc43sBJzr8/9jhf3v4bRnkZBSNObdi3+rszkBR6zt1C69l2P8oDr99IzPIvQBZUmP5+gC16OpcqfZyy6roHQAata9m5NykpKM3bWRMHEVsruy4p5hFajPhTjA+sCQPIWExlZH6R/CPUwjMz6Bzdh3m21qWtVztpZPa8TIZq8FlII5uNVaVNxnDdndv2WX37M1zdLxFgk1k9GCLpmtXTjBx1CJMdXGtzbGdDnRQ2YCicdz5Q9x9TXzkegdhyGlWRK9wfz1NmNWEjxfDHPd6vID3ul3+eZ2PW0fll87fVYIljTTfZ5ycR+eKNn0HFeM6kjmgwdl0axwQhwdgS5tVJ/hRggZny2OE+aRf4CQBpjV6Uq+hPav+amzMVvZkPwxK5mHZR1P+xCMPzzet9L4TdKdTMcPn7ZiCjEfh4nw0yenY+fpnpZehOFzRv18Z/zTStUaIBJHtwU0OW/KWTl4gzAQkG615+XEIv9xkJkjYyyAKu8PWwfCdT0BED7VCkP/HkW6YmXSHbfRmsQnZhCQDr9f6gklDAIJIj2a1qjQjMycpOLJUoAXttGQ742IRkH5J/bOjKmoMhUjfmqwTcHPhuvkxwC1k7eoGEOpk0juDjUBtj0tQzrosHUpifkZmdeOL7RUXFEypyb86of7Qifa3vtjWpV9sAUdX4qSmc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(39830400003)(136003)(451199018)(38100700002)(38350700002)(6916009)(4326008)(41300700001)(316002)(83380400001)(66476007)(54906003)(66556008)(8676002)(66946007)(8936002)(5660300002)(2616005)(52116002)(478600001)(86362001)(44832011)(1076003)(26005)(6506007)(6512007)(2906002)(186003)(6666004)(6486002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3wL8+luDK5Ajudqh0nNpHNu5wMAuYiAFBnftsTl4beq0v4HDbwmaFAgqT50T?=
 =?us-ascii?Q?6HXmln/eqAdRVuxp4KHrEIAEayLkYZht8KjbBihDAEMfw4b7V6x5P5zqR9JT?=
 =?us-ascii?Q?vj5qZVxtf1ZWfl3xkcYdA7TQR42qm8tIwl+9t1epO1aY7DQVtlCwuaSSioJP?=
 =?us-ascii?Q?7xQp1Y7GIbXdamdHoYnXjan2HimbM7kGphWrTdAG2OUGb1piJc3rCsjsdMwl?=
 =?us-ascii?Q?GKYjVhZAD+laN8OxL48CqADqP/Jr0PMRoAw3kfqbgHz+HGHf6XmB7truVkex?=
 =?us-ascii?Q?pVm9Q1bKoY0U99xm6YHb7FVOg0UH5l28envqPzxa7+Aa4cQHAzlyjA5EbXAo?=
 =?us-ascii?Q?Y1NrTe7/wKeME+BtnqLlI+xz2M352ML6lJ5PP+bgOo+99gBsmLg1wndgUPFB?=
 =?us-ascii?Q?H5ms0vMfwja3QhBvdYHxjhAkoNwKYSII2xCShs7DqmWC8lUcZ0NLMbUKliO2?=
 =?us-ascii?Q?ziw+ljxK1GCsGknKhw3k03CADpl+SLOx/M/3pLDjDwMn52ztkFziq62Huh3T?=
 =?us-ascii?Q?VMPmW9kL6bFam2biMM2je2TPcyfAo2S4yC939ukKvJQwmcWrL3Hq0O/ssPwC?=
 =?us-ascii?Q?s3iBdrCWWsImyGEJQuw0idWhaEyqZppsX7LXtcwzUkmPl6lHR5Tr7b51j5IP?=
 =?us-ascii?Q?ZJPyy/NxKozOMBlzW8KgqsycIrM6vI5zW6WnR/YXb7e/+tA4kol3UG0i1aGW?=
 =?us-ascii?Q?+N0G+Pcrh2ll53auMRiiSXoiB0yEahX5AQeOX6uWUKZS9R9n8BjbLnfM+/Me?=
 =?us-ascii?Q?d5keUugJsu5k8Sex2jzdUmwLkQpmAeU2Q/dCDoOMeEkDZaQiDRAgTELK5bl6?=
 =?us-ascii?Q?daQNkMLSoHRoCEoP4TOlcIU625/KIML0r4CCDG0ae/Ak2ULQ0go1XA0dkZcx?=
 =?us-ascii?Q?wqxGeoa1/+nn63H+g+zvyNFOae5Vd8ouSR4f1LvQsMyLuPZOonQy+HxM3BPn?=
 =?us-ascii?Q?8bdO4H/0OKmSVC9ATwTjqgqpWZ/smGrAikr/zXbRe+SEG5eRrQjpmu3bEx+l?=
 =?us-ascii?Q?hnAn7NUELcSmXzDCrVcFBDQsYaZLUCSUN5wWwN6h9TRbCF7s+MrClrO/gGCP?=
 =?us-ascii?Q?SZ/OIhBrvt5wNx0rEAQh5usQFSHXOFCzrKEbBqaB+YJAKL8fdw9i3KwCMatX?=
 =?us-ascii?Q?fYdhJhzbdAupNZPMq1KpSOF0BCY/XLYtV+RK+IEU9FPubljQfhh0ch/j4Z7Z?=
 =?us-ascii?Q?eeYc3ly+Eom8LIvbIIvFq/zbaG697jyC4MFQkzwpG9APOGlvH0oQ8n4oMK0m?=
 =?us-ascii?Q?RiByvKgBb6pQGXSc26pwBw2R1uYhCCnbcGq3ua/lDzRzF47HeUSpOl6/sqYx?=
 =?us-ascii?Q?rIVm+8Qrz/jAav3UEn+SEpjiselKiT8JxuCoePs0Db/YJaEoNJYzyYU8EhBH?=
 =?us-ascii?Q?7BcRb8exNkCptmIb/3Z0kRkzon64DR2v5Bxu+ySVyqvUCXaJcJbNGJjJSE/z?=
 =?us-ascii?Q?yNxBoO37yMeSjLXT+ZfSeSwcabU95pMCUxpTPgbVtaJxtj5lp4qXWpIbHIE6?=
 =?us-ascii?Q?LnZnJBfDhmSJNxzPyzBSL4GoNiDRVDxzvFH5BTTrKIpNEd8IqV+JZYx2M4i0?=
 =?us-ascii?Q?CzyB8Qsp52jMGpoJt3WaG2JNcCJlt+NIr4f1nzmxneSouqpotQ5e60Doof59?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f2c79a-80ae-44b8-4488-08db247f650f
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:29:37.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCM2PKRxkBPa1o2u65AqRLFuA9kmLtODXj1vm8s0xX2JKbX3MhwxaQglJJz8bmvYfCBhG/1xXmoN5C1FWfDBiY+3uM4W7tsVRZScEFXtQ5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0123
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 13:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101520

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-  rotatelogs: Add -T flag to allow subsequent rotated logfiles to be
   truncated without the initial logfile being truncated.

-  mod_ldap: LDAPConnectionPoolTTL should accept negative values in order t=
o
   allow connections of any age to be reused. Up to now, a negative value
   was handled as an error when parsing the configuration file.  PR 66421.

-  mod_proxy_ajp: Report an error if the AJP backend sends an invalid numbe=
r
   of headers.

-  mod_md:
   - Enabling ED25519 support and certificate transparency information when
     building with libressl v3.5.0 and newer.
   - MDChallengeDns01 can now be configured for individual domains.
   - Fixed a bug that caused the challenge
     teardown not being invoked as it should.

-  mod_http2: client resets of HTTP/2 streams led to unwanted 500 errors
   reported in access logs and error documents. The processing of the
   reset was correct, only unneccesary reporting was caused.

-  mod_proxy_uwsgi: Stricter backend HTTP response parsing/validation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../apache2/{apache2_2.4.55.bb =3D> apache2_2.4.56.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb =3D> apache=
2_2.4.56.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.56.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
index 88cef0ef83..1ad222ace4 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f=
39c71bdc5f69ac"
+SRC_URI[sha256sum] =3D "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5=
442d41afdb2d7c"
=20
 S =3D "${WORKDIR}/httpd-${PV}"
=20
--=20
2.25.1


