Return-Path: <nickdademo@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id EF75171902
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 23:49:02 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id h136so11682317oig.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 16:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I0eWYgoHExyKgh7/iGsVdz+V/24Zzvf41UNlIPAHVy8=;
	b=BdPOTO2H5VVdWb6j45o8jx5KOMu4k0pAXu3RHfAUCGXJ5pxhLspu8bWJLBCs70v0MQ
	+hVJox/UCRk1XD/JlsAWT++02ZyC3kjhctdxtOw0S2lady/B4kqIYd+rSPAB7Y+ch+T2
	YsgCtJOpbLvH4pxJKvyFWl1kp9mqYBCyx/dKvK9HY7QyqiuADuDB6Q406Zl/0VeWgUe1
	lvM2DaHzbg0foF4yT+SeZLb8IwbplFGi98/pUQCR+QkC8mcZoxN5kk0IqdYMfeYme05L
	uiGWNrYuBxFtpeC4oPYDdB51fuu6inmFCoDNtxZ2nCW3joJPV8bQFlpzpy9+R5Q066nZ
	z4rQ==
X-Received: by 10.202.77.77 with SMTP id a74mr17452911oib.0.1413157742466;
	Sun, 12 Oct 2014 16:49:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.167.163 with HTTP; Sun, 12 Oct 2014 16:48:42 -0700 (PDT)
In-Reply-To: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Mon, 13 Oct 2014 10:48:42 +1100
Message-ID: <CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Sun, 12 Oct 2014 23:49:09 -0000
Content-Type: text/plain; charset=UTF-8

Has anyone had any success at all building a Qt5-based recipe with CMake?


On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo <nickdademo@gmail.com> wrote:

> I'm receiving the same error as described in the following posts when
> attempting to build a CMake recipe (Qt5 code):
> http://lists.qt-project.org/pipermail/development/2014-May/017075.html
> https://lists.yoctoproject.org/pipermail/yocto/2014-May/019755.html
>
> * The imported target "Qt5::Core" references the file
> *||*      "/qmake"
> *||*   but this file does not exist.  Possible reasons include:
> *||*   * The file was deleted, renamed, or moved to another location.
> *||*   * An install or uninstall procedure did not complete successfully.
> *||*   * The installation package was faulty and contained*
>
> Looks like the *qmake* binary cannot be found.
>
> The relevant parts of the recipe are as follows:
>
>
>
> *DEPENDS = "qtbase"*
>
>
>
>
>
>
>
> *inherit cmakedo_install () {    install -d ${D}${bindir}    install -m
> 0755 test ${D}${bindir}/test}FILES_${PN} += "${bindir}/test"*
>
> Does anyone have a solution to this issue?
>
> Thanks.
>

