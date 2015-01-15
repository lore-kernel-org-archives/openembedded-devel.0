Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9E45D71637
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 00:11:54 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id f10so5939619yha.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 16:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=NH2v5b0OvfZCusmWaMclPUvn/ci05buDSvune2hrK/s=;
	b=UX9E52RZaWHkZOujNA/j9OZIZUYEOaNffxqljTYrRPRmv/LjkZUbBp2fhooKJtlPap
	ARMIPFTxpgWU0Cu+Kr7CROAdJKtL4xQvXdJOoQJ3XaVZkgf3ukPBpx1xpSgaaIqI20j3
	NmTj/pzX8mI3g0yhSVT9BpNKFWRCeNRzwLiY9stxA/l5qqggLbUcag0vgv7wSss75zF2
	33jdUE1aZmPaVINUMSxlpgEVhkmxEUUc+HIXBMTo98AyHe57/aM4IvUCeiq99/Rv39aj
	WC4cc7yCXQF33PxYYvUV8LRtNl+mhE0lcW40G+ZVrJ5+sZuYAe10VcTSDomudvuGyDlE
	Zm/g==
MIME-Version: 1.0
X-Received: by 10.170.174.197 with SMTP id q188mr4455014ykd.110.1421280714597; 
	Wed, 14 Jan 2015 16:11:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 14 Jan 2015 16:11:54 -0800 (PST)
In-Reply-To: <loom.20150115T002923-253@post.gmane.org>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
Date: Wed, 14 Jan 2015 22:11:54 -0200
X-Google-Sender-Auth: jHZTpKLXZRe7_4eOHe0Vl1kXTA0
Message-ID: <CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Alex de Cabo <alejandro.de-cabo-garcia@congatec.com>, 
	Max Krummenacher <max.oss.09@gmail.com>,
	Henning Heinold <heinold@inf.fu-berlin.de>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Thu, 15 Jan 2015 00:11:54 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

(I am adding Alex on Cc as well)

On Wed, Jan 14, 2015 at 9:52 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> Otavio Salvador <otavio <at> ossystems.com.br> writes:
>>  Can you prepare a patchset for it?
>>
>
> I'm not really convinced that reverting the static linking is a good
> approach as obviously something failed when linking dynamically.
>
> Both mails which reported the issue with the failing qemu-arm run were built
> for colibri-t20. The Tegra T20 SOC is a bit special as it does not have a
> Neon unit. Plus our standard setup uses angstrom which builds the linaro
> toolchain with thumb2 support.
>
> So the failing builds are failing with an unusual oe toolchain configuration
> and the root cause is the toolchain.
> I'm unsure if risking the failing builds with dynamic linking poping up
> again justifies fixing the build failures in an unusual configuration.
>
> If you don't think so I can prepare a patch, no problem.

It is failing on me as well.

Alex has found that QEMU -L command is causing issue so if your patch
fixes it, it could be an option for sure.

I think there's no good answer as a patch for test. :-) I think we all
can try it and see if it improves it after all.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

