Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 161F67878B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:31 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id u13so8128586plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xsqleWaAjVY5ZZ5JWwe4+kGw4jgqxAJIBmURQEDYKFY=;
	b=j4LDwx3y1KMGszvy8MO4G4hJ0wU7Uku3Re87cF0S0mNjWbW9h4Fa73OmvJoNnZluT+
	C7dLAGSh1Cwyrz2JxppkhUd00eaTB/qD+BVBYzcdErlF84LtfWJrpdvWXKjUIpUgczl/
	LRECClOfN47XflAn95NZOfrE7l3fvfymS7WCUKRBudUcVC4/J3fa0KxJqcHmEz/83o8u
	rbJnkY4AbweCzxPhu3SMrGoZ0/gE7etcGOXgh1bsPMQjDuGEXuFT4ZMkdLPW8o8UuS0t
	dSoo9uPB3+IlLHYDjfBDFYJpklnV9r/XFkxg4T7LiCoIeDowydOwApaZxyuqyDjSMxA/
	FYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xsqleWaAjVY5ZZ5JWwe4+kGw4jgqxAJIBmURQEDYKFY=;
	b=QHB9waVWno9LxNKi20DrZMFDhBEobsPdDE0qYmggYAxpSmFo7P0zr2PvS72IgE83Ug
	J7DbbxQDJr4fV0vymqN24vl/D7HX5cKE8RJZJ1lYX48cDbE3S1i/4KIeowhDazty1DWX
	U5l5CmBtcl2MDIou9uyqY0Id+8kzS4iBPtfzNSulrwA0HOhTPF6s6uX6FwEr5j/NBc71
	+qpQNq/zW79Cm2rNy2YT97X4y9gX2ov6bWokqZZuXqJ7DRFXVPX5hvsnb5WXmXuPflZd
	AZkFVVLe1NfvkXBi+gOMtMYcgssiUitJ+R31fxpOMRtVBg/s1M0CJRHiVC72wOfMmQKr
	+PPQ==
X-Gm-Message-State: APf1xPCpgHAB/85P2J2AkFBeLAz/zWaX2L1tz+BdcNQI+20d+3YdfNsQ
	bmmZgItLwLj/1jGUKpWCTDfYew==
X-Google-Smtp-Source: AH8x226WwHhscizh0moQn4574wcGkfZSIbP/EyFEMRSxWx0vPpSsd9noDXL58XzctDuJ9iNSAAW8cQ==
X-Received: by 2002:a17:902:a984:: with SMTP id
	bh4-v6mr8328520plb.95.1519594413177; 
	Sun, 25 Feb 2018 13:33:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:56 -0800
Message-Id: <1519594406-24490-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 06/36] libdbi: move to recipes-dbs
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:32 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-dbs}/libdbi/libdbi.inc      | 0
 meta-oe/{recipes-support => recipes-dbs}/libdbi/libdbi_0.9.0.bb | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-dbs}/libdbi/libdbi.inc (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/libdbi/libdbi_0.9.0.bb (100%)

diff --git a/meta-oe/recipes-support/libdbi/libdbi.inc b/meta-oe/recipes-dbs/libdbi/libdbi.inc
similarity index 100%
rename from meta-oe/recipes-support/libdbi/libdbi.inc
rename to meta-oe/recipes-dbs/libdbi/libdbi.inc
diff --git a/meta-oe/recipes-support/libdbi/libdbi_0.9.0.bb b/meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
similarity index 100%
rename from meta-oe/recipes-support/libdbi/libdbi_0.9.0.bb
rename to meta-oe/recipes-dbs/libdbi/libdbi_0.9.0.bb
-- 
2.7.4


