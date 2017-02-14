Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFE671A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 20:06:06 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id k90so177294208wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KZhMq5wfn5YWSN3Azf/C7ENZMikSLhedQkHFbi4GINg=;
	b=A4/QmRqLqr01Q/hF3WRQqDbXvGuGc+cksxExQtdFv8JyOFabd2EzLRWgOBBxEs0WLO
	/O5RrAjBuX9dnT+p/c414d6X9T+wfPS8O3TLzo9AIPJk3zBCVhukVJvGqftYmQNeWFpO
	BQiL+7tjjuPnf3XnkruR7elp9WMKdX0m6mBSZoACdMnL5ceIxnMuuhYEQbzUjtuRmCQA
	87OsGM4TC2Ny5dsuYDBwzz7AKZR9xfvFky23t6zGRnrnllAlnY7equniVVzdCltvfCN7
	2zfNoH3I2TVw+OKVTPL8IqZKzPSVvd0Co6lCZm4usIgVgSrqZ6UT2YV2VODFlKXb8upo
	3J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KZhMq5wfn5YWSN3Azf/C7ENZMikSLhedQkHFbi4GINg=;
	b=aOc+H6zdH4d8+gmwBk9pNgT4rIinim2gcrXY1ohFIgiGSt+3D2BqdBslROBsZf/FkM
	8NATjkKilxInLD4C1u2P3qX9Ot9YuGBSSXa6x8UfVUXJH5pytFmitv7I+lk8VQ63cfMl
	c1Vfhqon5eSbZp+TVEHVL2C04stQpFq8cfW2RHbyA4cJ5xtUZ5HCiGAL9DB6nZCrnxNu
	VGLQi7eWsYIE3nU9U5QzW64xA65QkBvK/Aaz4Au7dDj8cu1PHjosFbh2vzaldh2Xtv/9
	tP9Ih5VvpMMANkcWc7dXK1k8aWLLINd83/RZVSiSyEnvH+4d/tWILjyszIZgXA/cbayG
	zf8Q==
X-Gm-Message-State: AMke39ld6VHOPeY9ByxbHTLHdTA2yjVA3jXqpybKkCrnWOGPOYuatsu1+YWvvjOvwnvvzecwe743g+kG1ymQIg==
X-Received: by 10.223.136.109 with SMTP id e42mr26988211wre.14.1487102766791; 
	Tue, 14 Feb 2017 12:06:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Tue, 14 Feb 2017 12:06:06 -0800 (PST)
In-Reply-To: <1487101608.13854.367.camel@intel.com>
References: <20170210082811.GA3021@jama> <1487086509.13854.347.camel@intel.com>
	<1487093290.13854.355.camel@intel.com>
	<CA+chaQc+pT3pj-MJFHY=AJBdqgdrhqNmqM+k1KDm8-Nfir02Sw@mail.gmail.com>
	<1487101608.13854.367.camel@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2017 21:06:06 +0100
Message-ID: <CA+chaQfovfgVG6oiWcc=SV5ssZ-6qDY5z_AWg2pGoHZqNaum7Q@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: multipath-tools on arm (was: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-08)
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
X-List-Received-Date: Tue, 14 Feb 2017 20:06:08 -0000
Content-Type: text/plain; charset=UTF-8

Or you can try to force arm mode for multipath-tools build (by setting
ARM_INSTRUCTION_SET
in the recipe).

You can also see how the "bitbake world" builds are configured in:
http://www.openembedded.org/wiki/Bitbake_World_Status_Setup

On Tue, Feb 14, 2017 at 8:46 PM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Tue, 2017-02-14 at 19:08 +0100, Martin Jansa wrote:
> > Have you tried to reproduce it in qemuarm build after enabling thumb
> > in poky?
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=9213
>
> No, I haven't. I'm not familiar with the exact configuration of these
> tests, and from http://errors.yoctoproject.org/Errors/Details/130529/
> it's not obvious that one needs anything besides MACHINE=qemuarm to
> replicate the problem.
>
> Bug #9213 doesn't say how thumb can be enabled, and the bug #7717 that
> it links to isn't very clear about it either. Ross suggested on IRC:
>
> PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
> ARM_INSTRUCTION_SET = "${PREFERRED_ARM_INSTRUCTION_SET}"
>
> Is that right? Yes, seems to be - using it I can reproduce the problem.
>
> It seems to be a known problem. valgrind is marked as incompatible with
> older ARM, so the solution has to be to disable the use of these
> valgrind macros. Should I do that unconditionally?
>
> Doing it conditionally would imply copying the logic from valgrind.bb:
>
> # valgrind supports armv7 and above
> COMPATIBLE_HOST_armv4 = 'null'
> COMPATIBLE_HOST_armv5 = 'null'
> COMPATIBLE_HOST_armv6 = 'null'
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
>

