Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.19532.1621838176663917892
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 23:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fQaEs6Jo;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0778862490=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14O6YUnR017435
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 06:36:16 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 38qk95rgee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 06:36:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP8j8RzpXO3C2GnzyMYEA/Fw7tMVIgJW2ttKTPAH03J9idUr68DwRdqFfZGYD4K0rx/uPdg4vN0gTKrfBCfXHBaOahW38rLmWSQhg9OeHikweMkbo8wHjpUh0JP1/b3cECmlLguRm84sixIEpqQydVNWoq3smPey8f8wJ34e9JNcMnoYz/6YWQGHc0Pq6VMnIOE4XGANn4/+VO64Njbew4N+DJHmwUzu8JTUxXnYOT934z4fSymVpkamrKvol07E+DobL6WnGlk4bFQb7EZmxiSYQRW/L/LUFEjs4rXbXSJQSskiESRMZiGfK6lZs2Yeda6vwt1fEcHg7/RyapegeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scsRjmZlKj0BMTOSt2fo2rPqYk5mij/dLtkaxGAiBCQ=;
 b=C2cPCe722/Qi440YYA6zh+lScFx+tFoew1hEi4rwlKKXVo/QicaoqUFPj6EPnzsfezyIMjIKrxDADGpz3vKh9g4BhApTLjh6UmJw6nSseSkauBryIcZFoAWujABHQWXVYiDG6hIXHNsCsLRA5dLeX9qnMvndIrt/zqwTmcUexOAtOoFkEQuxXcpvTAk9MqSqQDvnhav8KzQ0O8TEAPtAPq4a/Usm/K4ouEEbxGYem6bYLIPiwTqGmb/vZm61+O80jR/7EjKCEhGJ8aSN88z3CWLGNFnX3QNDQkgIZPjYLhqEAM7afEd97rLQ204/z7pMXxwlFqtgxINrj7IPzY4hOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scsRjmZlKj0BMTOSt2fo2rPqYk5mij/dLtkaxGAiBCQ=;
 b=fQaEs6JoYU7lNYVnn1Jxfdo6GmqxOLEbF6teoBx/+oMITMDSNPXwNlV5VlwNwNCcsfmrh0vu+QJgfECHBaLLZ0iMoVnljOdq+kv1DHR1EMPbD1R9+3/iPMpUgggYTFMANBd2FNCktag6qEZrxdK//YOkYNvK3siEDtF9q8BK/ZM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 06:36:11 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 06:36:11 +0000
Subject: Re: [oe] [meta-networking][PATCH] dhcp-relay: add recipe
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <167FC4DDC2069D52.24037@lists.openembedded.org>
Message-ID: <931b389f-1994-22ef-2eba-d20dbf6ff8b4@windriver.com>
Date: Mon, 24 May 2021 14:36:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <167FC4DDC2069D52.24037@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:203:c8::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HKAPR03CA0006.apcprd03.prod.outlook.com (2603:1096:203:c8::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Mon, 24 May 2021 06:36:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 215daacf-6a62-4b9e-210d-08d91e7e3841
X-MS-TrafficTypeDiagnostic: CO1PR11MB4802:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB480245F50101BCA28452C0AAF9269@CO1PR11MB4802.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ae7My+c/df1FXoeTpT49Stp9wb0LLV1urbNtrI1jvkvqkf3uaqWnFbn/vpPwRlFfDmpAlLmJqGaP9JygMpr6yzIjL3t5dfKU+nZG6o9/HOwoxo3ptP0GiZYZCtdwmubPADSc6ZLCvcZiMwiJGIGKTFkU4fnSLRpQpSJdLj5EifKfppmQkzghjYp6/izS8pVTC3ZC4WDw8ZicxOLyLlOyoh0F67J3qXuEIJqEUUTJuC06M/c0ggvM9dIiG/odysFFW8E9BtG9tv3hBne+Cmgf5KxXxDzizUAqswYGOMkbE0aJ064dQN5ryymq1lXT6t95wAtUPe/xyIeqjoZOBIMzCYg7oreo7bnGShOEXbUtp/TGr1AtBmZgiExA5LbzaPfQbgoW1eeHh+e5gOvAv3cUzgtJLVg8i/uwEqET+0CHMhoecDsDHUP0tDiOzDUERLV7cpJj/fGGvLuA/Wri9zaUKVXXTerQzcvFfnCWASDASAo8Xs5OyuyMidH7waL1O2ZBoFx9zH2dR9dWeXCTzN767bbi3MYugJP3OAVCsJd+N+sZlVF0xHvpXCzZ73MzW6ALmbZGfbdAbYdv+J+NzWAlcmuN8ax552fnkZg4cgX2Ul+8Ddo8U9OMSsFDvcoXCThNLAckiN9lSuZu4nVB2xLp6BZdMs7pItnkAEHgM4L5hn61QZehTDYdQWPFimh/w/Dsd4vfnOq/xMLPAHmMmgwcFIbZpNIU7MLv4Y93b9HfEkJo2eykCZlSf4CIi56neLZLmTD5Zmffvlv7hG0FZQhnroUoGGVsJ6ohKQAzgNuQ1mqpnmr/s+GTN5tFvh7CMJm4wHOtub3jhhdbhrIBnSy2FnRW42gRQabkMp0T2t700F0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(366004)(396003)(346002)(136003)(33964004)(8936002)(31686004)(53546011)(52116002)(6666004)(166002)(5660300002)(2906002)(6916009)(66556008)(66476007)(66946007)(36756003)(83380400001)(8676002)(66574015)(6706004)(44832011)(956004)(186003)(26005)(16526019)(30864003)(316002)(966005)(38100700002)(38350700002)(6486002)(86362001)(2616005)(478600001)(16576012)(31696002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WUVkTmdlaGpnV1hFUjNZbkJMbldSRklTSXVtZlNLRHdDeTgvZVVwSDNOZGc4?=
 =?utf-8?B?SWFCMVk1MFFaQzB1N0tOYUdyRzBWS1Izd2lBbkJoWnRsNnBFQ0cwb2xwMzRv?=
 =?utf-8?B?akNkZVlYYzhjdnk0azQyd1Z2c2xKa1JTWWphMFd6eDR0R0U4T0t6ZjBTVTV1?=
 =?utf-8?B?L2hjTXlONWVISDRqSGVLL21EeXZseEVLQ1MxTFl5OE8zMHFCQ1lCcW9tMFhH?=
 =?utf-8?B?WWRkZHBLOGxzb1B6NXpqT1d4c2djVHdpNTRZbkplSjNieHIybWNRQnRBYTMw?=
 =?utf-8?B?cGZjY0txTERjMVRoMndscEZ2UTRHWTBCczZEMkJ3cGtlcVkyMStJRnhKN2Fk?=
 =?utf-8?B?ZGtWTmxkMjVST2xVYnRxSFo5aWVEM2tVQ1BxSUNsOGFiSk5ac2FWSHV5Wm03?=
 =?utf-8?B?RHFkRG9NVCtCTXFXdlJhbHp1Y3hzUGVMVUlscVlGd1RUQUVsbHhZdnR4NldV?=
 =?utf-8?B?cEMzOVRvUjU4RU1BTWZKSXFHZVdpRHREYWF0Qk00MFpnNUVyTE9DNUdGbC9S?=
 =?utf-8?B?NjR3ZURoKzZTYnQ0QlViMnFkdGRYQXRQbGVneFBuZ0R3R1VOWW5zQThCWHVv?=
 =?utf-8?B?QUkwMHovS1dOUUd0YTdWWW9PcHJ4OU9MYnVjeE0yV1lLS251S1JGcmZlWEcy?=
 =?utf-8?B?ZFd3bTZPUFNDeFRMMkR4eWxHb2I3QTVZeWhCdGNzbVN4U1Mxa1NPeURLSk9v?=
 =?utf-8?B?andFUkZNcFlydStBNU1LdW5JOEZSZTA3RWQyZUc5YjIxbUtwQVJTbERHTzZl?=
 =?utf-8?B?a2V4Z2lua2h2cG1MWFlQRWRaWGxhYUJIUi9oRlZ3MUFaVWlxbGovZFFLQjFh?=
 =?utf-8?B?L1RXWDRIenc2NWc4MnRaRE1MeUZUMmJTT1ZWaUgwdTN0SlU1dEo0MXYrWHZO?=
 =?utf-8?B?TkhrakM2eTZBOHV2cUdTcEt2UEd4T3dBb2FtRTlKUk0vS3Z4SEtLRllWOUN0?=
 =?utf-8?B?U0FDMTNlRXNkaEJWTkFqOG83VWd4VFlBMWFZdkpJNFZOb1B3VDUwSG1iUXVJ?=
 =?utf-8?B?WVAwUTRML29KOHBJcU81ekpMZWtQcnN2VEE2R0hwOU9aUjBOSVI4MjIyUTEr?=
 =?utf-8?B?RjZaaUNmaFMzd1NQOVM5RlEyeWhFZVI2aDdBMEFJdEQvY3ZtK05lLzdORUd4?=
 =?utf-8?B?bkZETFZhaW9MeTM2NG15SzlNRzlqeXlNRWhqdHFYNGpkcUszbDBHMFVZVFF5?=
 =?utf-8?B?VGxKMnU3SVZiaFpsUkhJUDdrUzZ0WTQ5ZURmeStmRExYQXVpNWNyY0NySE9k?=
 =?utf-8?B?aE1Nb1JCdC82Y1FyNnUyVjNPbVZKbkNTQ0laYVJlbWcrcnFHQ0tHMGJWWTJG?=
 =?utf-8?B?ajZBUHV2U1J5blk1Y2dFeFE1QktGWmNiWUtRUXBCUk9rL0gyVHRFQThlaUda?=
 =?utf-8?B?dXJIVG1lRTk1ZXA2cTllZHkzOGJCK2JUazB0RUZJSlF4ZDR0QUlxc2RqVTli?=
 =?utf-8?B?QnRQNm03QXBGdlFnK3RZMC9TTFQ4ZFJ5cnlxdU9qRnRKeXZIeVp6TERMbFVI?=
 =?utf-8?B?QjNzR0VrS0c4V1FkRkNXZktGbE9tc3JvVjQrUkpBbmhoa0MwZkY2VEVka1Ju?=
 =?utf-8?B?czAxWE9uVWhZUzZhWGV0Rks1SUtSbThiT3p5SE9HOUoyUzdpOXkxL3lsSmRH?=
 =?utf-8?B?VmpoWGMzNFdlWHJPbWE0YUZTL0JyQTAzUUJqT3piQ2pCRWhKY1N5aGJ6K2Y3?=
 =?utf-8?B?Wnlzb2FqQ05lOTU2ODNYbFRMZ1FiY0QwSkJXaFl6WVJhVjBZa3VxWFBlUnJI?=
 =?utf-8?Q?mHZw10VdJ5uyvO6RQLIBPFV7lBuVv1qZ++0iscy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215daacf-6a62-4b9e-210d-08d91e7e3841
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 06:36:11.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to1mvnzIzc+YdNiPrZrVzuK6QcDF0DwE7R3Y0r6NiEUqvyUEEUla/AkEPYrFV0rLoaEtNoFtyCreA+QL+Jwr/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
X-Proofpoint-GUID: kPwK7XKp5_D9t6iBHDToTk82P-7iC4fE
X-Proofpoint-ORIG-GUID: kPwK7XKp5_D9t6iBHDToTk82P-7iC4fE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-24_04:2021-05-20,2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240050
Content-Type: multipart/alternative;
 boundary="------------0F1D622FD1E86316DD559442"
Content-Language: en-US

--------------0F1D622FD1E86316DD559442
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...


//Yi


On 5/17/21 1:53 PM, Yi Zhao wrote:
> The current default dhcp server kea in oe-core doesn't provide
> dhcp-relay tool. Add a recipe to provide dhcrelay which is from dhcp.
> This patch is picked up from dhcp recipe with some tweaks. In order to
> fix the build dependency, we use bundled bind instead of external bind.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../dhcp/dhcp-relay_4.4.2.bb                  | 62 +++++++++++++++++++
>   ...0001-Makefile.am-only-build-dhcrelay.patch | 30 +++++++++
>   .../dhcp/files/default-relay                  | 12 ++++
>   .../dhcp/files/dhcrelay.service               | 10 +++
>   .../dhcp/files/init-relay                     | 44 +++++++++++++
>   5 files changed, 158 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default-relay
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-relay
>
> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
> new file mode 100644
> index 000000000..bd816106c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
> @@ -0,0 +1,62 @@
> +SECTION = "console/network"
> +SUMMARY = "Internet Software Consortium DHCP Relay Agent"
> +DESCRIPTION = "A DHCP relay agent passes DHCP requests from one \
> +LAN to another, so that a DHCP server is not needed on every LAN."
> +
> +HOMEPAGE = "http://www.isc.org/"
> +
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
> +
> +DEPENDS = "openssl libcap zlib"
> +
> +SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
> +           file://default-relay \
> +           file://init-relay \
> +           file://dhcrelay.service \
> +           file://0001-Makefile.am-only-build-dhcrelay.patch \
> +           "
> +
> +SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
> +SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
> +
> +UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
> +UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
> +
> +S = "${WORKDIR}/dhcp-${PV}"
> +
> +inherit autotools-brokensep systemd
> +
> +SYSTEMD_SERVICE_${PN} = "dhcrelay.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> +
> +CFLAGS += "-D_GNU_SOURCE -fcommon"
> +LDFLAGS_append = " -pthread"
> +
> +EXTRA_OECONF = "--enable-paranoia \
> +                --disable-static \
> +                --enable-libtool \
> +                --with-randomdev=/dev/random \
> +               "
> +
> +# Enable shared libs per dhcp README
> +do_configure_prepend () {
> +    cp configure.ac+lt configure.ac
> +}
> +
> +do_install_append () {
> +    install -d ${D}${sysconfdir}/default
> +    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
> +    else
> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
> +    fi
> +}
> +
> +PARALLEL_MAKE = ""
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
> new file mode 100644
> index 000000000..fed85d2a8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
> @@ -0,0 +1,30 @@
> +From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 13 May 2021 15:23:16 +0800
> +Subject: [PATCH] Makefile.am: only build dhcrelay
> +
> +Drop client and server build as we don't need them.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index ed692a5..34f9772 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -38,7 +38,7 @@ endif
> +
> + # Use an autoconf substitution vs an automake conditional here
> + # to fool automake when the bind directory does not exist.
> +-SUBDIRS = @BINDSUBDIR@ includes tests common omapip client dhcpctl relay server
> ++SUBDIRS = @BINDSUBDIR@ includes common omapip relay
> +
> + DIST_SUBDIRS = $(SUBDIRS) keama
> +
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-relay b/meta-networking/recipes-connectivity/dhcp/files/default-relay
> new file mode 100644
> index 000000000..7961f014b
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/default-relay
> @@ -0,0 +1,12 @@
> +# Defaults for dhcp-relay initscript
> +# sourced by /etc/init.d/dhcp-relay
> +
> +# What servers should the DHCP relay forward requests to?
> +# e.g: SERVERS="192.168.0.1"
> +SERVERS=""
> +
> +# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
> +INTERFACES=""
> +
> +# Additional options that are passed to the DHCP relay daemon?
> +OPTIONS=""
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
> new file mode 100644
> index 000000000..15ff927d3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=DHCP Relay Agent Daemon
> +After=network.target
> +
> +[Service]
> +EnvironmentFile=@SYSCONFDIR@/default/dhcp-relay
> +ExecStart=@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-relay b/meta-networking/recipes-connectivity/dhcp/files/init-relay
> new file mode 100644
> index 000000000..019a7e84c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/dhcp/files/init-relay
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +#
> +# $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
> +#
> +
> +# It is not safe to start if we don't have a default configuration...
> +if [ ! -f /etc/default/dhcp-relay ]; then
> +	echo "/etc/default/dhcp-relay does not exist! - Aborting..."
> +	echo "create this file to fix the problem."
> +	exit 1
> +fi
> +
> +# Read init script configuration (interfaces the daemon should listen on
> +# and the DHCP server we should forward requests to.)
> +. /etc/default/dhcp-relay
> +
> +# Build command line for interfaces (will be passed to dhrelay below.)
> +IFCMD=""
> +if test "$INTERFACES" != ""; then
> +	for I in $INTERFACES; do
> +		IFCMD=${IFCMD}"-i "${I}" "
> +	done
> +fi
> +
> +DHCRELAYPID=/var/run/dhcrelay.pid
> +
> +case "$1" in
> +	start)
> +		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
> +		;;
> +	stop)
> +		start-stop-daemon -K -x /usr/sbin/dhcrelay
> +		;;
> +	restart | force-reload)
> +		$0 stop
> +		sleep 2
> +		$0 start
> +		;;
> +	*)
> +		echo "Usage: /etc/init.d/dhcp-relay {start|stop|restart|force-reload}"
> +		exit 1
> +esac
> +
> +exit 0
>
> 
>

--------------0F1D622FD1E86316DD559442
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Ping ...</p>
    <p><br>
    </p>
    <p>//Yi</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/17/21 1:53 PM, Yi Zhao wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:167FC4DDC2069D52.24037@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">The current default dhcp server kea in oe-core doesn't provide
dhcp-relay tool. Add a recipe to provide dhcrelay which is from dhcp.
This patch is picked up from dhcp recipe with some tweaks. In order to
fix the build dependency, we use bundled bind instead of external bind.

Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
---
 .../dhcp/dhcp-relay_4.4.2.bb                  | 62 +++++++++++++++++++
 ...0001-Makefile.am-only-build-dhcrelay.patch | 30 +++++++++
 .../dhcp/files/default-relay                  | 12 ++++
 .../dhcp/files/dhcrelay.service               | 10 +++
 .../dhcp/files/init-relay                     | 44 +++++++++++++
 5 files changed, 158 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default-relay
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-relay

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
new file mode 100644
index 000000000..bd816106c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
@@ -0,0 +1,62 @@
+SECTION = &quot;console/network&quot;
+SUMMARY = &quot;Internet Software Consortium DHCP Relay Agent&quot;
+DESCRIPTION = &quot;A DHCP relay agent passes DHCP requests from one \
+LAN to another, so that a DHCP server is not needed on every LAN.&quot;
+
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.isc.org/">&quot;http://www.isc.org/&quot;</a>
+
+LICENSE = &quot;ISC&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01">&quot;file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01&quot;</a>
+
+DEPENDS = &quot;openssl libcap zlib&quot;
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz\+file://default-relay\+file://init-relay\+file://dhcrelay.service\+file://0001-Makefile.am-only-build-dhcrelay.patch\+">&quot;https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+           file://default-relay \
+           file://init-relay \
+           file://dhcrelay.service \
+           file://0001-Makefile.am-only-build-dhcrelay.patch \
+           &quot;</a>
+
+SRC_URI[md5sum] = &quot;2afdaf8498dc1edaf3012efdd589b3e1&quot;
+SRC_URI[sha256sum] = &quot;1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521&quot;
+
+UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="http://ftp.isc.org/isc/dhcp/">&quot;http://ftp.isc.org/isc/dhcp/&quot;</a>
+UPSTREAM_CHECK_REGEX = &quot;(?P&lt;pver&gt;\d+\.\d+\.(\d+?))/&quot;
+
+S = &quot;${WORKDIR}/dhcp-${PV}&quot;
+
+inherit autotools-brokensep systemd
+
+SYSTEMD_SERVICE_${PN} = &quot;dhcrelay.service&quot;
+SYSTEMD_AUTO_ENABLE_${PN} = &quot;disable&quot;
+
+CFLAGS += &quot;-D_GNU_SOURCE -fcommon&quot;
+LDFLAGS_append = &quot; -pthread&quot;
+
+EXTRA_OECONF = &quot;--enable-paranoia \
+                --disable-static \
+                --enable-libtool \
+                --with-randomdev=/dev/random \
+               <a class="moz-txt-link-rfc2396E" href="mailto:++#EnablesharedlibsperdhcpREADME+do_configure_prepend(){+cpconfigure.ac+ltconfigure.ac+}++do_install_append(){+install-d${D}${sysconfdir}/default+install-m0644${WORKDIR}/default-relay${D}${sysconfdir}/default/dhcp-relay++if${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then+install-d${D}${systemd_unitdir}/system+install-m0644${WORKDIR}/dhcrelay.service${D}${systemd_unitdir}/system+sed-i-e's,@SBINDIR@,${sbindir},g'${D}${systemd_unitdir}/system/dhcrelay.service+sed-i-e's,@SYSCONFDIR@,${sysconfdir},g'${D}${systemd_unitdir}/system/dhcrelay.service+else+install-d${D}${sysconfdir}/init.d+install-m0755${WORKDIR}/init-relay${D}${sysconfdir}/init.d/dhcp-relay+fi+}++PARALLEL_MAKE=">&quot;
+
+# Enable shared libs per dhcp README
+do_configure_prepend () {
+    cp configure.ac+lt configure.ac
+}
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+    else
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
+    fi
+}
+
+PARALLEL_MAKE = &quot;</a>&quot;
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
new file mode 100644
index 000000000..fed85d2a8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
@@ -0,0 +1,30 @@
+From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
+Date: Thu, 13 May 2021 15:23:16 +0800
+Subject: [PATCH] Makefile.am: only build dhcrelay
+
+Drop client and server build as we don't need them.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ed692a5..34f9772 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -38,7 +38,7 @@ endif
+ 
+ # Use an autoconf substitution vs an automake conditional here
+ # to fool automake when the bind directory does not exist.
+-SUBDIRS = @BINDSUBDIR@ includes tests common omapip client dhcpctl relay server
++SUBDIRS = @BINDSUBDIR@ includes common omapip relay
+ 
+ DIST_SUBDIRS = $(SUBDIRS) keama
+ 
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-relay b/meta-networking/recipes-connectivity/dhcp/files/default-relay
new file mode 100644
index 000000000..7961f014b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/default-relay
@@ -0,0 +1,12 @@
+# Defaults for dhcp-relay initscript
+# sourced by /etc/init.d/dhcp-relay
+
+# What servers should the DHCP relay forward requests to?
+# e.g: SERVERS=&quot;192.168.0.1&quot;
+SERVERS=&quot;&quot;
+
+# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
+INTERFACES=&quot;&quot;
+
+# Additional options that are passed to the DHCP relay daemon?
+OPTIONS=&quot;&quot;
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
new file mode 100644
index 000000000..15ff927d3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DHCP Relay Agent Daemon
+After=network.target
+
+[Service]
+EnvironmentFile=@SYSCONFDIR@/default/dhcp-relay
+ExecStart=@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-relay b/meta-networking/recipes-connectivity/dhcp/files/init-relay
new file mode 100644
index 000000000..019a7e84c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/init-relay
@@ -0,0 +1,44 @@
+#!/bin/sh
+#
+# $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
+#
+
+# It is not safe to start if we don't have a default configuration...
+if [ ! -f /etc/default/dhcp-relay ]; then
+	echo &quot;/etc/default/dhcp-relay does not exist! - Aborting...&quot;
+	echo &quot;create this file to fix the problem.&quot;
+	exit 1
+fi
+
+# Read init script configuration (interfaces the daemon should listen on
+# and the DHCP server we should forward requests to.)
+. /etc/default/dhcp-relay
+
+# Build command line for interfaces (will be passed to dhrelay below.)
+IFCMD=&quot;&quot;
+if test &quot;$INTERFACES&quot; != &quot;&quot;; then
+	for I in $INTERFACES; do
+		IFCMD=${IFCMD}&quot;-i &quot;${I}&quot; &quot;
+	done
+fi
+
+DHCRELAYPID=/var/run/dhcrelay.pid
+
+case &quot;$1&quot; in
+	start)
+		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
+		;;
+	stop)
+		start-stop-daemon -K -x /usr/sbin/dhcrelay
+		;;
+	restart | force-reload)
+		$0 stop
+		sleep 2
+		$0 start
+		;;
+	*)
+		echo &quot;Usage: /etc/init.d/dhcp-relay {start|stop|restart|force-reload}&quot;
+		exit 1 
+esac
+
+exit 0
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0F1D622FD1E86316DD559442--
