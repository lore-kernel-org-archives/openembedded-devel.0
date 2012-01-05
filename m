Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <angweiyang@gmail.com>) id 1RicaV-0007mq-9a
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 02:57:51 +0100
Received: by wgbds11 with SMTP id ds11so36332wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 17:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=69ClWOQhd0KCMTa4OJeFMw2WOoFll/W655yzXqC/l58=;
	b=UyC9TxyRdK0EJr6oBsJcWWNyhxFszyDErw0R/rmfzShT75fe5azHz+hIlLnVpi4WnA
	sqPP4231a/NjluJfxaoRN74tGx58+SIpzgjkoSTGZybAo1386oYv6lJLrbl9kUa67J6I
	u7DrZLMbpOXyT5/bS7iHwcP8n4Vp8ANqP4hlI=
MIME-Version: 1.0
Received: by 10.227.198.68 with SMTP id en4mr15972840wbb.26.1325728228908;
	Wed, 04 Jan 2012 17:50:28 -0800 (PST)
Received: by 10.227.158.20 with HTTP; Wed, 4 Jan 2012 17:50:28 -0800 (PST)
In-Reply-To: <CAOy7-nP8oc7ZObfc7We8j4Oj7ZTrhqs-upo8KY61tvqDcRG6-g@mail.gmail.com>
References: <CAFggvfNpJGosK3E0pG=Qikk3QXLoOSHndVRqxoTkNUS47_pDQw@mail.gmail.com>
	<CAOy7-nOSQ1-SjHjYqKo4t-N=ZDo7FPoEGBdTbabtTBSd78Cczw@mail.gmail.com>
	<CACj0d1jmq+XG=ksy5QTr9DsNs7xRZKVCtKwiSqXcJ=UGWDD_Pw@mail.gmail.com>
	<CAOy7-nP8oc7ZObfc7We8j4Oj7ZTrhqs-upo8KY61tvqDcRG6-g@mail.gmail.com>
Date: Thu, 5 Jan 2012 09:50:28 +0800
Message-ID: <CAOy7-nNBAYxHFzPsNwZrQ_WAzSVuzNEVX+V9OQ+XK3v69+1=Ew@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Jan 2012 01:57:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

On Thu, Dec 29, 2011 at 10:17 AM, James <angweiyang@gmail.com> wrote:
> Hi all,
>
> On Thu, Dec 29, 2011 at 9:36 AM, Neil Gruending <neil@gruending.net> wrote:
>> I have the same issue. After some Googling it appears to only affect
>> Ubuntu 11.10?
>>
>> Neil
>>
>> On Wed, Dec 28, 2011 at 5:23 PM, James <angweiyang@gmail.com> wrote:
>>> Hi all,
>>>
>>> On Wed, Dec 21, 2011 at 11:09 PM, George Alexandru Dorobantu
>>> <gdalex@gmail.com> wrote:
>>>> Hello list,
>>>>
>>>> bulding a console-image for beagleboard, openssl fails to compile.
>>>>
>>>> The log shows this:
>>>>
>>>> openssl.o: In function `main':
>>>> openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
>>>> openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
>>>> openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'
>>>> .....
>>>>
>>>> Removing libdeps-first.patch solved the issue.
>>>>
>>>> Does anyone know if libdeps-first.patch is really needed?
>>>> If not, could it be removed?
>>>>
>>>>
>>>> Thank you
>>>> George A. Dorobantu
>>>
>>> I'm too experiencing this issue with my overo board too and is
>>> currently using the same hack to get pass openssl compilation problem.
>>>
>>> Please backport openssl from oe-core to oe-classic to solve this once
>>> and for all?
>>>
>>> Thanks.
>>>
>>> --
>>> Regards,
>>> James
>>>
>
> My build host is Ubuntu 11.10 x64.
>
> --
> Regards,
> James

Can anyone advise on this?

Many thanks in adv

-- 
Regards,
James


