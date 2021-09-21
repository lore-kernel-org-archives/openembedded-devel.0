Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.4380.1632259589838190676
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 14:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XQxHYKN5;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4898774542=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LLCgCE005794
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 14:26:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Z8/c5+HVV23shDEKtM2xgElnaZ4rnVbK9Xo+Kl2PWX8=;
 b=XQxHYKN57+QQnp0xvmdvxJ4Js0GtGaBDtgPKPJt4bbVf3y3T/ZQtoI9ja//oEwooPIZ3
 bmny08ey2xO1yEeytCQ7H02rPLgKpouO0mzq+4+pMI2CmT/cgEsYnbJhgCgQYcSDHJnK
 aatXGn5cJv00uKqX6mCh71FN4paNHMHgwmHZpjwPZEUhrU5x2VviWwjvwGS6iWlfpwsf
 oYFR9MlZkWVcz7nkF4j94kaDxuUwguPKxleFTBgWrnf2m2HBzn2Z4OECGz/UiZrgR0J9
 uSYSM3nqGWPqo2/VXMj8KvUsMjUW4StzNACbOfMTSw5nA3gI286Q8mWfXofCaHEO+ZV/ JQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b7q3k007v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 14:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNHcJhpjEC+xB4/AVSI1TdB0kRmUZ5YGz+diBineJE0ZxwtR/RhRcm5NNd8vZgqSHwKIVFfvAmX2RO75Do9DZ4WDoa7EyslUasNBfabyhb3lW2kN+iS5qjmvpHmwbJzxB7etfu1h94WgFzEShSH989G5gkNtzUYvc/0GoK8iDP8gT0pfDvCThPbd54v81fAiKVDYzMLI9SauBTaDadGGt9dLeGl981gNs6H9mrDQcr0JH6bNaiZksopmQqJT3fyttVnjnM5iOhs6sjo9rBFcl4NncLwmUhDjAkKckiPvLsJC+7ZaRaCKBTqKbOE2Q420rVv/wAds8hcmQuI3fTj6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Z8/c5+HVV23shDEKtM2xgElnaZ4rnVbK9Xo+Kl2PWX8=;
 b=Wql5oeQjhKN5LOLyJ5ZwOlQpSZVhGKFbydXD5FO3ZzozzMhbC8PK0QKGGWQVW1nFtFZzRyilo7HxnRGBKg8t/aER9C86aH/VHthGpYZpE9hp4sgSlnd67z1Wxi1otb1atPmoDSaImlxK/6gZC6jWBlprl6mvfY7EzUrAbRBKvzaQqatt6gN9jdyGQy61cA1SmuYWoLICAMLyiMbM2POFUUIouUT1ixtvVSpfut0FYapK9qIfmKzKH+UQGP78AbOcq2WnYTgp21dXEYVrk8SexmdUs41t4xQz7IxpbVZ+d6rmdh15cIVOpU8gIGV8orE6DuPNVTlcLZhZBd6uIrGMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 21:26:27 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e119:f175:fff0:b3b4%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 21:26:27 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH] gd: upgrade 2.3.2 -> 2.3.3
To: Sakib Sajal <sakib.sajal@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20210921200820.8490-1-sakib.sajal@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <f55d4edf-2390-31f8-200e-263c39293159@windriver.com>
Date: Tue, 21 Sep 2021 17:26:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921200820.8490-1-sakib.sajal@windriver.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by BY3PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:39a::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 21:26:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff82261-2316-4946-cff7-08d97d467849
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3994830422B15FA4ADF22FCDF8A19@DM6PR11MB3994.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZBkl/D57dVY3FdYawYAdQItyk49KI5mQupslduZRpKgFXU8MoY7ECeZyBEbqgdQj7j27s7LagSW1WFbuV83PSrTZ/+8f68CAo+XJ6LDUSqJm5Uwh1Ve5IxvmUNob3A0kIGmCB7YWM4UcfIyaNCzrR8d93b2EbTuC0AazZqYYnP7DKkv4IiVbGc8Bb7kBsglys9jiMFrA0gYsUdF2blX2phemqEXfHUFIQzQpCvAJMRg24JtQ7GEyFPDP3DSSKBZ8ISwXPeY6OoTZg+ShuDzpQwngHnOYpWOeGt4N2dNRXJ46Thqa/HFp1rakIAHCVd90LNncPViwTYV9QV7uzNXbiLzXCSO6/awwAVDRJ21mBmwrEC2MHCUUH+i49AFrQR/vACiDgdLxXIq8k9Fa/0X/ptPy9UO/phlpaArAoZXGcSVcIT615KYaHCa9hsjS1zeBhhulthCXzN42ncWeSk4h0l8KxFVyK15p70lCmsMOfUXY0ZbBADiE/vEqUxuThkmrufHqRgdu6XG71KCKyYSB7cmx+b/xwRnZeMAaMdiYEyZIwrC7N00Z5tSYYAckGPz5jqfOjwM6zp1Dpd/a2qD8Rv75GmQuPaD36oLz+fAzb/F491DvsjAo4DUCpGRNXzb48mnc/GirkxT24YOv35SWlRVHeDDHqyZ5NhmF3w0RoiWGGeTOxyPLygGrlXICYcWsRGWsJQg4D/MrOHfKjMySgtkXN2fn6BIHUm9V429SJHA6dn013+1uZT9ogytko3MSD3rq0TQ2brscvgcBIfGEqTU1KgtDVl807pDNRbZbBRTUl3a0usUZ66+maNWFA45IOkQO7TExqKQZuFx1oyzUeVsmCNtl4TXmJZKsd9IrMMixMoG8ZUzra/mM3x053bA2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(2616005)(956004)(8676002)(86362001)(6486002)(966005)(2906002)(5660300002)(8936002)(31686004)(6666004)(26005)(38350700002)(16576012)(53546011)(316002)(38100700002)(66946007)(508600001)(66556008)(66476007)(36756003)(186003)(52116002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFZtdnZrVll4T29GSW9GRFI4MTlpcHNFUmhGOUhRV1hrUnhZK2drak5iU0g3?=
 =?utf-8?B?aWVuTHlTSFRPZ2Q4eXg1WUorSlczQ2wzYWxOWmdJcFdMcnVRMEtncW00UE51?=
 =?utf-8?B?TGpOMTZlNGVlMUdwUGRHNjBTc01UVCtYSmtmKzBXb1VLUGx2NVUzaGVER2hC?=
 =?utf-8?B?T0dpZEI0ZTM2cFNQRHlQRDZrQkY5RmpTem5PaGtucEt3NzRzMDN4Mkt2dXBR?=
 =?utf-8?B?SEREZk1jTDlwMzhFeU5qb2FNK0VmcFNOWUxnM0Y3QjBIeElTZDl2UzZ0cjlv?=
 =?utf-8?B?MXA3TlVXSnRyQ1ZXRUxOaSswNTlka3JRdjlCVGRZRnV2TDdGVWZhOGVJOHlW?=
 =?utf-8?B?OXN1Z2FranRaQUxmbGFXdWVwUkpkUDJzaU44QUhsdnNJWEczWWVZcUxLd0dW?=
 =?utf-8?B?WFVHVk9JMEd4b2x5L3Q3SVBNNmgwZ0psVFdnb1FBVzFPNWE0MnhUOFBMQTl2?=
 =?utf-8?B?KzN1NDlqVkpneUF5ampDT0taY2ErWFVRdDA4MkpNWXNpdjkraGVrZzNIT1gx?=
 =?utf-8?B?Y3U1OW1pWk9KdS9CMUZNNUVJNmM1clh4Z0ZWeXhYNUtVSmRzNitOdEkrUXpW?=
 =?utf-8?B?bmlIeTZjWk9JOXA2a2JGdTVpWC9BTVhXd2VSYm1Wb2FDeEY1b3BoYlM1STl6?=
 =?utf-8?B?dE92b2JIcWFTMzlMSU52WmFnQ0NXSWtxQjZpUnpKeHBDZk55U3IyR0JDSjV5?=
 =?utf-8?B?ajZsa0FlMFhrSG0wNy91Y1RkOVVMdVZ4eHQ5SVhJMGE1OTZUN2w4M0VLNk9K?=
 =?utf-8?B?UzVOVFkzQWxXT0IrdUswTWR0R0s3b2tGelZIcDgvT1AzdEkxYnk5RFB2c3Ba?=
 =?utf-8?B?emZqTjNrVjBSUlZhMnBLcHQwN21qTWxvL0NyTk5lODF0cFJpd0gzSm1pdVZa?=
 =?utf-8?B?ZFhsU3ZrMUxnTHdEbVl6NGhsUTBvVUE1RXpzanRVVjZHZkNlMFQ2ZS9RS1BQ?=
 =?utf-8?B?c3hCK1dSYjE1WTlYN1BFTDNVYjRpRU5IdkhGdjhsT0JFL3FBaGhJdG5VbW1h?=
 =?utf-8?B?cGxoWElxU1BtZ3BqZDZGb2pKcEk5TTBnSGdLOHVnbUloYzJrRktJSmxwc3BP?=
 =?utf-8?B?WFhUaUZ1OTRYaVJsQzVicmh4aXZValNQY3R6OHFuTnA0UlYxbFc0djZVSUtW?=
 =?utf-8?B?UWlaeUhMWEhUdzJOMkdmQjltNEViLyt0WmRvZUd6YlM5dUpVZGMxcndTSGtQ?=
 =?utf-8?B?Q2Y5NS9VZmt1NjFwenNhMjJpWk5nTkJvYnlybnJwTk5ZWnJYQ2JJTERqNnB0?=
 =?utf-8?B?b2xpOStOdDRsS2N1Mk5FTytzVzZBRTRtSTlGejBFUkJQRDdGSGREcVlxRkdt?=
 =?utf-8?B?eWthTmRvaE9ZODZxUnNTL1grRCtWQ21GclBZUUZNSkdDL2RxUXpDYmJGdzdH?=
 =?utf-8?B?VTlwYW5rYTYrUTIzRERyRkpBNEE4SjFpNFFhbkV6TDBTRFFRU2pObmxwakhZ?=
 =?utf-8?B?c1R5M1hra2FPdFF6WURneElLZjVKeEEvSGU4RkhLOUUwUWd1TEJkaFYrMDUy?=
 =?utf-8?B?WjRmQnRiVnlkWVY1WHpTWi9KZXJrdlJHelhnalZ6cE02VE5GTlRTcVo1eDZx?=
 =?utf-8?B?UGgxb005cjczaTlxVTdWam96VExPcHdSWjRvUEdvQTNLeWNxSGY1UEVtQW5u?=
 =?utf-8?B?eUdMSnpqOERhckpiTVRIcUU5YmFHbEFjOW0wZllodXNIeFN0NW9kc0ZMVmhr?=
 =?utf-8?B?TEhIcHdpMGVmbHZMREhzeEFDWTVqSFBHeWJZUnhiYlhBaGVnNmpiM09jeUVi?=
 =?utf-8?Q?jMySx+1Kg8e91RI1Q4lh18zwiQiXnhi6lYKSNJC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff82261-2316-4946-cff7-08d97d467849
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 21:26:27.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwHSP22YWHpD2WK9ewSJKLwaV3u5qwm+3aroLg2PhcuzAbEs8bagkO2rYnqPB/cMU6BT0/iQqKf9vKnp9pUdrPbhtdop8DT2rZ1AIuy5JzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3994
X-Proofpoint-ORIG-GUID: a1mT1AD8L92THgoWRB2Gj3QDzSnDb_Ds
X-Proofpoint-GUID: a1mT1AD8L92THgoWRB2Gj3QDzSnDb_Ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_06,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 clxscore=1011 mlxscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109210125
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-09-21 4:08 p.m., Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   ...-of-bands-in-reading-tga-header-file.patch | 33 -------------------
>   .../gd/{gd_2.3.2.bb => gd_2.3.3.bb}           |  7 ++--

Wow, that's lots of changes:

$ git log --oneline gd-2.3.2..gd-2.3.3 | wc -l

416


but it does seem to be bug fixes since
1. upstream maintains per release branches and
2. on: 	https://github.com/libgd/libgd upstream devs say:
      GD 2.3 (Branch GD-2.3) serie is in active support for bug fixes.
      No new additions will be added.

3. a quick review suggests that these are all bug fixes
    https://github.com/libgd/libgd/commits/GD-2.3

$ git diff gd-2.3.2..gd-2.3.3 | diffstat | tail -1

  111 files changed, 2495 insertions(+), 2638 deletions(-)


Looking only at the src changes:
$ git diff gd-2.3.2..gd-2.3.3 src | diffstat | tail -1

  36 files changed, 738 insertions(+), 577 deletions(-)


A quick review of the first 10 commits suggests that these changes
are ABI comptible.

So looks good to me.

../Randy


>   2 files changed, 3 insertions(+), 37 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
>   rename meta-oe/recipes-support/gd/{gd_2.3.2.bb => gd_2.3.3.bb} (84%)
> 
> diff --git a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
> deleted file mode 100644
> index 649b9b744..000000000
> --- a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
> -From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
> -Date: Mon, 19 Jul 2021 10:07:13 +0430
> -Subject: [PATCH] fix read out-of-bands in reading tga header file
> -
> -CVE: CVE-2021-38115
> -Upstream-Status: Backport [8b111b2b4a4842179be66db68d84dda91a246032]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/gd_tga.c | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/gd_tga.c b/src/gd_tga.c
> -index cae9428..286febb 100644
> ---- a/src/gd_tga.c
> -+++ b/src/gd_tga.c
> -@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
> - 			return -1;
> - 		}
> -
> --		gdGetBuf(tga->ident, tga->identsize, ctx);
> -+		
> -+		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
> -+			gd_error("fail to read header ident");
> -+			return -1;
> -+		}
> - 	}
> -
> - 	return 1;
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/gd/gd_2.3.2.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
> similarity index 84%
> rename from meta-oe/recipes-support/gd/gd_2.3.2.bb
> rename to meta-oe/recipes-support/gd/gd_2.3.3.bb
> index 557b45dc4..e129dc5a9 100644
> --- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
> @@ -9,15 +9,14 @@ HOMEPAGE = "http://libgd.github.io/"
>   
>   SECTION = "libs"
>   LICENSE = "GD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ace63adfdac78400fc30fa22ee9c1bb1"
>   
>   DEPENDS = "freetype libpng jpeg zlib tiff"
>   
> -SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
> -           file://0001-fix-read-out-of-bands-in-reading-tga-header-file.patch \
> +SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1\
>             "
>   
> -SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
> +SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
