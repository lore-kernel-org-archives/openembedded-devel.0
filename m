Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TeGth-0005YQ-NL
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 04:04:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAU2ntJI013853
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Nov 2012 18:49:55 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 29 Nov 2012 18:49:55 -0800
Message-ID: <50B81ED3.8020303@windriver.com>
Date: Fri, 30 Nov 2012 10:49:55 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
	<1547659.oHFHv4PiYI@helios>
In-Reply-To: <1547659.oHFHv4PiYI@helios>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python: fix for Security Advisory - python - CVE-2012-2135
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
X-List-Received-Date: Fri, 30 Nov 2012 03:04:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2012 10:07 PM, Paul Eggleton wrote:
> On Friday 16 November 2012 16:53:42 yanjun.zhu wrote:
>> The utf-16 decoder in Python 3.1 through 3.3 does not update the
>> aligned_end variable after calling the unicode_decode_call_errorhandler
>> function, which allows remote attackers to obtain sensitive information
>> (process memory) or cause a denial of service (memory corruption and crash)
>> via unspecified vectors.
>>
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
>>
>> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>> ---
>>   .../python/python/python-2.7.2-CVE-2012-2135.patch |   12 ++++++++++++
>>   recipes-devtools/python/python_2.7.2.bbappend      |    1 +
>>   2 files changed, 13 insertions(+), 0 deletions(-)
>>   create mode 100644
>> recipes-devtools/python/python/python-2.7.2-CVE-2012-2135.patch
> This patch is also against OE-Core, could you send this to the OE-Core list as
> well?
OK. I will follow your advice.

Thanks a lot.
Zhu Yanjun
> Thanks,
> Paul
>



