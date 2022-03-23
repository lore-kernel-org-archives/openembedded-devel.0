Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23868C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 07:38:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6407.1648021100299107918
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 00:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XNEhRjlQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0081b5c51b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22N78ViO003464
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 00:38:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : cc : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=bTSqltF3fDVJrrnl3DSjhRp6s/VMtBbYLuj5fX8j1Zw=;
 b=XNEhRjlQmuTzq/mtb837x+Yy/wNTp90mfex6Gqo150Z1rr9C1pnNnh611MVhl72Noj9o
 C6cFiPsXSqI+2pWV3T+oa8IhRdc4ruRcw0r5ptS014mlsMzNEaHZcvOpQDIVMp+HeQ1G
 kk9zUTIByOj+PGdLf5NhcDBE/y27kuCTxWLJxbVsCiqv/BrZW5t08tQklLqhTmEWhvYl
 2ZneT/Y3UCCWKlMF3j5ykpitAkYtIlXY+iKr8YzjqwKSixexmfbjfVoulsFELoeEbk6h
 qoftIc3qf1dlccPeGc3IN9uK6pkjfD8SnGxO0VdX7ILUC1JYLKE8FhkJzFF3nEW2Zlop 4Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3u3fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 00:38:19 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22N7cJ1D010577
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 00:38:19 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3u3fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Mar 2022 00:38:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnYOFeHmUWxUeKkJlCHB1olmTKu2n/ik3Tw3nSWYU5BdeXIYTpGLuV2Z6a8iFVGgt2r14gWVtKV36s10W9A6F3jR0ajSFNVxQxplquIEpi6dNrZURX3uazj02q61qDRHyIbGQLN8IACmoVVUCakpN9Erz4vDgqcYPy/rzh4m5gsvAldXVdzdHR6LlREFp/21TpUcgXcN5XVfmEuk03WL976lSuvxl6ke2Z2HkLtjVNxArtafjCChGTgh+/qOmcRvgawgzITPAraMzA9macgqw+HU/8DToHr+YtN+IgsIqSblD8JZcF59L4akCcvaGX/8vT0UhSlhUYeocfRxDQAizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTSqltF3fDVJrrnl3DSjhRp6s/VMtBbYLuj5fX8j1Zw=;
 b=KwFcrFnIY9Vl1xUWH0k/cx6rLOCYo4+Fmaqw78dHASaq3qapJOHR4r612UrgOiZ3f0yPToABjVT5PgDPql5TmG2BF0FG+9Qb6kEG4nTHmwhEFP9y9+cxzfs8Hh+sE7aThXzQr77CJS0GZErRDjuOwcKHjt7079Nwo+ZNBrr4oK/tg5PHyYkfPTzBpwsxFA256jhpzQPhJeOgIGP0W1n9RbwPtooVxYFlWioaekGFIhP3NQoFDsdthtgzxevmJ7YjG+h/6jTpX/vMfcQVutHSjDRO1fsyflhXgNDnJ1gTdTyXgUkWkAKMu4GQYVghhuW5hxgpisiff9a+2h1FShkMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BN6PR11MB1955.namprd11.prod.outlook.com (2603:10b6:404:100::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Wed, 23 Mar
 2022 07:38:17 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1511:269:4fb1:7501]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::1511:269:4fb1:7501%5]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 07:38:17 +0000
Subject: Re: [meta-oe][PATCH] mariadb: Enable openSSL and use as default SSL
 option
To: Khem Raj <raj.khem@gmail.com>
References: <20220323051658.4065181-1-raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <86f06147-1b3c-5bef-d3f3-d51fb9ba568b@windriver.com>
Date: Wed, 23 Mar 2022 15:38:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220323051658.4065181-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9172233-7df8-4646-22b6-08da0ca0183a
X-MS-TrafficTypeDiagnostic: BN6PR11MB1955:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1955C63E17978D65920F3853F1189@BN6PR11MB1955.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pm8RXE1JPqh1eDHx1kKly624W0NpzHREGAr9HmGPEdmWN7b7a6PV5VYKPBlDDjISWSKQvjBC4Ei6xSlCAJKvW/NhZA40K3JZ9ExJgl8XFR/WKTBOYnU/c6O7snEh0Qg577Mloc2KqBIFkKEerHC7V6V119I+SJOoxX4wmUljN1tFKfoov7gQvr9FsX5AFX2nMS6II+rpOZ8lTbdlloStqsDUQ5ZGNe5j9ygMMnDNrIY5MvF2DsHZTZQCmkYj96IaxTiUsSYvy1mpAqZPqliOeG77VtMDDkDemRgK8styS/VConuHYbvSJ2dPBB/r9R9OB2h7iYkXdZXHV9JThL+dhMIoDHu7AmdYDRZ5paWyDWkMce5wJoAjQwIrCUxrw4J+BAtdh0Zofsi+zFg1gHdMEhIThPM1+WBjq0CwT56WZeqyx/yig9ASzSVRHcLh3q/I4vP74FBpvB7ZF8Ns/dJqRh2JLsXawBfbWGp2qlibgZcb/YSitqukVc0hgbyx5glU+n0+M5deI7IsxZOmnQ+hkOvMNifvM90yAYqVzYuPwYOq587XiIjI4PqFf+KGIrjRbAekhrthAKiyU5He7+TNxCp+/7YeVhl805fusi+ZWpkf0Su4KEr1XSRFnlqv8VcGQ0xAdTKXot+T1UrQ/arxKaJF1FI29tvvmHB+Ax9DmkZmREQLHBP5Jr4m02+YhIM76iN4+vKZ3HfDMgmmht8xbxH8Bsd4115y1lmdHaPnnkT/avyoUsYE2BGj865Daw+7VEPO27hIeGNG413y/tvPsqZx1HxKVdeVJCwsJGDxL3/Etk3YQNJVAM3wb120YFJBEOQlGaf4LtX7vqypv1LZaaMuo9KwrnvIQaSkDsNXu5Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6486002)(966005)(31696002)(86362001)(6512007)(2906002)(508600001)(6666004)(52116002)(6506007)(26005)(186003)(83380400001)(38350700002)(38100700002)(2616005)(66556008)(31686004)(66476007)(66946007)(8676002)(4326008)(5660300002)(316002)(6916009)(19627235002)(8936002)(30864003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T2hqV1QvZjVxT1l5SzhuYWZ1VHpKMFlJWFprNmEwUXhQWEN1bE1xYVdKZVlL?=
 =?utf-8?B?bUljUldJc1Rybkh5UWIwajNCMnR6SVhPcWdFWDRhcExtRytTV1ExbE8vNEdu?=
 =?utf-8?B?ekpkL0xWSWN3MUFyRUx4MFFiSDlDSUJHZFJpK0p5UHBEaGlLWndoMnNDbXFY?=
 =?utf-8?B?eGc3Q25janNKNGtVd2MrczlGVHN5c2ZnZzRvYVVibGlMK1dGeklYb05LNHdy?=
 =?utf-8?B?bjl1TlE0aTB6eDlPcm9ZRW1TdVp0NXhRcUNSZVhLVXozMzNBbkh3b3dvSDZw?=
 =?utf-8?B?Wk9wYXJTWVgzTXZEU3VaZk11eldaNzhPS0JReHd0NVpHM1hzL202WnV4Tlh5?=
 =?utf-8?B?Y05HSWNMekJFeEZZenI4ZWRjNWhieVFEai94VGxWdVdwdDB5MGt3Zm5jZWoz?=
 =?utf-8?B?R2NlVVZ2THc1RGsxNXFSd2dvekVoUVRBcEdORDllSWF5MFA3TWlEQUZEY0hY?=
 =?utf-8?B?d1VaMHA1TjNjV2IyeURDZzVGOGtPQkJBanJqVUdmTmEwSCtLNDNVUis0THZK?=
 =?utf-8?B?NG5BZU5ZVjUrMUZueUduaE5lK0MvRkVyUVpKQTVCN21FVDFOOUQ1L3BDSFY4?=
 =?utf-8?B?cE5PZnU2clhkbDdEY1BOR3JPZjhvN1l3LzFvMkVhRE9lMjJUL29HSFpYVmxN?=
 =?utf-8?B?elZlN05XdXlkbGloTmNmRU1TcC9WZWRJVEU0NFdmMjBuaGpZSWJseFozQ2hF?=
 =?utf-8?B?SmdWSlFLL0s4aGc3VjYwNDVkM0cweXdLVFJrbVZjWHhTbU9JcGtSQU1GenZN?=
 =?utf-8?B?Yk9TVXV5NTB3MTlaUWFyYllCM1VFM3NhZVdjWTRJOW9vN0tqaGJ0OVE1aGpW?=
 =?utf-8?B?SnlNeXFqRmpKM285NFVjRkI2QkNGL1J3dWZSMFJ1UW8vOGtQSjZuMjRkbC9M?=
 =?utf-8?B?TGIxOVFIK2RreVZ2OGYwb1J5UWJHVXhkSDR6RURZWmdKWFpBQlF0YUJ4Ym85?=
 =?utf-8?B?S1BHa01LVFJOYzZkS0l5ZlkrRGVzL05rRm5DOXd5bmxpSXJSZHZUVmc5NzFR?=
 =?utf-8?B?VGJ0aUlaZTNBdytzWng0TGZhSGpTUk56dkVHWWhDT3I3Q3BOdGFESHBhUDhp?=
 =?utf-8?B?NHRaV1NSbyt1cDJyUTkvbkxPaWtaSnk5VFVnY2NJbU1jbXYrZUlHQXlVSUNQ?=
 =?utf-8?B?THRrR3NHQXlCemdPbHZWcE5Lb2xTMC9SK2tYZThiKzI3czI0OGJhNHVnMHlO?=
 =?utf-8?B?Qk9ta2h0cksyYUt3TEkyWndsOXV4ek1XN2tWWXlmZVBDcld6UzFiN2lEdGlP?=
 =?utf-8?B?WmhCSlBtbno1by9aRVVISkZaTUZ3RzF1blV4dmhFdXhYYnNmMUhYRHk0aG40?=
 =?utf-8?B?NmdPQzRMRjZDZnhNc25wQVRwOVhURzc2SFZwNVlBczZkcEY5dVlkUmtRcVlC?=
 =?utf-8?B?Zit2UFg1UGo1U0FnL0k3KzJNR2FOWVhtb29EM2hFM3VKTDU0R281QXFVUVhU?=
 =?utf-8?B?UXo4Y2svRlRJdmI5dUhqcDhOV0hiWHBFdUdacWpGbkFMMjkxTmFteWVFNGZC?=
 =?utf-8?B?Rk41dnp4R2wyLzNZb1M5Q040OGNzMHVmTHhOaXVXaytGWEl6RU9VeWVsOWw3?=
 =?utf-8?B?MkUxUzVQZm1BZHlMdXBHa3M2WDEwS291SVlBcWJnUFNGNGhJZ1B2NkxuZ05j?=
 =?utf-8?B?TWlydGNqMkdRMEtCSjE5ZzN0N1ljWitCOXVtS2lTeDJFRS9iNE1oNENOSjhm?=
 =?utf-8?B?QVJOai9RbHdxdnkySTNYYWpLZ1FHUVcyQWZvWjBJeVdFdHVEakllZHBvTEJY?=
 =?utf-8?B?OUdaVDNZZGxONERpMWhqbHZMSm1mUHdqN0VjMEcvc09XSGpoWGxDT29sTEFz?=
 =?utf-8?B?dlZKb0JpM1RsRmhkOWJwMWdZbk9VZnhpMWg5OTJDUTl3eUxMd2pKUkFwZ2x2?=
 =?utf-8?B?WlU1YU9lOGlpWDhJa2pHaUVQQUozNXlJU3NKajhRNWx4VlladGZNUThYRjkz?=
 =?utf-8?B?NWNwNmg0VlpPYWgySkpvQ1VNZVVqb1BBSWVRYktuQnNkdVZFVUd2UXQ0UXNi?=
 =?utf-8?B?U2gwclZxRitRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9172233-7df8-4646-22b6-08da0ca0183a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 07:38:16.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XpR+ml8XYcLIHVOeexS5cIaH2o9PjvTyZ2adkbUtk6GjFZSs1zYYT9Laz+Go28IzeJiLxCSHft7cC5OtvXPHiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1955
X-Proofpoint-ORIG-GUID: 0C9B-GzKV25CwJGBETavPg4nhMxM6Lkt
X-Proofpoint-GUID: KzgC6V28pj2qfJP0Z6AeIQ9Jna06Wrwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 07:38:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96158

Thanks for the fix, the previous patch
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch 
should be included in 10.8.x and we still need this patch in 10.7.x.


Thanks,

On 3/23/22 1:16 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> cmakery fails to detect openSSL and falls back to use wolfSSL which is
> bundled with mariadb, therefore fix openSSL support fixes from fedora
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta-oe/recipes-dbs/mysql/mariadb.inc         |   4 +-
>   .../mysql/mariadb/mariadb-openssl3.patch      | 385 ++++++++++++++++++
>   meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb   |   2 +-
>   3 files changed, 389 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
> 
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 7f78da1fd3..02ca5f96f2 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -19,6 +19,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>              file://ssize_t.patch \
>              file://mm_malloc.patch \
>              file://sys_futex.patch \
> +           file://mariadb-openssl3.patch \
>             "
>   SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
> 
> @@ -60,12 +61,13 @@ FILES:${PN}-setupdb = "${sysconfdir}/init.d/install_db \
>                          ${bindir}/mysql-systemd-start \
>                          "
> 
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
>   PACKAGECONFIG:class-native = ""
>   PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
>   PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
>   PACKAGECONFIG[krb5] = ", ,krb5"
>   PACKAGECONFIG[zstd] = "-DWITH_ROCKSDB_ZSTD=ON,-DWITH_ROCKSDB_ZSTD=OFF,zstd"
> +PACKAGECONFIG[openssl] = "-DWITH_SSL='system',-DWITH_SSL='bundled',openssl"
> 
>   # MariaDB doesn't link properly with gold
>   # https://mariadb.atlassian.net/browse/MDEV-5982
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch b/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
> new file mode 100644
> index 0000000000..db123e4a10
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
> @@ -0,0 +1,385 @@
> +From c80991c79f701dac42c630af4bd39593b0c7efb4 Mon Sep 17 00:00:00 2001
> +From: Vladislav Vaintroub <wlad@mariadb.com>
> +Date: Mon, 8 Nov 2021 18:48:19 +0100
> +Subject: [PATCH] MDEV-25785 Add support for OpenSSL 3.0
> +
> +Summary of changes
> +
> +- MD_CTX_SIZE is increased
> +
> +- EVP_CIPHER_CTX_buf_noconst(ctx) does not work anymore, points
> +  to nobody knows where. The assumption made previously was that
> +  (since the function does not seem to be documented)
> +  was that it points to the last partial source block.
> +  Add own partial block buffer for NOPAD encryption instead
> +
> +- SECLEVEL in CipherString in openssl.cnf
> +  had been downgraded to 0, from 1, to make TLSv1.0 and TLSv1.1 possible
> +
> +- Workaround Ssl_cipher_list issue, it now returns TLSv1.3 ciphers,
> +  in addition to what was set in --ssl-cipher
> +
> +- ctx_buf buffer now must be aligned to 16 bytes with openssl(
> +  previously with WolfSSL only), ot crashes will happen
> +
> +- updated aes-t , to be better debuggable
> +  using function, rather than a huge multiline macro
> +  added test that does "nopad" encryption piece-wise, to test
> +  replacement of EVP_CIPHER_CTX_buf_noconst
> +
> +Patch from Fedora https://src.fedoraproject.org/rpms/mariadb/raw/rawhide/f/mariadb-openssl3.patch
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + cmake/ssl.cmake                   |  19 ++++-
> + include/ssl_compat.h              |   3 +-
> + mysql-test/lib/openssl.cnf        |   2 +-
> + mysql-test/main/ssl_cipher.result |   6 +-
> + mysql-test/main/ssl_cipher.test   |   2 +-
> + mysys_ssl/my_crypt.cc             |  46 +++++++-----
> + unittest/mysys/aes-t.c            | 121 ++++++++++++++++++++++--------
> + 7 files changed, 141 insertions(+), 58 deletions(-)
> +
> +
> +--- a/cmake/ssl.cmake
> ++++ b/cmake/ssl.cmake
> +@@ -118,7 +118,7 @@ MACRO (MYSQL_CHECK_SSL)
> +     ENDIF()
> +     FIND_PACKAGE(OpenSSL)
> +     SET_PACKAGE_PROPERTIES(OpenSSL PROPERTIES TYPE RECOMMENDED)
> +-    IF(OPENSSL_FOUND AND OPENSSL_VERSION AND OPENSSL_VERSION VERSION_LESS "3.0.0")
> ++    IF(OPENSSL_FOUND)
> +       SET(OPENSSL_LIBRARY ${OPENSSL_SSL_LIBRARY})
> +       INCLUDE(CheckSymbolExists)
> +       SET(SSL_SOURCES "")
> +@@ -139,9 +139,20 @@ MACRO (MYSQL_CHECK_SSL)
> +       SET(SSL_INTERNAL_INCLUDE_DIRS "")
> +       SET(SSL_DEFINES "-DHAVE_OPENSSL")
> +
> ++      FOREACH(x INCLUDES LIBRARIES DEFINITIONS)
> ++        SET(SAVE_CMAKE_REQUIRED_${x} ${CMAKE_REQUIRED_${x}})
> ++      ENDFOREACH()
> ++
> ++      # Silence "deprecated in OpenSSL 3.0"
> ++      IF((NOT OPENSSL_VERSION) # 3.0 not determined by older cmake
> ++         OR NOT(OPENSSL_VERSION VERSION_LESS "3.0.0"))
> ++        SET(SSL_DEFINES "${SSL_DEFINES} -DOPENSSL_API_COMPAT=0x10100000L")
> ++        SET(CMAKE_REQUIRED_DEFINITIONS -DOPENSSL_API_COMPAT=0x10100000L)
> ++      ENDIF()
> ++
> +       SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
> +       SET(CMAKE_REQUIRED_LIBRARIES ${SSL_LIBRARIES})
> +-      SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
> ++
> +       CHECK_SYMBOL_EXISTS(ERR_remove_thread_state "openssl/err.h"
> +                           HAVE_ERR_remove_thread_state)
> +       CHECK_SYMBOL_EXISTS(EVP_aes_128_ctr "openssl/evp.h"
> +@@ -150,8 +161,10 @@ MACRO (MYSQL_CHECK_SSL)
> +                           HAVE_EncryptAes128Gcm)
> +       CHECK_SYMBOL_EXISTS(X509_check_host "openssl/x509v3.h"
> +                           HAVE_X509_check_host)
> +-      SET(CMAKE_REQUIRED_INCLUDES)
> +-      SET(CMAKE_REQUIRED_LIBRARIES)
> ++
> ++      FOREACH(x INCLUDES LIBRARIES DEFINITIONS)
> ++        SET(CMAKE_REQUIRED_${x} ${SAVE_CMAKE_REQUIRED_${x}})
> ++      ENDFOREACH()
> +     ELSE()
> +       IF(WITH_SSL STREQUAL "system")
> +         MESSAGE(FATAL_ERROR "Cannot find appropriate system libraries for SSL. Use WITH_SSL=bundled to enable SSL support")
> +--- a/include/ssl_compat.h
> ++++ b/include/ssl_compat.h
> +@@ -24,7 +24,7 @@
> + #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
> + #define ERR_remove_state(X) ERR_clear_error()
> + #define EVP_CIPHER_CTX_SIZE 176
> +-#define EVP_MD_CTX_SIZE 48
> ++#define EVP_MD_CTX_SIZE 72
> + #undef EVP_MD_CTX_init
> + #define EVP_MD_CTX_init(X) do { memset((X), 0, EVP_MD_CTX_SIZE); EVP_MD_CTX_reset(X); } while(0)
> + #undef EVP_CIPHER_CTX_init
> +@@ -77,7 +77,6 @@
> + #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
> + #endif
> +
> +-#define EVP_CIPHER_CTX_buf_noconst(ctx) ((ctx)->buf)
> + #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
> + #define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
> +
> +--- a/mysql-test/lib/openssl.cnf
> ++++ b/mysql-test/lib/openssl.cnf
> +@@ -9,4 +9,4 @@ ssl_conf = ssl_section
> + system_default = system_default_section
> +
> + [system_default_section]
> +-CipherString = ALL:@SECLEVEL=1
> ++CipherString = ALL:@SECLEVEL=0
> +--- a/mysql-test/main/ssl_cipher.result
> ++++ b/mysql-test/main/ssl_cipher.result
> +@@ -61,8 +61,8 @@ connect  ssl_con,localhost,root,,,,,SSL;
> + SHOW STATUS LIKE 'Ssl_cipher';
> + Variable_name Value
> + Ssl_cipher    AES128-SHA
> +-SHOW STATUS LIKE 'Ssl_cipher_list';
> +-Variable_name Value
> +-Ssl_cipher_list       AES128-SHA
> ++SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
> ++VARIABLE_VALUE like '%AES128-SHA%'
> ++1
> + disconnect ssl_con;
> + connection default;
> +--- a/mysql-test/main/ssl_cipher.test
> ++++ b/mysql-test/main/ssl_cipher.test
> +@@ -98,6 +98,6 @@ let $restart_parameters=--ssl-cipher=AES
> + source include/restart_mysqld.inc;
> + connect (ssl_con,localhost,root,,,,,SSL);
> + SHOW STATUS LIKE 'Ssl_cipher';
> +-SHOW STATUS LIKE 'Ssl_cipher_list';
> ++SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
> + disconnect ssl_con;
> + connection default;
> +--- a/mysys_ssl/my_crypt.cc
> ++++ b/mysys_ssl/my_crypt.cc
> +@@ -29,11 +29,7 @@
> + #include <ssl_compat.h>
> + #include <cstdint>
> +
> +-#ifdef HAVE_WOLFSSL
> + #define CTX_ALIGN 16
> +-#else
> +-#define CTX_ALIGN 0
> +-#endif
> +
> + class MyCTX
> + {
> +@@ -100,8 +96,9 @@ class MyCTX_nopad : public MyCTX
> + {
> + public:
> +   const uchar *key;
> +-  uint klen, buf_len;
> ++  uint klen, source_tail_len;
> +   uchar oiv[MY_AES_BLOCK_SIZE];
> ++  uchar source_tail[MY_AES_BLOCK_SIZE];
> +
> +   MyCTX_nopad() : MyCTX() { }
> +   ~MyCTX_nopad() { }
> +@@ -112,7 +109,7 @@ public:
> +     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX_nopad));
> +     this->key= key;
> +     this->klen= klen;
> +-    this->buf_len= 0;
> ++    this->source_tail_len= 0;
> +     if (ivlen)
> +       memcpy(oiv, iv, ivlen);
> +     DBUG_ASSERT(ivlen == 0 || ivlen == sizeof(oiv));
> +@@ -123,26 +120,41 @@ public:
> +     return res;
> +   }
> +
> ++  /** Update last partial source block, stored in source_tail array. */
> ++  void update_source_tail(const uchar* src, uint slen)
> ++  {
> ++    if (!slen)
> ++      return;
> ++    uint new_tail_len= (source_tail_len + slen) % MY_AES_BLOCK_SIZE;
> ++    if (new_tail_len)
> ++    {
> ++      if (slen + source_tail_len < MY_AES_BLOCK_SIZE)
> ++      {
> ++        memcpy(source_tail + source_tail_len, src, slen);
> ++      }
> ++      else
> ++      {
> ++        DBUG_ASSERT(slen > new_tail_len);
> ++        memcpy(source_tail, src + slen - new_tail_len, new_tail_len);
> ++      }
> ++    }
> ++    source_tail_len= new_tail_len;
> ++  }
> ++
> +   int update(const uchar *src, uint slen, uchar *dst, uint *dlen)
> +   {
> +-    buf_len+= slen;
> ++    update_source_tail(src, slen);
> +     return MyCTX::update(src, slen, dst, dlen);
> +   }
> +
> +   int finish(uchar *dst, uint *dlen)
> +   {
> +-    buf_len %= MY_AES_BLOCK_SIZE;
> +-    if (buf_len)
> ++    if (source_tail_len)
> +     {
> +-      uchar *buf= EVP_CIPHER_CTX_buf_noconst(ctx);
> +       /*
> +         Not much we can do, block ciphers cannot encrypt data that aren't
> +         a multiple of the block length. At least not without padding.
> +         Let's do something CTR-like for the last partial block.
> +-
> +-        NOTE this assumes that there are only buf_len bytes in the buf.
> +-        If OpenSSL will change that, we'll need to change the implementation
> +-        of this class too.
> +       */
> +       uchar mask[MY_AES_BLOCK_SIZE];
> +       uint mlen;
> +@@ -154,10 +166,10 @@ public:
> +         return rc;
> +       DBUG_ASSERT(mlen == sizeof(mask));
> +
> +-      for (uint i=0; i < buf_len; i++)
> +-        dst[i]= buf[i] ^ mask[i];
> ++      for (uint i=0; i < source_tail_len; i++)
> ++        dst[i]= source_tail[i] ^ mask[i];
> +     }
> +-    *dlen= buf_len;
> ++    *dlen= source_tail_len;
> +     return MY_AES_OK;
> +   }
> + };
> +--- a/unittest/mysys/aes-t.c
> ++++ b/unittest/mysys/aes-t.c
> +@@ -21,27 +21,96 @@
> + #include <string.h>
> + #include <ctype.h>
> +
> +-#define DO_TEST(mode, nopad, slen, fill, dlen, hash)                    \
> +-  SKIP_BLOCK_IF(mode == 0xDEADBEAF, nopad ? 4 : 5, #mode " not supported")     \
> +-  {                                                                     \
> +-    memset(src, fill, src_len= slen);                                   \
> +-    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT,              \
> +-                    src, src_len, dst, &dst_len,                        \
> +-                    key, sizeof(key), iv, sizeof(iv)) == MY_AES_OK,     \
> +-      "encrypt " #mode " %u %s", src_len, nopad ? "nopad" : "pad");     \
> +-    if (!nopad)                                                         \
> +-      ok (dst_len == my_aes_get_size(mode, src_len), "my_aes_get_size");\
> +-    my_md5(md5, (char*)dst, dst_len);                                   \
> +-    ok(dst_len == dlen && memcmp(md5, hash, sizeof(md5)) == 0, "md5");  \
> +-    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,              \
> +-                    dst, dst_len, ddst, &ddst_len,                      \
> +-                    key, sizeof(key), iv, sizeof(iv)) == MY_AES_OK,     \
> +-       "decrypt " #mode " %u", dst_len);                                \
> +-    ok(ddst_len == src_len && memcmp(src, ddst, src_len) == 0, "memcmp"); \
> ++
> ++/** Test streaming encryption, bytewise update.*/
> ++static int aes_crypt_bytewise(enum my_aes_mode mode, int flags, const unsigned char *src,
> ++                 unsigned int slen, unsigned char *dst, unsigned int *dlen,
> ++                 const unsigned char *key, unsigned int klen,
> ++                 const unsigned char *iv, unsigned int ivlen)
> ++{
> ++  /* Allocate context on odd address on stack, in order to
> ++   catch misalignment errors.*/
> ++  void *ctx= (char *)alloca(MY_AES_CTX_SIZE+1)+1;
> ++
> ++  int res1, res2;
> ++  uint d1= 0, d2;
> ++  uint i;
> ++
> ++  if ((res1= my_aes_crypt_init(ctx, mode, flags, key, klen, iv, ivlen)))
> ++    return res1;
> ++  for (i= 0; i < slen; i++)
> ++  {
> ++    uint tmp_d1=0;
> ++    res1= my_aes_crypt_update(ctx, src+i,1, dst, &tmp_d1);
> ++    if (res1)
> ++      return res1;
> ++    d1+= tmp_d1;
> ++    dst+= tmp_d1;
> ++  }
> ++  res2= my_aes_crypt_finish(ctx, dst, &d2);
> ++  *dlen= d1 + d2;
> ++  return res1 ? res1 : res2;
> ++}
> ++
> ++
> ++#ifndef HAVE_EncryptAes128Ctr
> ++const uint MY_AES_CTR=0xDEADBEAF;
> ++#endif
> ++#ifndef HAVE_EncryptAes128Gcm
> ++const uint MY_AES_GCM=0xDEADBEAF;
> ++#endif
> ++
> ++#define MY_AES_UNSUPPORTED(x)  (x == 0xDEADBEAF)
> ++
> ++static void do_test(uint mode, const char *mode_str, int nopad, uint slen,
> ++                    char fill, size_t dlen, const char *hash)
> ++{
> ++  uchar key[16]= {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6};
> ++  uchar iv[16]= {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7};
> ++  uchar src[1000], dst[1100], dst2[1100], ddst[1000];
> ++  uchar md5[MY_MD5_HASH_SIZE];
> ++  uint src_len, dst_len, dst_len2, ddst_len;
> ++  int result;
> ++
> ++  if (MY_AES_UNSUPPORTED(mode))
> ++  {
> ++    skip(nopad?7:6, "%s not supported", mode_str);
> ++    return;
> ++  }
> ++  memset(src, fill, src_len= slen);
> ++  result= my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT, src, src_len,
> ++                       dst, &dst_len, key, sizeof(key), iv, sizeof(iv));
> ++  ok(result == MY_AES_OK, "encrypt %s %u %s", mode_str, src_len,
> ++     nopad ? "nopad" : "pad");
> ++
> ++  if (nopad)
> ++  {
> ++    result= aes_crypt_bytewise(mode, nopad | ENCRYPTION_FLAG_ENCRYPT, src,
> ++                                src_len, dst2, &dst_len2, key, sizeof(key),
> ++                                iv, sizeof(iv));
> ++    ok(result == MY_AES_OK, "encrypt bytewise %s %u", mode_str, src_len);
> ++    /* Compare with non-bytewise encryption result*/
> ++    ok(dst_len == dst_len2 && memcmp(dst, dst2, dst_len) == 0,
> ++       "memcmp bytewise  %s %u", mode_str, src_len);
> +   }
> ++  else
> ++  {
> ++    int dst_len_real= my_aes_get_size(mode, src_len);
> ++    ok(dst_len_real= dst_len, "my_aes_get_size");
> ++  }
> ++  my_md5(md5, (char *) dst, dst_len);
> ++  ok(dst_len == dlen, "md5 len");
> ++  ok(memcmp(md5, hash, sizeof(md5)) == 0, "md5");
> ++  result= my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,
> ++                       dst, dst_len, ddst, &ddst_len, key, sizeof(key), iv,
> ++                       sizeof(iv));
> ++
> ++  ok(result == MY_AES_OK, "decrypt %s %u", mode_str, dst_len);
> ++  ok(ddst_len == src_len && memcmp(src, ddst, src_len) == 0, "memcmp");
> ++}
> +
> +-#define DO_TEST_P(M,S,F,D,H) DO_TEST(M,0,S,F,D,H)
> +-#define DO_TEST_N(M,S,F,D,H) DO_TEST(M,ENCRYPTION_FLAG_NOPAD,S,F,D,H)
> ++#define DO_TEST_P(M, S, F, D, H) do_test(M, #M, 0, S, F, D, H)
> ++#define DO_TEST_N(M, S, F, D, H) do_test(M, #M, ENCRYPTION_FLAG_NOPAD, S, F, D, H)
> +
> + /* useful macro for debugging */
> + #define PRINT_MD5()                                     \
> +@@ -53,25 +122,15 @@
> +     printf("\"\n");                                     \
> +   } while(0);
> +
> +-#ifndef HAVE_EncryptAes128Ctr
> +-const uint MY_AES_CTR=0xDEADBEAF;
> +-#endif
> +-#ifndef HAVE_EncryptAes128Gcm
> +-const uint MY_AES_GCM=0xDEADBEAF;
> +-#endif
> +
> + int
> + main(int argc __attribute__((unused)),char *argv[])
> + {
> +-  uchar key[16]= {1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6};
> +-  uchar iv[16]=  {2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7};
> +-  uchar src[1000], dst[1100], ddst[1000];
> +-  uchar md5[MY_MD5_HASH_SIZE];
> +-  uint src_len, dst_len, ddst_len;
> +
> +   MY_INIT(argv[0]);
> +
> +-  plan(87);
> ++  plan(122);
> ++
> +   DO_TEST_P(MY_AES_ECB, 200, '.', 208, "\xd8\x73\x8e\x3a\xbc\x66\x99\x13\x7f\x90\x23\x52\xee\x97\x6f\x9a");
> +   DO_TEST_P(MY_AES_ECB, 128, '?', 144, "\x19\x58\x33\x85\x4c\xaa\x7f\x06\xd1\xb2\xec\xd7\xb7\x6a\xa9\x5b");
> +   DO_TEST_P(MY_AES_CBC, 159, '%', 160, "\x4b\x03\x18\x3d\xf1\xa7\xcd\xa1\x46\xb3\xc6\x8a\x92\xc0\x0f\xc9");
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
> index 8667417b12..c800c4c56c 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
> @@ -2,7 +2,7 @@ require mariadb.inc
> 
>   inherit qemu
> 
> -DEPENDS += "qemu-native bison-native boost libpcre2 curl openssl ncurses \
> +DEPENDS += "qemu-native bison-native boost libpcre2 curl ncurses \
>               zlib libaio libedit libevent libxml2 gnutls fmt lzo"
> 
>   PROVIDES += "mysql5 libmysqlclient"
> --
> 2.35.1
> 

