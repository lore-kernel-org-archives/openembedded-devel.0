Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gruending.net>) id 1Rg52C-0001vY-46
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Dec 2011 02:43:56 +0100
Received: by iakh37 with SMTP id h37so19244848iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 17:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gruending.net; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=FZQTlZOOAMEPbDS47ZcrtcQFz7za5zqTQ1YY/p/KaMc=;
	b=kTfYJz5gRKhnHhNKW5bFfJ2TeWhOQKzDhux/bHBBUoSg3thQJKCXYJOuk6zH3IepLE
	w1OKNBq7WoSievLn6ZxFC+eV+s7B6C7pz8eXjsnIZzAbSGAC4n6G6HtLw0lV6eNy6axP
	JdGq8COsfmnt/djDlKzhhYvVt3e7abTr1mp9E=
MIME-Version: 1.0
Received: by 10.43.58.10 with SMTP id wi10mr34468001icb.57.1325122596633; Wed,
	28 Dec 2011 17:36:36 -0800 (PST)
Received: by 10.231.31.74 with HTTP; Wed, 28 Dec 2011 17:36:36 -0800 (PST)
In-Reply-To: <CAOy7-nOSQ1-SjHjYqKo4t-N=ZDo7FPoEGBdTbabtTBSd78Cczw@mail.gmail.com>
References: <CAFggvfNpJGosK3E0pG=Qikk3QXLoOSHndVRqxoTkNUS47_pDQw@mail.gmail.com>
	<CAOy7-nOSQ1-SjHjYqKo4t-N=ZDo7FPoEGBdTbabtTBSd78Cczw@mail.gmail.com>
Date: Wed, 28 Dec 2011 17:36:36 -0800
Message-ID: <CACj0d1jmq+XG=ksy5QTr9DsNs7xRZKVCtKwiSqXcJ=UGWDD_Pw@mail.gmail.com>
From: Neil Gruending <neil@gruending.net>
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
X-List-Received-Date: Thu, 29 Dec 2011 01:43:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have the same issue. After some Googling it appears to only affect
Ubuntu 11.10?

Neil

On Wed, Dec 28, 2011 at 5:23 PM, James <angweiyang@gmail.com> wrote:
> Hi all,
>
> On Wed, Dec 21, 2011 at 11:09 PM, George Alexandru Dorobantu
> <gdalex@gmail.com> wrote:
>> Hello list,
>>
>> bulding a console-image for beagleboard, openssl fails to compile.
>>
>> The log shows this:
>>
>> openssl.o: In function `main':
>> openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
>> openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
>> openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'
>> .....
>>
>> Removing libdeps-first.patch solved the issue.
>>
>> Does anyone know if libdeps-first.patch is really needed?
>> If not, could it be removed?
>>
>>
>> Thank you
>> George A. Dorobantu
>
> I'm too experiencing this issue with my overo board too and is
> currently using the same hack to get pass openssl compilation problem.
>
> Please backport openssl from oe-core to oe-classic to solve this once
> and for all?
>
> Thanks.
>
> --
> Regards,
> James
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


