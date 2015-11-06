Return-Path: <ken.overly@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4335076104
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 18:46:58 +0000 (UTC)
Received: by vkgs66 with SMTP id s66so20677506vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 10:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=RJTUfwd6a0tRlKTabBlL/j6Ti/l/lH2WnNpojC0kTgM=;
	b=oxzuFpfu+FWgVrdrkqWV3NSJ9FY/9Rwt6T7zwraXlFgV6pitXzL1nk6mohW8CXiGDH
	Rjy6YNLgVBkWChbvhKWL7HDdmOrhsY1Ckt07X84SZAGLdamuOafeNnb3HiWgcgXpIa7B
	IXyvdw+U6rM50olQrGEH/NNWk8oBfEXlWImjphItm2Q3f2leeZ5fUwTpZ60gco6SB8bF
	sEf6PbKtcFb0kJCALIr3XkTw3DTjAL/eYqaXKUjVBNPZy6j9uACc1itLXpRtWciDVYC6
	Td1k+7h+eu3Aq3aO9blmIncM21OpMS9qsXXIfkf+lKSSpD53bScDTiChwiwM4Bkvo4/Q
	QuNA==
MIME-Version: 1.0
X-Received: by 10.31.157.6 with SMTP id g6mr15325897vke.24.1446835618780; Fri,
	06 Nov 2015 10:46:58 -0800 (PST)
Received: by 10.103.7.4 with HTTP; Fri, 6 Nov 2015 10:46:58 -0800 (PST)
Date: Fri, 6 Nov 2015 13:46:58 -0500
Message-ID: <CA+C6QiyG0oJ8OCMEhNDaeuWSzMjsrH=PdQWhmT=eC0xC59B06Q@mail.gmail.com>
From: Ken O <ken.overly@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Problem compiling python
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
X-List-Received-Date: Fri, 06 Nov 2015 18:46:59 -0000
Content-Type: text/plain; charset=UTF-8

I'm rather new to oe development having only been using it for a couple
weeks, so please forgive me if this problem has been covered before.

I'm attempting to build oe / yocto 1.8 for a Toradex colibri vf target
board using a Ubuntu 14.04 VM.  I'm able to build a target image and load
it onto the board, however I just noticed that some python modules were
missing.  I forced a rebuild of python using "bitbake -f -b python_2.7.9"
and observed a number of QA warnings that I missed the first time around.

Can anyone explain why parts of Python 2.7.9 won't build?

Here's the QA warnings:

WARNING: QA Issue: libpython2 rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-audio rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-codecs rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-compression rdepends on glibc, but it isn't a
build dependency? [build-deps]
WARNING: QA Issue: python-compression rdepends on libbz2, but it isn't a
build dependency? [build-deps]
WARNING: QA Issue: python-core rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-crypt rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-crypt rdepends on libcrypto, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-ctypes rdepends on libffi, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-ctypes rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-curses rdepends on ncurses-libpanelw, but it
isn't a build dependency? [build-deps]
WARNING: QA Issue: python-curses rdepends on ncurses-libtinfo, but it isn't
a build dependency? [build-deps]
WARNING: QA Issue: python-curses rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-curses rdepends on ncurses-libncursesw, but it
isn't a build dependency? [build-deps]
WARNING: QA Issue: python-datetime rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-elementtree rdepends on glibc, but it isn't a
build dependency? [build-deps]
WARNING: QA Issue: python-fcntl rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-gdbm rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-hotshot rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-io rdepends on libcrypto, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-io rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-io rdepends on libssl, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-json rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-lang rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-math rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-mmap rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-multiprocessing rdepends on glibc, but it isn't a
build dependency? [build-deps]
WARNING: QA Issue: python-pickle rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-profile rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-readline rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-resource rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-sqlite3 rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-sqlite3 rdepends on libsqlite3, but it isn't a
build dependency? [build-deps]
WARNING: QA Issue: python-stringold rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-syslog rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-textutils rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-unixadmin rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-xml rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-zlib rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-misc rdepends on glibc, but it isn't a build
dependency? [build-deps]
WARNING: QA Issue: python-misc rdepends on gdbm-compat, but it isn't a
build dependency? [build-deps]

