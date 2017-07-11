Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 64D9A606B2
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:43:06 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id c11so169123180wrc.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=aAdztaKwSGtgmYC4ES5snR7op1P3NtaOmOPeV3w+JWk=;
	b=WQ9uC300p8e2NTr34cvUdziC/NQq8AzOnk8djUSBnX31L5ugdeYLrFrIk+LQqCa9kl
	/vYbwoZOPOa9Dm6cYX9b+cZ0X4TzA7Wid0KKhD7XE/09Z05oWsNLYBBvL83mteZFBw/Z
	6ZXvEuGmLqm7yu8cnrG3gQExsREMY0aFH4V3j8K5NYOwhp2Sq6UgcqsosGEbqV6qV7Cr
	zueK4QNzUFYv2gdb5KcWU1AnyPlHr8gO0MZ+X8w6Ts8TeldoVwWYMnvxOTJMLq03SG0Q
	vFYel7/SiOj73LLx6WGvY1A2xroUmcmuUrBb25UZr8H9PfA6AqCISzpZuxizXL3lxMRw
	8BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=aAdztaKwSGtgmYC4ES5snR7op1P3NtaOmOPeV3w+JWk=;
	b=lUArZIdrJ+hjDPn68KyZLO1bnYxJaGdbY4/ckjzbrNEmuSp5bynKtejqFmkCZ57R73
	g5KvI44qm5K2iTgz7lqo4Lo/F3Pp8ATgs+UmMyqJKXZvBHKuESXr2/ax/xJWPT1XW2DP
	1/KtlR5U5OvSCG2l/nquRuLzvXJGK1xO+JwZeffLElHutK66tfA8ORrA70q7tdzSYH3V
	Jg5AVzcL9aFTxtg0muDzc9sY4NaQgRw+C3BvxtsWH3mDkAVWdWABhMvrlU0z7Qvz3gMo
	fVYpp2ieBNNeY6xjVSwpmDRcWCBcAoz5XGPcm+OkrBxi7yeTSqU8he/6cGLgIIzg2b/p
	gpCw==
X-Gm-Message-State: AIVw110JZo5d1FumsCOmspoZOhVJvxBnn9nT7XmSYsp0alJ+Fb1GYfQM
	vsPtrZrTCS+UeQo5b7c2lxBRgVEcig==
X-Received: by 10.80.140.204 with SMTP id r12mr1393745edr.123.1499755387739;
	Mon, 10 Jul 2017 23:43:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Mon, 10 Jul 2017 23:42:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jul 2017 23:42:37 -0700
Message-ID: <CAMKF1squ2QyqpKvUKbz7QP5YsBvd94B6jFaju0hL+qWy6cA7tA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] qdbuscpp2xml native Crash
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
X-List-Received-Date: Tue, 11 Jul 2017 06:43:07 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Andreas

This patch was added by you.

https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch

This is actually causing qdbuscpp2xml  tool to segfault just on invocation
when I build using on arch linux host.

I tried to debug it, it seems it gets lost in translations.

What is status of this patch ? has this been accepted upstream ?

I also tried to apply two patches that were suggested on qt mailing list.

See, https://github.com/kraj/meta-qt5/commit/df4ca3897b3929f380623629bdfd935c335e49b1

while it gets me away with segfault, it ends up with more errors.

Ideas ?
-Khem

