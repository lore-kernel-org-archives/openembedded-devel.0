Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id C22B778F0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 19:43:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id h4-v6so8871091edi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 12:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2MianmuNxt/0/d0piuHfX8PLhzohnMxESH91MX52uP8=;
	b=gzQeA/n5H5RtO/b5H+O0ghcvpPEJninKy1T0UrSpZ9SC0gOtb5bGPliWuMD33dxDk1
	D8dOH7wSQrEJTF+cGJK0WQnyeLIQuUNiQo/zmnNxeocbUeJ8C0lJ1uJcN25ucU//Dzja
	R9+1gAOxtnx0kGqLggts0gKUuSyuEpbwwLvpC/xUvKXo/PIsndQkBho4SKSEEOg9PKIZ
	XueseroOZFe1Rk90vU0/aoIIzip1yhZE5A5z0FDJ/XAD3+SisT7q8PhcTNHS7COitlB7
	D2Ow2rDIQmOKfyn/y15M/a61L8wFh+jU0D2H4oqYBOV45VOCidz2SjpvwRYpdYgokDJi
	c0CQ==
X-Gm-Message-State: AOUpUlGagML8uF2bQKZvOLJcxrwxFJg832H/fhP8+A7DwjNlU28xX1MT
	nWdp+zebSIXwxKeFmWisHMc=
X-Google-Smtp-Source: AA+uWPwMgzS0JXH08vknaUzknZ0F53zTgsbhNFSGIwi/mr+5wrV4SETHEpyVg38RnjzoGjijfPugzg==
X-Received: by 2002:a50:8466:: with SMTP id
	93-v6mr24381953edp.304.1534189410518; 
	Mon, 13 Aug 2018 12:43:30 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	i3-v6sm6978098edt.42.2018.08.13.12.43.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Aug 2018 12:43:29 -0700 (PDT)
Message-ID: <b6bb9134fd23a76635c35823e0e5bf614aaf88c6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>
Date: Mon, 13 Aug 2018 20:43:29 +0100
In-Reply-To: <20180813193251.4079-1-git@andred.net>
References: <20180813193251.4079-1-git@andred.net>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-8: gcc-8 fix #4: undefined behaviour (hotspot)
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
X-List-Received-Date: Mon, 13 Aug 2018 19:43:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-08-13 at 20:32 +0100, André Draszik wrote:
> 
> With these patches applied, the openjdk-8 ARM port works again:
> > RESULTS:
> > RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED (0.04s)
> > RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED (0.68s)
> > RESULTS - java.JavaTest.test_java_exists - Testcase -1: PASSED (0.14s)
> > RESULTS - java.JavaTest.test_java_jar_comp_mode - Testcase -1: FAILED
> > (5.13s)
> > RESULTS - java.JavaTest.test_java_jar_int_mode - Testcase -1: PASSED
> > (4.48s)
> > RESULTS - java.JavaTest.test_java_jar_works - Testcase -1: PASSED
> > (4.44s)
> > RESULTS - java.JavaTest.test_java_version - Testcase -1: PASSED (3.66s)
> > RESULTS - javac.JavacTest.test_javac_exists - Testcase -1: PASSED
> > (0.13s)
> > RESULTS - javac.JavacTest.test_javac_works - Testcase -1: PASSED
> > (30.87s)
> > SUMMARY:
> > openjdk-8-test-image () - Ran 9 tests in 50.263s
> 
> The java.JavaTest.test_java_jar_comp_mode failure can be ignored for now,
> as that test verifies compiled mode which is not available on arm. The
> testcase must be fixed instead.

Do you have an idea how to fix the test case? I've never looked into oeqa...

Cheers,
Andre'


