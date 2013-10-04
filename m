Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id C456B60FA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 13:03:05 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so1791489ead.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 06:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=yLn4iwDZvnq9ASuqYc00/KWoLamPoJ5LKrvfOTFtYpU=;
	b=IZiNZ2HKZ6IB8gPjBI/duilWjbZsX+2ZIIIAMiuYOTYrGHrucfxVSc+tU9Jf9zuL9+
	ybKp6YClPYrU7or+ujCxYYIwISRYuBc268mWS5/Ta2mAt+Vf5pzfqbmU/CvWFDpGhbcW
	gBoe4viCI3eCdPWteD7HIEIMQibBnGmlRd3vfrSuvpk1Ax1p8lz4VKXyDKjFlcR1V2H8
	/5+CCTmF6sZUTAGoi7JmxtuALFwEHNjXWeFMa3tyvXvIvs0mBYbbPfBMOjeJ2GpBoznA
	MUP6OuwnPJ6H7Ys1r/H1Qabr2yGbpl9+FFGQSD3JfQwPfTEgGAL7qsgvBvxdkoRZk+qY
	Uctg==
X-Gm-Message-State: ALoCoQnZiWsVajaY+C2lxYg4ZMUqfAgMFMOTguNhBnVPBUptwStMXmD/PblD4okxD+4uJlM/bTxY
MIME-Version: 1.0
X-Received: by 10.14.179.9 with SMTP id g9mr194408eem.93.1380891786871; Fri,
	04 Oct 2013 06:03:06 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Fri, 4 Oct 2013 06:03:06 -0700 (PDT)
Date: Fri, 4 Oct 2013 09:03:06 -0400
Message-ID: <CALmOhgkzmnVuviF+cAzELRpdZomHDzpHn5-1dZEwa_xznG8JiQ@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Abhijit Potnis <abhijit_potnis@mentor.com>
Subject: meta-qt5, master, qtwebkit-examples build failure
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
X-List-Received-Date: Fri, 04 Oct 2013 13:03:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I tried performing a

    $ bitbake qtwebkit-examples

and had a build failure in do_configure. I was just wondering if anyone
else is seeing
the same thing?

    Unknown module(s) in QT: webkit

Full error:

ERROR: Function failed: do_configure (log file is located at
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/temp/log.do_configure.20401)
ERROR: Logfile of failure stored in:
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/temp/log.do_configure.20401
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function qmake5_base_preconfigure
| DEBUG: Shell function qmake5_base_preconfigure finished
| DEBUG: Executing shell function do_configure
| Reading
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/examples/
examples.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples]
|  Reading
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/examples/webkitqml/
webkitqml.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples/webkitqml]
|   Reading
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/examples/webkitqml/shared/
shared.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples/webkitqml/shared]
|   Reading
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/examples/webkitqml/flickrview/
flickrview.pro[/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/build/examples/webkitqml/flickrview]
| Project ERROR: Unknown module(s) in QT: webkit
| ERROR: Error calling
/home/trevor/build/yocto/tmp/master/qemuarm/sysroots/x86_64-linux/usr/bin/qt5/qmake
-makefile -o Makefile  -r
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/qtwebkit-examples-opensource-src-5.1.0/
qtwebkit-examples.pro
| WARNING:
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/temp/run.do_configure.20401:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_configure (log file is located at
/home/trevor/build/yocto/tmp/master/qemuarm/work/armv5te-poky-linux-gnueabi/qtwebkit-examples/5.1.0-r0/temp/log.do_configure.20401)
ERROR: Task 6 (/home/trevor/devel/yocto/git/meta-qt5/recipes-qt/qt5/
qtwebkit-examples_5.1.0.bb, do_configure) failed with exit code '1'

