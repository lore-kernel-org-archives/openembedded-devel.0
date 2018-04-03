Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8E1C74B05
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 23:16:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x4so38213008wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 16:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RbmcqmtYpDerB2jHwmdX0f6w9XKIfzzsurNRp3Rb4X8=;
	b=I6aw47J3c0PrbvVvQX9MNQv4xM9Fn1cDjFCVf8BG2aFPBhEeQX09COQdrO/Eb3MMuo
	nUussV53fHbtpAFD1PzvHWoaeIfktLsW1zGPPYqvf0qcOrfU55jbreuM2IU5GZasZY3U
	ofNzy382jQhYrdULg/wNd7SYgdaD/0Mzu1BrFpfwEpgcIphfm2zrSZddRLDaWhU1HF2/
	brqgMqNpcyrzB0qJay2htTLiaEVddFis7qm9c/dZCSlXehiZBQrYs0l0FGqz5lZkB01p
	iDcpw664hoxZuAnhCFhrQKW6AWBE7u7N6YDzAXRMXXda5BXCv52egiTPralr9JCLYajC
	cEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RbmcqmtYpDerB2jHwmdX0f6w9XKIfzzsurNRp3Rb4X8=;
	b=a4zLMf6c2tF592wShMFMtP/uwhvqfpepDrrglB0N76ymIC1PwEnGZ1LFYbIQ3jW5OC
	tXGk4hPgVbC/8Vvwf3TcSGK7IbUC34cP+6Sl71SobWP0l7Xx2mvj0B7PPg20akXNaI7y
	aHp8NkYFKRML1CP8U/D7hjMFUbBskR2oQDy1EQpbXRrIkUnQAY1l0rcnA0mnaQfWakHj
	f4f4pTqtiATYwPpbFLbVPySroKnn/uoWraIjfeGizwyBtsgE00Xn6qEGnQyVoszjAs2R
	0HxeqIdBVI3GzODGx9vaE3/WptgEtBf9748TTNlg0o5jJKFAzUscApS77rVk4zQn39yr
	hHLw==
X-Gm-Message-State: ALQs6tBW/+f8vxjE4UYzW1gLCAr+RGyi6AROB/9KLPziEaR9J2x/Aejt
	GAQdqL7DeCy93aztS+GKfNwG+g==
X-Google-Smtp-Source: AIpwx4+x/NARR9ZVWv6Ux+dArrKBcSPLlFLg3Wwj1MmRNSsaF2euX1bNc4raTQVk9lNRMAqzpN+Eww==
X-Received: by 10.28.17.142 with SMTP id 136mr4917626wmr.38.1522797394882;
	Tue, 03 Apr 2018 16:16:34 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC1FD091E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:fd09:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	m129sm2682099wma.27.2018.04.03.16.16.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Apr 2018 16:16:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2018 01:15:59 +0200
Message-Id: <20180403231601.5329-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 0/2] poppler nightmare
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
X-List-Received-Date: Tue, 03 Apr 2018 23:16:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not convinced that I'll get support at poppler project. Let's see what
autobuilder says. If it fails, please unroll back to 0.57.0 - I am sure
that disable glib causes trouble for evince.

Andreas Müller (2):
  poppler: Rework patch fixing do_configure
  poppler: update 0.62.0- > 0.63.0

 ...0001-Do-not-overwrite-all-our-build-flags.patch | 36 ++++++++++++----------
 .../{poppler_0.62.0.bb => poppler_0.63.0.bb}       |  4 +--
 2 files changed, 21 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.62.0.bb => poppler_0.63.0.bb} (93%)

-- 
2.14.3


