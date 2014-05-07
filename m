Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 38DD3605F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 08:40:38 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id w7so876080lbi.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ar5rsRt04vxERDi4mcCpyBxmCbSj3XHcRUaMEzi53KU=;
	b=A7YEFUr5xtdZ3J5ZRTy2jl8ikvS7EBUyBsQWtwIacMnL5N1Jk9yG11eCOdFyB81TL/
	I55dIKc/JNoT61mfIMjgAXgcHARI14BKacr1thYsyTIjKrGILlO9cCpH5jAwwBwqoFQv
	d3rmuWVbDY3VpLiVgZ9yGdB28g0b/r1odLcg4HefXMgb9iWj1b+7A0jx61rOrmD42gOl
	8RXyKjq+vw/jp8Y9zUp+4Si9lH9JhC/wbx7yAG1VcYtQ9k8tl0f0J/IJzXI+igLgPiZR
	NEtwtCZ468opHqq8k74mEl+Mlez2WleouxvM90sThdZwiv+B9MyRwDpx3z53p6nNL3UH
	dV9w==
MIME-Version: 1.0
X-Received: by 10.112.199.234 with SMTP id jn10mr14567619lbc.8.1399452038929; 
	Wed, 07 May 2014 01:40:38 -0700 (PDT)
Received: by 10.112.36.164 with HTTP; Wed, 7 May 2014 01:40:38 -0700 (PDT)
Date: Wed, 7 May 2014 10:40:38 +0200
Message-ID: <CAPbeDCnwm8U-NTnmZB8Y5GSCc+WtORstG4JoFi1czfvTHpLEVw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Error during incremental builds, qtserialport
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
X-List-Received-Date: Wed, 07 May 2014 08:40:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I've ran into this one a couple of times. I've never seen this problem when
I do a build from scratch, only during incremental builds.

When I create the SDK for my image, I see errors like this:

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-qt5-toolchain-target:
 *     libqt5serialport-dev *     libqt5serialport-mkspecs *
 * opkg_install_cmd: Cannot install package
packagegroup-qt5-toolchain-target.

Sometimes it's not only qtserialport, but other qt-packages.
If I check log.do_package for qtserialport I see:

WARNING: QA Issue: qtserialport: Files/directories were installed but not
shipped
/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandboard-dual/usr/include/qt5/QtSerialPort/qserialport.h

... and a whole bunch of other files. These files actually don't exist in
my system when I check for them.

It's strange because I'm not building the SDK for "wandboard-dual", but for
the "wandboard-solo" MACHINE.

Am I confusing the build-system since I am jumping back and forth between
building for wandboard-dual/wandboard-solo ?

/Jacob

