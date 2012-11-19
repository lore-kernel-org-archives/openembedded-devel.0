Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaOhW-0005eU-Ut
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 11:35:39 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1931883dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=apvJsJ04w7whf3NR0PCPko35trG3l1pJ5gaDbaviIWA=;
	b=Vndc8AKEWkVVEpZ2Iw034r8u4wWO4FJK9+80WXCUy8XZT8EkkXSFzi3DpCsqHVNYfc
	tI+ELDpvKOzpU0CYCzNwe3es4CbiTvyhnqxkOvx8RigNpJqY2RZEcc6cA66IAjJW/HfF
	VU3X8Abbzma9JwXIxMRK1EdrVrxmT1ZCqdoQzzo6I7HoEKE/O8jTchwSy5F522iO3jKR
	4MpTQpptCmqPQPJaTkzMJyITuphTm+cI56x3IcinUMprnkzBLOhnFn0LfDyJsmrxiSim
	SP8aHgR7xELarJsSssZNw7y/B4Q+pRAptMa7CivB2NouxFwhlfPpoxV72n6Ho4ut1IJx
	65MA==
MIME-Version: 1.0
Received: by 10.66.90.101 with SMTP id bv5mr34272894pab.42.1353320496200; Mon,
	19 Nov 2012 02:21:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 02:21:36 -0800 (PST)
In-Reply-To: <50A99B43.7000503@windriver.com>
References: <1353056022-29560-1-git-send-email-yanjun.zhu@windriver.com>
	<CAP9ODKoX3=SV+Dei9s7NYUPtos_JtqewY_hi6ji2gEvYndfYPQ@mail.gmail.com>
	<50A998E3.9030103@windriver.com> <50A99B43.7000503@windriver.com>
Date: Mon, 19 Nov 2012 08:21:36 -0200
X-Google-Sender-Auth: wJjvte5ukNuLz_L3oQk0QXN2cOA
Message-ID: <CAP9ODKrVg7de+xk--BkKY7fTXthithhSCVae1FGvcVRZzraMzg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Mon, 19 Nov 2012 10:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 12:36 AM, yzhu1 <Yanjun.Zhu@windriver.com> wrote:

> On 11/19/2012 10:26 AM, yzhu1 wrote:
>
>> On 11/16/2012 08:21 PM, Otavio Salvador wrote:
>>
>>> On Fri, Nov 16, 2012 at 6:53 AM, yanjun.zhu <yanjun.zhu@windriver.com>**
>>> wrote:
>>>
>>>  The utf-16 decoder in Python 3.1 through 3.3 does not update the
>>>> aligned_end variable after calling the unicode_decode_call_**
>>>> errorhandler
>>>> function, which allows remote attackers to obtain sensitive information
>>>> (process memory) or cause a denial of service (memory corruption and
>>>> crash)
>>>> via unspecified vectors.
>>>>
>>>> http://web.nvd.nist.gov/view/**vuln/detail?vulnId=CVE-2012-**2135<http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2135>
>>>>
>>>> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>>>>
>>>>  I think this needs to be backported to previous releases, right?
>>>
>> Hi, Otavio
>>
>> OK. I will do it.
>>
>> Thanks a lot.
>> Zhu Yanjun
>>
>>
>>  Hi, Otavio
>
> Sorry. I do not know what is the previous releases. Do you mean denzil
> branch or others?
> Would you like to make it clear?


Yes, I meant denzil and danny (both released and maintained for now).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

