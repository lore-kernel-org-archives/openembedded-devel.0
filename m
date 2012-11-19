Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TaHHu-0005Gu-T0
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 03:40:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAJ2QdPX016131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2012 18:26:39 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 18 Nov 2012 18:26:38 -0800
Message-ID: <50A998E3.9030103@windriver.com>
Date: Mon, 19 Nov 2012 10:26:43 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
	<CAP9ODKoX3=SV+Dei9s7NYUPtos_JtqewY_hi6ji2gEvYndfYPQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoX3=SV+Dei9s7NYUPtos_JtqewY_hi6ji2gEvYndfYPQ@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
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
X-List-Received-Date: Mon, 19 Nov 2012 02:40:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2012 08:21 PM, Otavio Salvador wrote:
> On Fri, Nov 16, 2012 at 6:53 AM, yanjun.zhu <yanjun.zhu@windriver.com>wrote:
>
>> The utf-16 decoder in Python 3.1 through 3.3 does not update the
>> aligned_end variable after calling the unicode_decode_call_errorhandler
>> function, which allows remote attackers to obtain sensitive information
>> (process memory) or cause a denial of service (memory corruption and crash)
>> via unspecified vectors.
>>
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135
>>
>> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>>
> I think this needs to be backported to previous releases, right?
Hi, Otavio

OK. I will do it.

Thanks a lot.
Zhu Yanjun




