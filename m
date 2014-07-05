Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA6D7029A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jul 2014 22:05:04 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id j17so3017585oag.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jul 2014 15:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=lPyDUFTScbUo009nXtfmIFh2GAeAIBFx+QjJBB1Uias=;
	b=C6EQ4cani0bpstjk1NV11ENcg8lK/U5ryydPUznC792Nfb/hrPTHIO7I+21c7plRxK
	RfQU8kjZ/uZ5CeTr68JncIjMXcLP4F6UXwDov+0SnkRVfLFSV54Jk+MV2b8TzccAixBx
	8T/x1nZOrRb3xEIucaY4s1eAodF4ercxwDy0AvLX3Db+JBp95YPH9jHFnDpvTahFnjbc
	utx6AQ6DtpeEaJ9Op97uC/k98IuxN0pt8Z1uxjTFPqwD36Wc9p1biUnViJeQ+U0Hpt0o
	BdT0pOm/Jp3P+vUTjmIwl35msSvxjjtRpe3vY46nuJpRC+bHL9xaMtYtr9pb5vdg3fSD
	heJA==
MIME-Version: 1.0
X-Received: by 10.60.141.67 with SMTP id rm3mr4338076oeb.78.1404597905789;
	Sat, 05 Jul 2014 15:05:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.84.164 with HTTP; Sat, 5 Jul 2014 15:05:05 -0700 (PDT)
In-Reply-To: <53AA0672.7070606@balister.org>
References: <53AA0672.7070606@balister.org>
Date: Sat, 5 Jul 2014 19:05:05 -0300
X-Google-Sender-Auth: CXrJC2B_7TUKnhFFhESKunVI9mw
Message-ID: <CAP9ODKoLDRFHVFAxQp57YiWb3NarxpmQoJNwgsnnh+gcRUwXEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Sat, 05 Jul 2014 22:05:05 -0000
Content-Type: text/plain; charset=UTF-8

Hello Philip,

On Tue, Jun 24, 2014 at 8:14 PM, Philip Balister <philip@balister.org> wrote:
> What's the best available solution for creating an image you can dd to
> an SD card? It seems like this wheel has been invented several times and
> I am wondering if people are converging on one approach.
>
> Bonus points for resizing the linux partition.
>
> How are people doing this today?

Sorry for the late reply.

First I'd like to support that 'wic' is the longterm solution for it
but it lacks good docs and has limited support for non-x86 based
archs. We've been doing it in meta-fsl-arm for a while[1].

1. http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/classes/image_types_fsl.bbclass

Different of TI's code it does not need root to run.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

