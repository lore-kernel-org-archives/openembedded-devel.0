Return-Path: <Martin.Hundeboll@prevas.se>
X-Greylist: delayed 35922 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Feb 2018 02:40:38 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0095.outbound.protection.outlook.com [104.47.2.95])
	by mail.openembedded.org (Postfix) with ESMTP id 9536778694
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 02:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UldDxO4fM4KgkWaJRveOiSLzwXkVRve0VhiNFqfH+bU=;
	b=JBTRmDVOwmgXxLsi40zbbqZw63ix4tMiAZQZLFJeVIfALEvgq2mhLR0QaMmUsCHfgb1awzpEcCy9rKd3GfBgCCLELKfs+hklHm6DfhCO0zwbokqrd+ZwyMvAK1srMUb0jS7tyED1icyVCMk9CMYFNltzKW9pgiDI68fYB8V1yk8=
Received: from [172.16.11.15] (81.216.59.226) by
	VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM (2a01:111:e400:c54a::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.527.15;
	Wed, 21 Feb 2018 14:09:40 +0000
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
	<CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
	<20180221135732.GI4311@bill-the-cat>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <766040fa-b622-5610-4ba3-87d416c7ee4f@prevas.dk>
Date: Wed, 21 Feb 2018 15:09:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180221135732.GI4311@bill-the-cat>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: HE1PR0402CA0016.eurprd04.prod.outlook.com
	(2603:10a6:3:d0::26) To VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM
	(2a01:111:e400:c54a::23)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9075d72-c33b-4720-727c-08d57934bffc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:VI1PR10MB0125; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	3:SdpTnYw8yAkhCQGiiSLiwfK1bFSM35VfqnV8RB1y/0RNtkpneEKofoqa2klmxmATIy4fcVqIYHkmA7efi2ykjwASH3X89cnMMFpRuTGwHEPKAbSeiPcL/5j26mPOlvMeoxs3ThpcgJO8fnFlTT/23R3ywCEUJb+ABOO7Mwol86140sKs8YbiHYidPndahB07IHZ97+jAMHEo85PSaoSFPuxmWNUl9J3ZyZQ5POIwXAQzM4reYGOztlxqz2CqhKh4;
	25:0Cn3UPK+UM4PbDr0TgeCx/jrwaWO3SK3Muj3hVDFOqh996IiV8TeEwL5oTvashVzImrNp5DpO3ChDFx6vFOG5FkMzPvZpBPvUsolr52+HliDwDWV38oVnBiXaqmG00f5A9zafwx7ChzlAI+Xbm6tyuHms0V+KjChZ23hg8IPNCf+Tjrq+SYAeAJMJmQJILwFvMMazo4Bqghoq+5a5HCda1mTKRagyzj7u7xeQdzx8XBrzSxKrmM0ECrKH6Cf8Zue9POSV88lgICaIC6mMGHZDaFh/JuBDtcbssj0jtrspXFbWc+PJvd+69TC2Ktc8brB4pgpN+ZqFObXEeOLy9Ssew==;
	31:14hIyXp0zK13G1FW4ISbGratSOrt4K5zzb2wZVuBODsm6T1e1TCn7jJAf8dBIlry+snX+XfGqGrljA15yYzZKKmJkpBhJ7LL3PBUZCmpaU/EerRx0E5RwoBVtT0h+y1AVkmf3vSBjhYOuBrjKfZvpLPpPs2iE6/PbjNEcabUEEacH0qGyiJMG3eX0n9Bc2eFpU1CHuoXuFXxiUyfNt9gt4yfODLEHojpfGQb3Sxe9zw=
X-MS-TrafficTypeDiagnostic: VI1PR10MB0125:
X-Microsoft-Antispam-PRVS: <VI1PR10MB0125A88DB594A1100A7769989DCE0@VI1PR10MB0125.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(166494164430575);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(93006095)(3231101)(944501161)(3002001)(10201501046)(6041288)(2016111802025)(20161123562045)(20161123564045)(20161123558120)(20161123560045)(6072148)(6043046)(201708071742011);
	SRVR:VI1PR10MB0125; BCL:0; PCL:0; RULEID:; SRVR:VI1PR10MB0125; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	4:HxyDfL6JTXaNyA0AGYUO9wFTpotWdQ7PNc+T3i/TPp5eKZLuMOxRT9Jw5+bI4E+0HerDyQAE4zgHl2ZDONsPWt6reuYrjLQlgS/w+5ODjg84PS3tTSf8VTCf0FZ1Jyi2AsUaOIWG7ckjuqTq2ehHV61FqnwmBn2lEn4T8FEeJ2/6z/oFw9l2Tm0v/nSareZoHPbldmt+ps1xgwR7UTgVbOXPyeiuvLhjFNHdXSF5Xj7Safm5wCGzfmimzYTvCBQqw/oZo05Xx0ZrHg7n3msUuW/EOaa540IcQ0EwLtF6eGIkBLRxEngQ+TTpG4G9GA7I
X-Forefront-PRVS: 0590BBCCBC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(346002)(366004)(376002)(39850400004)(39380400002)(396003)(377424004)(189003)(199004)(53936002)(478600001)(6246003)(23746002)(64126003)(305945005)(36756003)(7736002)(67846002)(2906002)(2361001)(58126008)(6486002)(25786009)(93886005)(316002)(5660300001)(229853002)(47776003)(50466002)(31696002)(106356001)(2351001)(3846002)(6116002)(16576012)(186003)(6346003)(81166006)(81156014)(26005)(16526019)(77096007)(8676002)(65826007)(386003)(53546011)(52116002)(76176011)(97736004)(8936002)(65806001)(230700001)(74482002)(66066001)(42882006)(68736007)(6916009)(59450400001)(8976002)(31686004)(72206003)(6666003)(65956001)(105586002)(2950100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0125; H:[172.16.11.15];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; VI1PR10MB0125;
	23:mQLxS19Qzm/QDseCe5YJejrT+1Is4bmoHJa2v?=
	=?Windows-1252?Q?xVzKV8E/U92sd3RkiFaNNbQrOc+xyB29iZDPwr3IYJDPe8rmhHKlGO6D?=
	=?Windows-1252?Q?/d0aZh2hvto0LCrjl2XxcKY/v+ygOxkDXNwOscLY4zYR6DFn/6Hogqsm?=
	=?Windows-1252?Q?lr4WWH81sBQFJ7XKEEX9XzreCoQSstFSm6dKhna+kDkbv8Dynv7P8X53?=
	=?Windows-1252?Q?9E8NUMzC9RkeFXTjcA805kKhGDHf4Z1UZezmXvIjHfjhAiTTKYZs+NyM?=
	=?Windows-1252?Q?FGCu9u+42er9hcmRkOS8jwo5bQ6yBm4SzATOEt/saUebEdEIxm9Qum52?=
	=?Windows-1252?Q?YgEZVkNKpu217f3rwZ1DEueTWWFZAQ9lfeICCkF9Xmx2klyc3hC51E97?=
	=?Windows-1252?Q?AjCxc0H8leu4zdKbBZSuy9Dtj9AZkP62iYUjSegfVSSfrvszrpJh5ERk?=
	=?Windows-1252?Q?QpFcOeobHPJx2sDELI6gLq7BXHABhB5vb9ZVbok7Hjq8T0BeWIMc8FWy?=
	=?Windows-1252?Q?cuKxoFiVl2Y5C27gCJXZruw8WdMEP/QQOaJV3SsleJJbj0C6nrMaaW51?=
	=?Windows-1252?Q?X9er2UlJMacoDnQOqNLRaqZPzUUGWbOWvefCr/Us+84GXibTX1nwm61Y?=
	=?Windows-1252?Q?bMkRnV5hQh0BrLzPxaRbfoAWSRrnjTmN5PHsEzKdl+9FWE3m4HdiIyyp?=
	=?Windows-1252?Q?/IXAiYLefGB3CUw/mCCt3MHKwQPc+H0GOIf563gzg0VZRcH2jLH7Le2S?=
	=?Windows-1252?Q?G8nLlcdgvnlhfbJwNh2ncOuqs4IDACvSjzlHEW9tYxBW6GAygBu5RYIl?=
	=?Windows-1252?Q?B3ZHBU1Zg+5hdyGfiAW3e1VnUSujafCG50WH3QEoUiq6OrZIg2H9awCV?=
	=?Windows-1252?Q?/4WVqIBl9K0hSX8UjwVCuyTQr+ntiBKIJeJ8gJ/tg9aXS/9qiYEk/tRw?=
	=?Windows-1252?Q?7AZOY2/MYQ9jXgwYnirOKCAJLxi0fDAG0Rq6Q1EPAB4DRd7+IFpbSQgD?=
	=?Windows-1252?Q?SgCUswFIa52zlgmW/ojdq1kR+XFRYuHfY3FEEfAV78nTAiJcZx3470oh?=
	=?Windows-1252?Q?9jSo+YGN2OOyznCJCWNR61g/PEgved5kCRYze+ni9JvpZZa7YCFy0cwQ?=
	=?Windows-1252?Q?GC5vjkpe5oosJ7vMByW5Q7pLcjs3AuWeLj4AGPPf5R7U6Y9+J9mWxElV?=
	=?Windows-1252?Q?OBe6KQB7R2LmUW8K5TEDn/lo1+0dMsgoDgdPzkUDmr1Oz5zn1wJ5HteI?=
	=?Windows-1252?Q?dfhtO6Q1idr3BqdXpoG1YfoQB1tfTd/Pq/o2sU98rvNKjoBvvGc69Ra3?=
	=?Windows-1252?Q?jy2hbXHq90U/J1SrajoficRi0WFVOB4teZrbqFLzkw8WyF6DCeIV2C5P?=
	=?Windows-1252?Q?NU0FyuO8iyNW6o6cvbZrsGf2DdgigD4YXmtvm//xMCdUUB/X8gR1bCoC?=
	=?Windows-1252?Q?PTLEH+pJ2J1TuS7LeKRT4yatw21W4n9LwxFdIWKfuEv1z1gwgxFqUeaF?=
	=?Windows-1252?Q?+gWZlDLVwA9cnoQb/Qf/Mz6Cx2qyVjnFMBXpRmKpU4DsDlDbK1cCma9c?=
	=?Windows-1252?Q?DkKpxgheTecc59zxqUazQUs1BhOQVl/T0JFmf+/3kfBm6zWz7aBNLzPr?=
	=?Windows-1252?B?dz09?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB0125;
	6:st8fZqcTbB5AzVhNsGWNZxO0zSrzzpNWyV+cqwQ32y2VAV+FA9T1n+Rs0Mm58Ma7AwGH8IRtAA4T8yxBlEDglNysZN3NobVJhSC+6Frb8o1JVM50MMCl/3ZDSqMfkPV3TRWqJxGvJ9FNMpKq+GWDHHU2dmQk2ivjuSI0UZbFM44G1cTHeaK7xEuxCXa/CDb/Xp4nYae/b2Dt7iPBz1J31O6n/8dZj7HEzExlCeBW9jzF0bWFCwmtLqTmkiyyjGR4SFbhZ5zO9zPXnK3QxGK/3FdeGPC5QAdflRpTgAj0vxN2p9yA+BwzolaqU+Xo+ovTIjUTx0jW9lCSZJbzYZHrGFbOdv7vU+Tq5BNKP/KhDsc=;
	5:hRDeg2ZHuEoskOe/Dz1RTdGED85U29w8E5lBWLKKc3mi0tsWFqQKCNIMMjKkFeh413m4MGaM5VEv3XJEJwddHUcA+3jSh623FYFCTE1o4TAQr8zOozUy7Hw9CuITWV1WsDDc43WSmCUcy+UmsQlLHrRjcQAmZSdghUPOHEZD3uM=;
	24:P+8jkA20GZL38VQtwP9xmfhJPGOtOziqs23VkYHNsspw8LSH90hI13uGEamPKqmoeGBlyO82Cg4FG9TEicghUvokWBvvbS4KakfK2qov5Xk=;
	7:edHyoyt1wp8mCNpCeph0/0pB9LFezy4Usm7yFJwGOTdVZ2Qwr4cjnlC4I4T6bknAdKtXS74ugE7dB+oZwB44QaQLVr9ivAXNgAhhTXISoJB2YqdRFX4YI77bmeS4JJGescW+oJwx4L0y4N/s3h+b3+nZPOaB388UIGmVyvyjgQzFvDwxriGjhKlniY+VuCnieENLHGx+KK4lh1DFOfBVbAIOmNVYYg7o/ztBePqAQIkspe0+IsRUly7ecpZ+BoAn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2018 14:09:40.6389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9075d72-c33b-4720-727c-08d57934bffc
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0125
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 22 Feb 2018 02:40:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2018-02-21 14:57, Tom Rini wrote:
> On Tue, Feb 20, 2018 at 09:10:25PM -0300, Otavio Salvador wrote:
>> On Tue, Feb 20, 2018 at 9:07 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>> On Tue, Feb 20, 2018 at 3:52 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> I could combo-layer pieces of meta-oe into poky but I'd imagine that
>>>> would create more problems than it would solve too and given the
>>>> general dislike of combo-layer, I think ultimately better layer tooling
>>>> would be a better answer and more acceptable to everyone.
>>>
>>> Poky creates more problems then it solves
>>
>> ... send was too soon ...
>>
>> Poky creates more problems then it solves.
>>
>>   - it causes confusion
>>   - it avoids the urgency in adopting a setup script
>>   - it does not use the layers as we market as being a good thing
>>
>> So adding more things to it, just makes it worse.
>>
>> The setup script is more urgent to be discussed then splitting meta-oe.
> 
> I agree that a setup script of some sort (off the top of my head,
> something that takes layer-names as input, checks vs a list,
> fetches/clones, creates a wrapper around bitbake-layers to always add
> them) should be a high priority.  I don't have a problem telling my
> customers to clone meta-openembedded and then use the layers that are
> needed in that specific project.  But it's painful to have a shell
> for-loop in the docs we provide so they can setup a build.

Now that the discussion branched out a bit...

We would like better support for this too. Our setup uses a "manifest" 
repository with git submodules to setup the layers:

 > yocto/
 >       meta-poky/
 >       meta-qt5/
 >       meta-foo/
 >       meta-bar/
 >       conf/
 >            bblayers.conf
 >            local.conf
 >       .gitmodules

With this setup, customers simply need to clone our yocto repo 
recursively, run `yocto/meta-poky/oe-init-build-env yocto` and then 
`bitbake image-recipe`.

But this is rather inflexible, as it requires the "yocto" folder to be 
the build folder to activate the config files...

We looked into putting the configs in "meta-foo/conf/*.conf.sample" and 
using TEMPLATECONF, but the "oe-init-build-env" script is rather picky 
about poky being the "top" directory.

I guess the oe-init-build-env script can be changed to look for 
.templateconf in any parent folder?

// Martin

