Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGsU5-0002aU-Vt
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 16:21:06 +0200
Received: by eeit10 with SMTP id t10so286935eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=+sABIvWekRsnM9tlnXoQyplXr29D46mXC8OhiNh6Atk=;
	b=Llc28V12tzILaEt+1NDuneS3/mHDMNbgsXDKuoB/SE+riEGYmqNG0Jop4J/PCdxL8K
	7NoG/6BUezKyJv2Q8IL6MWN9xM3OcqkCHM1T81UCmD+LkW7bC7+dGJkW+goF+csWY/gJ
	S3baZbhdoehmvqG1FshFiHFHEJfid6wA2Mp97bLMEMP1D70tpNXcaR4jBTBMAqKkx5uT
	1gsJ+9oBXh2ZQWtwpNJs9SFT9jqFEES8lq4S5BteyuEuxhmfPf6usCeg5H/l1x1vpxl2
	BJ5iw+QzomrFXoPShf9UKvt9KQLMyrEKgZuYWFL3ZQrV1Ye/8CTCbkU3YU3XJB66TuLV
	t2XA==
Received: by 10.14.4.201 with SMTP id 49mr1376278eej.0.1348668495569; Wed, 26
	Sep 2012 07:08:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Wed, 26 Sep 2012 07:07:45 -0700 (PDT)
In-Reply-To: <k3ub3f$evl$3@ger.gmane.org>
References: <1348595018-27413-1-git-send-email-raj.khem@gmail.com>
	<k3ub3f$evl$3@ger.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2012 07:07:45 -0700
Message-ID: <CAMKF1srusqy_s5PzaCkVFvT9SAyDJsirJiTkr73kAYfkUnXi1g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH V2] systemd: Upgrade past v191
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
X-List-Received-Date: Wed, 26 Sep 2012 14:21:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 26, 2012 at 12:33 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 25-09-12 19:43, Khem Raj schreef:
>> Booted on eglibc/uclibc i586 systems
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com> ---
>> .../systemd/systemd/optional_secure_getenv.patch   |   19 ++++++++++
>> .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   39
>> +++++++++----------- .../systemd/systemd/use-rootlibdir.patch           |
>> 31 +++++++++++-----
>
> The rootlibdir patch is wrong, it moved arch independent files into /lib64.

I am looking into that and will send a patch separately meanwhile consider this

>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQYq+yMkyGM64RGpERAmsoAJ0TLr38YpqwwrvEwB1+BQSfCeG2jQCgsrro
> smFdLuNHAaVG4BXqrkgaudE=
> =UZCz
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


