Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 86CD660034
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 15:21:53 +0000 (UTC)
Received: by pdnc3 with SMTP id c3so46108923pdn.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2015 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Fv/N/1293cQif9n3KJmwwhHXHMDdHf9u9HsiVbzBkAk=;
	b=nx392amAZTe8FSTOu4aeMqXtikJOBsXplErlf+74R28gptd9Ux81GjqYwdLnUob+Fi
	M/DtPOwrIWNXB8PC7oXtkjM/V48oPBxA65DGUVceVICrYPrza0nA/IKtSREvs4hj6IBW
	defaSwNYt66Euumk25j7OEed/PySEdCL5+uMngXHhuaP/t9PTsdQ4Fjxa7iOE/IAum1Y
	apFOwwfo2DnkbFNMKC2nsUJrU3xrYF5QHmJHANUxsrBwdPu3jXGtmtwr7cZ6Pojnsvj2
	54EPrkRj1AT3VKs6a9yEJ2KOHXf7ws2aXaZ5beY8shEF8ZytxhoJoveFw+HGRuiVerPk
	aCMQ==
X-Received: by 10.66.102.99 with SMTP id fn3mr141920084pab.118.1426692115087; 
	Wed, 18 Mar 2015 08:21:55 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:890f:8bf8:53cc:4b2c?
	([2601:c:a700:3ba7:890f:8bf8:53cc:4b2c])
	by mx.google.com with ESMTPSA id
	pa6sm28184456pac.45.2015.03.18.08.21.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Mar 2015 08:21:53 -0700 (PDT)
Message-ID: <55099809.9050509@gmail.com>
Date: Wed, 18 Mar 2015 08:21:45 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <54ED1B78.4040101@balister.org>	<20150227083113.GF2309@jama>	<CAP9ODKqFPNyF4ZoXv0C1Jw==opnmrj+cWAEHUhr6nXbbXUKw6g@mail.gmail.com>	<54FF59B5.20900@gmail.com>
	<54FF5A1D.90907@balister.org>
In-Reply-To: <54FF5A1D.90907@balister.org>
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
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
X-List-Received-Date: Wed, 18 Mar 2015 15:21:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Changing is my staging tree.

hope to make a request this weekend. I have a few more backports to do.

- armin

On 03/10/2015 01:54 PM, Philip Balister wrote:
> On 03/10/2015 04:53 PM, akuster808 wrote:
>>
>>
>> On 02/27/2015 05:41 AM, Otavio Salvador wrote:
>>> Hello Martin,
>>>
>>> On Fri, Feb 27, 2015 at 5:31 AM, Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>>>>> Please pull these three patches into meta-oe/dizzy.
>>>>>
>>>>> https://github.com/openembedded/meta-oe/pull/19
>>>>>
>>>>> These lead to a working PyQt4, which will reduce the number of
>>>>> questions
>>>>> I get about gnuradio-companion not working on dizzy.
>>>>
>>>> I'm not sure if we should do upgrades in release branch which should
>>>> receive only bug fixes, but I'll let daisy maintainers to decide.
>>>
>>> I agree with your concern but I also see the improvement
>>> (cross-compile support and like) of the new PyQt4.
>>
>> Sorry I have head down for the last two weeks.
>>
>>>
>>> At same time, I think this is not ready to be merged. Checking the
>>> code changes I think we need to:
>>>
>>> * split python-sip runtime package
>>
>> So is this split being worked on ?
>
> Yes. I sent in patches yesterday. Thanks for checking.
>
> Philip
>
>>
>> - armin
>>>
>>> This will fix the upgrade path.
>>>

