Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD826080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 09:13:44 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ph11so77134225igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 01:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=e7mKS8e6GxvfsXVaqFt4xoOy08oHFUBSxllc7DE/41s=;
	b=tvHUHVg1H0iLJXmXtqHI6DrU0h9+4XnqSByC7L4Fq9uUcu8IRtCAy7JDr1BG/EKW7f
	tE3cRa6eIe+70gbtTC49XPCLpRYKKzo9ALILA0B+xAfuyfuouacCzSRBAocVvV1iU7Lx
	dtd+2dPigNLVxPW7YiGJIA1wSv19EyrExi4drh3GFunin1foar5QEU/9PE/05/LWt451
	Cm42cPSMllk7r78mR/jISOWPY7JBdcOnHnI+nTY77pOtZ9O56vNKnAg7ORit0IZ+DtqX
	2KQQr5lCELI/Zswe7Tpki0rbJtNVutRpjq5h6MBSyrTBMweMlQZBMpvyvQMLswmyGi1S
	MFxA==
MIME-Version: 1.0
X-Received: by 10.50.225.1 with SMTP id rg1mr30211948igc.78.1450862025521;
	Wed, 23 Dec 2015 01:13:45 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Wed, 23 Dec 2015 01:13:45 -0800 (PST)
In-Reply-To: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
References: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
Date: Wed, 23 Dec 2015 10:13:45 +0100
Message-ID: <CALbNGRSgYj_m2_uxFO4VEAND5Ru6aXLJgHkmKRmuC73Ys9YocA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 Dec 2015 09:13:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 9:19 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi
>
> The story occured on jethro but I think it is the same for master:
On master fix for qtwebkit won't be necessary - qtwebkit will go away [1]

[1] http://blog.qt.io/blog/2015/12/18/qt-5-6-beta-released/

Andreas
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
>
> Andreas

