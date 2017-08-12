Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8C2600EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Aug 2017 23:10:07 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id q25so26330734uah.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Aug 2017 16:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Vo/wip3Jdi6uk3+U9DgC3AlIbzDDrScdogMieQzLaeU=;
	b=Pnsj8ueUe1S2RDpu89DgoJx2coLTsEj6YsBfmlBtOZZAnIPhyoyU9n5bG/x3zq2Rmg
	RQeB9/qhe8aKwf2SdMpejhYr9BPTQS9UQk4VFzA1ewhzztx0MQ6mcQPrtrQV09s5mbcR
	mrYMuu3A/Y6gFN3gz/tr+cHyQMlAfu3lNlDXGR77v/cyek2PH51yngf+hhHrnvPep9zs
	THlCXs6KZ/wSONMViVJUruvqVFTgnemetqcbCQCtx+Mgt34f8/R/oiVtKRY2tcguYRAo
	S9nmXP0XM/qUddFME1EkVhSCaM3DxpaDkXhv/eFLq080FrHKQs/waD1F8e4a0auLLAyD
	2c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Vo/wip3Jdi6uk3+U9DgC3AlIbzDDrScdogMieQzLaeU=;
	b=tgT81SJw6CCUb5Vh5N7qSuGr+R5kXg+ORpDn352C1O773CYDMOntgnD8YYIPjmJqqw
	kP14q0PlqGpvjecHYuMdVP0bA3YVVo/Vxyjmk8FgKnJwBJMz1k6+R9tb01yuyuyShGo/
	bVUxrplk1Db5SFNmNsdZAXzzvmLg1dZkILPFJMUq/XavRkFyPtUdNIwO/0MtEkNGWdLq
	/a1LRGdk5geHod2g/KpFPJv1Lu9VvhSaySKWGh9J+z1G3NqDShRB2xacu6MDj9wJ2sQ4
	nisKWzBivaTDWdXwXjkOpHKhKsUSvO/ak+kVUaCUo++ajl1f04PgOY5ieBtd0ygcN6B2
	GDng==
X-Gm-Message-State: AHYfb5iXrfwvqZDaPomJTlcPi7qUNr9vauPhlXk5CvMR5CQXa4Q9Vtyy
	K3GRHn8GAP3dZFhKurxEb2wrhioAvpt9
X-Received: by 10.176.90.193 with SMTP id x1mr12378678uae.129.1502579408962;
	Sat, 12 Aug 2017 16:10:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Sat, 12 Aug 2017 16:10:08 -0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sun, 13 Aug 2017 01:10:08 +0200
Message-ID: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: chromium detected as stripped
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
X-List-Received-Date: Sat, 12 Aug 2017 23:10:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

in current OE environment 'file' says:

<...>image/usr/bin/chromium/chrome: ELF 32-bit LSB shared object, ARM,
EABI5 version 1 (SYSV), dynamically linked, interpreter
/lib/ld-linux-armhf.so.3, stripped

This file is 4.3G of size and this does not fir into most of my sdcards!

One note: I have an elder environment: meta-browser
c79cf6c7811afd2cd167e8967e3c29b1e797371e. There chrome binary is
detected as not stripped and properly stripped on do_package.

Any idea why it is detected as stripped?

Andreas

