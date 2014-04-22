Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id EF41E6084B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 22:59:51 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jw12so179629veb.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=e4vl7WBWjydI90wZCT7cIf/XHSxGxGOgeZYHYLKwdTk=;
	b=C/f5mAGRNoTlZJJ16Lr7N0TZfXBWjK76JtwUNjz7iYW520xmmeqm0F5mzYhDQS/sdv
	ifjlWJ7yzn0Burz73x75x8Hug59voHx28ZpKVQlFp9ChIwOTjTxwPpgf2axLv89bXbN/
	2nTon1qMRxb/TGbdBCWOkAcb+xz1E1PyaHSQGYPxd3ejm6gBPEWBuUnfJnVUH07003ab
	T6ud994lqnwUyGDWDF6xTJ4/UGNLd7zicMSM0T+ozpyUsDzjT9mLgRAN+/6VkQbhAJtQ
	lKSGVfRIFb1uu/NKc50NE28XhQv1/XiP89SsMbkQCTiTJ47q6R14C729COzPitOUHMOR
	3iUw==
MIME-Version: 1.0
X-Received: by 10.58.49.10 with SMTP id q10mr41530045ven.5.1398207592574; Tue,
	22 Apr 2014 15:59:52 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Tue, 22 Apr 2014 15:59:52 -0700 (PDT)
In-Reply-To: <CAFeBWL69KhpCShJsMnd+Vu0nd5wp5u9KZ_+3Sjd9z0Kyhx96Xw@mail.gmail.com>
References: <CAFeBWL69KhpCShJsMnd+Vu0nd5wp5u9KZ_+3Sjd9z0Kyhx96Xw@mail.gmail.com>
Date: Tue, 22 Apr 2014 15:59:52 -0700
Message-ID: <CAFeBWL6bneKQgZ2XX3mZjqJXuDbG0y7rLNOWskLAerUsXDV57w@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: xfce4-dev-tools fails to build on master-next
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
X-List-Received-Date: Tue, 22 Apr 2014 22:59:57 -0000
Content-Type: text/plain; charset=UTF-8

It looks like autotools bbclass began doing out of tree build. Switching to
Poky's 'daisy' branch, which contains a couple of autotools related
commits, fixed this issue.


On Mon, Apr 21, 2014 at 10:56 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> I noticed my XFCE image is blocked due to the following:
>
> DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
>
> DEBUG: Executing shell function do_compile
>
> NOTE: make -j 4
>
> Making all in m4macros
>
> make[1]: Entering directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/m4macros'
>
> make[1]: Nothing to be done for `all'.
>
> make[1]: Leaving directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/m4macros'
>
> Making all in scripts
>
> make[1]: Entering directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/scripts'
>
> make[1]: *** No rule to make target `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/xfce4-dev-tools-4.11.0/scripts/xdt-autogen.in', needed by `xdt-autogen'.  Stop.
>
> make[1]: Leaving directory `/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/scripts'
>
> make: *** [all-recursive] Error 1
>
> ERROR: oe_runmake failed
>
> WARNING: exit code 1 from a shell command.
>
> ERROR: Function failed: do_compile (log file is located at /media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/temp/log.do_compile.22389)
>
> I can only see xdt-autogen.in.in (not xdt-autogen.in) in the scripts
> directory. This is the same with the previous version however.
>
> Has anyone else seen this? Thanks!
>
> Adam
>

