Return-Path: <asselsm@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id DEEA9607A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 19:06:30 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id c189so672204vkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc;
	bh=VswbsKE9zPJdCeoJ2gPVdes6UWsQpgCQ2MNf1rZ3e9c=;
	b=dmGDQ4cW3SVu/4tkCYvjjiQx+c4Yn2LnxjROOdA6KYrtq//IcIi8XGskP6ITB81d2u
	h95V5ggsiL0R0A9LVZOMmaUpsqy+RwJ2AU3gtbbwoM5kWLz93uNdbdt77GtxS6CPC/wp
	iuZDh7N5KifN+Aq+bx5Dx1Ygr45uSZqo52CjGoGQ57iroTeeVKwYsutHZKve62RWMQSk
	rIfZWjLHOSeYpJjpfOGxe9+SINQZYtE1a3NomQUQUoEYo23aod5iJtqEVlKbKQDQyjpP
	z1LgGhKhp6RXNXuttNEV5FPyz8qmj4TepFur91tsQpZxMPPwMcQnLyLyacOc61O/+8GK
	OMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:cc;
	bh=VswbsKE9zPJdCeoJ2gPVdes6UWsQpgCQ2MNf1rZ3e9c=;
	b=mqIvYw6bwOyLyRxatyfbw+rW9GPiik+cQMKz1pzX2f5tIjdKxm5JnKHh2kaYeLF/EE
	PJarfUNnSXYVnW3dW1KCMPNsD0nPYfWR4AVhDFV5ptNZSveT33ZX+wQCUzJiZiIkfJEJ
	kzbr2UvxEHP5G5F6YOKTTYT435GsV36CssT76SHkeFGejwYHC3iYAVVa9BQMYqhq+uvc
	8Qbx4IwstAZDFSggyulOnj0IrPVyVSEDxs993LAUrdvcMvfcURttOu5WSmEplK414ylx
	FtWOY9gxqz550q4M48fdGuHDYYUCZIfhyI71OV8Ne97rvF9jJnt7jQPjXXUrI0Ayw/7Z
	Tbsg==
X-Gm-Message-State: AOPr4FU6LykJ5kJcclgXkVBlbWvWZG2K1CzdgOy3Zl5eiWP52YUJB+3GhSao1V8FutuPz0nDiqkfe1KOvKtuNQ==
MIME-Version: 1.0
X-Received: by 10.31.196.197 with SMTP id u188mr352446vkf.139.1461783991045;
	Wed, 27 Apr 2016 12:06:31 -0700 (PDT)
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.159.55.142 with HTTP; Wed, 27 Apr 2016 12:06:30 -0700 (PDT)
In-Reply-To: <CAJTo0LYVVLJ1XqQKgVtf7FCw+GkzAdJX+MB6_wB6Ffo-w0u+pg@mail.gmail.com>
References: <1461697722-20378-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LYyrrO+5277fe2q3wZ8Z_JEsxU=0OqyXu5b7CK9hsh_GQ@mail.gmail.com>
	<CAPuovELikTayU6Q6xCSgR8tMHKjEyDE_zvCrcH_XUg68bJGr+Q@mail.gmail.com>
	<CAJTo0LYVVLJ1XqQKgVtf7FCw+GkzAdJX+MB6_wB6Ffo-w0u+pg@mail.gmail.com>
Date: Wed, 27 Apr 2016 15:06:30 -0400
X-Google-Sender-Auth: uExWxmjf9OXwAB3vic96ozGKrBw
Message-ID: <CAPuovEL1TFazRCtmu+9Pu-2ovG7PejOKBQFtXV_4yuzAr7X3BA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mozjs: fix configure host contamination
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2016 19:06:32 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 27, 2016 at 1:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 April 2016 at 16:15, Mark Asselstine <mark.asselstine@windriver.com>
> wrote:
>
>> > I'm not sure using pythonnative is the right fix here.  Executing python
>> > using the host python should just work, so why does importing ntpath fail
>> > using your host python?
>>
>> Correct. Host python should and does work but configure is executing
>> sysroot python and using host libraries.
>>
>
> How is it finding and executing the sysroot python without inheriting
> pythonnative?

I originally hit this issue when building Wind River Linux and I
usually take steps to ensure these changes are applicable to non-Wind
River Linux builds before sending anything out. It appears my checks
have failed me. Looking again at a Yocto build I see that host python
is being picked up and thus the issue does not exist.

Thanks Ross for the review.

Mark


>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

