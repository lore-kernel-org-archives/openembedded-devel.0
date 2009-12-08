Received: from mail-yw0-f190.google.com ([209.85.211.190])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NHwcQ-0000lw-4D
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 10:44:33 +0100
Received: by ywh28 with SMTP id 28so5905067ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=eeUJ8gi4wiQ1MyWHB0BZqimH9qja8aQA7T+m7+0e3LU=;
	b=C78JcX5bqYgfgF0LS/i8rrbMBHY6xthlRD0aVOni0lQoUW53Wk6SykbgF8e9XNtorR
	pjYdsvS9HECH8IV2UgjSjpktWhNFlTCLvZisA9T8SAAoI2OzTb5AHZpehl+gPdXUbTQG
	os9Xq6ilssduBGQyWnk6F47hfo2o4t2gR3pvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=ugmK8tedhouw6utXbOJMRYJqkGQiNiGy3zWKuSz6WExaRjE883J9SesTPRBGcMQMug
	PUPgQIXXCvHW48XNo5BkbOYjSmviZKq3K43UREtJM8E7x9Su7Qj1jlbwx8zdxAHMu5/R
	4kyHeYVqBsL1mfBZ9OygrpDUih7uuyOD2zJxM=
Received: by 10.91.26.7 with SMTP id d7mr1787193agj.1.1260265367704;
	Tue, 08 Dec 2009 01:42:47 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.77])
	by mx.google.com with ESMTPS id 21sm4052390iwn.2.2009.12.08.01.42.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Dec 2009 01:42:46 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4lz932emn1qzu@guohr-laptop-ubuntu>
	<hfl1ft$sog$2@ger.gmane.org> <op.u4l246yhmn1qzu@guohr-laptop-ubuntu>
	<ac9c93b10912080106s655aba70kbed46f8a0c93c229@mail.gmail.com>
Date: Tue, 08 Dec 2009 17:42:37 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4l49bhamn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <ac9c93b10912080106s655aba70kbed46f8a0c93c229@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.190
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Does it possible to use pre-built native tools
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
X-List-Received-Date: Tue, 08 Dec 2009 09:44:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Hi frans,
   In fact, I need to build completely different images for different  =

architecture in different tmp directories. We need to do nightly build o=
n  =

build machine. So I think it would be better for several builds using th=
e  =

same one native tools set. It does not need to build native tools from  =

zero on every time.



=E5=9C=A8 Tue, 08 Dec 2009 17:06:27 +0800=EF=BC=8CFrans Meulenbroeks  =

<fransmeulenbroeks@gmail.com> =E5=86=99=E9=81=93:

> 2009/12/8 Guo Hongruan <camelguo@gmail.com>:
>> Hi Koen,
>>   Thanks for your information.
>>   I think it will save my time. Consider I have to build several  =

>> platforms
>> for different architecture, in fact the native tools is architecture
>> independent. So I think it is more reasonable to avoid building nativ=
e  =

>> tools
>> for other platforms. Is there anything wrong with me.
>
> If you build different machines in the same tmp dir the system will
> normally not rebuild native packages.
> Also if it is the same architecture you won't get a new compiler (e.g.=

> if you have two armv5 systems).
> Thinking of it, not sure what would happen if one version would insist=

> on using an older version of gcc
>
> Frans
>>
>>
>>   I tried to use ASSUME_PROVIDED to avoid compiling some native tools=
,  =

>> but
>> it seems that there are some building failure. I am trying to figure =
 =

>> them
>> out.
>>
>> =E5=9C=A8 Tue, 08 Dec 2009 16:07:25 +0800=EF=BC=8CKoen Kooi  =

>> <k.kooi@student.utwente.nl> =E5=86=99=E9=81=93:
>>
>>> On 08-12-09 08:55, Guo Hongruan wrote:
>>>>
>>>> Hi guys,
>>>> I want to configure openembedded to use the pre-built native tools.=

>>>> e.g: qemu-native, quilt-native when building the whole image, so th=
at  =

>>>> the
>>>> building can save lots of time. Is there anyone know how to achieve=
  =

>>>> it?
>>>
>>> It won't save you any time, since every tool OE builds for it self i=
s
>>> built for a reason. If you think a 10 minute buildtime improvement  =

>>> outweighs
>>> a month more of bughunting then look into ASSUME_PROVIDED.
>>>
>>> regards,
>>>
>>> Koen
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>>
>>
>> --
>> Guo Hongruan, Embedded Linux Consultant
>> Mobile: +86-0-13484056007
>> Skype: camelguo
>> Twitter: camelguo
>> http://www.gulessoft.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


