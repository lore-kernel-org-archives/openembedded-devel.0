Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0075.outbound.protection.outlook.com [104.47.38.75])
	by mail.openembedded.org (Postfix) with ESMTP id BA08B77BD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wKErqOLPQj7p/VnV+vhiHrLGLNaxvm6gYcQJqxKcVGE=;
	b=nkUCV6j5JcSflpVV+fne2zYAOfNmvpLM4vVBoTfeWW9UCCVXDX9JNnAw75zzH+2DBnpzU/Bi8xSfI3ccw/ZDNkPhQ/tS5PbvQ4f1q6EOlq4FgSWQwnekufelAAWuXOYDRl537rtcBa8+474R2PcEYE/z4H97HPp9WsSaxVB0FNs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	BLUPR01MB1396.prod.exchangelabs.com (10.163.82.30) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Tue, 28 Mar 2017 20:51:13 +0000
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	"Martin Kelly" <martin@xevo.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
	<1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
Date: Tue, 28 Mar 2017 13:55:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR1101CA0002.namprd11.prod.outlook.com (10.174.246.12)
	To BLUPR01MB1396.prod.exchangelabs.com (10.163.82.30)
X-MS-Office365-Filtering-Correlation-Id: a206f337-34b0-4eea-a616-08d4761c2c7d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423066)(201703031133072);
	SRVR:BLUPR01MB1396; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1396;
	3:wrNkpBRvH056HwmofeDR1NbKthprDRpDbz+ifKjPlD/kTsVk3v27y4u3okTlMx0ai882P9JCIOIvVzKtoPVSnMDEm95Uaj6l4Sgmf31DN2gjdYy3DRUGeLHaOI+gP+xFqO8ZrDsB4fKonxY2xAfgoHTq6VWMxL5Nur23vgx9upR2q48CDuRB5KvcjGL4SiSowmeHjUH+EEqH+T8FEAf7X/ynvGYEmK/MVjdoEToBDOn+AWrahDMfFARi4a2oqkn5H1wNntjtjX7SHpOQweaQ/9nTZg2EZ6xOt7ijwzBphfQXAv0KZdKlnL6B1kiHyiy3h/35Qzuwy8lxygd54N947g==;
	25:/aAbcX+N4hEx0M/nROocAyM3Ab9lbZy2eQS4nfdNVZh7wJNG01oAmExoZeDlO2IfzVhW5N3QI+tOx90lomMqmTmhaovO9iZYVrYEDvkM8Xwhrf5O96JNSYTcAMzoLjl2wbIOEbiUS9EytAiD2xIHxXHgnrkFwhw07AIlz9N2kPVMj+mTJCgWv0pjhRC/mElxcMxoQZptOM7mZlIs1gFXfRtmO04SzwdpSJfbxAR2i8g1MgzACiGFaC5YF8Bzv2famHbtKOSjNGep0syYwR9eNOV+cPdBzd9vQs9MY0Cv/TbCPt5VUCynBW/LPqKoa2TQQBsylHZ8bIbJBPNeSOrTijSXUtVRaycE15nalNPjm9egu3+3acEv+MZ8oxjfj9CjJRYN44A1qNhHmNtcFHa7YL3NLXzjr1BEXR+WKYqClMOWqok8g92XlyllQJmimgD+Rn9byV5xPMJayHKNNGHPSQ==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1396;
	31:E6rEKRA+9j6WGonG/l+29Xf7Y0LhLLwrI+IBZLe+ITVzKL/opF8wxV6Jh773EngRyY/VCGEzdHelHbEyUDqdV3/Z90NZPNijjcz881cQm4Ia9UO/rPfCq/2u8qPeLj9gTVoYQgXNFOJXW1oM2ln9drORAFtHgqCRdCiXhSFSwc7d0vRiugxyXDhxc4ANha1r64Q+pt9y/CfC9snD90EAY6aY1ekc5GS2GlyMyLBCdI9zyigskt1+PQLH6RWyTeFB;
	20:hQGvyymKmJKiBoBQT31xIlWmpZwxCeguQQ7Rk4scy0ub1ep0ofT33ZupkRCK3iFNGa63cHXartb+naTJqUwPt/672OmkwRkgI7WvT7hQzJJCGVZzDa0uMasxDzu8gCllJQPYThrk4Ez08MTaSO2aDKyqq2PBB9X8PJOTyR1Diu36k5FXvW5hdC3pbiIHGZCCwIp/4z0Gs8NoJLDg6HWsFoRNud04FnbgzbApA5nYDANPuOj/dVLyiokMF2oWUiAeQ9cl5oYnV5ugMTOjRDuLBlF/4DwMUJpCAzPszcFTcwWISVV9Aq9i+g69rH+kIJJO9GrjveIuW57qyKeiPHqddQ==
X-Microsoft-Antispam-PRVS: <BLUPR01MB13966DC994A27E6FD5C52AA4AB320@BLUPR01MB1396.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040440)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123558025)(201703131423065)(201702281528065)(201703061421065)(201703061406065)(20161123560025)(6072148);
	SRVR:BLUPR01MB1396; BCL:0; PCL:0; RULEID:; SRVR:BLUPR01MB1396; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1396;
	4:2a1/Trh+OLzENMTRszezfDlZYb9pzx4DXcsu9Jafa7lubKznSG5acfV4fkr55gE/sJqGXDSeJmq8jz9DDwMR+uMhYnC+bkZdn2vRuCA3ABf9tTLL4g8xXABySwGK/eYMBtvKhiSRlDKmTJWxSMemDUXrPXQLtxGksiEhzWwKwP9LlV7rk2PaTyjTEvuK5tSKtp2lv/dHPrrk/26x9hLwHNtUYzqJy9n1GUid0oDP5XLlovi0MCDvBRjA949ZMrseFkTSxaIywkqkoJKa8QUcJ0oRRYBEM3pCi/Coa5EQFWEKkRArBHq1E9vS4W2Svl9KlTLwUPEnVbM5BwvFtuHMRkXiGYj3pOT/1A3fqEMhaDDCdXKx0u9qIeoRGpyE3HVw0L8b2lSBvyU5OSCQDzHPewVS6YeSFbhwZzY9/dl0buxKpGOcnr3DPfEMqGU7jV+gWDbbUeLLeNGIlZyiOzfRbPT/XSrclcvLryn2hP8GAsV7Gp70hiES2a99oaHpZkPcThVaYe5vnkluOt6QFzhXCLL47QWzBzke1CduFz+YfE1woZse7sq20L5FeAZbYm7dnUzGunwrBg/JOOTAugkXU0oZLlOksZIWkVo1x1uOPCUvtXpYc+lQmSJUUULpJpRz+lceofHsVDCB68x0YkhraghEDG4NFPreGNtxboRfBTqdmhb8x3p0avmcCnaAPGi6O8/dQwQ5UDCnBbLWXhKPGP0tZBa6RdaRHTdL52oj91MaT2PWjKXlsS9Y4bOXDuWqZnxzi0OBcwDkKYdJMGUipw==
X-Forefront-PRVS: 0260457E99
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39450400003)(39410400002)(39830400002)(377454003)(24454002)(189998001)(86362001)(23746002)(229853002)(38730400002)(6246003)(2906002)(31696002)(6636002)(25786009)(8676002)(53546009)(33646002)(81166006)(2950100002)(4326008)(4001350100001)(6666003)(7736002)(50466002)(5660300001)(305945005)(66066001)(53936002)(64126003)(36756003)(54356999)(3846002)(47776003)(83506001)(76176999)(31686004)(6486002)(42186005)(77096006)(6116002)(6306002)(50986999)(230700001)(90366009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR01MB1396; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BLUPR01MB1396;
	23:9+jP2XwGQJfb3rVEGk/IdFGJnyXLCfSD4yeOi?=
	=?Windows-1252?Q?CWvFfdyEm9xXWSWRyWD1ngBZ1OHtvAPU7H/f7zNLqeyORWVmR9xGscO8?=
	=?Windows-1252?Q?IeNgczT+B/WJj/DeoCRNftt2tbhESdJBnpSfsY70vkRQwag7C9JuqYLJ?=
	=?Windows-1252?Q?06DuTJFG2FIUHBJ1TwOXSS7aySoRqiapfU0+QsCjRtZUcYrLZZBYeK+l?=
	=?Windows-1252?Q?bLSw1fTUtWC4incQ3aDO9XC3RzB+BvBc2l/8hk6Ef0hQU97i9Zj8e2sV?=
	=?Windows-1252?Q?EtBmRj0fDSctgM/mixkE/hBqHI5E9RcXKAVXI3bAnT3zd8jdEpG2syhV?=
	=?Windows-1252?Q?dm37wD0sb1ahiimq1MpUlMOBHtF/NFK+LlxdSczyZjUkdIas7fSzEKjk?=
	=?Windows-1252?Q?RoeIPnUEfc4jbz+wIuY4P7qMVMYJUxtHExirCIn1dSVe5d6JADvCEyZF?=
	=?Windows-1252?Q?SNyHgEmWEzbvEbzNum0Z6dS5dWGing/9w62laLGzgWUX3ssUBrpGJ2++?=
	=?Windows-1252?Q?miszI4BHJSR45B6+u5rzYkKx12eACCb51fasOIqCF4ZgVnUtPgzfd0jq?=
	=?Windows-1252?Q?49jnidAmW3FnG+PREFde44KqkgBdPMPfk4n4LZwZ1FfC8n+tAmuQcUB2?=
	=?Windows-1252?Q?62TMvieBNBsy9sD32FZYQjFvYejU088QI6Ip7R2N/Uq0ddzfGTkBvRVN?=
	=?Windows-1252?Q?R6EjIPAWGvB7jAunsUwxXT0VW0b/ZYUlT1+OZGXl225XlQWHECF+dgzt?=
	=?Windows-1252?Q?IWEn82Ti2HqQx7nT9dzLYhUAWx/Ud+ZOuMN7DRLB4GhJoU5Gd+tpcoLI?=
	=?Windows-1252?Q?VEQEV0FQp+ieuj1NKLkCAzUe+o6DtdQvwZGRuc6TGkgDMVnkf2j16WpZ?=
	=?Windows-1252?Q?Pzfb1s4pD/qKj/GW0UvfQyS2h1K6bQUr/Jg8MclVfs4qWrqAshd4fR9+?=
	=?Windows-1252?Q?UpMZE0QuJRK2ffQvu7ukPVW5vZTWCPG4TgxuD2UjRECHV1XaoQpVwXnX?=
	=?Windows-1252?Q?9kuBg+jsJft+JngvtVU9jhjh6Z8F6vnC8DZO2/dEIFmmouYp3u9zjagC?=
	=?Windows-1252?Q?QlTs654dz4lGb/6UhrFRFEeGhX5VP2gBgi5STloOXAcfBMYyyw5mm7vr?=
	=?Windows-1252?Q?hwFXjRz0KzEi3ZOWsRdthn3HNY9d61Q2wCyO0w+OVGwi/G2avhasXbqv?=
	=?Windows-1252?Q?YhNJ/C9fPgQmcGVjZY89VADO+0XwfVg1fusZqaNwk2EZBxNLgXlhe8wY?=
	=?Windows-1252?Q?NGaPZRnyxWOWB8NJpbLzNxT62TNaQy/9GP7NopG9MVNlFsI9QTnmjv3y?=
	=?Windows-1252?Q?wpW?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1396;
	6:7a0KfYBSjon3pUaG5SkXxsPMzCTvxfXFcGGbw8B4+Nzc4Uhi1IXTLetTwIzc7C09N6xaRsI4hDTawNQXNGIDiLwf7cxyCO+0oG2eBj2MUvCJpTdDIUd1PSRgDE6EXEsRHVuXI7GyzAVLRwidfr5VDZuD9qT+8F8sNhKk18jT62afcM5ZXMsS0yAlgxyrKU6cvVySZqAM5rf9ewXSlg4Opw29RImgVOyPf2NAFvFPnWFnu7TgNIfCuGAHlgy4up14yWLAVmHVY/v+LvPPuGXBLQtgly08I6+FhuwRjcP+2CwDCfO3h7ZQwq65En+er3TkIR9qywdCcaYAotvCzJ2mnkuynqLm9gqzRVY7KPzAqObfoqJscPYt9IwRmj3chFSQSg/GYHTUyqN418qBW8n10A==;
	5:f003XqW99goQllZvCNomTkIvIqlQETWi81RVNLaQvu5COaBvV1pqKH+fJcWy9rHmNh1quWAT4e5wl+KR3l7TeAF/2HW8x8Ye1cQs3eVOWFHV0goqOZdKsqwV2o1Lo4Y6U0iz2sU7ljuvynVz2Ds36zbzYOannxWeS/cRgNKf2VY=;
	24:CiI6+yLxk7yI4JQLVUZA058tDuB3yQlQTK2nI9eS8CUOYASwamQoNuzH2nF+xocMsqT9limBnaQ/R4JWR1b/H7cwNTmwbh+cG+EWWV3Ozlk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1396;
	7:hMvp5NmWqU+yyU4NJRtiegBPvDmXUVWjNSieafyfCE5kaef7ozChL04KFZP0pdf2eQfIu6g4Eti6MdD5muuH2jqtSbviVE86RhpJ4AETROBZ5f9xk3BJKUBB5ctBy81zmuzQhjlVqoEYSFwhwJ5tj85AbLp2fg0E0oUuLSyLP138lwVj+32s59KNjp3ZGZ1kVU5Ohm2gSIhTJe6NbZekeYJ8KaF+pVdNDXuHgeLzp3dzu4F+Vp13VEhzXObLjdUwKaqyZrbB8xBoYPNgm0Pd1565RQ5Afnfp5j1RooPADqKrRIzmS8gBXMQvIFJTpCvbqMXo9+vnajdNHf6/8HAQ/A==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2017 20:51:13.8312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR01MB1396
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest: add -fPIC
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
X-List-Received-Date: Tue, 28 Mar 2017 22:23:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2017 01:47 PM, Khem Raj wrote:
>
>
> On 3/28/17 1:37 PM, Andre McCurdy wrote:
>> On Tue, Mar 28, 2017 at 12:33 PM, Martin Kelly <martin@xevo.com> wrote:
>>> From: Martin Kelly <mkelly@xevo.com>
>>>
>>> I tried turning on the Yocto security flags and hit a compilation
>>> error due to gtest not compiling. Adding -fPIC fixes the issue.
>>
>> Since gtest only creates static libraries, compiling everything with
>> -fPIC might not be the correct solution.
>
> it still is going to be linked with a PIE binary then it should be PIC
>

Yes, I should probably clarify that gtest itself compiles just fine, but 
the failure occurs when you try to link against it. As an example from 
the AGL project, dlt-daemon fails to link with security flags turned on, 
with an error message indicating that -fPIC should be added.

More context here:
https://gerrit.automotivelinux.org/gerrit/#/c/8935/

