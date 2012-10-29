Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ap.john.stirling@gmail.com>) id 1TSmAi-0008K1-9y
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 11:02:16 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1569394bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gL4FAamz7AYvTDMaK09bO6Gm8IUpF4eb72q0qxDEGfA=;
	b=UCg8+T86esNtg0sYtGz0ysz1wZsMxYJe4TwPY8zLoqsPE2CT8kzdzfeULEZacZg4k2
	gmhzvG02hmhz2+hZWDxRbcAww6bgw827l/XTJkWWgRwdePO58J1+wM7V1UEfgyE0w7JN
	6AcD4n9Zxfo5+tjLLwQ/7sGpHSE/xvfPOtSQulmhPq6jvVJA9btIeUAaQCunkNDw3VY8
	+5N4joSt7hznahJKXLD2PrJu9ZE8gusq6/p1OtOwL9uutdlKwE7x6Dynwt+XkY8EDiwG
	V2uyl1HqgayJHSfZ9D76x665GVWX7mTQjfVQfubLANKgeSdjKH5E543ALzICWJfw6hxF
	KPMA==
MIME-Version: 1.0
Received: by 10.204.128.144 with SMTP id k16mr9178308bks.64.1351504122614;
	Mon, 29 Oct 2012 02:48:42 -0700 (PDT)
Received: by 10.205.43.200 with HTTP; Mon, 29 Oct 2012 02:48:42 -0700 (PDT)
In-Reply-To: <CAGiJk9dmLv549hBTizFHw19xYNtuLnqHgWOh7bh8JMyE+t-b5A@mail.gmail.com>
References: <4772E7C9DD9B9D4EB442B23D7FE42EEA01F32E92@Exchange01.audio.local>
	<CAGiJk9dmLv549hBTizFHw19xYNtuLnqHgWOh7bh8JMyE+t-b5A@mail.gmail.com>
Date: Mon, 29 Oct 2012 09:48:42 +0000
Message-ID: <CABuzA3P69cVJddp_MskZgb71My6HPkjzAwXZY_cqsyr-m6ymSQ@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: sox-native
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
X-List-Received-Date: Mon, 29 Oct 2012 10:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

>

> > I suspect that going through each error and adding a BBCLASSEXTEND line
> > is not going to work ?
>
>
> Basically what you do now is: Add native providers for each dependency
> recursively (yes this could work).
> But maybe it is easier to generate the files on the target? (not native)
>
>
> If on target generation isn't an option for you, then all I can do is
> recommend "bitbake -g -u depexp sox".
> With this tool you can view the dependencies and don't have to wait
> for bitbake to resolve them / to see them.
>

On target generation isn't what we want.

I attempted to go further down the dependency tree and making everything
build natively but eventually got stuck with udev-native.

We could just generate these audio files completely outside of OE and then
pull them in pre built rather than attempt to get OE to generate them.

I'd quite like to get the native thing working though, but I'm out of ideas
now so will park it unless any OE experts out there fancy getting
sox-native to build..

Thanks for your help in any case.

