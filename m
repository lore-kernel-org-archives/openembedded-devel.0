Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 32EBE7DF7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 09:44:31 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 13so3422051pfw.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 02:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AHQBSoH0zAQj1M+2xgCIvOdFm9RoT6sAN2UhhkmpvqE=;
	b=thwHhCVe8VxAje4Hnpn4a5op7yrR+BJ0DMyvAWUGAEYFlfpFc0zRrfI+bw0T8mkgxj
	6MaMUjQwgLeXaNM5TrXNKEzRgQK0r0ZwMH3E1bxJG15Cv00vW3SkM5vkfIlaj1haYKac
	yoGuXazf59gbJZkxoYcQ6uXvWRcWCRrlrnXwEyR6SPCV70IsP3w+uk7s+zQiVQ2AvVDJ
	F1pUFD/3IUksOfEJo1F8wgTNzuO5WQUX5juE8w/gkUPnK1tLTKKDGjzCG9ahxKUitV5a
	6GMr7a5ovyjd8b4TvdehJ9coM0V3PLSPTWaSrO7jEiT2l16uRXpbnH5GdPRvlVq8Frxj
	u/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AHQBSoH0zAQj1M+2xgCIvOdFm9RoT6sAN2UhhkmpvqE=;
	b=mcGzGkJ9RouvfsKde7ubUDdVXE9IF/Ec40ux57Kobooz5wimH7YGxY/UXyIM/st86M
	eKU8eLA13nPka88TVX5YpH3fJuNuxPu9mMeg6BqPDypXWTk5futnxlnFcGJ5XlpT9noX
	ORTx0h6r/E+f0f72dxQszZsu1AF5yejCxUgueT+3bsvT8Gf7ugbCTbCXo1pRLjTrf9cL
	NgXLv3uyJ8gHoDhq1422igVd44BgkUA/o06+9Bwki1c/bAHMQ3JCkjKRP4mxkRUCM3+r
	Bt3N0bheueTafrXIGoPR/qMLyoJfUVmKUDxHNQI/umsyry4cnI2l/T1PvNVo1Wrn7I82
	m0KQ==
X-Gm-Message-State: APjAAAWnBRBGxnerStLnh+zDDeab8TB4y7FQN4ia3R80qm3bgOPSsW9c
	KRZy3Pd4ioMGvlE2w0vqk9qDT4UOG/4=
X-Google-Smtp-Source: APXvYqztMsdMZ9TILDHqTNQJF8g6X2PzoCorLGHoYBFVzLOLdEplBGgab9wCaxkNp3yRA72FBeEdNw==
X-Received: by 2002:a63:4952:: with SMTP id y18mr12625044pgk.144.1558086272021;
	Fri, 17 May 2019 02:44:32 -0700 (PDT)
Received: from navik-desk.iind.intel.com ([192.55.54.43])
	by smtp.gmail.com with ESMTPSA id n1sm7697511pgv.15.2019.05.17.02.44.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 02:44:31 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 May 2019 15:13:35 +0530
Message-Id: <20190517094336.26232-1-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] safec: Add Safe C license
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
X-List-Received-Date: Fri, 17 May 2019 09:44:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/licenses/safec | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/licenses/safec

diff --git a/meta-oe/licenses/safec b/meta-oe/licenses/safec
new file mode 100644
index 000000000..2bf1e6374
--- /dev/null
+++ b/meta-oe/licenses/safec
@@ -0,0 +1,26 @@
+Safe C Library
+
+Copyright (C) 2012, 2013 Cisco Systems
+Copyright (C) 2017 Reini Urban
+All rights reserved.
+
+Permission is hereby granted, free of charge, to any person
+obtaining a copy of this software and associated documentation
+files (the "Software"), to deal in the Software without
+restriction, including without limitation the rights to use,
+copy, modify, merge, publish, distribute, sublicense, and/or
+sell copies of the Software, and to permit persons to whom the
+Software is furnished to do so, subject to the following
+conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
-- 
2.20.1


