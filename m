Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYDfW-0001KW-6M
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 08:11:01 +0100
Received: by yxe5 with SMTP id 5so748166yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=WanCMgyOdFedESY4Twb7DCMYrOOsyR2EfHNonhwn6tQ=;
	b=LaEEryr+npfN39X4fseXtR9qEutsUklPIGe9leTmBxVrYUZ9NQe0nRaMaZhKnxDUkM
	6ZZfSzpqgbqeKxx3+qWH2x+pcVd5U/pEUCPlX2rBUFl2f/ezACXt6iBmOTB2J9AxN2Jp
	FQVkKGGDYCKSql4mX8xlgM4W6yMPtpgU+7J5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=wmt6TqMDZr8uYmHBVP2yQD4ubzGWc23reXbYDRi278FIjQbhDsh15Ndqd3BFnY9ymN
	Lq6J/nufLxzSTDB/XeWAic/1SBvBtxdbPu79fOmFxXGIU3bAAD6IsKWZ8YuRyTRzLLmv
	UbFWNzRLuJNMcF0VEsrCeLNej3avuin7vkXfQ=
Received: by 10.150.174.19 with SMTP id w19mr3569310ybe.64.1264144120143;
	Thu, 21 Jan 2010 23:08:40 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 7sm696799ywc.21.2010.01.21.23.08.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 23:08:39 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u6w9m4x2mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001212304l1bb94efdr81be0ea00b973118@mail.gmail.com>
Date: Fri, 22 Jan 2010 15:08:27 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6w94dibmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a91001212304l1bb94efdr81be0ea00b973118@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to generate files in site directory
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
X-List-Received-Date: Fri, 22 Jan 2010 07:11:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Yeah, I am trying to do it this way, just hoping I will not forget some =
 =

important values.

It will be wonderful if there is some way to generate it automatically.

=E5=9C=A8 Fri, 22 Jan 2010 15:04:35 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Thu, Jan 21, 2010 at 10:58 PM, Guo Hongruan <camelguo@gmail.com>  =

> wrote:
>> Hi guys,
>>  I am trying to build an openembedded project for sparc machine. But =
I  =

>> found
>> the file for spare in site directory are not complete at all. I want =
to  =

>> know
>> whether or not there is some standard method to generate site file or=
 I  =

>> must
>> write it by hand.
>
> you can start with a copy of closest architecture.as (A bad idea but)
> a starting point.
> you should check for the values in there if they are really whats
> desired/available on sparc.
>
>
>>
>> Thanks a lot!
>> --
>> Guo Hongruan, Embedded Linux Consultant
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
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


