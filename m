Return-Path: <nickdademo@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id C50916FC68
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 02:41:54 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id v63so6162065oia.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2014 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=IXB5YL6AWVG5SnNWPllFH01N5XXUuSYRpLyQv/l3HKA=;
	b=z9EriGcNJqrnVTcrwsV0i+XCkfZcaIDErMwYMwGqds8hvVfugrbiELg25OWe6iVYMl
	1GTx0cu0bsiOGzaKcl8BQCdJnyghMSYVvqBrvoqIcj/s08WzZZ0M0rDg8d652GIj7H+r
	mTrVzt3v44/UXs1fx/esKGYyJrqhz6GWNy63M60FcA+vhjqESZW4kH4hojKaxQuj5goV
	RIbYLOnBKRhCR5wL6+K5X66TvrRvNC/L0blkQnqWZYZGtPTFBfgU6E8AHd4V0CWuPRaI
	l4xWelX5rm4NyQxrVrYEOWYPKdkSj4WJDS69Ezl8GPP/M6tpwwEyAGXyqQCYeAZ4CjHp
	dscA==
X-Received: by 10.60.160.148 with SMTP id xk20mr8934013oeb.68.1412736115095;
	Tue, 07 Oct 2014 19:41:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.167.163 with HTTP; Tue, 7 Oct 2014 19:41:35 -0700 (PDT)
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Wed, 8 Oct 2014 13:41:35 +1100
Message-ID: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: ootavio@ossystems.com.br
Subject: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Wed, 08 Oct 2014 02:41:56 -0000
Content-Type: text/plain; charset=UTF-8

I'm receiving the same error as described in the following posts when
attempting to build a CMake recipe (Qt5 code):
http://lists.qt-project.org/pipermail/development/2014-May/017075.html
https://lists.yoctoproject.org/pipermail/yocto/2014-May/019755.html

* The imported target "Qt5::Core" references the file
*||*      "/qmake"
*||*   but this file does not exist.  Possible reasons include:
*||*   * The file was deleted, renamed, or moved to another location.
*||*   * An install or uninstall procedure did not complete successfully.
*||*   * The installation package was faulty and contained*

Looks like the *qmake* binary cannot be found.

The relevant parts of the recipe are as follows:



*DEPENDS = "qtbase"*







*inherit cmakedo_install () {    install -d ${D}${bindir}    install -m
0755 test ${D}${bindir}/test}FILES_${PN} += "${bindir}/test"*

Does anyone have a solution to this issue?

Thanks.

