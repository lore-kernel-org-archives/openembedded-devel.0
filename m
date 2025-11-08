Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC055CCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 13:18:47 +0000 (UTC)
Received: from xmbg8.mail.qq.com (xmbg8.mail.qq.com [116.128.173.110])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1631.1762587938283235685
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 23:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foxmail.com header.s=s201512 header.b=QnHuTZ4W;
 spf=pass (domain: foxmail.com, ip: 116.128.173.110, mailfrom: wenyang.linux@foxmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1762587931;
	bh=/4Ys5iI0Lf5dUBRMDPPmNvaRU1f+s0MiSflHeBzJ9x4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=QnHuTZ4WtVhnwcRzQMmalJEDLUg8TuZNyYj6IpLW031OSXab1gfH6oSsLIT3teTkP
	 ozDm7HylMm0YVNVJv/6QYHj9KTwzpZxF980lPLF2/UsVNhkJuqb0bRfqo8DjvpqR9A
	 kuoAZy9vrCZZi00DHvSzgRMPvuqzpxpaThKgGOdY=
Received: from [IPV6:2408:840d:9120:633a:23c8:1608:9f15:714] ([2408:840d:9120:633a:23c8:1608:9f15:714])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 93910865; Sat, 08 Nov 2025 14:36:57 +0800
X-QQ-mid: xmsmtpt1762583817t6iz1kjdh
Message-ID: <tencent_F5643F9CE792AA336AF520A9C9D774466607@qq.com>
X-QQ-XMAILINFO: OYKM/pSuXZktjd2JghGfh50YwriVJtce4w2p/lpEU59YTI6JnwZjTLI34De/PF
	 5a4WlTZjC1wPB0UvpQiJ7Q5ZdRm9xFLRQGGVppbyaq6kPTfXnVtFZ1NYZJAzsaDImG52q6GXQpAl
	 w/n8YHGpVh4aL1ocmAeW4Qeks9YcE6ijGpaD5havJh3jLmjnALoZdQgntVG6yonsMMcnMuHVEc9u
	 0xmiGBhDSUfDFEGEsomdiTZ/kVhu2zOEV/tTnAYg5Cc1rrwPMLPqPbRG3KA6XQcsMezz1WedOqQd
	 i9UX04zzeu89bzrkKJvkh7t0nh9auPI0fQEacqNRoxLnoN+1VCqxOyJEuH4MySl4MdJiEMWfnJb+
	 eURLaMhezrrjjks2i47zw8r6XhGbfYpRx27X034ZfFMtWI3tud0hK4xs/TCgEHOngJmRr3EpLZKe
	 yxsyeULr+u/F0+XEjIHzb4EtoLKa8r4216gPLXJsU4PYdCcH5WgqmwUCL6zUDY08yC4TBB2Wco9P
	 H+KOUUeivLOcqoj0HZ+J1IE1pjAixkSP6Apd60EdYt2O49stKBnvPBY3KeyLWoTNOdgGjW11R952
	 aCLuqrTc0ANP/SNbnZ4r6wI9LwWgUmYFhiwr2ESmI/xlC/mJzt7qy9zEloTsph0PTzY+khJzdhEl
	 ZLcSfVlrdI8HVfo3kD2ivGFLfbkGvI20f27J7pWDx+3wGHVHrAUrYVhxuCX6MvrX3lmTuw7W6byk
	 GRQO8CTgf9tXZRjKqaqvjUzrY3H02E39/j6OmzQSjvncBRowU44NabwKqkiLcYQoB8SumXefh6wj
	 W+MayaDAbCbVigsEtVuL104PKjOWYi6Jxu6iHw/ejpZR8XzNdcSYIuVtbM5F8zTc4h1QYtsHg2dc
	 lWmwpoL818awCtbjzNQYYLMqGD128d482DTnOabAiQW8RP1YzELLLhtLBdioqiWFqpYR+apnniIy
	 ZdQ5G2rEAjY5DrRqoZOrjJm1GkhIDhJEpP94gs6bWJIfgADgIVlqH7sBBmhZLuzsaxqUdqj+8QBw
	 obLCW/da9QGlsm8jwTVpGVQ3b4VpZnttgaT3a5fcmE0c/21vr8jV/b9IkozmY=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-OQ-MSGID: <15d07759-268e-4949-8b71-b0d227348c8a@foxmail.com>
Date: Sat, 8 Nov 2025 14:36:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] nethogs: add recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <tencent_27FD029FC5AAAEA8AB837C276FD225996D09@qq.com>
 <DB5PR02MB102135E5DE3FAB1543D477544EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Wen Yang <wenyang.linux@foxmail.com>
In-Reply-To: <DB5PR02MB102135E5DE3FAB1543D477544EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 13:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121382



On 11/8/25 10:28, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of wenyang.linux via lists.openembedded.org
>> Sent: den 7 november 2025 18:02
>> To: openembedded-core@lists.openembedded.org; openembedded-devel@lists.openembedded.org; Khem Raj <raj.khem@gmail.com>
>> Cc: Wen Yang <wenyang.linux@foxmail.com>
>> Subject: [oe] [meta-oe][PATCH v2] nethogs: add recipe
>>
>> From: Wen Yang <wenyang.linux@foxmail.com>
>>
>> NetHogs is a small 'net top' tool. Instead of breaking the traffic
>> down per protocol or per subnet, like most tools do, it groups
>> bandwidth by process.
>>
>> Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
>> ---
>>   .../recipes-connectivity/nethogs/nethogs_git.bb | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
>> new file mode 100644
>> index 0000000000..29af14961c
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
> 
> Change the version to "0.8.8".
> 

Thanks for your comment.
We will follow your suggestion to change it to 0.8.8.
There are also 6 patches that will be backported because 0.8.8 has 
issues with meson.
We will send the v3 patch soon.

>> @@ -0,0 +1,17 @@
>> +SUMMARY = "NetHogs is a small 'net top' tool that can group bandwidth by process"
>> +HOMEPAGE = "https://github.com/raboof/nethogs"
>> +SECTION = "console/network"
>> +LICENSE = "GPL-2.0-only"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +SRC_URI = "git://github.com/raboof/nethogs.git;branch=main;protocol=https"
>> +
>> +DEPENDS = "ncurses libpcap"
>> +
>> +inherit meson pkgconfig
>> +
> 
> Add:
> 
> PV .= "+git"
> 
>> +SRCREV = "08daf76d8123943392c84a07108beea3e23ea39b"
>> +
>> +FILES:${PN} = "${bindir}"
>> +FILES:${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/lib*.so* ${libdir}/*.la ${libdir}/pkgconfig/*.pc"
> 
> Remove the two FILES variables. The defaults work just fine.
> 
>> +
>> --
>> 2.25.1
> 
> //Peter


