Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBA06E786
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 22:44:57 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id at1so3424174iec.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2R3i7qE3liZ5cTyQWCcMGQCta+WDAfVEAAbwYEpiM38=;
	b=Xetu7QBnXIpyvPXSn24dHpCoVni3Y7UefS9cDuiIKQIYhBAdNDrR845m8SVRzvrYpF
	mjeQewvQTkKWaJFs02wdmoihBt3YQEYVafzAaiWAm8Yp8DOJGcSJOKQQ7ydXbiJGat4B
	2S4jgtE0psl48AY6HvvMXZpY2jvtjiHWa6y9xD7jcYRPJf5dIanBUr7yDrUddb0QqUGx
	V0oTBlW3UnsU+2xc9zdGE89D/JK1r8b3DltgC0FusHG1+bK80x9A7E4KQ4AYyOs4zecD
	bSRh/B4dj/5ezef/EcTuQKxixrDCnk6228HQZFFY+U+Ub/uAv37rvUuxK5mIPG1Uzke8
	GzDA==
MIME-Version: 1.0
X-Received: by 10.50.20.100 with SMTP id m4mr18573731ige.17.1392677098429;
	Mon, 17 Feb 2014 14:44:58 -0800 (PST)
Received: by 10.50.224.137 with HTTP; Mon, 17 Feb 2014 14:44:58 -0800 (PST)
Received: by 10.50.224.137 with HTTP; Mon, 17 Feb 2014 14:44:58 -0800 (PST)
In-Reply-To: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
References: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
Date: Mon, 17 Feb 2014 14:44:58 -0800
Message-ID: <CAMKF1sr6b1MNt4s08AmZKg02d79w9cM2DpqL3-u8OtpiP+S4kg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Andre McCurdy <andre.mccurdy@entropic.com>
Subject: Re: [meta-qt5] why does Qt5 build with ARM_INSTRUCTION_SET = "arm"
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
X-List-Received-Date: Mon, 17 Feb 2014 22:44:57 -0000
Content-Type: text/plain; charset=UTF-8

-Khem
On Feb 17, 2014 1:28 PM, "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
wrote:
>
> hi,
>
> does anybody know why in Qt5/qtbase.inc, we have:
>
> ARM_INSTRUCTION_SET = "arm"

there were issues with thumb1 and i guess legacy continued may be its not
needed any longer test it out and send a patch
make sure that when its using thumb1 then current logic still kicks in
>
> Could it be an a low hanging fruit from the past? e.g. before
> https://bugreports.qt-project.org/browse/QTBUG-16402 or
>
https://qt.gitorious.org/qt/qtbase/commit/a3bd9d4c0f3d9e80dbe35bd88649b245dca5f410
?
>
> as a matter of fact, for our project Qt5 (and QtWebkit) are building
> (and working fine) when built with Thumb2, outside of OE. Also using
> ARM instruction set instead of Thumb2 enforces Webkit to use the ARM
> version of the javascript JIT, while the Thumb2 JIT engine seems to
> work a lot better in our testing...
>
> cheers
>
> nico
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

