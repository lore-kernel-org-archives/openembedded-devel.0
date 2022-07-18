Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB91BC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 01:22:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.22237.1658107375762764810
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N/5OfP01;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4198530481=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26I1CCp1004494
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=53lZ7kYa144fwFU/0bElDJUunF2hlyOxnIYPo/+o27E=;
 b=N/5OfP01F5N9wtyd9YOuGFH1OvzgnrXsJ0uzX/c9V6S/uybZ39AojCa7OiZKl2fVKGeD
 184jQP0LQQtjCxRd3Kmw/xehrQsvxnNd1YYliSoeq4+GjggwjWru5MYzrMRMeThrL5DG
 i/hoXqWeQx6nKBPx13nF8TGqi51e+1RIJqesE+vDYvvwr3nzEwbL0ep+fAB7L+h+UZA1
 1FMRDZZkekFFHqOBzvIp0IgWt3iOqUXVQ/yHP4lt+9uJl7ogtgHQ4SN0iJXrIqHc71E2
 jZkvpruAAKBOc47HOiRHk8/dPcrIb1hw1AQYpPh0t6cqpRIvVtrDw9zDpGf+O7JtdoFZ 9Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvukrths-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:55 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26I1MsWb025051
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jul 2022 18:22:54 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvukrthp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Jul 2022 18:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR9dz0CpNwrSMadjNXW3ZdcGn2GZAbCkilr7+lGo7ZAOz8s410/9JFvFtPOYBWbm2GgJvWtcUf08NalUFqRkqDiT6e9v6Bnw8nebchVE9cxnOmykpIGcSbq9oU/7LqpOdvH54YYkpsCrdTYZlkN+ktZ71ZxaF0VFWEc9nTfP4brD9DUlctu1wjbIavBR/bLbrCL29sbfKYqGSWn55WI62xWR6SG3YprEay8A/LvWAmCAemKCUy5DiR0WpxpqfjIHoAIW3UI8/Vilr400NfvWW7XPA6OlI0eWQFBbinl+wekY3EjzomAxdsDLhpnBslGl91h0+Pu39u4Ht4pbOZeEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53lZ7kYa144fwFU/0bElDJUunF2hlyOxnIYPo/+o27E=;
 b=jQfXkXwLy2RpF6NuyrF2yFqmv428FVYzXGAwFRv2raojuqZjfwnOiZE+3K/aU6vwuNLDA5cY1hrnAoqFuWTFqFLP342E9MxjAZTUldWY3qY++uWM2Kw64Qrvg286EvhumyiPkkoH3J4FWVW9F+h0EeNHb4KpGLUS9NS5pNkfZiCp7N7vaRobiPDXV1ZeBMdjoYLqgf47j8tbj0XJn8mhCCS+O5eOgjeBDDyw0gv5hXG/RYhS5Rk6yisKwIvjXRq8qLMg3L3wnFj/QKkD2XOvPkXIlcNOlmZgACVgJkGYHk5XF4224xjz1x0RK+GEOQSlisCvjAHusLoankAa1zuizw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 01:22:53 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b15a:47d5:1944:4a86%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 01:22:53 +0000
Subject: Re: [oe] [kirkstone][PATCH] zabbix: upgrade 5.2.6 -> 5.4.12
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
References: <16FCF2B9C368B89A.28546@lists.openembedded.org>
Message-ID: <a21b36d0-0783-a41a-4cf7-527ca1c93a1c@windriver.com>
Date: Mon, 18 Jul 2022 09:22:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16FCF2B9C368B89A.28546@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------8AF101A9E00E470C3F97FEED"
Content-Language: en-US
X-ClientProxiedBy: SG2PR01CA0148.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::28) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2209dc0c-9353-450e-e029-08da685c0932
X-MS-TrafficTypeDiagnostic: PH0PR11MB4967:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	64BqjpqgxWwp3pnmoh7v2gmvcWmAA46og86u7qFw7Pt5gADZOKigWH8RPDQidTQCQxiG71bCR3OEdLh3Uo4SE23/6FhcItstbXzl8kWTTxuHct5cqi3R7zXl/Lsj3AfSWwoiolEFp5Z+dP728OuV3cSfmrALEkIslK5Vs1jXQVJ+5YfLngGKkIW1SEHUhdTxR33PfoNlVfIIWIJ13wF147ZqPX3Knk1NtbbSRzXqyR/c9bMzTw0UINarfXuy4qvhEeoB1wr+v5XfzfyEzXXqK+kdvvcN3f+ty58VQsxRs+Lbm/L6I6+51sIj9gegpTjoUOyU8YY5I3olPgrBN69og4JVTbs2fYDmHCPRjIscO9B4iwYpMK6dFJAXch4G+w7VgPZOzuBnyY99SpQfwM3Svb0SFdBAE1fvgX4Zf6FI9uneVZVSsnXNkkX+k3TorauGB19jUsbyAKKKuDoR9PuVKkFNJJfPoBbjrCQdzGjwbi9sIcXUESf22YebKhEx3RKEPByvPrEgLjXvlzKojZugbQ1w323vTCBOCkVLIb3wt2kQAlI/zhjU4tqSCP0xoQrgLLybB4g6PTygT8sEW8TKDHQ1WwJizWMNAjY6b0+/MIvuGZmNenxyw6nWbMXF5NY7hMbHetxxZBbnRonIAaKsWUXgn3t0nBHefIahE7KIn98Iq2HcGgJuR4Ld/tbKCd7WGeIhqLeFr8Ik4HMxF3sPR+XGpMAZylv8QYp+Usa0K324TVUeqp10v9XUodU4y1MKGjojnLMpqUTaisOEPbxyXQTPek5QkhVofDHKgyjE1nMulfP0oa1mf2dH1LxAsjRujE16ywkd/6b6wYynHvCoedynG6JyfnK1arXyxafe2u0GV0Gcu9368pfJNTUzthBkU08L3F0wsEquox1RpePdLNlfyyCTUzd+UMFYjoFKB739cpIDfraGeucGRXqpLnVu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39830400003)(366004)(8936002)(44832011)(5660300002)(8676002)(66476007)(66556008)(66946007)(2906002)(36756003)(31696002)(38100700002)(38350700002)(2616005)(166002)(6486002)(966005)(41300700001)(478600001)(6666004)(316002)(6916009)(186003)(83380400001)(53546011)(6506007)(52116002)(26005)(6512007)(33964004)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmJjbUJBY0IzVHZ2RFhLUHBIVFFxNWtOQ2dtK1dZdS9xK2J4MXZPbm9PaWls?=
 =?utf-8?B?dGRlcDFnNmVvZE50WlhGMGdXa1JVazJsdXdJajVIMjlhSzB3Y3JRdDVRcTZJ?=
 =?utf-8?B?RFhYZERLbTNNcUs1UlA5WVlQdnZqUkdNQlRQSlJ3eEtPS283cGR1c2lsWkxo?=
 =?utf-8?B?cy94YzZTNktwcjE5bXUwV0JzbC9jRlZudjF3LzhJN2hIRUV1b1RoVFdQR3Rz?=
 =?utf-8?B?Mkt1QWFUOW9wWkZnQnVGTnNCN0FIRDJ2V2ZFVmZhV1oyWnYva0ZGMDRnanNr?=
 =?utf-8?B?UW0xc1VXS1JDUDVOcGU4aVB3UVgybjZZeXBRT08rZDc0dmUvUGxTTG1xcThL?=
 =?utf-8?B?YnRqYkVyY2dTelVnVjBvVUZNT3VDcWlISTlHa0FXMXRCL1FHL2NuRlY5blc1?=
 =?utf-8?B?RnE2RnZVSFl2RjF1eDRBMjBzcVdidWNGQ2hoWHJYS1cyalEwNVNzNWlPeGRt?=
 =?utf-8?B?emJOSUVHZUc5ZVB2NGY1VEFNN1RlbXp6M0wwc3pRczUzNXo4WldkK0djSjR4?=
 =?utf-8?B?WTVHTDgxV0dicHhkZjZxUi9mblFuK3NWZUNHTTZCUXhRdmNMUGU2WFBYMlYy?=
 =?utf-8?B?TEhKK1loV21UZ2pjMllLeC8vTElGdEUzUk0wclJ2Z05jazBiWDdJeVlJUVJP?=
 =?utf-8?B?UU4reEIvZ3dDMnBySitPZlJXQWdYTkxzZCtMaVdjYVhvd0wzVjlnNTN5YzBq?=
 =?utf-8?B?NDhFVGlVT0xISDRuVS81NFdiZlNpcHJMd1hnYjUzM2FxV25DSGlHM1FiRlVy?=
 =?utf-8?B?S01vUnEvS3pjakppSUVaM2pmSmRiMUJvWm9BQThZOVk1dERHMjVYNm5OWUlH?=
 =?utf-8?B?MVdzL1Rjdi9WbmdIK2JMVjVoY3VoNTYzUDZUOVVrMSt6SXhySUlucEltWm8x?=
 =?utf-8?B?MTdzRC9vYnc5VHE2Myt0OGY3TEtPQWlKL21JOW5iMDltNWUyY2wyOHNMbXhi?=
 =?utf-8?B?YmtMYit3WUxSN2lsOE5MVTZaNCtENzQyY1dUZytweVVnN0RTRm1sQjIwZE5X?=
 =?utf-8?B?ZlhCcVlGdFoxQS9PcG0xeWNPemVhRCs2QTQrNFliRzJNWkJRNnU5aEpaNS83?=
 =?utf-8?B?SWpyclRNWUxxcGpwNmd5YTBuMXdHaHpoNnlLQm9Sc01wYms5LzZUMmdSbVdN?=
 =?utf-8?B?QmJOZnhqcGlGOWNVUUtIbXRUY2hzRkdzTVBmSE9IcFI4c0lrOHYrZG9NQldE?=
 =?utf-8?B?MzZxdmtkdlFTOFk4SS8xcVhUT0xVMGpNZzQ0YmFNYjRQQXVFTTRiVm1iOUdX?=
 =?utf-8?B?WGl2N2JmRDBIK0hMV1FoL0xQUWxtcS9ydjE3UnE2bGpyZXhCR05EcDdEUjhZ?=
 =?utf-8?B?SHdzTGphSm1VaFlQczJsOVdxRFRKSWdGb24xV2VoME1SS2xYYW41ZDNLTkJx?=
 =?utf-8?B?WGhtRE5KeXBkNHRYTEp0U2VhUEg1blhoQ3lDeG1BZmhsZ0cxVERKQ2pFbk1C?=
 =?utf-8?B?aDVBc0trN0RXd21USmxwcm9xVGRsMXAwRlBxczkrcTZUYWltSWJvbUx4cmpt?=
 =?utf-8?B?WDRiMUtnb20vWmFiUHR5L3ZJaW10MHlhLytzMzI2Y3VBM1pZaG4yWU1pM2ZI?=
 =?utf-8?B?b2N2cXoyQ090cWRVMTVjaC9xWE5jaG0xbU5XUXh1OFI1NFRTdFhKQVNpUkEx?=
 =?utf-8?B?T1JPanpkQnhNYy9Zak16MS9VUlNpamZXdmVvYU1rbEIrQkh1R2RtSlVvaVFQ?=
 =?utf-8?B?UktiaVlQaytKcTd2Vzg2YjJROHhSNEF6K2dKbHVHOW9NWTRmUFMvMitRdzFV?=
 =?utf-8?B?RGJMTXNQbG11cEtTeFJCbWZoQU5PWDV0OWltN0tIN1U3S2tjNThOcXpha3Qz?=
 =?utf-8?B?WjJFbnpGbkZXTmNqYk1SNVk2Y1VON21DaW5vNzJUQllHc2gxUXZ3ZktOa3Bx?=
 =?utf-8?B?bnhtckFGU2cwRU9wZFpRcUxiaEVLYzBWZlRIL2JzdjRKY0lGKzUza2swTVEr?=
 =?utf-8?B?cmpFYmE0Qk1FOGZGQnVxMzRObnBlWFo1N2FrREVaQi9yUkRjUDZFeWdDckUv?=
 =?utf-8?B?V3U1RnRjUklrZlQrUFNhSzRvdkJCWW1QeEZHVTdiUmgrczRZUUl6WVBKR2Rk?=
 =?utf-8?B?UzZWS1BJOG9uNEFsNjcrSjI3RWtBcytIb0pVaHIyWnMxQnZsdDlpWHJOa0VQ?=
 =?utf-8?B?QXgrVXRITkhIOVJkNkdpaTZOL3l6dlEzbUVTYnZNOWRtYWxGS0dhRDJsK1NV?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2209dc0c-9353-450e-e029-08da685c0932
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 01:22:52.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3ZqGJKmeKFDDKh+uWPkqVsqgUWZZ/mBjDY60YS6FsPgv44YTrb/qA3sUjJ+LP3rVunGxGTJ38x+j2UISA+DpS7UITiu2PZJ/oVOyTsbfVjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
X-Proofpoint-GUID: 6KBxQUxGHadAk-Uh9o2v-nRvl11vDqlx
X-Proofpoint-ORIG-GUID: LmSMSHEcLZU_oxyN9iKWcZnepVEDYl4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_01,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=911 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 01:22:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97865

--------------8AF101A9E00E470C3F97FEED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 6/29/22 9:20 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> This upgrade CVE fix:
> CVE-2022-24349
> CVE-2022-24917
> CVE-2022-24918
> CVE-2022-24919
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../zabbix/{zabbix_5.2.6.bb => zabbix_5.4.12.bb}            | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.6.bb => zabbix_5.4.12.bb} (92%)
>
> diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
> similarity index 92%
> rename from meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
> rename to meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
> index 66c80758c..f5d89d6c3 100644
> --- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
> +++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
> @@ -23,13 +23,13 @@ DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz \
> +SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz \
>       file://0001-Fix-configure.ac.patch \
>       file://zabbix-agent.service \
>   "
>   
> -SRC_URI[md5sum] = "31dab3535a1fa212f5724902727f6d4d"
> -SRC_URI[sha256sum] = "76cb704f2a04fbc87bb3eff44fa71339c355d467f7bbd8fb53f8927c760e1680"
> +SRC_URI[md5sum] = "f295fd2df86143d72f6ff26e47d9e39e"
> +SRC_URI[sha256sum] = "d60d5515807c30c05d0900b83a7e6ef6479929aef7d6f248fba481c4816bacf4"
>   
>   inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97615): https://lists.openembedded.org/g/openembedded-devel/message/97615
> Mute This Topic: https://lists.openembedded.org/mt/92057318/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------8AF101A9E00E470C3F97FEED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 6/29/22 9:20 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16FCF2B9C368B89A.28546@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

This upgrade CVE fix:
CVE-2022-24349
CVE-2022-24917
CVE-2022-24918
CVE-2022-24919

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../zabbix/{zabbix_5.2.6.bb =&gt; zabbix_5.4.12.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.6.bb =&gt; zabbix_5.4.12.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index 66c80758c..f5d89d6c3 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -23,13 +23,13 @@ DEPENDS  = &quot;libevent libpcre openldap virtual/libiconv zlib&quot;
 
 PACKAGE_ARCH = &quot;${MACHINE_ARCH}&quot;
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz\+SRC_URI=">&quot;https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz \
+SRC_URI = &quot;</a>https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 &quot;
 
-SRC_URI[md5sum] = &quot;31dab3535a1fa212f5724902727f6d4d&quot;
-SRC_URI[sha256sum] = &quot;76cb704f2a04fbc87bb3eff44fa71339c355d467f7bbd8fb53f8927c760e1680&quot;
+SRC_URI[md5sum] = &quot;f295fd2df86143d72f6ff26e47d9e39e&quot;
+SRC_URI[sha256sum] = &quot;d60d5515807c30c05d0900b83a7e6ef6479929aef7d6f248fba481c4816bacf4&quot;
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#97615): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/97615">https://lists.openembedded.org/g/openembedded-devel/message/97615</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/92057318/3616873">https://lists.openembedded.org/mt/92057318/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------8AF101A9E00E470C3F97FEED--

