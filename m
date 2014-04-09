Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id D285E609BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 18:26:39 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so3224154oah.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 11:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tVmzBS2Za/dHJqVCW+Vy1n1X/7pIiw9olu9zZPSntgk=;
	b=ZGdguWSnAHOpDOZigwid8QDJHEDk1Tl4hhH3CNpOfHx+yNwc5vt71suLQwcerJYRW6
	bXmzxtVxQ8mZ5hwB0mRGhwzabAvNcHcFeFHAVBmW81mZiKO5c1MnEp2vR8htyRaH+nOb
	43zuD/MMwaUzB/lSV3HJ3Yr0rCc9Ll0vNzkeKL07Q/9WSxut6V7ht/651Gokg05lP1bH
	j1osqmbRmsqGpOiEQO44GsJMle8gXBjirvDX9aWf7lbcm5JqbQR4EpprjbgsOnPyr31B
	OCosm32NLswc0DbqydGRTtcN1w3ZTifiI2PHZZviSnPK9Aykd9ze45qB+wy+OZmaVliN
	NrJw==
X-Gm-Message-State: ALoCoQnCrcoyTLEIcEzoFko4aRvAXg0j5jX3m7hEzOoY69KAoQLJj2j/CTUJLnksG6TG9odklN2u
X-Received: by 10.60.58.7 with SMTP id m7mr2874905oeq.59.1397068000139;
	Wed, 09 Apr 2014 11:26:40 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id or12sm2739233obc.0.2014.04.09.11.26.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 11:26:39 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 14:26:30 -0400
Message-Id: <1397067991-1308-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-gpe][PATCH] fbreader: remove old non-working recipe
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
X-List-Received-Date: Wed, 09 Apr 2014 18:26:40 -0000

While trying to perform a world build I came across the issue that I can't
build fbreader-0.12.10.

In the first place, the download for fbreader-0.12.10 doesn't exist at the
location provided by this recipe. Most of the downloads appear to have moved
to fbreader.org/files/desktop, but trying to retrieve version 0.12.10 from
that location fails too.

Note that there is a _git version of this recipe which builds just fine.

Therefore my recommendation is to simply remove this non-building recipe for a
4+-year-old version of fbreader and keeping the _git version which does build.


Trevor Woerner (1):
  fbreader: remove old, non-building version

 .../fbreader/fbreader-0.12.10/Makefile.patch       | 22 ------------
 .../fbreader/fbreader-0.12.10/gcc45.patch          | 20 -----------
 .../recipes-support/fbreader/fbreader_0.12.10.bb   | 42 ----------------------
 3 files changed, 84 deletions(-)
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb

-- 
1.9.0


