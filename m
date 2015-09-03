Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0102.outbound.protection.outlook.com [157.56.112.102])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE8676FD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 13:10:51 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from [10.9.5.47] (91.217.248.11) by
	DB5PR02MB1176.eurprd02.prod.outlook.com (10.162.163.22) with Microsoft
	SMTP Server (TLS) id 15.1.256.15; Thu, 3 Sep 2015 13:10:49 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<aa8e5f7733a5b247b397236478271575215c843c.1440502860.git.samuli.piippo@theqtcompany.com>
	<CAP9ODKoUVXp5MuOiTTiYQfkWzWjU=wf7dKVpNnBJW2KNudZZyA@mail.gmail.com>
	<20150902172525.GE2470@jama>
	<CAP9ODKpCBfZzzFxFkRv-YSOQT4cZdpvgwQ4dDki3k03VhzkR8Q@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <55E846D9.5040003@theqtcompany.com>
Date: Thu, 3 Sep 2015 16:10:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpCBfZzzFxFkRv-YSOQT4cZdpvgwQ4dDki3k03VhzkR8Q@mail.gmail.com>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB5PR03CA0009.eurprd03.prod.outlook.com (25.162.150.19) To
	DB5PR02MB1176.eurprd02.prod.outlook.com (25.162.163.22)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1176;
	2:XlEFCx2JTLWVfCF0wQHrvkz67GmfeQjpCeqmDV9yJdgdfEsS45ja811zrINd0uCvhJ0Hb9aw72D8v+Y674DzSsjdTj9zeIJqJk4wU0BfZBXVLLwa7lQQUOP5/fdbuwsp+WnN9lP4fOS8R1FU58z6LvH/D9czR2mCzmGRS1vqLbY=;
	3:+tUg8YuDksWqkgPFziILmIg4oUo0wu6Py9IEaD2QenhtsAMg+BAiUUY2AsyQwh2whU0BATZcu7cpR5t+WX+2UEq4NXqILBAwZIr9grSJ3rN28ehjI4s/mP2xmoH55WQeeXJrFUFvuMdNmeFEaN5DkQ==;
	25:15qrLCYfmrWRn5towyMOJaAqaP/Q5jyZemsuAnu2CYxlU/LZss48mYi3QqG1sX/UTFUXpGHHcMkwh8PYLY54Ks46wVeaPaaWNBZFp+oSmVyZwNgoEJ0MvIfGK+gFzAzof+yLSWx57nCjakny0gQfnqeuWIJ1IQMAO/lwglimWkOdt498gAZ81kqa5GIgM+sUdDh5ZPk38MH5ReuNtKXfFlM9uD4RWGblyavBuJG+5txohClmN+GR7MgHvL4H7Pcu
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1176;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1176;
	20:/pbanw5Zk7sLsHQhEX5q9TxowW+9ezcnGosPANn6DG3gwu+gbd8bEswVJm9Gy1HKkmzPQIi5z9ttW1zkwQ2dONNQtENAenOf/7m0XdK6PFuMRsTV6khxV3hP4jgObHifUC9cNFQMjtlwhaFECkSSuKHCV3KHaFArax9k52U0CpUUHUPicnBf3vweVybJAcbcaH0yk8da8IoohXiWEKaqXNsldp2r4GWJs8E3ZTBO+ySoHmzpGufT6aAMO82fQ8kxSDGQCLKeKGZA3B5UU+w3jp1zZb7tu4ZH8ZdgJ2EeT9KYHXKuat3RLgDqvah/HX2wHKMXGa0t+cwgqJMvTmQnixmfmQK+wdX3p+9pOt2xQUGIaJfPxdWCxLdFYx9YBqraLKjDasqus+7pMAKoYRKnEtTvqMRh7Cdkcd/a5yOe5WAFrArMDghjy6G7BO86IcvVUOoAqpsNP19SWuDP79phlftySnBVUrCvAudVNxzeblO6NuoPQX281VTVWq9a2s73;
	4:stbMs22TUuVy/TI1MENnn/F66W4KfHnxWNifOXHwoVcWvZ6nSH6H6C4dAVmZ8jmwwqpchzLEOGy9sWwnQ7KmN4ffcAGV5oI3dv7cX2498faGz+OfELNdI+jR6YuDAmcL9MxFkbHuPolXnNkpJ5JXeSRhWLI8n/EQhf99L3Hw7rM0UB/friFNC+F0GF5guP3H/+xl1CTne4pPOqMCoPp72DRpjNs6FFF4vVECHCZZxzS7btuGZdKxmvOW9UtCAJYK1bg56HbAlsPl7fj4XyTv9J6uUVNFi7vHqtnyIG7ZKdqZycgOhYE2ppCura2O76UR
X-Microsoft-Antispam-PRVS: <DB5PR02MB1176C204A82AF2DA7E97405190680@DB5PR02MB1176.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:DB5PR02MB1176; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1176; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(6009001)(199003)(377454003)(189002)(24454002)(76104003)(2950100001)(50466002)(5001960100002)(4001540100001)(107886002)(97736004)(5001860100001)(92566002)(64126003)(83506001)(86362001)(87976001)(5001830100001)(5004730100002)(19580405001)(5007970100001)(110136002)(80316001)(189998001)(122386002)(93886004)(23746002)(450100001)(87266999)(2351001)(76176999)(105586002)(62966003)(46102003)(77156002)(42186005)(65816999)(101416001)(50986999)(4001350100001)(59896002)(106356001)(36756003)(33656002)(77096005)(64706001)(54356999)(68736005)(66066001)(40100003)(65956001)(65806001)(19580395003)(81156007)(47776003)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1176; H:[10.9.5.47];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB5PR02MB1176;
	23:LTe3E1WQKWDdpbF/KnugdsAgbTMTQ+Fnjpy9Z?=
	=?Windows-1252?Q?O6mvHpyIQIWoncCos6sWN9c3TgzLcUMU6dWOAeaUPyPFPJNRsXiKxzLk?=
	=?Windows-1252?Q?Yet/hUnAjxLP46dcrzjqQzjJWUEd6Ol9zQCc8CklTPDrYP7SHIrPrXL9?=
	=?Windows-1252?Q?0WuGJeD1UldvB0C81muLVu4c9r2qR9bQcB6l6qJuVhdxSMbdgnlLwIOP?=
	=?Windows-1252?Q?8gK6Gvlu2p0ogtPa/RgCEmlt7LuhCf9A40cp9QMm+jb22UC/hHYGAgEt?=
	=?Windows-1252?Q?KyWHrbVUMWozOheF33N8PtRly4jMsa3jqiF6p7iWUnJ5rfQYNK4vbkNb?=
	=?Windows-1252?Q?N4KOoDK2h3WpnN3xipfz0ScDN0UoNlcyn0i4eGPwHGNUzhTyRx5Oh4ur?=
	=?Windows-1252?Q?qiudiCSoJhIViWtlF3pYHAnJfmh+6+0Cd5PXcnDji7qb2dspsIXsgFer?=
	=?Windows-1252?Q?5vjv8QVlkgUSC70GjwkiZgiqZCUasTXwNjOkZCIOl2oO6wpYAEiSV+sc?=
	=?Windows-1252?Q?/hfwdqiSjB0BnbGPZ9oWgFj91ya+DmiZHFQyfx7Ra8bgr1AkSm5Un1hj?=
	=?Windows-1252?Q?VjuWaFXpOMVhhCTb8QCNUmhda+6fg7f+WdLunCQBupsf9yE0WSiCi5qe?=
	=?Windows-1252?Q?WW3GUEBoFWJAY3k7iI5FpCk8nJ9uAMptd1tOvXDlU2tVnV5GZnWOP7uF?=
	=?Windows-1252?Q?wnrmRRHWqYXPMeptwfMlE0htPdBnkYBurrsn9KSwNm/1MSybMwY8cGjC?=
	=?Windows-1252?Q?/Rumlm0tOr1PmIfJof0SV5pCr2QhJG/5uyfO+LzPThFvoQqZ7lfo0+IN?=
	=?Windows-1252?Q?JhDX5bu1vKUGi6FZqby08/BqTx/8amL5RZwClKwV/PM3ANOQsZpAdVVR?=
	=?Windows-1252?Q?cvz8mAiCGxLpNfDPvpFZt9TytdeYEmWU6x2esF9GNREAYwnQINsu12ya?=
	=?Windows-1252?Q?tlHdXnSZcbIYUvvJCtMu6ptv9VBvoZ68SYoSA17acWGT8kmlVc9NOyyI?=
	=?Windows-1252?Q?O8SWoah2aQ4P2XCJzDNQiu77jsFzzPauh4ox+hSNU+aphMGHO9Lp/JUo?=
	=?Windows-1252?Q?hUaE4THNFjwYBCg7pFePM7ckzRJ4uFihq/aN8wcPSdRjO2bmzRnc0e2w?=
	=?Windows-1252?Q?VigPXV/erkDQLLuZPzF1ST4g+uo4O687Xn5ifzqwOKXE1DS5aUSR/l/K?=
	=?Windows-1252?Q?WL6cHnQ8h26PODjcudhtRhMQwa0R2Tj+EahB8mPZpGyAsjL7LkUsYHir?=
	=?Windows-1252?Q?viMcKgVLofNLBIGWe0ic87wJ8/HaTp6cWoetQ8/BtwDc+ngeCTaZqMbv?=
	=?Windows-1252?Q?kTaRf86TCJRGGiF/It/qtgojIbrY/MFF2OkPplW1yiRFmulXC0kjX/mV?=
	=?Windows-1252?Q?YbdlgFuEhqW06Z0pJ1N/orf7lSFDO9kWmDxU/KwWdJt1uUATlRhBAFUG?=
	=?Windows-1252?Q?rETcSWi/x/3r8ymcYP7tP4pP/R/9ksxTpMDm7eZDBo4DO3CCz8ZMGYYi?=
	=?Windows-1252?Q?TGNyO0wqeUFoFkLS+ejVuzDB8K4LTyrnvaFFCIHBCFuUN61kCuI2I5G6?=
	=?Windows-1252?Q?gi3ftoDP6mWtkldIRi5P5/mdhqGtupzAoAVbyLt1SUN7f2aNrrgqHg00?=
	=?Windows-1252?Q?QXO9is3jjsJclpm+9vf7Vc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1176;
	5:QDUmR4CMnjHAyRvuQZKm0Y8DUM4nHqhV1iy4XRWm9hlF2KrKyVfsB22RuD9VyD6BW00hfzPTewxT+AuMiD9ujqzCjmoRd5PNuOwdZsuQO7PbGBCxLSNnuk9agvMXKutUZdbsV5P+fXA8d6awO7czUA==;
	24:06twxcMVnyNNejG8V4by3k8zJbyoEnsyUPt9M4IDG+9rowUosen4DChRoJQF7emfDI9VKMKna5WZaf5lN9OQXr74AJOCdo6KOZcL32d62Zo=;
	20:6HdoCX44vwI1rRSFBJKmqitl978zInpRcBF7RaBl4+FqYh7vRmEVwee4Gkw39zWHuNYF2Oqzl7ojOoRkqd65Eg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2015 13:10:49.6767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1176
Subject: Re: [meta-qt5][PATCH v2 05/11] qt5: disable debian auto renaming
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Sep 2015 13:10:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 02.09.2015 20:53, Otavio Salvador wrote:
> On Wed, Sep 2, 2015 at 2:25 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Wed, Sep 02, 2015 at 02:07:15PM -0300, Otavio Salvador wrote:
>>> On Tue, Aug 25, 2015 at 8:43 AM, Samuli Piippo
>>> <samuli.piippo@theqtcompany.com> wrote:
>>>> Some of the Qt modules have multiple libs, which prevents debian auto
>>>> renaming to work correctly. Instead of only having some modules renamed,
>>>> disable renaming for all Qt module packages, so that all they all are
>>>> named as ${PN}.
>>
>> I don't think this explanation is good enough reason to disable debian
>> renaming and that's why I didn't take it into master-next yet.
>>
>> The original idea was to let qt5 package with libraries coexist with qt4
>> ones, I agree that not many people are using this, but on the other hand
>> few people asked me to provide more granular packages for qt5, so
>> instead of disabling debian rename everywhere why don't we split the
>> packages with multiple libs or define LEAD_SONAME where one library is
>> significantly more important than the rest and the package should be
>> named after it?
>
> I have mixed feelings about this. I do see the value of splitting it
> more and I also see why people may want it in less fragmented set of
> runtime packages.
>
> Putting a second thought on this I think I agree with you. The
> benefits of splitting it more are higher than having less runtime
> packages.
>
> I think we could take a look at the package split done in Debian for
> inspiration and this would help to reduce many iterations to get this
> right. What do you think?
>

I think the package split is something we should do, and has been on my 
want-to-do list. This patch was an attempt to get packages in consistent 
order until such time that the debian naming works correctly for all 
modules. I haven't looked how Debian splits the packages, but that 
sounds good place to start.

