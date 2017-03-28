Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 873 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Mar 2017 21:28:01 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0077.outbound.protection.outlook.com [104.47.36.77])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC1B77AA9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 21:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8xMFeTMhGkO040NHQMlulWLgbyUIZVlsP7/yXptdT00=;
	b=FF/4IqkVHQPMYcLu+NVIPywEZsNmRExsjOiGKVtTby3FCPJr5Yia/kuxFO0qSQ50kxBz4X8gaZkyrTCP+SrfJu5n5gN6LSnF45/Nos6BwtIrmVeGeh8+sBUMKBJXjEOtyvtw2x3WFwiSNkEpT81yUoEt2ETNLEnPFP+mwhSXxys=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Tue, 28 Mar 2017 21:13:16 +0000
To: Andre McCurdy <armccurdy@gmail.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
	<1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
	<68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
	<CAJ86T=Uj+xCZT29k4ti9K4_Eaa3L9=CeCuqMbqqWRKiWbnJHZA@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <8c827e6f-f739-0913-f38c-fa2ffcea62e2@xevo.com>
Date: Tue, 28 Mar 2017 14:17:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Uj+xCZT29k4ti9K4_Eaa3L9=CeCuqMbqqWRKiWbnJHZA@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR18CA0038.namprd18.prod.outlook.com (10.175.9.152) To
	CY1PR01MB1406.prod.exchangelabs.com (10.163.18.28)
X-MS-Office365-Filtering-Correlation-Id: 8b4f5260-cf91-4a77-1dbf-08d4761f466e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423066)(201703031133072);
	SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	3:ebYD0kdd8gkKJ7w42vbmf55qjKzglnhd/XRZAYbls9Vonbe4G+1EdEHGHegwZnGWv/mr8aw3gGORttecjnerOEwyGi8C3IbKivFU8ty7ctJ61LgLwJi7ezq1R++4ODBAOVpYwrZP/22gWHQRtGLDvdLFGDTy9GwpAdu9kP1j8TPIuucsNUlSH/RSkPXC9mcJzSqzk8QoC4Yx6JISPuhM7x9wpfHohI/UrGvAnY1MacTC7jXa43SZ7rQ1nWIoL+2b6qg4ziBLJU107wXtv8K9EEUlzWZ7dlhVZDL8vyr7SqvNlCIERnOL7fjihsM9KrNTN1RheBlV0BfRe2H+1VoK3w==;
	25:GshRGEAL/oziSi4Bh5tIM/aDFsGjHOemKSuzC51ORM+R4lNuirHIMxv7fKHL6xtRBO0zB1PwdpwMiWLv6AwWI9m8zI0u1vBrVv7Olv4WBT09Yfgz8oQKTNZM+kASo2WhICE1BqdRSWamB9QMM0fE/rV+CzSJMl7m5d5C58NqMvwBht/QD0HKAKlE5H1BFP+LZIdu/y6lYukQlTDbmMIkuhRYKv9tEU85WDoAj63dY7QZXwcV1GO4OiMNRpZJncYUCLHj4mGkPefRt+eLQmVvqV59VY22iZfZXOtfYIZtY8CPLs15LlVtXaRYrEgA+YcgYnJK8ImVLg0glIJpXpFBgibZHdFfBuGnPEbEvdPA5s6h1ubNIH3Lx21aeTQ2ngEOztScgDsp9LgTEZb9t6ZbwteCEQUB8CvwiuHAhxkYKuRavC6mc9DklhnU72vqdaLB+CwxL0uOtuD0bRcbkFvtcw==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	31:My6GTFhS+v1DnouxgHE0UxZzZhLRj1ge/lGDujKmON83r3kdzIeI2QPNEvVFtbTu05tZ4e5oojcUIunSO1KK/Yu9kSYJfpwaB/SNzVc2ZORNWZXpmj+VAdeGFf4unp+NG0CnmAUzprq62RCcbmNGx6E4LzuUD8S3YL+Z2Fgthc/D2gYeo1Seb5ZxE94oIIOaxr4UuAKHPWQz96nRwBpsgvuplR58M9QQhf7KaYD6OIY=;
	20:QADOlXlfYIpAsOEFkEBW902VsNWmDYek7mrgB/aot+8fj3C8D90BCYhWr0HNF26tnV46H5U9B0NTPTVTkN0cXOJfYefcRKaY20C3vHPMLvEB9mVpc8Rz6xG24Dr4Zvmnz8ZHcgWJDc/nGvZfy4UIiwt+C++aN51/+WKp45nJwqYsj+8lBi5YRoYtNljen2WRs4pPYeYw5GS6KajYr3t3X7phIfXqnqCCIAvjVfsVArYpEn/GF5RYCEJdJ2dkFoW1hW+1uVc6UbuL5O16tdmcRzFj7uyfYiAxsUNqHtffGfWGCJreRYy2GKLbQqc7y9H5LjW815wMbU+QoJovglIokg==
X-Microsoft-Antispam-PRVS: <CY1PR01MB14060772EA0A1F06A2706E09AB320@CY1PR01MB1406.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040441)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(201703131423066)(201702281528066)(201703061421066)(201703061406066)(20161123562025)(20161123558025)(20161123564025)(20161123555025)(20161123560025)(6072148);
	SRVR:CY1PR01MB1406; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1406; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	4:AKLP3JEa8PTdz/jUQewQvM8paEw0QaynK3qOz0SHmmFmTyl0ZTgSQzqMDG8iAr5vxndjOOQTqlw+MayJyPzsb9uH3pyt+sEacVvAq3dOQRdKwtDc8jeIM0DtmZUak6pMg2dQJeEaTa+92pmnXSr8dANqz1raEvxiUvTuiRytYACX2DWwidVkv08MCL8bClfytO7+lk+MfvmAB98E12XnVa4FN6Eu2wWeOKlz/heZvU4tHy7AHn09gV6v0eeFrYZMXqdUZDt6qBQ5QMZDa5e2sH9PP7oeHg0SpzA5KcXYVtkq8eJF190OGqBWlksrWqm6jpCXW/mQg/7kwfW76+bmrnIMibQ7s1RkbK5jtyzBHV7yqcFtPk2/QCBcdjVq/jU0HLk9doQXT7w7oOw5j97Qha4godZmypDop3u7vgUe3Dfq3NaN3TDKDAC7OOy99PRoeqz1Vd8HLG4Xy3qOO7wckiGD0HuaISdXnfbjIK8dQvm+RG5KIvbIGykyqPbFQIiBG4XqFJWhEdqqMLlbG1phJlOdEac2i7R7kJfaq22vja6Gx4oox7H+KYk/N6Zi3BMqC5gqyD251b3WKm39J0M2TLLtCYrsKQx2c7QYt6uIfc4x9YiV/EImqIF8XwS/RNY/Gz9Gk0HzCZiQuaCXOnjGvAc36ZRdkBeTmC7vAJT4E++3DznWBHfcoFezevZ3QNtmUReCoDR6uC5tdFav6BQhCduEt20jKCbMOTKqeXCKLykWWVFVNQkYGYNEPCXs49Zq79olEb4aFluX08ykdljlpQ==
X-Forefront-PRVS: 0260457E99
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39450400003)(39400400002)(39410400002)(39830400002)(24454002)(377454003)(5660300001)(110136004)(54356999)(38730400002)(54906002)(6246003)(50986999)(53936002)(76176999)(8676002)(66066001)(6116002)(81166006)(305945005)(3846002)(47776003)(36756003)(1411001)(230700001)(6916009)(229853002)(2950100002)(2906002)(6666003)(93886004)(23676002)(7736002)(86362001)(189998001)(33646002)(4326008)(31696002)(31686004)(42186005)(4001350100001)(50466002)(53546009)(25786009)(90366009)(77096006)(64126003)(83506001)(6486002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1406; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA2OzIzOlJXQzBFNnlsZDBITUNMMDlZT2dMcGMzVDZx?=
	=?utf-8?B?QkxrbU9SU2hVZ00wdk5LaU1kSFBDNmIxdkpkcUFwSzBJSkF4SU91aldZOU40?=
	=?utf-8?B?WHZyZTNMUUtWVWdlcUxUci9GYmdTTlJnVzZHOUJlbnNDMUttdHM1TXJPdVBN?=
	=?utf-8?B?ajBqdjdOSTZlVUtPL2RvdlpjNUZpSFBkZ05LK3hFU20vN2V4cXZtWGdHSWhR?=
	=?utf-8?B?NVNyOVNwWXUvL3Z4VlhSeWd3RUdKeE9wcnp1UXRZa1R4dU13RWZIKzZudUhO?=
	=?utf-8?B?VU1zUVJQR0d5ZzV0RThBMTNLSjFGNUplclVXYjNqSlZydXNibW05amVuTC85?=
	=?utf-8?B?M3FEQWp4Zzl5Vi9nOEs3bFhVc2tEQ1k1dVJQc2luQjUxRG42S2RVbHNXQjdk?=
	=?utf-8?B?d2l6cWFlak9SdlZpMXl6VEJzaUdYSTZvMWhYbWVPc0xnZnVQdHpEc0JCb0xn?=
	=?utf-8?B?QUNZb2dzdnY1V1BzeEpaZkI3UldBS1E2NVpFUW1zeWRCL3FhbzBNMmtKaDBw?=
	=?utf-8?B?em9MNitZakVOUStvZmFwMk5lcW12Q1lyVEVFL1dXZ2hKN1JFdFlDVUgxbUIz?=
	=?utf-8?B?WVVtZ3kwdlRKMzJibWtwK2ZVak5jNFZNVzIvMkVrU1hiNTk3bkVlQzlIMmZ1?=
	=?utf-8?B?Q1Bra3NqYkpFQzRwRCtBN29LMThXMWUyNURjNUdVLzA3Ni83RE5lRkJaUFky?=
	=?utf-8?B?YzZWa1pWbitLUXZLcExwYmJLZVBYaU9nMkJyaWp2OTdiREFuSGVMQmZoMXF1?=
	=?utf-8?B?NERVem9OeGN6a1o4UUhqakJKdXlQQS9sYjEzMm9yUkZuak1BTkk1cWcwK0VM?=
	=?utf-8?B?S3I2Rmt3a2ozNzlmVFB4OHVFV1N0aTVMWkVkaTR1OTVxQ09UZ0tuTEZGVjlp?=
	=?utf-8?B?cVR2aUJoNW16T1BURlhJbjUwV3orZXVKdDJXeDFZUVhIc0c2YTdERnRyamgx?=
	=?utf-8?B?YXczUFJmQytBdlFUaGdCNHNyd2s1WU5SVTd1SWovaERCdnEwd3NlNzBTRVlL?=
	=?utf-8?B?VGVSVTN6d3kybkdWajJKU2tSSm0xWVVnTHJFQm16emcwcERYb3lSN2R3a1Fu?=
	=?utf-8?B?SEJacVlhWWJ2eng3N2o3QnlDWGdVNW80eW5QTTAxMG1INXJzcXVqNWpObjJw?=
	=?utf-8?B?TGcwaDZVeFJNYjNRTTdkeEx0VlRpak85RDM4QUpORDZiVHhOOGhLN1RjLzJr?=
	=?utf-8?B?bnFSUXRmT3dBcDU0SXpTU3Qzei9zMWdWU0ZWMjlnSkQ4eUVwZmE0cGc3NnBw?=
	=?utf-8?B?cGVHZ3c5Z0Q5TnEwbnUvaWsvbTJpS3puYXI4VmRDR3phUnI1eDJTdzZxZGZR?=
	=?utf-8?B?Q1BIK0dYVTZJVVJnZWhQVk5TeEZmR3FPKzNtckNJVHRnNmVKem5NSUR3akY3?=
	=?utf-8?B?ektTRzEzdXRNUVZ3dlNNdTkwbE1DZUZJelhHNVUrZGlLMUMzZGl5OWxNYVdO?=
	=?utf-8?B?cm04TDlMYzM4Y01FKzJ2NVd5QnBqcVpXbi8xa0NTWlk5UjhwV3U5cUFpTGUz?=
	=?utf-8?B?NFozMzhOSnFTWWt5bUpjQWMyTTV3czJTRGdYY2s0MFBCUTkvUkdiTHhucWc3?=
	=?utf-8?B?dlpQTHRWaFgrTjBUcEpjKytDcGYrRE04SjJ0V3JLeTNlUHdXaGtyR0pNOWxu?=
	=?utf-8?B?ZXVQQXNUWTlvYWEzdTBSb1hEdldIRUx2UEk1MnZhakp2SlhzVFRiNmFySWhZ?=
	=?utf-8?Q?e0LJavnXyoBdC8TLDcupdSXnoUR1aUSqAhSz8j9?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	6:NvdTDQhsYBuo48gpn2UBAqjfJxYoWnLT49eyR6DDVHk7f4OvCezgjSkR7MUfzsJojy0zb30JTJ2GH542eHE3zOrQeMbyFflke2uOioQevdXAep5rLCVQSgb33TP2M1G83vpUMhss6SaRvYFECy7CJK2e2yaZTLXLIYxeFZTxnzR6K6t+v2g8P3okIo3XdSOrBaCkRxoWdIOQ2Kt8m/IHt6GIFYSxs2NJPypc/tU9Ar12S/wYkL0wl472GvOoFuk/Gxwr+2Tl0RNOtyau99WxoMnBFP+te87SvZbOCU0ugiDrSe5KXzDy+QjAmVyQNhxWfgZugkl3hEeDvxlfBJhv6RJAvvD9e7WLvZOgyq2bC7LwrLDmyPZm46mhOkJLRmwFW8BaeZvH/mwxc9jc31nSLA==;
	5:3Qhk4L5fkV4CX9Me4H56sdHVz+rH6hC61qJMbIPX0nCrzLNfng8a2TlPUdu7bNXy3mM8//oFdGFmjp7yCAsTtg1s2b9f0ImE1SCwktuBy2H8EBICTj/70rqy/hl3EPagB4rWgdBUUgDxgifngVcE//S/Kd2sTKzYkn42ppeQcJg=;
	24:YHWQxJztOLBfHaadYLJc/ddH8qApn9z/AlHDBon9hNWB8cpI4HUsfqDCQ2+SJnolmJfbqbj8EBmdr72qD7xAU+uON0M3/lRtZvGTpBgKPOA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1406;
	7:E+/AXDQUZ0OiyWjUx0sqW/Za56UymxIN4ugljEiTtJH13tAaHXt5mNkrenXEMvwYiUHJtSE5fH5686dLsIDNCYs0E0Ne0bt3sJI52JwbwiS5hN/gtJOq/QlWlkdhgDokQeWQaZ/j6pLmln7yHyF2vH4lVV47QHVP+lBw3dzKEVaqxk6wC9Re8oklswAd/SSUIb6whR2+glXVQXyq7/wjzZLSxJoOWqTdhLI7XK6RWL4pXvvF5XXEZtfUGSkDNbyxflpNm5dWjim1s/qhEsf1R/D8pz0+aW9beZ7RYpGBjoSZMOaVpPWxfFGF1kh6I5X1CzLGc+xEHDhb0qSiYyzL+w==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2017 21:13:16.4808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1406
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Martin Kelly <martin@xevo.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 21:28:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2017 02:05 PM, Andre McCurdy wrote:
> On Tue, Mar 28, 2017 at 1:55 PM, Martin Kelly <mkelly@xevo.com> wrote:
>> On 03/28/2017 01:47 PM, Khem Raj wrote:
>>> On 3/28/17 1:37 PM, Andre McCurdy wrote:
>>>> On Tue, Mar 28, 2017 at 12:33 PM, Martin Kelly <martin@xevo.com> wrote:
>>>>>
>>>>> From: Martin Kelly <mkelly@xevo.com>
>>>>>
>>>>> I tried turning on the Yocto security flags and hit a compilation
>>>>> error due to gtest not compiling. Adding -fPIC fixes the issue.
>>>>
>>>>
>>>> Since gtest only creates static libraries, compiling everything with
>>>> -fPIC might not be the correct solution.
>>>
>>> it still is going to be linked with a PIE binary then it should be PIC
>
> Wouldn't compiling all gtest objects with -fpie work in that case too?
>

I am no expert in this, but from the gcc manpage, it looks like -fPIE 
will work only when linking with executables, while -fPIC will work in 
either case. Thus I suppose it depends on whether we want to support 
linking gtest against a library.

