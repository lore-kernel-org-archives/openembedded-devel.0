Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0807B6010D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 09:57:17 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 186so214224159iow.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 01:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lh3tEL8SSs6abNyl/gekQTW3LlZrFOfWvyueCSZtQJQ=;
	b=gE9Ybh0NaiNU2CiLt4NiPJQbSkkKj2oMApUZYLO+aW0wvmeSKOtoe2pf7e1/XdKLbP
	m4KKu0C3mFNknP2u0It3o4pv7me0Ui2E15JjBxhPxxTmjfbhgSIYh4zP7xJiF8t2+dT4
	umlfEveYDzO92v/0J3YviIeEc9bKL3a+A60y2S5y85EeNnwdt9BFHkhTzSk5dmOv3zAs
	Kb9kXPziHLV5oCH2wZX5oZIQzXIeTXHJRb1ZN396er716BgqD9QZOucQsnhEMi9t02Qq
	3Y3q67y0SB/0cA4i6KUFipB8414D0zCG5gOrUCHezgkRCDl0DqrCq8FChlSeceuqyT0a
	ppfw==
MIME-Version: 1.0
X-Received: by 10.107.155.209 with SMTP id d200mr33595458ioe.133.1450864638397;
	Wed, 23 Dec 2015 01:57:18 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Wed, 23 Dec 2015 01:57:18 -0800 (PST)
In-Reply-To: <20151223094204.GA2569@jama>
References: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
	<CALbNGRSgYj_m2_uxFO4VEAND5Ru6aXLJgHkmKRmuC73Ys9YocA@mail.gmail.com>
	<20151223094204.GA2569@jama>
Date: Wed, 23 Dec 2015 10:57:18 +0100
Message-ID: <CALbNGRRPPHk4FXahtc=sMeKd4mGp+J1wW5aUQnN=dwofgLJK9Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Dec 2015 09:57:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 10:42 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Wed, Dec 23, 2015 at 10:13:45AM +0100, Andreas M=C3=BCller wrote:
>> On Wed, Dec 23, 2015 at 9:19 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > Hi
>> >
>> > The story occured on jethro but I think it is the same for master:
>> On master fix for qtwebkit won't be necessary - qtwebkit will go away [1=
]
>>
>> [1] http://blog.qt.io/blog/2015/12/18/qt-5-6-beta-released/
>
> True, but there are some attempts to keep 5.5* qtwebkit compatible with
> latest 5.6:
> http://lists.qt-project.org/pipermail/releasing/2015-December/002026.html
>
> so I wouldn't hope for qtwebkit recipe removal soon.
Yes - also in the blog I linked it was mentioned in the lower area but
my mail was already out when I read that.
>
>>
>> Andreas
>> >
>> > We have a simple application containing a QWebView which segfaulted
>> > during loading a page on a CortexA9 (armv7 thumb2). After enabling
>> > debug information for qtwebkit and remote debug session the point of
>> > segfault was detected in
>> >
>> > qtwebkit: Source/JavaScriptCore/llint/LowLevelInterpreter.asm:1082
>> >    callSlowPath(_llint_slow_path_new_func_exp)
>> >
>> > Further digging around lead to similar source in:
>> >
>> > * qtwebkit: Source/JavaScriptCore/assembler/ARMv7Assembler.h
>> > * qtscript: src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMv7=
Assembler.h
>> >
>> > In these files a class ARMThumbImmediate is declared and used in many
>> > places. This lead me to the assumption that compiling for armv7
>> > expects thumb support.
>> >
>> > So I removed the
>> >
>> > ARM_INSTRUCTION_SET =3D "arm"
>
> You build it in distro with ARM_INSTRUCTION_SET set to "thumb", right?
Correct

> Because the default is still "arm" so this issue you're describing is
> still valid in default DISTRO-less builds.
Ooh yes - so the right way for now (as long as other arm variants
don't fail) would be something like

ARM_INSTRUCTION_SET =3D "arm"
ARM_INSTRUCTION_SET_armv7 =3D "thumb"

If agreed I would send out patches for master and jethro with this.

Andreas

