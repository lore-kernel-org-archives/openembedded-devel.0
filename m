Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U7Ufi-0006z1-ND
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 18:38:36 +0100
Received: by mail-vc0-f178.google.com with SMTP id m8so3732787vcd.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=BQsQxE/vkMald+wUnmEdRXvgMGid5jNKPPXAhgPHWQg=;
	b=ggVLO6X0uVrTXUWMonkbaiYRshy9cOu3gn9JxMoEEr/mS+dxUfQT8V355+bA1/KIFj
	Pmhg8/gGjoHUoK64gfokGaAHBMimOKBrZDOSsO4QaP5Nt9/kGBvpd7qXk+v5pjJYbipa
	jPN0/P4vBu2UILlHWqDYKHuWwbM8+7/WRxqjRRpGVvvbmqjaj51ZoJ/Bey1yAUn1t9Y0
	GkzZanXI2ovkd6Hngj5Ujf6pdUscSAKYvoi5h3ftPXhYJ8bWev7Q5rIeoePfbSkvQz3W
	oAwFNQtOFgOSUsRt3o/sxGhp/y581vPPyxUfrlRnBoc1R1BsNoXydmQ7MtrKgMJ7XLCs
	D9Tg==
MIME-Version: 1.0
X-Received: by 10.52.89.242 with SMTP id br18mr14528646vdb.22.1361208146366;
	Mon, 18 Feb 2013 09:22:26 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 18 Feb 2013 09:22:26 -0800 (PST)
In-Reply-To: <20130218165351.14989.14162@hoothoot>
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
	<20130218142026.7849.12017@hoothoot>
	<CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
	<20130218165351.14989.14162@hoothoot>
Date: Mon, 18 Feb 2013 19:22:26 +0200
Message-ID: <CAF6bG8dwjBY-bQnb8oBRXFZqoK9NzA+T2RGd+=qe0ffZhgKkRA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build dependency cycles in openembedded
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
X-List-Received-Date: Mon, 18 Feb 2013 17:38:36 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 18:53, Johannes Schauer <j.schauer@email.de> wrote:
> Hi,
>
> Quoting Takeshi Hamasaki (2013-02-18 16:07:36)
>> Before continuing to write reply,
>> I want to make sure about the usage of the word "native":
>>
>> in OpenEmbedded recipe, let's say, when you work on a x86-64 system to build
>> for target system which has ARM architecture,
>>
>> if you want to borrow a xz tool from x86-64 environment: you can write
>>  DEPENDS = xz-native
>>
>> if you depends on xz tool build on target environment: you just write
>>  DEPENDS = xz
>>
>> Is this the custom you assume?
>>
>> What I had to find was the word "native" is used to point the target environment
>> in [1].
>
> The terminology can indeed become very confusing. In our setup we use the GNU
> terminology for cross compilation.
>
>        build machine
>            The machine the package is built on.
>
>        host machine
>            The machine the package is built for.
>
> In some tools for dependency analysis we develop (dose3) we also use the terms
> "native" and "target". For cross compilation, native would be the build
> architecture and target would be the host architecture. By your explanation
> above, the terms seem to have the same meaning in OpenEmbedded so we seem to be
> talking about the same things. :)

 "Native" indeed means binaries that can be run on build architecture.
I think term comes from the fact that they are build as native build,
not cross-compiled. I get more confused when I want to refer something
that's needed in build system prior to OpenEmbedded build, the OE
dependencies. I don't know what's the official term in OpenEmbedded
lingo, but I speak of "build host binaries". Anyway, "native" are
something that are still built as part of OpenEmbedded build process,
such as cross-compiler to be later used in producing binaries for the
target. That might be important for your original question about
cyclic (/infinite recursion) dependencies. OE has both native build
and cross-compile part, and problems can arise in native part too. One
example is that pkg-config version used has not been updated for a
while since build of newer version would depend on glib, which needs
pkg-config to build...


 - ML


