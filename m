Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8F38B65D48
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 05:02:23 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so133005022pdf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2015 22:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=QNiifhQLuxt0KiiYt8kUby3+aqgY63NscBARSsMZwQQ=;
	b=WrITNC7clumz7pEknSOaUQXqMXudvwYyEROWrtAlOSA9pm1+edOpRFkbOuL6vmrZSM
	jVXkeRS39CsXQIKqSim7Vdpw/vFxtQ2O46TIIHWrKlM4N9zx5zhq2U88PMFEV30XU9Po
	eyf6ds+QwqFPKTxJoZ/qRplHa8PoYQuoqkLXjtg99Q4rcAKpM6igbBKgbEsn+8pkqNSv
	dNVzlQuh8LBAJR2yrdLecFdLoMCD8Ie5LXCp8mWn7ypV+gKzI4qcFvSuq1axARv3A+oj
	nY8rTk90PZBBTSrVqt7Bp/muMlBaztP6T0kunGPkou24cqKH2KKqX9SaEYsKqn6PcwCX
	kHwA==
X-Received: by 10.70.24.130 with SMTP id u2mr41173240pdf.147.1431925344292;
	Sun, 17 May 2015 22:02:24 -0700 (PDT)
Received: from Akusters-laptop-2.local ([2601:c:a700:3ba7:35c0:577a:3030:37cb])
	by mx.google.com with ESMTPSA id ld1sm8561654pbc.26.2015.05.17.22.02.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 May 2015 22:02:23 -0700 (PDT)
Message-ID: <5559725A.6080806@gmail.com>
Date: Sun, 17 May 2015 22:02:18 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Yocto Project <yocto@yoctoproject.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: meta-ci20
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
X-List-Received-Date: Mon, 18 May 2015 05:02:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello,

I have created a layer to support the Creator CI20 using Ingenic JZ478.

some board highlights:
* Ingenic JZ4780, dual-core 1.2 GHz MIPS32 processor, PowerVR SGX540
GPU, 32k I&D L1 cache, 512k L2 cache
* IEEE754 Floating Point Unit
* 8 GB Flash, 1 GB DDR3 memory
* Video playback up to 1080p
* AC97 audio, via 4-pin input/output jack and HDMI connector
* HDMI output up to 2K resolution
* 2 x USB – host and OTG
* 2 x UART, GPIO, SPI, I2C, ADC, expansion headers

the layer can be found: https://github.com/akuster/meta-ci20.

U-boot is currently a binary. U-boot requires soft-float and userland
building hard-float. Yeah, most likely multilib..

sdcard image is created.

xfce works fine and uses a 3.18.13 kernel.

enjoy,
Armin

