Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5441B745BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:20:13 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id h4so6293530pgv.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=Z5oILpJd4qpM26pYVhLhzgBpZwJQWVdL6nABDPzEwGY=;
	b=mj7ot/YRHkUhaXMzs4c9hOiq0nKUrNlhIN0RxD0GScJugKs3e3iPMXk69G7yDYEXjr
	TXMxvtB2+bHp14ok7Ot4R0+gM4eV3xxpEGg2TWMgiUCJ/O7Lv1ZeplOnphwi1cnJxYSl
	ok96oHRcCX3rQxfvj+ze6cqGOSQAxU8tghqsyCm4iq10fATCRs+JQgCENrthYuR+44kR
	d6sve7ZXrIWEjulJhX0+TBwvcxEHQQT0+OlNAM58N4KAZIeDTgmfpB84mrJf9zzO6s1S
	75N+s+iSvStgJzKURhy0b+Tb+mesr1h6bebQi/ldrQgcLmSCj0J6QMKI+lYSgvQ0NH8j
	NUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=Z5oILpJd4qpM26pYVhLhzgBpZwJQWVdL6nABDPzEwGY=;
	b=ufi21ywzWTcz2gk1z0Gbn3C4d3Yn07e2XlSim2fR58FiMS37zC6Uua4R7VaD8vAN2H
	0ol6y8q69jiGYlVbznGz0KnycyUxnI/ycHJI9zi/XMiGNtxedks+RCLpsvgmuETTUcys
	kBq/m1dBrcnHHYV1/9oyB7FjEUn4qjkzfuaZiISRrBPpAfh4f7iwBfSk+90xYgoD4lTT
	FdwBu92pRC/7UQRIoUwYjM1h7C6iBMIV2PmK3rC+RAucBkCZHZjzN5QwQwI/nr9Wujcn
	XqIdnsHHCW996lQcghMBNQvQ4Jrk4BKmxSVav/APCMin7JDo1QeQOFSQUT30j9tfdxam
	nSKA==
X-Gm-Message-State: APjAAAXo+cYs/Clq3D53rFMqjd6RLllINhxf8FveWVzF1DKbrp4TDfy/
	ks8GlI3IblYZv2LizGGr2s0=
X-Google-Smtp-Source: APXvYqy5xpX3E5Byuu4p/BElMzSCxS4ZqYIMm9zJFIUWM4u1lqtrv9Uf3930Kgj/FztcLqObAKD3Yg==
X-Received: by 2002:a17:90a:ba89:: with SMTP id
	t9mr20418304pjr.138.1573838414079; 
	Fri, 15 Nov 2019 09:20:14 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	h3sm11292375pgr.81.2019.11.15.09.20.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 09:20:13 -0800 (PST)
Message-ID: <0c9f98fe3add2be003e3aeaf20b681e940fd47bb.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Nov 2019 09:20:08 -0800
In-Reply-To: <cb700209-e8fa-ea77-0127-0f1669a2c452@skidata.com>
References: <cb700209-e8fa-ea77-0127-0f1669a2c452@skidata.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: Re: [meta-java] merged changes to master
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
X-List-Received-Date: Fri, 15 Nov 2019 17:20:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-15 at 10:50 +0100, Richard Leitner wrote:
> Hi,
> this is a note to let you know that I've just merged the following
> patches from master-next to the master branch of the meta-java
> repository at git://git.yoctoproject.org/meta-java.
> 
> If any of them should be backported to any stable branches please get
> in
> contact with us by replying to this email. Thanks.
> 


thans for this Richard, can you also peek into patchwork and see if all
these patches are marked accordingly on patchwork?

> 
> Alistair Francis (1):
>        layer.conf: Mark as compatible with zeus
> 
> Chris Laplante (2):
>        classpath: add patch to fix BigDecimal.compareTo()
>        classpath: add patch to fix BigDecimal.stripTrailingZeros()'s 
> handling of 0.
> 
> Fang Jia (1):
>        Revert "base-files: Define JAVA_HOME by default"
> 
> Nicola Lunghi (1):
>        openjdk-8: Enable HotSpot builds on 5.x Linux kernels
> 
> Ricardo Ribalda Delgado (23):
>        icedtea7: Add missing DEPENDS
>        openjdk7: Make kerberos optional through PACKAGECONFIG
>        openjdk8: Make kerberos optional through PACKAGECONFIG
>        classpath: Fix build with targets aarch64
>        jamvm: Do not build for aarch64 targets
>        cacao: Do not build for aarch64 targets
>        javasqlite: Create cc tool to make libtool happy
>        jdon: Fix location of S
>        rxtx: Fix path of javac
>        jamvm: Fix binary name for javac
>        cup: Do not use all as PACKAGE_ARCH
>        dbus-java: Do not use all as PACKAGE_ARCH
>        rhino: Do not use all as PACKAGE_ARCH
>        ca-certificates: Cannot be an allarch package
>        xalan-j: Do not use all as PACKAGE_ARCH
>        xom: Do not use all as PACKAGE_ARCH
>        jaxen: Do not build an all PACKAGE_ARCH
>        jlex: Do not build as an all PACKAGE_ARCH
>        bsf: Do not build as all PACKAGE_ARCH
>        poi: Do not build as all PACKAGE_ARCH
>        xom: Allow re-running do_compile
>        jdom: Do not use all as PACKAGE_ARCH
>        dom4j: Do not use all as PACKAGE_ARCH
> 
> Richard Leitner (7):
>        README: mention new TESTIMAGE_AUTO variable
>        oeqa: runtime: java: Drop OETestID
>        cacao: update to latest staging tip 2d6f6c14daf9
>        README: rewrite build host dependencies
>        icedtea7-native: disable new compiler warnings
>        openjdk-8: disable stringop-overflow compiler errors
>        layer.conf: remove compatibility with thud and warrior
> 
> 
> If you have any questions, please let me know.
> regards;Richard.L


