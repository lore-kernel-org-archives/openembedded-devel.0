Return-Path: <niko.mauno@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0083.outbound.protection.outlook.com [104.47.2.83])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0DE745DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=1lEq/PpHpD5RZG9HyjebsZBRi9TTsuRoOgYuvnFggNs=;
	b=FpAPTHgXfZQESv1ReA3P+wFUSuEFiWyLoiSMlCARWqsyF55kfwzZ023M8CwBevWowiUV/TKf+2VdBEHXqppwqgIjUOUC49EkQQylEOketnc98s3rlSh72nSApfSKSnVzKvi3s9uSCdkGjdvA7vSdoAwLGLFp5dnQNmyEfkTzV2g=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from [172.24.64.128] (193.143.230.131) by
	AM5PR0601MB2532.eurprd06.prod.outlook.com (2603:10a6:203:42::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.675.9;
	Wed, 11 Apr 2018 09:51:00 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <20180409160652.4835-1-niko.mauno@vaisala.com>
	<fc468dd4-19fe-c91f-1c57-8dec70ff5701@gmail.com>
From: Niko Mauno <niko.mauno@vaisala.com>
Message-ID: <10355333-c489-1f50-5919-597b88ca1582@vaisala.com>
Date: Wed, 11 Apr 2018 12:50:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <fc468dd4-19fe-c91f-1c57-8dec70ff5701@gmail.com>
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: VI1PR0501CA0013.eurprd05.prod.outlook.com
	(2603:10a6:800:92::23) To AM5PR0601MB2532.eurprd06.prod.outlook.com
	(2603:10a6:203:42::18)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0601MB2532; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2532;
	3:lDKl+xEDDiqWWIJwN8hH5kGJHGCiLFzFLHMcVsWC1rf8zzwGaaOzzn7ikQh7ApjlbdMlIZwU38g0nB5LgYQva8/SLjZRMPzo1mmaWqZWxS0jqzAXqrxSBBVF7T1+NeXT8oL6tnoosu3lz9nYhhifcaIg6R8pcAcxaqbs+iF5JC29X7a7CoHs6HEh/DalMNW01xOV5+fQG2L0ijcKijdLUY1fdgo3UMD4Uo4DdDCnQvFUT962olnGXjHNSFK3Jl6c;
	25:ddfFXQ1UkAiZcD1RiqSgFrGQoiv9VavEtYiN9Jhf3NCmMJ13NkIc6gssQbBfxX+Hntd5hIAXNBgkmpZnoCfzdnYm7K08wm14V+dkVSAtXhe6MhKJh3WvVgWsVjv0JDq3cDF3O2V+uIO4RjEBfSEJ2NhXHCqG4Vz1Vp0nKGKVGqWM4QC1A5RYTYdBIiAJrRoUlVHxJy4ojTNYKPFSQ9zPpToZuUbzGGjYtgtQwOL1IQGwT6lSN8WaAFJWtGViTfjI1I6sGxGmA/lMDso7yi0AmSRJ/VP+tFviLzOK6WebiY5yK76HeW2euymMmdD8igb/KveIy/8fPpjl42p5NO1PXQ==;
	31:V6j2vbSeaxetE5z9WQcUfFCrqFDjQ6dj7MVtS8owjHdUDcU6Iv1YW1hMArv16dug9rKQTdzWVqNdJOvfd3rTh98n3woGNGFQHINZK1LZpoe1l9YzQjOYA30+octNDSAtJ3g86bsEyR2uRR4N9pGnZ7Tlo71WWFpvUGDdMNG/c+HqjrycdQfi8iM1V/buclPQ/Y6fqvAuWMw3IVaRxa4IJWcZylNk1nlDuCRx5yI830s=
X-MS-TrafficTypeDiagnostic: AM5PR0601MB2532:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2532;
	20:jcPsMyFE3c5ZnavPHeGfuI6Ks7DZYFpBdsAqMO6pP9kzW/qVrv9ICjML76yyN1B9qp1dOEiFUbzh+kzgqybej5nJ4s1SSErclAzl8n6Bll6sgoEh1SjVhv+5OkOoKut8+Azf76oGsRQqGnQuSZ9gyxCyRFYpEW2Jqgtu2MoXxuQ=;
	4:o8byil0i7aOg6b46QWOik8dHZFrh85E6wKy7GfI7U2Ks45YPn6jQewrME2Qwn+H9N/8okuC3ryMTvJsdWIwIl3ZggKv0q1+lDjSsSw4u2oKyvkbHzJkQQRiknebEh+o/KqWFni8BmKkdx7n3mhRl2iUuRwPrPBHhhULjo1dEgYS0w3+jm3BalJWTdmkWvQs7gbzkWWkq/871upcsiFcOgEbhcl1MX/7ChN149mOgfedtlo8JzPWUKmTH+TTSgvFkboQMUGseeY6ZjJir60Hpcg==
X-Microsoft-Antispam-PRVS: <AM5PR0601MB25320707BE00D68EB77DD40481BD0@AM5PR0601MB2532.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231221)(944501327)(52105095)(93006095)(93001095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:AM5PR0601MB2532; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0601MB2532; 
X-Forefront-PRVS: 0639027A9E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(346002)(396003)(39850400004)(39380400002)(376002)(366004)(199004)(189003)(105586002)(106356001)(230700001)(31686004)(11346002)(2906002)(25786009)(446003)(6116002)(478600001)(476003)(3846002)(956004)(2616005)(50466002)(97736004)(486006)(305945005)(58126008)(8936002)(4326008)(53546011)(386003)(68736007)(5660300001)(6246003)(52116002)(66066001)(81156014)(47776003)(76176011)(23756003)(65956001)(316002)(65806001)(8676002)(81166006)(64126003)(16576012)(7736002)(31696002)(36756003)(16526019)(186003)(39060400002)(77096007)(6916009)(86362001)(6486002)(26005)(6666003)(53936002)(65826007)(229853002)(67846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0601MB2532;
	H:[172.24.64.128]; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	A:1; MX:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?iso-8859-15?Q?1; AM5PR0601MB2532;
	23:4mV365kk+zHabC+4DNyzU/8X8NxUUslApaXm?=
	=?iso-8859-15?Q?hvlDiamrUP6hy+RADqlRGSMtiOPr2gKuYPBqJVQkwQl0YS7PGPxDq9ovy?=
	=?iso-8859-15?Q?bev7K9zc+ZEFY70IVtJ2HLf3NyPiUWyjmh8WpCCgiVvFEMOzBKbm23s6g?=
	=?iso-8859-15?Q?+6iWW8uUAREHHvyu2d9NHh7SAh9j9FO19WL5v1xH3RelKRZiV6ss0OWJ4?=
	=?iso-8859-15?Q?Iq2C48MWpIQxt2NRQRG6xf9o8Zf6Xe5qJmhh+eUVYOtvS+2446PNG2BuD?=
	=?iso-8859-15?Q?r9dSNxGG2bhxfDTMzV0Tcdq+Pka8Ndr0vHLoF1DGtvLq6cVhy6HQCbgxJ?=
	=?iso-8859-15?Q?TAzwoXuvKKWdzfMvYwSRfkf0N9K402AiNTt099Sv5upbaV06dD149G5Ml?=
	=?iso-8859-15?Q?0th1DyMc3UKvhuJXZFZNErXK3BREmPf0UzIchXvWlKu4+sfafRmiXzUTd?=
	=?iso-8859-15?Q?6X5OVz2C7NEUHqrR9AWWnXfD0TNgYVcp11u7rX0KLTwZ7mU9Q/Y2ywGoz?=
	=?iso-8859-15?Q?4gWB+ICN3lDH6/dEP9M/EyPS4rAf4HJ0Sl4A60YC8UFZkDPfXhZ/kGMH+?=
	=?iso-8859-15?Q?GyS4OMmeiqeLbVDx5svxkkP99EsZ4CYWJGPX5wCTgJuhTch7WZfvA6yn7?=
	=?iso-8859-15?Q?e6dEIn4/S99cgHk2kojcFE714s3qXWaSs9ZWjvrFBaUbJUDmKPtgYdE8X?=
	=?iso-8859-15?Q?QG4QdaMqrjAlzcYe/RtMOdZQJwvFd/dObpVWUDmCuFyRb4p8+dN5cX9Mo?=
	=?iso-8859-15?Q?51XqgOX4YGHJJdvSZCW1v4nAD4URp5IA7Vxh9St0Fuc8E1NO1Eb6NS1tw?=
	=?iso-8859-15?Q?x6Z2v7k2lRpqC7GdQeoGPQJig0zVVTHYWIvutDulVGPOY/Eu8Cueymenj?=
	=?iso-8859-15?Q?MCy8lz+u/TiccX9qJ9tHSXzgRJ8enyL0VXrH3CfJbZwyiY0rUk+gVg/4M?=
	=?iso-8859-15?Q?svtqb3NeW2W+L/VsYyZ8qpqvNWvPgp9SXU1mp4NJF+DXd38DZvrbMA+R/?=
	=?iso-8859-15?Q?45GrIzklHoTrMNZ9BGnm8V4HW0PKJ/qPnhekvW0tDd1UfQ5XIp/alSBRM?=
	=?iso-8859-15?Q?7plRVWlAbE6ETrFTXQL2A/NEn1nQUhQ1v4EZ9dbIRkm1+Voy4qYoohVOF?=
	=?iso-8859-15?Q?VxqY1CxD/sWDUxmdG9ihdntvZihAJ9sZtRTsgHqJuwgy1VWHTQfetWVMH?=
	=?iso-8859-15?Q?98XJVveZl2zKNEytG+od+WVh9CGQhGVV/jji67BkubhIAsbZWlFrRFJ7b?=
	=?iso-8859-15?Q?4YuExtBReSftPu8KY5XKIhdeE94BJM3pfIbLlZ/3u/eG4lpkwFHmDnZnc?=
	=?iso-8859-15?Q?xQt4zWFgV8RyLERwY3PURXBmMLaTGfNHAVMeL4Cs9Jax9EZHvw+B9Th4l?=
	=?iso-8859-15?Q?PkV7lTjmX+jwzN7vvtMTt1CQaVa0lRso8BwP6mprsOLKzfML+6vC/WFNq?=
	=?iso-8859-15?Q?91ow2IGpzmnLcFEiuB0wotAjpi6XIGcb93wmcFRNoxgUHw8HcykIueDKZ?=
	=?iso-8859-15?Q?EmVkXKCmQ/82WxxFOs2C5iSI4g=3D=3D?=
X-Microsoft-Antispam-Message-Info: Q0o5IniE8Wa2h/0Cw6GFM7P7aACEEqi2dtpQI7J0O6qALwjcZFrVSfmIoH6ejbCjyQppmAJbn83fcbYLbt9+zQi6rRMiXKCITdvW+i+3AvBzr/uL9/xS0RjQ4V6/lsauxkAUxymDS6uEekAzwg/4kUu8S+29rcuMAuTWSLXhAtNu3zqZuBi6DiYGk467DZgj
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2532;
	6:nZuYPnvkMQDjc+5Em7IFmHgcSjosdnhdm+Bic5d70ok8xvEFTDEWqELjkK7YXTNBDxTfCC3bzCRRCohijozK4/BfnD3d9T1XTHtDqbMahaKog11kwHKA27sXItxK8FvfyrCStjxb6rTiQ6lNfy7zCqsUxBYnBEciQiLha1ilow7GEWa1XPUJNtuKB/w861PNiD2PWFyQAgSa1TJyb57C7ER/IenozuVV/Z4pefHIOworYkMgb0sQVnG7l3yt6CcSiRC1BbMjgTHg6Fwb58qesbblge+OSb6D+Fdngo4wuJko0UxHlN0CPIupQGYh9f6/ntYfkKAvV03f0asJ7VL695ABugYLTJRdtsafof95SMVwpdrEKCIBEYbYNwT8AAfxJYP8h5C8Y764reDGrCKDY1RywdaIWTvOo9+s+rD2u0AVo8YyuRFsAHkXN1vAGxTlNCEKStRx2F3/xEHT8tJRvw==;
	5:fCDP4qzP2+4KPclmO/P7LGic5HCpfPu8W3kB/M+x84H8VSv0eGoJIOV4KuweEy0hHYaI9YhupLdBIuCOo7+B9fDwkNLJO+NulloWPqDT4UlsrP1VmiL7m5I4kzQxOp2sA6XFWac6IawuB4SccaL4kr9USL+u1xfL4tYgQe7v6M0=;
	24:Iyya4cAd8wge1MYG40VnTs7FQPivCFcVbd1wbnC2LAzRFeJ1LY1mUJaukuPLjnIq927jFqO5zUPqu9EZqRUxQito0N6fRljJAtCTtsaUJ/Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0601MB2532;
	7:8d5BtSlsLiM1tmS1PE1RpIw5v/GDiYyHHpWxyDZZoUQ+o3uZC+g1mZYIuDq6LMTcfzx4740ouv1qk1TUqlGTjm3eMjwtgtK3qlriCl/Duo1cK2pSb378O/kXYFNmbNDEg+aEWfLHu3BSsEX3jWNXTI1LuGVwVegSx0ejgQsfI8xvx4vHCzK6a0+GKIEYvDaR1cm1HWgNOMp2/aoSGMnVzxZ2qYAdpKXv5N59rJ5ysiS6jRlVjiYemghQm0Ip2K5E
X-MS-Office365-Filtering-Correlation-Id: cadf1a7e-0651-4d13-949b-08d59f91bb43
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2018 09:51:00.0979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cadf1a7e-0651-4d13-949b-08d59f91bb43
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0601MB2532
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] tslib: Align recipe content to better match v1.15
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
X-List-Received-Date: Wed, 11 Apr 2018 11:24:41 -0000
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/10/2018 01:22 AM, Khem Raj wrote:
> On 4/9/18 9:06 AM, Niko Mauno wrote:
>>   - dropped EXTRA_OECONF altogether as it contained just obsoleted or
>>     implied configure options
> 
> Perhaps a set of packageconfigs would be desired. It may not be
> reflecting exact set as seen here but whatever knobs currently are
> available.

Submitted v2 which introduces also PACKAGECONFIG

