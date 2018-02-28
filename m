Return-Path: <nick83ola@gmail.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 20D977886C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 12:58:28 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id g97so2083746otg.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 04:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=45tPOTsxqtv/wM0ftVpvimsyls0TTQ2c4anrwwoxyDc=;
	b=tChq5cwig5FJqt7Me8h2FSS9Zr+JLFFdun0+4eWLguPPQDc+8e71rltznTSgv74SNA
	7yFYZYULYAj+KKIKsG68qNiqcOzvbq6hfx9a2YfPkRo6a5MfPGOED3qfteUdlumDwIhn
	cvaV8wL3WCvyVlJpoRpdX1QKqzCxaZIjGB745zBvRsgGwKsPWrdVDc6QbH0DTikJZW0L
	Pzh5J8ftEOo1w9Br1evEzzGCgvifS8QzmEmHdY1KnlwA8FGBMA4lmAHeNzfILecIIeUu
	rYb6oD1hg22v7P2mRhSfk7YFsKC3RxWp6whx58+53D1aLt5+AE2hFRkZe1u4+gDO1Y2c
	wjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=45tPOTsxqtv/wM0ftVpvimsyls0TTQ2c4anrwwoxyDc=;
	b=XkCJ8qmpe20Qo2ezWCn7HbV5CaSumQy53izCHfOcL9mLDhiCyvJNKlwBljGgD6LPT2
	MUrNPC4wBi1O36izdjbIVOXjTJRS2lM6+9LpM/sXDv/01QVs0jSWhyy3C7rfFYLP6J2j
	WktIlCxcsTYuWR+mWC4O5iuubfth7d1xrzOBmX/VJK+13U2Lf5ctBhwtEyyppcO43fR8
	qD2IbbDUxACLO1YPyNp95dNi08omJiqyezB1HU1VZeWuVyGJ4oM/BayldXUfgKQ9SOFw
	pxbF7y8uTTB5T4b+2GLlQI3gQUByr44P41t86vE9atDsjVvNOsFPbFzubZ9sJGUXRrUq
	1W3g==
X-Gm-Message-State: APf1xPB4u6rdjiVim+MGG6gpsy3aK1p/Ffv+/YoxXc69fec4MUmLu97N
	l9l9OXzM7FDUqM3TutwvduUjN3j2Lj0sg9gywCSLGw==
X-Google-Smtp-Source: AG47ELs5+fCQMjUYoC8TDSSbXMhGaWIhUEGfdWFcV0hym5zYMx8p9H0IQVZEslAMlDZSFalO9faYIc6CgMpYBvHPXLw=
X-Received: by 10.157.1.4 with SMTP id 4mr13086751otu.328.1519822709760; Wed,
	28 Feb 2018 04:58:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.50.136 with HTTP; Wed, 28 Feb 2018 04:58:09 -0800 (PST)
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 28 Feb 2018 12:58:09 +0000
Message-ID: <CABPh3UNxJfqzMtZKNNtEAVzHBm--=fA7mxH5szKX+jm=Y2_AwQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: BUG: openjre-8 won't compile on qemux86/ latest meta-java repo
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
X-List-Received-Date: Wed, 28 Feb 2018 12:58:29 -0000
Content-Type: text/plain; charset="UTF-8"

$ bitbake openjre-8

Build Configuration:
BB_VERSION           = "1.36.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i586-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "2.4.2"
TUNE_FEATURES        = "m32 i586"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "rocko:342fbd6a3e57021c8e28b124b3adb241936f3d9d"
meta-oe
meta-python
meta-networking      = "rocko:a65c1acb1822966c3553de9fc98d8bb6be705c4e"
meta-java            = "master:fbe0b0eb30d93f5fa2101fb015f20c1dc118b4a6"
meta-openhab         = "nick-dev:9daedbd7dd9348f3107e58e57675f620dbfd75cc"

Initialising tasks: 100%
|################################################################| Time:
0:00:02
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: jaxp1.3-native-1.4.01-r0 do_compile: Function failed: do_compile
(log file is located at
/home/nicklunghi/src/yocto-openhab/build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.24176)
ERROR: Logfile of failure stored in:
/home/nicklunghi/src/yocto-openhab/build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.24176
Log data follows:
| DEBUG: Executing shell function do_compile
| Illegal instruction
| WARNING: exit code 132 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/nicklunghi/src/yocto-openhab/build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.24176)
ERROR: Task
(virtual:native:/home/nicklunghi/src/yocto-openhab/sources/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:do_compile)
failed with exit code '1'
ERROR: gnujaf-native-1.1.1-r1 do_compile: Function failed: do_compile (log
file is located at
/home/nicklunghi/src/yocto-openhab/build/tmp/work/x86_64-linux/gnujaf-native/1.1.1-r1/temp/log.do_compile.24312)
ERROR: Logfile of failure stored in:
/home/nicklunghi/src/yocto-openhab/build/tmp/work/x86_64-linux/gnujaf-native/1.1.1-r1/temp/log.do_compile.24312
Log data follows:
| DEBUG: Executing shell function do_compile
| Illegal instruction
| WARNING: exit code 132 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/nicklunghi/src/yocto-openhab/build/tmp/work/x86_64-linux/gnujaf-native/1.1.1-r1/temp/log.do_compile.24312)
ERROR: Task
(virtual:native:/home/nicklunghi/src/yocto-openhab/sources/meta-java/recipes-core/classpathx/gnujaf_1.1.1.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 956 tasks of which 946 didn't need to be
rerun and 2 failed.

Summary: 2 tasks failed:

virtual:native:/home/nicklunghi/src/yocto-openhab/sources/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:
do_compile

virtual:native:/home/nicklunghi/src/yocto-openhab/sources/meta-java/recipes-core/classpathx/gnujaf_1.1.1.bb:
do_compile
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

