Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0106.outbound.protection.outlook.com [104.47.2.106])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBA2789B9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Dt++7YlScFHckaItglSZFnD4gQ40Q4k86q69kr8ueho=;
	b=D1o+YD9C3fbQMCeWucavo3KKdP/Up6/6r3B8ulWTJTTaxiS6cuBcvxeWfPv+bcwGIQi6fudnhCe5Y2+xxnB5Yf4TY6/6LJREH9mTJyz7GMLBCKEn3FImM7PuUO+3nNjQVWlYcClMJhIAlRi2oWE/48Yyn8Ky7mz8ZVIAbZbA3SA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [172.21.3.182] (87.54.42.112) by
	HE1PR10MB0122.EURPRD10.PROD.OUTLOOK.COM (2a01:111:e400:c525::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Thu, 8 Mar 2018 07:35:03 +0000
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <84788d5c-ba38-3663-9fb7-bd2a962f0e27@prevas.dk>
Date: Thu, 8 Mar 2018 08:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
X-Originating-IP: [87.54.42.112]
X-ClientProxiedBy: HE1PR1001CA0012.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:3:f7::22) To HE1PR10MB0122.EURPRD10.PROD.OUTLOOK.COM
	(2a01:111:e400:c525::26)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b355b28-6b6a-42f6-ab04-08d584c71ba0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4604075)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7026125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR10MB0122; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR10MB0122;
	3:5n9WCuyvtrxQGUZ0N43Uy9Coc1DuRu3xQpgRJVdiCwqpvbkVjsi2aZVSxW/0/fUnnFaDuDY0ApkS1wNPeAwVd3B5I+oqfBg0aS8KI44gSN/RTGOyUXN0Scw2NGgzxmObPqSieieQSvmaWfR/O1JGgpb0cvotYArM7M/QtjzE7SVJGrewgvHmgPkvdoILiHNbiORA56/knrohTzrVqqpl70ju9UKI2JHyFiicSD5gQuCJlc8x/EgH2JTnHQzj8IpE;
	25:/gmu/fJTaKOdsqy9OnzM/gm3kcFp0wkCa/GGYMF3CiEK2j9901N/jH0xLQAjPM2SWvbWg1PKE95uSYzJvck0tbqcmgR/JSXTBEImAM0B9dfgsCRvh7zf53pYfCkSmEPJ4gKTre4pbdZ0coZX2PgEuY9k/82Jwtrw8ObnyKdcF4rpqUIL9iwpdahGqQri36Ad3Dcx9qrlerzrL6KbNVpOI9VmPQl8Svr23RJTmg6AcKSnOloeWYQaWFrxsoKQhlL3/NNlE8afBpAqlARQCq0WctUZFr62GUIK4vxCpYm4wtaQxU0x4FCiN5aN27ulqB+0t4qd+P1b4nmdRo6KIVTyzw==;
	31:DUfnSZ+7VqoEgVG733CuVx8Kdr3soeKJEgE+U4mwZ2pV7B5sk2EPoMHGF0FNDB6KO42iQW5P6zSqwZiSMEroBMqslSA4lZGMhkDHNMqfk7FbImVErgJ6o25uIWHyJENOWC5PA0o8raSJp00NxdLTCoWEPRxEgrLXqkzJ9jzBj8smRn4+/ew7mp7UB3r4a+r5hyKB9qR3HlAaK6rZHCbPO9Qy2yq2ftZlfRhzheedBlw=
X-MS-TrafficTypeDiagnostic: HE1PR10MB0122:
X-Microsoft-Antispam-PRVS: <HE1PR10MB0122E053D5B1040B88D07A0D9DDF0@HE1PR10MB0122.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(85827821059158)(264703809997249); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3002001)(93006095)(3231220)(944501244)(52105095)(10201501046)(6041288)(2016111802025)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(6043046)(201708071742011);
	SRVR:HE1PR10MB0122; BCL:0; PCL:0; RULEID:; SRVR:HE1PR10MB0122; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR10MB0122;
	4:i5vrKVIIZe7avqdHMcvV+/rcIhBW7ux1PkmH2dtzTXnfllmHODUuMKls7zGiJ6s3oLBams+k+m9ziBJ5SlBhmlj4+nqTc35OE+ZiZiP5747UvGIErrkM9x/bQFfNX3cTh2lKGhfeuM7xq+8QKK6TtdMT4OuVI4SlY4jxOueJdsAeR3qpya+x83cRRs8hVg0QmCt21zhpZB141WU1EvKmBSGUEWpZOLSlqqMHkxA7lM6pXqZfRPLfRAujgYWVOhdNOs2mv63/IJydid6W8KGWD0pjVLaFAKLTr2FO4lsy84it/RCdmAKOTKjVdEPoRs/Mqn4f6j6ZdTDgcGaZrb818BnGW+jhBwT9T42pKmCtXtijRwCO4P82b1+2o7rkJq33
X-Forefront-PRVS: 060503E79B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(7966004)(39380400002)(366004)(346002)(376002)(396003)(39850400004)(199004)(189003)(377424004)(53936002)(47776003)(66066001)(25786009)(31696002)(65956001)(50466002)(65806001)(2906002)(3846002)(6116002)(6486002)(229853002)(36756003)(230700001)(31686004)(5660300001)(2950100002)(65826007)(97736004)(72206003)(64126003)(7736002)(68736007)(508600001)(305945005)(105586002)(77096007)(59450400001)(58126008)(16526019)(16576012)(106356001)(42882007)(316002)(186003)(81156014)(53546011)(386003)(52146003)(23676004)(52116002)(81166006)(26005)(6246003)(8976002)(39060400002)(74482002)(8676002)(2486003)(67846002)(76176011)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR10MB0122; H:[172.21.3.182];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjEwTUIwMTIyOzIzOlY2WHJ0SkhaVDkwMXIyNlhBa1RhNm9DQUg5?=
	=?utf-8?B?amg1U2k4OFN3ZVNQOU50d0l4ZmZwV2JFZnM2bDY1OHJKb0NEUzZYa2VoQStu?=
	=?utf-8?B?eVI5aWljcVU0aURicXNNVDl3RUxJMXNkYmx0VHd4ZGN6R2FWdVJXYnZFdUVo?=
	=?utf-8?B?MDhtaTRmb2g2aVJycFVMSHFpT2lEdUFyeDVrS29oTC93K1U1NmluQXEreWdM?=
	=?utf-8?B?YW5ZVnNHZXJzMUkrVDVScTUyOTJ1NHByVnZPd1N4MEN3MU9RVjFybktXQjZo?=
	=?utf-8?B?emRFNVkwT0dDQW10YjlzT0liMEZrZFpKY29zbGRZTU05ZGlFK2dLZ21RWnpD?=
	=?utf-8?B?WlI4N1RRTTd0S0JkVUxlUmQ1dmFSMUtoSXd0VmhLaWpsbmVxSDJvNk50YTRC?=
	=?utf-8?B?eC94VjRhWDdNSVJMRmZRb0c2RlpHdDVSanhGUjc2V2RYZGdrcHRRR2Vxa0Zs?=
	=?utf-8?B?K044V1QyZHJqT1FXY0lxMzFJY252SHM4aHI4WWhVbVkrcnZ2V2ZjeXJ2bDVY?=
	=?utf-8?B?cWlSZFpuUGRtV3dpalF3by9FaDl5NVQ0MFJSbDdWOForK1crZjV3amMxcHpB?=
	=?utf-8?B?emNOb3VXT3lwWGJMeG9VM0lCQUgxVXFqeVhtdklIU3NKMEkybDhTMmhzRDV5?=
	=?utf-8?B?Y2RYdktRKzA1a3NNcUpDdG5PZmt1clJJK1FranhHeXJ0N2xlMDF1VVZFVmtm?=
	=?utf-8?B?VEc5ajl6cHN2djlYWHJqb21FczVsRlJ0aE5YckxqZ2NlcDc1U01keWgwNWdi?=
	=?utf-8?B?OVVvMXI3aXBXSVZxZXZFbXdjUGlpd2dFN3ZFOGR0NFRRSzNNeWMyaVZiclJq?=
	=?utf-8?B?U0U1WFl0MmUxckViLzdRSDk2Y2lCZzg4Q1Z6V2R1a0k2ZGFXMzRuaWJ5d1A5?=
	=?utf-8?B?b3F2bzNkK29CbFBkWWRVZ1JYUjFDMm5PZkRUZVhOWUtRUVZ3TlBtZzJPeVFw?=
	=?utf-8?B?OGp4UUtTaXVvWHp2Y2dQR2NRZ1Axc0ZZdTFWUW9BQkVQZUwxUjJnUHNjREV6?=
	=?utf-8?B?OTRuYlpHNjVPaWFrcUhLM3pOdml0WDBkNVN5UDVXSmhNQzRJclYxSzhMRlNt?=
	=?utf-8?B?dXFBSFkrbzRXU0RsSUpvQUthUzVTWWZRalNqT3A3c1VRcUhzT2ZKdXIrVkJr?=
	=?utf-8?B?d3lxVWNVcDlwTTBSa0dNNUxUdDFWWVcxeWNVc3NMQ2Q0NDNlTzNlMzJ3SUxZ?=
	=?utf-8?B?WUZrclBaRG50MnFFQzBiQk42cUVuRkdnZk5ySHFHUjFZbG5rbS9UYUFjR3dk?=
	=?utf-8?B?NGZlcFBISDlzL3ltL2hQNGY4YVNuaThnNDdCN3hIMTMxTm5RZ01oZTFuVUQ0?=
	=?utf-8?B?M0lrcFJkZFRoV1pDM3diZ0F3WUR5V0Z4K0kvVnFQbnBuTmJZTUpBMUF6UGZH?=
	=?utf-8?B?amdmM250ZkpJU1h6L2FEUjZLbzlKTW15ZHV6dzFwRlRhdks2VnZYOEdoOVk0?=
	=?utf-8?B?MHpWWVMxdk9qNkh6TVZJVHFKeXFVS3BwcHlYbThyQVQxWUppZ3JPNWNYU0Vx?=
	=?utf-8?B?UkdycmNER1ovcWV5NW4yV2dESFFKY0pRM2VUNjhnbDFGSlhwc2ZDOTM3T0J6?=
	=?utf-8?B?S2RDUEdSMTBiaW5tNEtSZEQzN1Jwald4dGNWeUo2R25WRThLc01BQm1VUXV1?=
	=?utf-8?B?dVpxbWNZV0dzbVJ2ZisvTmFqQ2c0cEFCZy8rQ2xxR3VlNjJQZy8rZG5Wdmli?=
	=?utf-8?B?UHlJVlhZZkEzR3IrR2FKdTNkZkFocW1UTTlRZkJCVHNIZ0lXdGVNMjNkL1JF?=
	=?utf-8?B?VEJmaTB6ZnhHWVVCWnRBZ1ZjWUhuTklqYlVsWmFqMUpNYmZjOGpjYW5zUVUz?=
	=?utf-8?B?ak9wNkExU0E1L2hEZlFpOGdkYVlyc21YbzI1Y3JpVUFNbVpYTjJudVVSZlpm?=
	=?utf-8?B?c3Z5UUZ0cVArREVEM25sR29xKzdlN2xlZXo0V2IwZUJrandWcEp0N1FlQm9X?=
	=?utf-8?B?bjhNUFlTSU91Q0NqUzNRbDN5S25yMEVDTm5wYU5ySzZ4cTM0MzNGNjc1Q0Nz?=
	=?utf-8?Q?S5fgbi?=
X-Microsoft-Antispam-Message-Info: n2/Zb9UgBznBsKWyOdPTixSn34oguwb5sQCOPWDlYT1kvC7kimyAj3tCQxVpY4e8IdjAA+pHPy2OBH8zt5jfb0+60Tf1gtPg3WuNHvHlgNJrBUm+UGQpyNtVRt8zYHdJQxtPnboL8Xi5LuX5Ox0OeT5oPLK9A2HVwUMv3l0tU6NtCdZYPC91bRnFuJiPjH+x
X-Microsoft-Exchange-Diagnostics: 1; HE1PR10MB0122;
	6:R7dnSrrseDvXpR0tMmc3bnLJzyfceNl43EOe2//NVTbTKPFG1ztliW2RHoJmGPrPgUhKj/YpyCYh6Dmncu079P/C1yIzi1RiW6c/bL2AqnVB13TCfa5jxT94eNXWesVfvGkYDMpS06P7hNNy36U97hn3OUJ8ycIBMUf5sQWgjJqv5jdMXmo67TkkScn8UZfQb/1tS7E+1IH6AVElBeIXu8ZK4bKKmydJO2/JplFvMF5aiuBnCfYYJuBTTnZhKCCwX0d3AU0o6UlrOk79Snwy9vocUSyBF2ybVsJoG8kE+42ysUD3bJ/Xnh9YRQf/umRYPPozvwSJR+flQ3HwhlHe8gtUPY4S1eyrIRSmyHOVRG4=;
	5:kcGcgsw9XkoYQOwadQ0SSvyul2UPicM8vc6ae6FdXlTns6V2VBsXNVU3jXOoDsEsod/42Gk5jIGTTh6o6MfjTbCCAOV85gyjW5WWYJPPXYz03Df11o+gMTQyIsbWPDzfEE9XBWzt43wlt/lKc+WTRdKxqtwmqKgJ2+CDHRMb0Cw=;
	24:ABgAMQ7n9OBR/NE/voJLzhnYw6vcwnWe2bj4HcgjDjVt90bMEsOLt3c8MT2g7CRdf5ZGKfoe7Vpquic/OQrv+K6lUitM1hCkcKwj3iqJ0wU=;
	7:01/AXG533S1ehU0e8CdZbwihBrK96ENvydpzZdUmo5IlvG+hwQwVnByv3TF2toEhTXwSSSUs6hrHNpnNlQtJgPo1VEfl7ntbYnJTaUpi+0NXiyNaVntIaEDRixVBYgLfK2wb7Q7oAmG2g1xUXs4QmUg+gb1huZvybM1IofiPhF3vYH0Os/e6iJeBQomGfth0KrNdf8mrv8NN7DJUM3HwWqDWXEV4ZetfCaHNLot6pkRMFb7W3zbGpGqBZIdq8woX
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2018 07:35:03.7634 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b355b28-6b6a-42f6-ab04-08d584c71ba0
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB0122
Subject: Re: [meta-gnome][PATCH 01/23] santiy-meta-gnome: add class for bbappend files checking
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
X-List-Received-Date: Thu, 08 Mar 2018 09:08:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Armin,

Just a minor copy-paste error bellow...

On 2018-03-07 20:00, Armin Kuster wrote:
> Idea taken from meta-virt
> 
> Add a new class, sanity-meta-gnome.bbclass, to check for whether necessary
> settings are available for bbappend files in this layer to be effective,
> and warn users if not.
> 
> In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable users
> to explicitly skip the checking to avoid unwanted warnings.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta-gnome/README                            | 23 +++++++++++++++++++++++
>   meta-gnome/classes/sanity-meta-gnome.bbclass | 10 ++++++++++
>   meta-gnome/conf/layer.conf                   |  4 ++++
>   3 files changed, 37 insertions(+)
>   create mode 100644 meta-gnome/classes/sanity-meta-gnome.bbclass
> 
> diff --git a/meta-gnome/README b/meta-gnome/README
> index 0c4fbd2..ef3a6f3 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -1,3 +1,25 @@
> +meta-gnome
> +===========
> +
> +The recipe in this layer needs to have 'x11' in DISTRO_FEATURES
> +to have effect. To enable them, add in configuration file the following line.
> +
> +  DISTRO_FEATURES_append = " x11"
> +
> +If meta-gnome is included, but x11 is not enabled as a
> +distro feature a warning is printed at parse time:
> +
> +    You have included the meta-gnome layer, but
> +    'x11' has not been enabled in your DISTRO_FEATURES.
> +
> +If you know what you are doing, this warning can be disabled by setting the following
> +variable in your configuration:
> +
> +  SKIP_META_VIRT_SANITY_CHECK = 1

I think this should be "SKIP_META_GNOME_SANITY_CHECK".

// Martin

> +
> +
> +Dependencies
> +------------
>   This layer depends on:
>   
>   URI: git://github.com/openembedded/oe-core.git
> @@ -14,3 +36,4 @@ When sending single patches, please using something like:
>   'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
>   
>   Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
> +
> diff --git a/meta-gnome/classes/sanity-meta-gnome.bbclass b/meta-gnome/classes/sanity-meta-gnome.bbclass
> new file mode 100644
> index 0000000..331ea19
> --- /dev/null
> +++ b/meta-gnome/classes/sanity-meta-gnome.bbclass
> @@ -0,0 +1,10 @@
> +addhandler gnome_bbappend_distrocheck
> +gnome_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
> +python gnome_bbappend_distrocheck() {
> +    skip_check = e.data.getVar('SKIP_META_GNOME_SANITY_CHECK') == "1"
> +    if 'x11' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
> +        bb.warn("You have included the meta-gnome layer, but \
> +'x11' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
> +may not take effect. See the meta-gnome README for details on enabling \
> +meta-gnome support.")
> +}
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index fb89c14..37215a7 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -13,3 +13,7 @@ BBFILE_PRIORITY_gnome-layer = "7"
>   LAYERVERSION_gnome-layer = "1"
>   
>   LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
> +
> +# Sanity check for meta-gnome layer.
> +# Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
> +INHERIT += "sanity-meta-gnome"
> 

