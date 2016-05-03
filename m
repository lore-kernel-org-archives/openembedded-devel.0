Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C04B273167
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 15:17:02 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g17so45330399wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 08:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EcohIjHE7eT7+dgSNQMXNwvoqm4Iu1gT6Ke9W3f9fOQ=;
	b=U15sHJiBz6h4I17PrpIW8t7/adA5Df9GbuNUrtBxgnhAJXWnupBmwB07G8Tt4eunRi
	wGVYPbOnE6K9cY7OVgb1xxLAbZW5IXQBedtEhH82lUyqp2J365q/d9JI91dmX4VQEvnK
	G/qlQ4BT5illK8fyk5kAVRiXZlG9K9FB1iL2LeMmhRVso9yEFaCVw/7PslUjB6XSpSjF
	2ESTopfhzaNoIRz5lxmhWPSR0D50Ww8y0nUxi/TEZVloBv7chDZOy7sV/a6gBBkJ56S2
	g2ICeeCPgifFWKv3CHl0+g4naBhL9VYWmnlLNFaDDcw+2GbwVxLKM7FBxwYo1kkEkZO2
	pWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EcohIjHE7eT7+dgSNQMXNwvoqm4Iu1gT6Ke9W3f9fOQ=;
	b=DtkrFqtpH0O8NkVFoihmyw8rluW/pMGJ3sbIGRiOUh0jJaPug96tiAGjmlEyCUw7g6
	gNEnmj/bBCr6TQBPrVnALPMcA4m+ePfdzyyHzwNQTtGlm8BhFh/9NS+Q44z0uc0ffBc1
	p2GFcAc/Rx5zmFvAgYeIeeLzSfZInDnGyMhFsJxLN1OQSaf3zbn+bDIkJaiT5jEiVNQJ
	IoGh8oiekpA2r1W7C0TbnGaPhq3vAPIBwPeIAIqBGSarZhqn7TQ/pha9HbAxSbq2XkF9
	CMX54YJ7kUcgvHEEC/9SzUs38YGxaKB3MqYKE/HYueOXk0JHL1UODY22OsIaQzaOUDyD
	tIcA==
X-Gm-Message-State: AOPr4FWGeE6eB3sunRcox4Kjwledu85VS4+E5sJULStfs9YGCHbidjjolibmEpjrkFhAkA==
X-Received: by 10.195.17.166 with SMTP id gf6mr3503511wjd.124.1462288622272;
	Tue, 03 May 2016 08:17:02 -0700 (PDT)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id w82sm5051183wmw.5.2016.05.03.08.17.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 08:17:01 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2016 16:20:22 +0100
Message-Id: <1462288824-15975-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH 0/2] Protobuf recipes update
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
X-List-Received-Date: Tue, 03 May 2016 15:17:06 -0000

Added protobuf-c recipe which is the protobuf implementation in C. Also split
protobuf package into two packages, one for the run-time libraries and other
for the compiler.

Felipe F. Tonello (2):
  protobuf: add protobuf-c recipe
  protobuf: split package to main and compiler packages

 .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 28 ++++++++++++++++++++++
 .../recipes-devtools/protobuf/protobuf_2.6.1.bb    |  6 +++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb

-- 
2.8.0


