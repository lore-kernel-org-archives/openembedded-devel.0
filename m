Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E16260721
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 03:41:35 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id l10so3162719igk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=DUAACvNjy92WmsBn55zwuGQxSP5hy0auaVUUVDEUIFI=;
	b=CrP7Q9FmRzdoKWJxbOQmGxDcepEP+9chNSarvkEDek05/ZFg5ysNAW0fWUsipgEQEZ
	Ugy6k5l9Sn/7LxO0IWi/v/N+dZ5Nc0nGCpffynK+c7ssC1WGUXS11Vh0y7JbpiqsEfrl
	Nqp2XP8gAyDVb8QCGFWLZzEesZLvGZDL3DGKAwRbvAsM/iqWRXKAYO3Ze7akefSM0VBY
	Nbhwky2u9UHkCejopO1HP0CzksLlPg/qtPxDCAHU5wAvKPoqFvZl1Ds5Nr/W/N83qysy
	O59xXqO3X32qm9QwX8XaMJj12WlUTBBDfP5NPyfCdHbpwBw/QdqVRX1VEVWueNCYs/Zb
	kWcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=DUAACvNjy92WmsBn55zwuGQxSP5hy0auaVUUVDEUIFI=;
	b=CTgVi2jPQ4OlCNYGGKzPhXiN4uEtPW/pm+JfW5iVpdD9nAleRPVKWCqjaEtw0fXFDM
	EgPr9u/A9CGDYvTtBA3bfSsLBjQhS+w5WMnHYMIARWQT1+V9JPg7AvDEgPBWNrLR3y+Y
	sGLuhQhhC8TIcKoiYuUxmLxieMNQBD3XsGnEgPA3bxs/qiVx8aa6nDU0QKMcJvljISi9
	C9ribRGmAu9pAHQvuMdgvW6BY153YHLfpmDwGKPObSRsecan7ovgqy1iUHubxDDJR3br
	XJoCUYg5pHEzAIrU8/Zp+caFVn5GbHEInRSdAQ3lcnhJ01Hv52m8LK4UO7+EWM5C/sGf
	tFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=DUAACvNjy92WmsBn55zwuGQxSP5hy0auaVUUVDEUIFI=;
	b=JixyXYtAX2cBT/vHTbCz3oB2Sd2ZrKjXecD4mkDcS7UIFt6IhRhFahQtHaTvwFb9cA
	TM3UR+GZfc339e2qtV/o9mJKzMn8M8GhdXDxf4FtRj6uyyo/iymjd+lUBj1hpqDUtaD7
	T6Y/RUXzvjm4k0q3cDWunnojWtKajeh7fb+vrVhbuBa1hj9rfcnzmB5+8iPNAXXA3vp8
	a0OntXlzVb3MjoPxs5Z1f2gZ71hoFi2ctkPIoOsR5y3hL5WJuXvjV1kW79N8HzMucMaX
	gZqrsRv4nRPkScFRbjcMfTgxf5XJDV+WVwc91/xxYBq7jwbRYBx83LnBdyVZ99MpJw4d
	ildw==
X-Gm-Message-State: ALyK8tL3b2yU+uyBESHvUmApVKQPnZB+8YCOH1SDcEe7KTd7WU3mmZgDEfCcw3veLt2Fw/zDT/Qr3Gxubq8FGg==
X-Received: by 10.50.160.8 with SMTP id xg8mr4040164igb.87.1464493296199; Sat,
	28 May 2016 20:41:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Sat, 28 May 2016 20:41:16 -0700 (PDT)
In-Reply-To: <328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
	<3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
	<328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Sat, 28 May 2016 20:41:16 -0700
X-Google-Sender-Auth: OZxeSQetEpHbOtf_CwF01889ZhM
Message-ID: <CABcZAN=sp3YTzAMZFSE0RrH3ebv_xpE6w8yo7++S6fytNma+aw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 2/6] luajit: fix build issues, obey more vars
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
X-List-Received-Date: Sun, 29 May 2016 03:41:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 17, 2016 at 9:10 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Rework how variables are passed in to ensure that more of our flag vars are
> obeyed, make it obey more of our target path vars, and use fewer of its
> hardcoded flags. Also add verbosity to the compile output for debugging.
>
> Without this, errors were seen for us:
>
>     | In file included from
> .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/syslimits.h:7:0,
>     |                  from
> .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.h:34,
>     |                  from luaconf.h:12,
>     |                  from lua.h:16,
>     |                  from lj_arch.h:9:
>     |
> .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.h:168:61:
> fatal error: limits.h: No such file or directory
>     | compilation terminated.
>     | Makefile:233: *** Unsupported target architecture.  Stop.
>     | make[1]: Leaving directory '.../luajit/2.0.4-r0/LuaJIT-2.0.4/src'
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Were there issues with this one? I noticed the other patches in this series
were applied, but this one wasn't.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

