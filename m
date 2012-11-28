Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TdedU-0004PI-PE
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 11:12:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAS9wenA026895
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Nov 2012 01:58:40 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 28 Nov 2012 01:58:39 -0800
Message-ID: <50B5E04F.9040003@windriver.com>
Date: Wed, 28 Nov 2012 17:58:39 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1354070578-5401-1-git-send-email-yanjun.zhu@windriver.com>
	<2179675.GOD3EuFAz2@helios>
In-Reply-To: <2179675.GOD3EuFAz2@helios>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libproxy: Fix for CVE-2012-4504
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 10:12:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/2012 05:44 PM, Paul Eggleton wrote:
> Hi there,
>
> On Wednesday 28 November 2012 10:42:58 yanjun.zhu wrote:
>> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>>
>> Reference:https://code.google.com/p/libproxy/source/detail?r=853
>>
>> Stack-based buffer overflow in the url::get_pac function in url.cpp
>> in libproxy 0.4.x before 0.4.9 allows remote servers to have an
>> unspecified impact via a large proxy.pac file.
>>
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4504
>>
>> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>> ---
>>   recipes-support/libproxy/libproxy_0.4.7.bbappend          |  5 +++++
>>   .../libproxy/patches/libproxy-0.4.7-CVE-2012-4504.patch   | 15
> Thanks for submitting this, but this is not the correct mailing list for
> patches against OE-Core. Could you please apply this patch to OE-Core master
> and then re-send the result to openembedded-core@lists.openembedded.org?
OK.
Thanks a lot.
Zhu Yanjun
> Thanks,
> Paul
>



