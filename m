Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBB878DC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:19:56 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id l189-v6so5598130ywb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 04:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wkfQ4xrT3CB8XK0RvO2L6yoRxS3Th4hyG6zAFwRZg98=;
	b=sfqWBpNxCcwSEDID0uIwsEPnR4ADSdg05KK1E0eWAmBU+D5H1ikeB348Se9r73c1F2
	XEAlEHlAgsv8CaEnX/f1aLcFM7sH3tKSFGdyobmDHninMyk8aqH4LbyT0HKGRHWCuY9w
	qAO8ntgES5bHr1ozRXQExDMzlB299NFKR7o24TalmqUsqICZAeRlPMpYIch7FR2tDTGJ
	CXPLowsvMoLp2dwQp0KR1qAuUasYW+p50y8b0JftgFObZNo3XjriM7BEw/ZDq4U5PXs2
	Z4fyz5HRoLCo2ievX2LOk4Xlo8dp5kpGbFSfZqMGgU/6dTDe9p+hBkS0vtJONL6qqx1Y
	EjJA==
X-Gm-Message-State: AOUpUlEVY4T3VNE7p6fYrHKfNU1eyqUDrfy6K0YBchRpBCvm7/gk+7o/
	G6AqCHsa4VIzOA1Q5t3zmSfuOhPm
X-Google-Smtp-Source: AAOMgpcmkBl1+XNQ84Y4easTviLQEeoSH1fS5tUOT+4GcJyJaTrRWMxej/cYYU5uw+MTUPpaC99nlQ==
X-Received: by 2002:a0d:c843:: with SMTP id
	k64-v6mr10647675ywd.143.1533035997118; 
	Tue, 31 Jul 2018 04:19:57 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s63-v6sm2799603ywd.63.2018.07.31.04.19.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 31 Jul 2018 04:19:56 -0700 (PDT)
Message-ID: <872b2392cfb7793f514cf8b806262e8d37bb9fd4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>, 
	openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2018 12:19:54 +0100
In-Reply-To: <390065ca-13d0-7dcd-8528-575b25187e2e@skidata.com>
References: <20180727131616.13881-1-git@andred.net>
	<390065ca-13d0-7dcd-8528-575b25187e2e@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][master-next][PATCH 1/2] openjdk-8: update to 8u172b11
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
X-List-Received-Date: Tue, 31 Jul 2018 11:19:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-07-31 at 11:00 +0200, Richard Leitner wrote:
> Hi André,
> thank you for your patches.
> 
> Unfortunately I have checksum issues for aarch64's jdk, corba, jaxp,
> jaxws, langtools & nashorn:

Hm, is that another instance of
http://lists.openembedded.org/pipermail/openembedded-devel/2018-May/118358.html
?

I'll check...

> [...]
> 
> With the checksums fixed the build works fine.
> Also running a test.jar with -Xint works.
> Nonetheless executing "java -version" fails:
> 
> > NOTE:
> > ======================================================================
> > NOTE: FAIL: test_java_version (java.JavaTest)
> > NOTE: ------------------------------------------------------------------
> > ----
> > NOTE: Traceback (most recent call last):
> >   File "/yocto/meta-java-
> > test/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in
> > wrapped_f
> >     return func(*args, **kwargs)
> >   File "/yocto/meta-java-test/meta-java/lib/oeqa/runtime/cases/java.py", 
> > line 32, in test_java_version
> >     self.assertEqual(status, 0, msg=msg)
> > AssertionError: 134 != 0 : Exit status was not 0. Output: #
> > # A fatal error has been detected by the Java Runtime Environment: 
> > #
> > #  SIGSEGV (0xb) at pc=0x0000007f835d7754, pid=511,
> > tid=0x0000007f816131f0
> > #
> > # JRE version: OpenJDK Runtime Environment (8.0_172-b11) (build
> > 1.8.0_172-internal-b11)
> > # Java VM: OpenJDK 64-Bit Server VM (25.172-b11 mixed mode linux-aarch64 
> > compressed oops)
> > # Problematic frame:
> > # V  [libjvm.so+0x6d2754]
> > #
> > # Failed to write core dump. Core dumps have been disabled. To enable
> > core dumping, try "ulimit -c unlimited" before starting Java again
> > #
> > # An error report file with more information is saved as:
> > # /home/root/hs_err_pid511.log
> > openjdk version "1.8.0_172-internal"
> > OpenJDK Runtime Environment (build 1.8.0_172-internal-b11)
> > OpenJDK 64-Bit Server VM (build 25.172-b11, mixed mode)
> > [thread 547629375984 also had an error]
> > 
> > [error occurred during error reporting , id 0xb]
> > 
> > #
> > # If you would like to submit a bug report, please visit:
> > #   http://bugreport.java.com/bugreport/crash.jsp
> > #
> > sh: line 1:   511 Aborted                 java -version
> 
> So for me it seems the JIT/compiled-mode/mixed-mode doesn't work and
> crashes the JVM.
> Any ideas on how to fix this?

Works for me with the versions I posted, I'll have a look


Thanks,
Andre'


