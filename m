Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <angweiyang@gmail.com>) id 1Rg5fd-0003KY-Ge
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Dec 2011 03:24:41 +0100
Received: by wibhq7 with SMTP id hq7so6106856wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 18:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=m5x6QQY7ucLjiFn5Blte445ovz5H/tVg3O7M7kaSi9c=;
	b=Q9gWBMkwQPaCjZbTipLDWSwWw8pVEU/YFSLQKT4t4uVfPuonoClWGVj5+J1Q6byq5U
	cctNZBY/TmNa1EdfYLhPGjto5PgO64YShs/J30OfhxuGtjFG++I3fqT25pEd7uwge6ox
	yoIXtF6yIiBLnTH42roMRxZ5JtTLONSJPuVnk=
MIME-Version: 1.0
Received: by 10.216.131.13 with SMTP id l13mr18885135wei.45.1325125047178;
	Wed, 28 Dec 2011 18:17:27 -0800 (PST)
Received: by 10.227.158.20 with HTTP; Wed, 28 Dec 2011 18:17:27 -0800 (PST)
In-Reply-To: <CACj0d1jmq+XG=ksy5QTr9DsNs7xRZKVCtKwiSqXcJ=UGWDD_Pw@mail.gmail.com>
References: <CAFggvfNpJGosK3E0pG=Qikk3QXLoOSHndVRqxoTkNUS47_pDQw@mail.gmail.com>
	<CAOy7-nOSQ1-SjHjYqKo4t-N=ZDo7FPoEGBdTbabtTBSd78Cczw@mail.gmail.com>
	<CACj0d1jmq+XG=ksy5QTr9DsNs7xRZKVCtKwiSqXcJ=UGWDD_Pw@mail.gmail.com>
Date: Thu, 29 Dec 2011 10:17:27 +0800
Message-ID: <CAOy7-nP8oc7ZObfc7We8j4Oj7ZTrhqs-upo8KY61tvqDcRG6-g@mail.gmail.com>
From: James <angweiyang@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openssl failing to compile
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
X-List-Received-Date: Thu, 29 Dec 2011 02:24:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

On Thu, Dec 29, 2011 at 9:36 AM, Neil Gruending <neil@gruending.net> wrote:
> I have the same issue. After some Googling it appears to only affect
> Ubuntu 11.10?
>
> Neil
>
> On Wed, Dec 28, 2011 at 5:23 PM, James <angweiyang@gmail.com> wrote:
>> Hi all,
>>
>> On Wed, Dec 21, 2011 at 11:09 PM, George Alexandru Dorobantu
>> <gdalex@gmail.com> wrote:
>>> Hello list,
>>>
>>> bulding a console-image for beagleboard, openssl fails to compile.
>>>
>>> The log shows this:
>>>
>>> openssl.o: In function `main':
>>> openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
>>> openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
>>> openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'
>>> .....
>>>
>>> Removing libdeps-first.patch solved the issue.
>>>
>>> Does anyone know if libdeps-first.patch is really needed?
>>> If not, could it be removed?
>>>
>>>
>>> Thank you
>>> George A. Dorobantu
>>
>> I'm too experiencing this issue with my overo board too and is
>> currently using the same hack to get pass openssl compilation problem.
>>
>> Please backport openssl from oe-core to oe-classic to solve this once
>> and for all?
>>
>> Thanks.
>>
>> --
>> Regards,
>> James
>>

My build host is Ubuntu 11.10 x64.

-- 
Regards,
James


