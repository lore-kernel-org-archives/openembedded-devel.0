Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id F1AD970016
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 08:19:37 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id m11so63270586igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 00:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=jdbJpcjzW5/wCMwQ8g54DJLKZM4m95rXehLQVePMDtI=;
	b=zzc9ToQ+Nvhqi5OFEPK9PY32pXP0LXbGo11doYHFVBFU+lONhzS1S9waCtpob7vI7Y
	70Fpwwlq3WDnxYmjI8eYJ8tAIggeL9aVhOVGefQDv3tsG/iH+GVQpxnm9unhNd79tGpW
	HV/MyspzaLj1Oy8mGz7aFZ6Jnugyc+aOsy9XeEcsvJA6/cu9L458syd40OFD35VBeEZo
	CZnbNv+yIS041Cv4CNd+tBCAwMl/XIMBhhXQUnmMw6KtWlUwowMJ3f9828K7PVqN3ziV
	CopZ0IWmLNU3HZm7pqEcihySLzahXZUyEutOMljptYzw5MBomX5i4+zbNxRzHYVWGzbz
	gRkw==
MIME-Version: 1.0
X-Received: by 10.50.225.1 with SMTP id rg1mr30011069igc.78.1450858777858;
	Wed, 23 Dec 2015 00:19:37 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Wed, 23 Dec 2015 00:19:37 -0800 (PST)
Date: Wed, 23 Dec 2015 09:19:37 +0100
Message-ID: <CALbNGRQzE+zG0GOPStWAjP6VMZr0YznhVfSD+X0b9CyzS=cKYA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] qtscript,qtwebking: disable thumb issues on armv7
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
X-List-Received-Date: Wed, 23 Dec 2015 08:19:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi

The story occured on jethro but I think it is the same for master:

We have a simple application containing a QWebView which segfaulted
during loading a page on a CortexA9 (armv7 thumb2). After enabling
debug information for qtwebkit and remote debug session the point of
segfault was detected in

qtwebkit: Source/JavaScriptCore/llint/LowLevelInterpreter.asm:1082
   callSlowPath(_llint_slow_path_new_func_exp)

Further digging around lead to similar source in:

* qtwebkit: Source/JavaScriptCore/assembler/ARMv7Assembler.h
* qtscript: src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMv7Assembler.h

In these files a class ARMThumbImmediate is declared and used in many
places. This lead me to the assumption that compiling for armv7
expects thumb support.

So I removed the

ARM_INSTRUCTION_SET = "arm"

and our application worked fine. To be a good boy I then build tested
with ARM_INSTRUCTION_SET = "thumb" and for qemuarm: It still fails.

So what would the right way to go? Something like the pending patch
for icu replacing

ARM_INSTRUCTION_SET = "arm"

by

ARM_INSTRUCTION_SET_armv4 = "arm"
ARM_INSTRUCTION_SET_armv5 = "arm"

Opinions?

Andreas

