Return-Path: <ryanelkholy@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E4C5360616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:26:00 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g185so24200098ioa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 09:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=qZtw/0Fopum/7r84/BUjl6FwfQ4gsJWIJwXNYgN9QI4=;
	b=dsfmzj6QIpT6uEYA1MVIdiXsG6eOXHIVw06iwmMrVN4LXsBzE9q/xlEcjjMiQhvnZC
	yRCB8/vqL5y7co9HfnR1cZ5bjTvQ3YSN42nUKyvlvMc9QPD8O5lfvF+fxDqUvB9nJ72/
	tKnzvNjSyYeVmRwLoYDBaJVvBrJUV6VRL2jh/eKfcjH9rQ4/V1GBD/M0uNeEtLWgTq2w
	JZQpFg4zEXUULdaVsXLH59PvmNza0IWZ0JImS0PT6qMmXJotQKkSg0CsrmddSvS4tSb4
	0VWNbwBk3BfWPiRfAQswM3jCp+dIFpeTwqQfYLdaT0iQUUsopjtAYW/l1qmFHr7lCdjw
	GbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=qZtw/0Fopum/7r84/BUjl6FwfQ4gsJWIJwXNYgN9QI4=;
	b=QsAlrBxc2kcxJ/2WlFixW4M/gWfdz9+0L9hjIUh9gx71YmghN9+HV9d46Q90fxq2Qs
	sBEvkzoGqwMTpBA2A+n4/bAzN2CwgEaeVaY2IP/TJeXllrHCIPPNFYaGBBuG0hzyXQ08
	RqPiiZR3RtCTRCwgnusm9mWfs6l78sNyRvHAzektvbIlnNLQ5tzzqwcy5M/IS7w7gkxh
	tjXGyESL6Mgk90tsLtpFNYbwxSpF+C6M/b6wP/TJU0qdf3BZRBHzjYujvesn7BwsEll+
	Bh9hFzFdwqMjVASWk7gi3qrenL4PaYffXwvRPJrhKlo9mefyrVGy6tgJcZbeiOymXFF4
	WpoA==
X-Gm-Message-State: AOPr4FUCKyy78ZSr51I4XB1ZTsaC6yN9n4fH7HGm1exno5chaqETEGvWjQwoxXRPclg3jPZb/RFlQuHV56q2+w==
MIME-Version: 1.0
X-Received: by 10.107.159.137 with SMTP id i131mr4388850ioe.29.1461083161058; 
	Tue, 19 Apr 2016 09:26:01 -0700 (PDT)
Received: by 10.64.78.105 with HTTP; Tue, 19 Apr 2016 09:26:01 -0700 (PDT)
Date: Tue, 19 Apr 2016 12:26:01 -0400
Message-ID: <CAMZfsd5MAhEiAw7YsMuS0bv1AMKh3ZTONV0tW5E+U83UvQN4nQ@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Qt SDK seems to be broken
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
X-List-Received-Date: Tue, 19 Apr 2016 16:26:01 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I have created the Qt SDK after including the meta-qt5 layer. Once the SDK
was created I installed QtCreator after including the environment setup
script at the top of the qtcreator.sh file. After I run qtcreator.sh and
QtCreator opens, I noticed that the Build and Run settings were not
automatically detected. I further realised that I saw the following error
under "General Messages" upon startup:

"QML module does not contain information about components contained in
plugins.

Module path: /home/ryan/Qt/5.6/gcc_64/qml/Qt/labs/controls/material
See "Using QML Modules with Plugins" in the documentation.

Automatic type dump of QML module failed.
Errors:
"/home/ryan/Qt/SDK/sysroots/corei7-64-custom_distro-linux/usr/bin/qt5/qmlplugindump"
failed to start: No such file or directory
Arguments: -nonrelocatable Qt.labs.controls.material 1.0
/home/ryan/Qt/5.6/gcc_64/qml
"

It says it cannot find qmlplugindump, but I clearly see it in the path.

Regardless, I went along and I manually chose the compiler/debugger/version
using the SDK and made a kit for my target. After doing so I made a sample
app that required the following:

Qt += quick qml

After trying to build I got the following compiler errors:

"
Makefile:659: warning: overriding commands for target `install_target'
Makefile:650: warning: ignoring old commands for target `install_target'
Makefile:663: warning: overriding commands for target `uninstall_target'
Makefile:654: warning: ignoring old commands for target `uninstall_target'
g++  -o testapp main.o qrc_qml.o   -lQt5Quick -lQt5Gui -lQt5Qml
-lQt5Network -lQt5Core -lGLESv2 -lpthread
/usr/bin/ld: cannot find -lQt5Quick
/usr/bin/ld: cannot find -lQt5Qml
collect2: error: ld returned 1 exit status
make: *** [testapp] Error 1
09:11:02: The process "/usr/bin/make" exited with code 2.
Error while building/deploying project testapp (kit: Minnowboard Qt 5.6.0
GCC 64bit)
When executing step "Make"
09:11:02: Elapsed time: 00:00.
"

Specifically, it cannot find Qt5Quick and Qt5Qml libraries, which again I
clearly see in the SDK library path. I have been trying many things to fix
this and I have even manually added the library paths, but nothing seems to
work. Does anyone have any idea for a fix?

Thanks ahead of time!

-Ryan

