Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB3F6072C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 14:12:56 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so12397094pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2016 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U6tBdNXJiq9vzgl8C9BiXa1bCGYvjp30CzCvp8dHqHw=;
	b=g69LQNoqQ8YRvKm8RtDnsqitXGvr7qRnh0LKShQp+VKXeDTbRekWBnXDqNBnAFZSaE
	b+WsUyc11N1yVUHoD26pFTr1RL2fZTGz9dbeIRgIzuV8jq5k/JLRXQHcuQ1dkNtzCIP7
	OHHsj0KqDKgOL6Eo6bciFsmdz53N9rTjykVdh5lfHCpef9ciNbcSPoJ/3T6d/SNvlDLj
	wW6pmLCNnaW4EuH3AD10KITf6w0n7+SDXUnk/Ved1488mVOHn3Qke/3oR4MAHpPUPtT6
	c6/Ev7+YCgDCzAtMqLCDVx4c+/4iB0Q/l3pEciDeNPoEl+U8YgkhvUH+uKC4qfMfR/xX
	mkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=U6tBdNXJiq9vzgl8C9BiXa1bCGYvjp30CzCvp8dHqHw=;
	b=HrantGQj1NNAnJXGkOeMeZELeIPoYFOXAOPYE9Q0O6XK4uDl5dxysyJ23DHoF2vQvS
	8LSletQHQWVoBRJSsXdRaWo8Tn43QIlcQyAUMFmmh52ODax0PeoL/wf4tMWqAx5OtPKE
	s6A0jNOouB8M8YqLcRdGlRZapWPCCIZXxulX0HDFf2qn2Y6CfpZQbepszIMmVx2dL2Ww
	k1jINkRlQzFBIBVX1VzVJoiorjvYLLHSzlEprIYFZv0R+s6vG9d43YeB+Naq2Az9Qc8p
	pCWwaNsdm53xYDHigXZPnUak8W/J2HXbaYA8O8iqz5/v3grOoZYPRxlWTO1YhfS8OYcr
	qgYg==
X-Gm-Message-State: AOPr4FXcf0psUgg+aTkSjTk+fVwaWyiw3B+ky5D1JGHzYc3HcUHckI239K504oZU/yjj7g==
X-Received: by 10.98.47.66 with SMTP id v63mr21794726pfv.67.1462630377423;
	Sat, 07 May 2016 07:12:57 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	eh9sm28641312pad.47.2016.05.07.07.12.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 May 2016 07:12:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2016 07:12:54 -0700
Message-Id: <1462630374-1501-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] acpitests: Fix license issue
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
X-List-Received-Date: Sat, 07 May 2016 14:12:57 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

WARNING: acpitests-20140828-r0 do_populate_lic: acpitests: No generic license file exists for: Intel in any provider

this was copied from the acpitest web page

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/Intel | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/licenses/Intel

diff --git a/meta-oe/licenses/Intel b/meta-oe/licenses/Intel
new file mode 100644
index 0000000..eb81dd7
--- /dev/null
+++ b/meta-oe/licenses/Intel
@@ -0,0 +1,21 @@
+License for Contributions to ACPICA
+
+Copyright (c) 2000 – 2015 Intel Corp.
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINES
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
-- 
2.3.5


