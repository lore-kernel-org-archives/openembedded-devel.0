Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8AD600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 17:14:23 +0000 (UTC)
Received: by ykec202 with SMTP id c202so7478686yke.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=NHmsegfuk1qC8IdC6Fo0v7p6lyg20QUfMxiAMfd9MQo=;
	b=vW5ovMDUCEn//DnxrRH2yp/QNZAeqFJGQ+i1LvvyI+QXMih68Wk3J7EEHfyT364JjM
	TJroNBB6tj9mQqo4qtDmtcgpcbkvWvZttg+35V6FNpxRlJqjB2aoDD8bcwE9o9Ox/l8N
	ywq2tcToSy65PAlklq1XR5c/uNwa1hyt6i0BpfcJeuJw49IzmR0mR0QPbADRO/JKCdf0
	OrIrgznuJExn39ikJ3P9ImSIBhSegoPy9xIM98b4/yl60fB8VuvVNEyeqcksJ47YTvFU
	XndenS9PfGLjFj3P5MRnCXlGc69r//PqDqKsf9MZ6bWly+nWPYTrr2pqQFLv4rLApwW9
	enKQ==
MIME-Version: 1.0
X-Received: by 10.170.141.85 with SMTP id i82mr31034887ykc.39.1432055664835;
	Tue, 19 May 2015 10:14:24 -0700 (PDT)
Received: by 10.129.92.194 with HTTP; Tue, 19 May 2015 10:14:24 -0700 (PDT)
Date: Tue, 19 May 2015 10:14:24 -0700
Message-ID: <CAFeBWL7+veYtxfPTxrSf=uMWzMg=qQJPgyiiu9NNtahyCa6SZA@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: OpenCV Java binding, and Java JNI
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
X-List-Received-Date: Tue, 19 May 2015 17:14:24 -0000
Content-Type: text/plain; charset=UTF-8

Hello everyone!

Has anyone successfully built the OpenCV recipe with Java binding? I don't
see any .jar files or shared objects.

In the log I see these messages:

-- Could NOT find JNI (missing: JAVA_AWT_LIBRARY JAVA_JVM_LIBRARY
JAVA_INCLUDE_PATH JAVA_INCLUDE_PATH2 JAVA_AWT_INCLUDE_PATH)

-- packages path: lib/python2.7/site-packages

-- Java:
-- ant: /build/tmp/sysroots/x86_64-linux/usr/bin/ant (ver 1.8.1)
-- JNI: NO

I looked at my bitbake environment variables, but can't find any of the
missing variables above.

I'm on Yocto 1.7, and meta-java is on master branch. The host is Ubuntu
15.04.

Thanks,

Adam

