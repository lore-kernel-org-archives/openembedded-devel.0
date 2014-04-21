Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 515C9601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 17:56:38 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id il7so1325429vcb.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=3UtLhhTQ2tofhSuEYUOd3MvSYk7tN08qiu5qst867WM=;
	b=rhgr27MgFJ7H8t36X3cbaV6r2ET78iXOWi7R05iyvenD3qo4L/uENFrG189xxEv/Yn
	khByRV4uA5qQ/L5eY6qzv0j3Cf7OTW5earUvsjP/sDuMfYhaHeJ/4eediY1rYNesc6AC
	XGImxW+wjNXrWxB7OR8IkTR6oKy3TLjhN6M0666lDL3M1d6TeXhAji/5poKzJIY64rZc
	EdxJQvTeh2csIdJfgAVNyImLcvnasYAWn1MflAPn716WG9XuHCve/cn+u20wvmfLi9Sf
	DzowmTs1JLvpNTu2emoFbTYftvdXPb1TZzLINhBrc7+DYYiSmWqxgadDyj1756DuAAyW
	UXJg==
MIME-Version: 1.0
X-Received: by 10.58.219.233 with SMTP id pr9mr36479129vec.10.1398102999087;
	Mon, 21 Apr 2014 10:56:39 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Mon, 21 Apr 2014 10:56:39 -0700 (PDT)
Date: Mon, 21 Apr 2014 10:56:39 -0700
Message-ID: <CAFeBWL69KhpCShJsMnd+Vu0nd5wp5u9KZ_+3Sjd9z0Kyhx96Xw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: xfce4-dev-tools fails to build on master-next
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
X-List-Received-Date: Mon, 21 Apr 2014 17:56:42 -0000
Content-Type: text/plain; charset=UTF-8

I noticed my XFCE image is blocked due to the following:

DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']

DEBUG: Executing shell function do_compile

NOTE: make -j 4

Making all in m4macros

make[1]: Entering directory
`/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/m4macros'

make[1]: Nothing to be done for `all'.

make[1]: Leaving directory
`/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/m4macros'

Making all in scripts

make[1]: Entering directory
`/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/scripts'

make[1]: *** No rule to make target
`/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/xfce4-dev-tools-4.11.0/scripts/xdt-autogen.in',
needed by `xdt-autogen'.  Stop.

make[1]: Leaving directory
`/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/build/scripts'

make: *** [all-recursive] Error 1

ERROR: oe_runmake failed

WARNING: exit code 1 from a shell command.

ERROR: Function failed: do_compile (log file is located at
/media/Build/next/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/xfce4-dev-tools/4.11.0-r0/temp/log.do_compile.22389)

I can only see xdt-autogen.in.in (not xdt-autogen.in) in the scripts
directory. This is the same with the previous version however.

Has anyone else seen this? Thanks!

Adam

