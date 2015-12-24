Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE8D606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:40:31 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id jw2so89395217igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 18:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=iVa1O7AcfaQQsTilsvwbGuZRJrZXPoM0bKroEuVJaOg=;
	b=z1pA/qnu3gTdlIvOtGr5lWW97jVKi7wIm+zPFKPyCNkwGAvZXmco4KAMc4XHJr8AHV
	2rQ8P/PhmlvvDBjGSnvCq3AmyF+oIMdZxU8PbW51FO4DMBcqYMnYcEOjO2fWAqbJJdX9
	gxasbgXoh9tPinAOrjZsgh/tPaqP+HFxQGNjtPUv5RMVdPRdP7oNbI0Co5equFslYCxs
	Ac/oQcJcv3QADl63jE5L1X8ukZA+DX6cElzXFcHaPrAIlokr0CkKWEfHue31zNm4Tjan
	S7uZ6pGq09/DxZUCL5FJHyN9DYPEaIrIYRReseG3PAMOUbYcJkmPskPhtML7loPjY1W5
	vGRA==
X-Received: by 10.50.20.138 with SMTP id n10mr34651708ige.11.1450924832128;
	Wed, 23 Dec 2015 18:40:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 23 Dec 2015 18:40:02 -0800 (PST)
In-Reply-To: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
References: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Dec 2015 18:40:02 -0800
Message-ID: <CAMKF1sqPqAGdLgDdNn_rvjsOMVsGpK-L4Xf2zabt97ycoVF1BA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qtscript, qtwebking: disable thumb issues on armv7
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
X-List-Received-Date: Thu, 24 Dec 2015 02:40:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 12:19 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi
>
> The story occured on jethro but I think it is the same for master:
>
> We have a simple application containing a QWebView which segfaulted
> during loading a page on a CortexA9 (armv7 thumb2). After enabling
> debug information for qtwebkit and remote debug session the point of
> segfault was detected in
>
> qtwebkit: Source/JavaScriptCore/llint/LowLevelInterpreter.asm:1082
>    callSlowPath(_llint_slow_path_new_func_exp)
>
> Further digging around lead to similar source in:
>
> * qtwebkit: Source/JavaScriptCore/assembler/ARMv7Assembler.h
> * qtscript: src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMv7Ass=
embler.h
>
> In these files a class ARMThumbImmediate is declared and used in many
> places. This lead me to the assumption that compiling for armv7
> expects thumb support.
>
> So I removed the
>
> ARM_INSTRUCTION_SET =3D "arm"

LLInt backend with JIT  is only supporting thumb2 instr set for armv7+
so thats what you did when you removed above. There are ways to disable JIT
in jscore but you have to dig for it.

>
> and our application worked fine. To be a good boy I then build tested
> with ARM_INSTRUCTION_SET =3D "thumb" and for qemuarm: It still fails.
>
> So what would the right way to go? Something like the pending patch
> for icu replacing
>
> ARM_INSTRUCTION_SET =3D "arm"
>
> by
>
> ARM_INSTRUCTION_SET_armv4 =3D "arm"
> ARM_INSTRUCTION_SET_armv5 =3D "arm"
>
> Opinions?

this is right fix here.

>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

