Return-Path: <acfoltzer@galois.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 785C378212
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 17:34:24 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id k71so18204066pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=43KYtIHAU022p8rnifwBe4oHHbX/T/eVOM9FnTpXLF8=;
	b=gCZyAy8UivB0fmleKx9fd9NSn05SmtsYpoQ7xRZ1eBXe86E1b56Bg8Nk/kHIZyoXZe
	vIVfKQd6FJ50r7bRT3ko+8rA4Ge++aLfjd3Cia4/V9oGPCsHSfUPcQI6JeWKqOxL1GiW
	IOHnDvLl7/6q6TnUA8j4AV8iVoDZsOIxLyokLw42etHMDigHXydE2K1+Ul7agtHmx7MI
	flSMySx69DaVyyb6KknyoOO6kLeSeHhhbogYaVajfShBZa0APC1EpnZbZRN+vgFifv4R
	Rw9oEOaxlj5yn0Oq2hbdyLm6+X+wDrradVxQzF39/hdLrdaJUPo9hDlZ8e/l1cRXZyQX
	jPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=43KYtIHAU022p8rnifwBe4oHHbX/T/eVOM9FnTpXLF8=;
	b=mBRzNxXiVDUnFrdacvRwo9lhFC9ytjyUDJM8HSR40TYAmZLQNGfPrCoLXTNH37Symx
	VeBnIeuj/3uAi6vYq35RGAhaCOeB3e0EzRwGRPG7ukFZd61DYVJig0JC9Ln/nI20HEHx
	NPfhj2N7/o9SNyLstwpSNHzoY6Spfj/Wa6vr8s2F3afnS8xVxh875Mtx4aAfgT5CWLTR
	ZkkCx2PMOylreT6Cp1rDlSGEcyxt4efGQdqDX2bSbGVKIk4WXwx40Wu5tm8YCUhlQqMq
	JGz+ZuSssD1ziTI9nejB/FxDfIl64uKYluhztBj4hA0nEhlD5MXmGo9s9uyHPKCm3km1
	jOdA==
X-Gm-Message-State: AODbwcBQdvtT+zlXHeJKi31ljTq4xww4ru8J7CGPE0Iw6eixjf5aJzhR
	6sJw/jZfgXuvtxKcbVkaMA==
X-Received: by 10.84.137.1 with SMTP id 1mr36523655plm.128.1496943265824;
	Thu, 08 Jun 2017 10:34:25 -0700 (PDT)
Received: from svarog.localdomain (75-164-184-208.ptld.qwest.net.
	[75.164.184.208]) by smtp.gmail.com with ESMTPSA id
	t79sm12051846pfk.106.2017.06.08.10.34.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 10:34:25 -0700 (PDT)
From: "Adam C. Foltzer" <acfoltzer@galois.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Jun 2017 10:34:13 -0700
Message-Id: <20170608173414.29852-1-acfoltzer@galois.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <a96952a133614ffc9779d8a7ce912f8e@XBOX02.axis.com>
References: <a96952a133614ffc9779d8a7ce912f8e@XBOX02.axis.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] meson: add LDFLAGS to bbclass C/C++ link
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
X-List-Received-Date: Thu, 08 Jun 2017 17:34:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


When testing this patch on a 32-bit ARM target, I found that it does
indeed need TARGET_CC_ARCH in order to link to the right ld.so.

The addition of LDFLAGS makes sure the --hash-style=gnu argument got
passed along—the qa step was failing for my 64-bit ARM target without
this option.

Regards,
Adam

