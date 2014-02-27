Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 225796F305
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:12:19 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so1457071ykb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=siDUn8fNI9z6i0yxtw2WdxMZqgFVLodmMce8MSnqSAA=;
	b=T4fBP1Vo0n+rk6/hPcSDYay7emZ4FyWOLkqyBlvCJe3NmXRdUR9ReycUCyjmzjse8H
	qS9KQlLGHjQu+M6kLzAck5gIfkrLhKx0oZIuPm3hjZOvIR3JQTSereqnWIEpgd9zCcvc
	F20njU8/4UjGOySAnsF4eZkMtCAlJR/PO/wbtUuQ6DduAua260rYoJMy0mvGJakVnx3v
	fFumAhZeReWZfcBjsfcP1quWK79sxnYmGz63lBFnCW/s+R7VD46YmgfF56O6PC3/cv1f
	UIyWnS/asbZ6bXryert/SW6gjz+Z8QZBjN19ZXJdmc0gdSQL9ZCPbhpm+QvwZ7ygfy4B
	qUsw==
MIME-Version: 1.0
X-Received: by 10.236.150.164 with SMTP id z24mr16824924yhj.75.1393524740410; 
	Thu, 27 Feb 2014 10:12:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 27 Feb 2014 10:12:20 -0800 (PST)
In-Reply-To: <E2D50EB5-29C8-4FC6-9373-4E445C5B77F9@gmail.com>
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
	<1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
	<90CD9C88-7366-4942-82AB-B4E909189BAD@gmail.com>
	<CAP9ODKoCpaMUV58V3o7t6pGweB93QeugwouLOBgdgohh=JmgnA@mail.gmail.com>
	<7167B982-98BA-4A58-8FD2-C8BA54D56F25@gmail.com>
	<CAP9ODKog_2cBFMehH5rWfh6HgA7oseWrdR02LUp8u6p4=Fn3Qg@mail.gmail.com>
	<E2D50EB5-29C8-4FC6-9373-4E445C5B77F9@gmail.com>
Date: Thu, 27 Feb 2014 15:12:20 -0300
X-Google-Sender-Auth: QBTAA70zRU8Z3uK3UfmiHmy9fX0
Message-ID: <CAP9ODKr1A1PF5F2N6-7_oKovqbdJxLTPS9KTBGNdSzD5OA1Pqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 1/2] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Thu, 27 Feb 2014 18:12:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 3:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Feb 27, 2014, at 9:33 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
>> and how you think we can allow user to override it?
>
> there is -B option that can be passed to dropbear to let it accept
> blank passwords.

+++ b/recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb
@@ -0,0 +1,16 @@
+# Copyright (C) 2014 O.S. Systems Software LTDA.
+
+SUMMARY = "Remote debugging tools for QtCreator integration"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+# Override by distro if needed
+VIRTUAL-RUNTIME_qtcreator-debug-ssh-daemon ?= "openssh-sshd"
+
+RDEPENDS_${PN} = " \
+    gdbserver \
+    ${VIRTUAL-RUNTIME_qtcreator-debug-ssh-daemon} \
+    openssh-sftp-server \
+    qtdeclarative-plugins \
+"

Looks good?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

