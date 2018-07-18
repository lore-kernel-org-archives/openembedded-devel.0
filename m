Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0117.outbound.protection.outlook.com [104.47.2.117])
	by mail.openembedded.org (Postfix) with ESMTP id 68DB2789FD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XRcbNU+JlOGQyDUCu92+0SpqNsmzwA5JnhcR3RnBXrU=;
	b=VRbqtK6wuRMfdwXwZekEMSvhWxS7MzLyppzthBlyVl6AnLo/8w8PBC50cpow8ISpNs0tQKiLDYaFEUoxukQgJXQZ3GDRsat+AaPB01glEDujEeWmUvQzYIck9dHWvAXhrs3t+cMiE8yhiJ5k0PZASgXIANSXv3KWVcVWY/5BCL0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from [172.16.11.32] (81.216.59.226) by
	DB6PR1001MB1335.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b4::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.16; Wed, 18 Jul 2018 07:33:40 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180716092221.32243-1-rasmus.villemoes@prevas.dk>
	<20180717072008.GA2101@jama>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <2bc90b65-1345-107f-0db4-045fbeb5b6cf@prevas.dk>
Date: Wed, 18 Jul 2018 09:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180717072008.GA2101@jama>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: DB6P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::42)
	To DB6PR1001MB1335.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:4:b4::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75db36bc-dbcb-4905-7827-08d5ec80c8c3
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR1001MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1335;
	3:p0aeXjiJtA4UbtOCXVUrmol1qTS1gL7Z1DwMv3MyvNtKSC///MAJ2Kh2coPkDPLVCs5+rtNuApMh3n6OQN6/vaTsCxvYrB7AkKr4blZqDu0LEOZLOS+2dbtow+TYIP5Gg18jq63swII0BX0J4tpCCxMMvogbwakes8SW0mGIu8RG+r6xGJDNxzKpbTTwFrEb+1M3EWt2k2bxI5syKET8yEcFtx+EkVRTpjd9faWBz9T4B3LM2X6K10dRd9KJksC2;
	25:auHmMmtKWnOCiYgor+Y9CV3iRSb9lDdaSK1ZuA99KuJFr4bmbg0PKbFps60JKai97kE/1IQ+wJQCUWfIEq7ESvs4hZcYRxQephjUwlgb1FMtEqsCZNRIUx1IqxEjM+XTlmqo4JmaLWDA6Hdtp6OlI90eRZxgIdoxeCO9k/Roci0HawB/yQ4lXWup0akRkDAT5JYk8X5vO6B/wPCB05iFjx1aG0K9B51fJ4uNueoDiE6e0Kxjh64moAOP/vdp/mLt5vya+bNLfs1tnjEDWHwKLch/+ZbJY/49+XnEL2zokmGTnZATyxkrRqCa6fKRxd1anI5ZBgMXx1Ye8LCebQOPWw==;
	31:4jJ7W/PMCXSnA0uB02OrSewoLzfOju17ZsYYMWimax304Nin+vxqXdY8StW+KPmYXQMqM1e10yQ2sxhdMYVd5Nd3RrdCARnltURigC3bJS1bRtbedPy/mC6GM6A63yHfEkwlL7QvmqiVMUay4M1hVbgayZ7iiY7BlGMXRe2rozDLz0x1iwJHk6PxZ7NNmrZaqWVjBHt2jLa8N3cd7M8jUuE4RviDG3BfoK/B5nzHtHY=
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1335:
X-Microsoft-Antispam-PRVS: <DB6PR1001MB133502B0A0A0BF97FCB3F4A98A530@DB6PR1001MB1335.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231311)(944501410)(52105095)(93006095)(10201501046)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR1001MB1335; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR1001MB1335; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1335;
	4:eHVbY4FSk+qFpb7BgIDiqqUEt7dyfya2H4wY6te2B18BLo6eoAh47ttLofW/eWV6uCBbY83LjbP5HmuoAnbeJJ4Ai+0GvMXtaTLdldDVoSVsTIqKgeXmFnaZCEuzMMpOEBohOosASq4/aWoyrY7IS3pVP9flMZ1S7g1jdfkd4zcHP0siQo3b/gY8V18rw8e/RloXDDDLkxIZao1oPnqnqpdEf0+FcXSLa9nK/TYpEIMRh83mcEH2T10vX1c5Iwu7E7u6IQCwoWPOqZfp9EUl49n7QD1ZPQXzOlzmHk+O6GeVdKKMBR+kokz13neWC1RR
X-Forefront-PRVS: 0737B96801
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(396003)(39840400004)(346002)(366004)(136003)(376002)(199004)(189003)(4326008)(230700001)(53936002)(36756003)(23746002)(316002)(58126008)(6246003)(16576012)(68736007)(2906002)(25786009)(6116002)(3846002)(446003)(11346002)(2616005)(476003)(956004)(486006)(31696002)(97736004)(39060400002)(44832011)(47776003)(8936002)(229853002)(8976002)(65806001)(65956001)(66066001)(53546011)(81166006)(81156014)(76176011)(8676002)(52116002)(386003)(16526019)(106356001)(105586002)(31686004)(42882007)(6916009)(77096007)(305945005)(74482002)(186003)(7736002)(64126003)(6486002)(478600001)(50466002)(72206003)(5660300001)(65826007)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR1001MB1335; H:[172.16.11.32];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB6PR1001MB1335;
	23:3q2tj+qwhFSx5cPmgOWeWwnmAuH6Iu67xeF?=
	=?Windows-1252?Q?k3LwK9H3xL4W2JkKuZ1WIx0z6XlWaqscAtxQtgD+4B7i1WytXKDK3559?=
	=?Windows-1252?Q?nB2vp1VguW3YJVOQecgdOJWF9gbcXT+xlspI/yNyQWBIgxGVYvlz3eX+?=
	=?Windows-1252?Q?6YtBd3bhrL8jveJ3cShrUN7E1E6pHW5+v/DCZu3ORJkj98mNwLjZoEFk?=
	=?Windows-1252?Q?D+eH/RT+yO7gmjcWCKFXGbUOq1WpBi984tj/cb3WYN9fhX8sZCNnDpst?=
	=?Windows-1252?Q?Ajc+RqbT+2BoK1u688F3nbYx5jcDs7qJKO1zWE17XKFdRlz+UrA+YO44?=
	=?Windows-1252?Q?B0clSDCe26poj8YEiwivVJJrFY7YKkQqtgZQ+c1ntq8vpZOHz97xhRkX?=
	=?Windows-1252?Q?HNdNYniuD/S2RSOfVGaXhsPR5FqNin2xrq+XG1HYqtbw5RAOly5w6fTn?=
	=?Windows-1252?Q?PhbEnB1T8gq7Z5hTXbiv8w+RSgH4Nc9JfgXQO+ckCP5usysc8+z7qqP+?=
	=?Windows-1252?Q?/SBgKnwnnt3WBCAM+ZBTZqpmjipL9N5Vl3RuAHF4QUM6QoROpr8TKbOu?=
	=?Windows-1252?Q?/7oIv/yDiqUndcm7BBdttBYai+fEUrWMqlokqbiPJtfJJaxsyNP8UEhp?=
	=?Windows-1252?Q?os4sIztgbFWoAXagrj2nD7pi3m7u6usZwBkDKO1Gv+B1iCF/QMAFziCK?=
	=?Windows-1252?Q?gJs9iF7iNDLXiiKrnHGF0/zfcF9wpY77qa54HXvCnIU5seTYn9aNt3FY?=
	=?Windows-1252?Q?iRszgbQPndp3OMgLRtD3WfVVSw59+QdFiIi0E5MwvJQCxb/yxBKBDKn6?=
	=?Windows-1252?Q?+KagE1Bw3yPlIyUdHdtZf0XuTpMGuGUCUgmWGKRH+vcU5J47bSLo9/G0?=
	=?Windows-1252?Q?b4w0ZPkmbIjaTY76KLK+0XmIFXdGa7GQhG+oSzl4p01A7AfFerLhebkJ?=
	=?Windows-1252?Q?fgdA8CTT/Zom8Qi/TMPbeDv1EwrnXhPNQAypdwuxMiXhVrTefc01FoPo?=
	=?Windows-1252?Q?5hQ+dMlgUAmPDWP4YqjX2p3kEi2wha/5eITfCzPcg0so0gIuOf3ljUAZ?=
	=?Windows-1252?Q?y6wkc7ycUsxF8CY/h1WOf06l34N7o3C3Z8XSFo22EJ43kjvOjx5JQHYA?=
	=?Windows-1252?Q?cIC9jdR6de4fPDgB8bGKYX4L0IE5rQqTsf3rWeIrcnh5K/fJDgup87vX?=
	=?Windows-1252?Q?u7Ujw8gSqgy0An43K8YybMUlq3OmgKMerSiLzmhZiAIiU3UBB0Rb9ANz?=
	=?Windows-1252?Q?N0d3B62KTZECY7nmJlwKcwSG5Yw3dK51Hin6ELu368V36XD8M9GK0GGF?=
	=?Windows-1252?Q?KsE2ipngk4RDWVsWDff+dOvqQup29jLf6zkQudldIz/e9wUCzk3ud67v?=
	=?Windows-1252?Q?6Mkl2wjvzn7qL568U3+UbH8/3zyDTTxBW4PrFBvM1O7NrUhHYhruCJdK?=
	=?Windows-1252?Q?FM7jReFfXcpyNRNN03qPJGPOiSFR22Fg8hKbYDxic8p70gtfzup5OGxl?=
	=?Windows-1252?Q?7bLNneSarsclfiYJGWuAsmAR9uMCP/SOO4YPh5Mu4NmT+bv3bJE31z5n?=
	=?Windows-1252?Q?l3y/PMkOqJQzQSkw=3D?=
X-Microsoft-Antispam-Message-Info: hqRwxlnz8jjulp54fC/2SaR6Ufdbb/zpWz8YygW6k0LqgwaRSvJzN3Ufr1BK03IMk0wEAotks8ZpHH4AHcDMLGBPvqRGaxKuCVFNvW+F+v7NIFmi66lKxxFrXethVFySk6sy8K+WyXyX8HtbD2ojPFaaZcG5+Gfu9+6q/p6SuIYBPQCUq2cqg0AW+vkia3ssL54gUxsghuLuM4k/m2VshO8RztUDOkgqTt0PdfjtlmBUKLTDE3Ur8Nfpb062bKKzaJEjKVJVvIJRDxYXypqyfwbTCfVe/Rw9p4sRI9gUpysw2gSqTskJpTV0CIzZBZjmu7rUTCyxKnUquSM50TrLWYyvAOTWYGnvRWrbFw/oJeI=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR1001MB1335;
	6:0p4kqh6DsBLHKZxHc7IgB++zUjDBx92B25uNPVhk+jjzhuL11DC8A0OCAZyDu5w0MTjXd3uMWwtFwKTBBg7wyNbE1AusPlqxjUXpJN1nRaNSS/KlS3SVcgEjNsxt6vxH+SiENVxA9QYxV9otjtGGoJ75VNHeivrdX7JMerJNiU5orDpk7IP3sk7+GQRRCuydlBrqN9G5jsj4H5Oox0pO+2bswF1hxtb0g7v2+6Snb7G1jPuR85pX81eDk2MI5eU6DECfSIDD0d0cDnFO1+jTuF1GxWP7DbjS+1PNh6q9KlLYfJzTA3zKtgiGdOd6n2qv+cADpOagIb5QzVHpFaePUpquPaQWUpyDL5FJrzKJ5rEilQ+WwyjffyN7cV3Yty8HaMPdOIDJnPvc9l9GcElOkcWj8zlquG50sSszrS/rVx0oEYfSeaie4tP0H9bH0es9rVdVsKyN87kARX3xRa3Chw==;
	5:rSuH7hzAXi/mvMvyBDS8SvYomQdtsxNHInLN6JJoSnC+77tQvOgil9SJ2AtEoJ6ZkZh5S2bJqptANOqtVTIxYaiRsAgsA6/l3tWv9UhH+ep5cgSyMfMktFqvAJGOSjT/xKRKcYlNehiYKpj5uJ6BauuegV3qVNbh5v1nqoNOe5U=;
	7:ISNqPXYvNLWH059qmXcmriieZIUiG0cZycQEDzv+EZjJi5BuT6tYoj5D9pTOMAqp6C2HLROL6GNDtSFf3Fu29oeNXBBUj+THLONxEywdSi5fNJzCsccyClhzr1mmkz+pdyJPGMniIV5n9s78okCbYBvuti/ownhUNMHtz62+Ez5vTi/GoaejYRrxo6YxsCGRnbGIbawoBDEep+G+u5ZGm/NT/qiQZCd1N0WiCIODmzhtrrS3o/KJan1MEqRE39sw
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2018 07:33:40.8683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75db36bc-dbcb-4905-7827-08d5ec80c8c3
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1335
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qfilesystemengine_unix.cpp: optionally disable use of statx(2)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 12:08:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-07-17 09:20, Martin Jansa wrote:
> On Mon, Jul 16, 2018 at 11:22:21AM +0200, Rasmus Villemoes wrote:
>> When used inside an unprivileged docker container, statx(2) gets
>> rejected with -EPERM by the default seccomp profile, unless the host
>> runs an almost-bleeding edge version of docker (at least 18.04). That
>> causes most qt apps, qmake in particular, to fail.
>> +
>> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>> index 09b6cc5..41f9b7a 100644
>> --- a/recipes-qt/qt5/qt5-git.inc
>> +++ b/recipes-qt/qt5/qt5-git.inc
>> @@ -15,3 +15,5 @@ CVE_PRODUCT = "qt"
>>  S = "${WORKDIR}/git"
>>  
>>  PV = "5.11.1+git${SRCPV}"
>> +
>> +SRC_URI_append_no-xstat = " file://0001-qfilesystemengine_unix.cpp-disable-use-of-statx-2.patch"
> 
> Isn't this applicable only to *qtbase* ?

That is entirely likely. I have no idea which source files go into
building which qt modules, or if any source files are shared between
modules.

Rasmus


