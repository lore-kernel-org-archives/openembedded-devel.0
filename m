Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0928678849
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:41 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l131so5438572pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gxUMPfqcFTvXS+721DAtjx/nDFrvvMe09lI61oGqVwk=;
	b=hUOF95whtE5XDa06YPFouE/Jyvs4YBWpDJWF1WL0jyycHEBtsTRRXcS7PIwaT/4Q0n
	YeAfFP0QSspOhX5w/ps1nGCy6wWqqBN0po8f8vQaPmnocBT/uH4mlPG1rYYKqTwdNtLp
	S954q9Pn5L4GUH6KPAOZXVL/Q163T+dJsVSodhEj90kSB5npnjA7oMRY8ayLwiwmQRAN
	BdzbYaHSnjq8t3UIH/gUMi0ycaqhndIHyVvzUeuzhtrFtTkc0psCb2uO/UQxzd9/lKsI
	XtxAKEju5MCO59rbtNe8ijq4Y+dDtodYgBxuvrQyEGOPhmtC+Mc3Laqc3i5s2diXK2Si
	2x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gxUMPfqcFTvXS+721DAtjx/nDFrvvMe09lI61oGqVwk=;
	b=izp9DJTnztWts7YW+GZ/cTUKVbpL7XfUH0l4K15sIlbPPFCeOJtsA38VJOZqJ7R/IT
	WbTJrIsfAtzZdKTO2nOLmZuVfMz1bg5t2dpxeC+7Ithc1PtGka2xNB6z1TWjnDrwDS5b
	lTB5dOFuljsAyyCK9Nemt3h2od2FWarouDDJArN1roR7cpRtpeGj08PgnC9PgaPL7mHn
	WU/T4Eo2CUf1It4pH38urY14aW8CKjhhwkybRInfT91Y76SGq69f/Q5mDwo22cgUU1xP
	7B5HTxnRfU+0f3m2GI1GTV8itoVQvlEaySHbrGOW7oEqPBI8avFEMRcXzNndjgcte465
	J/5A==
X-Gm-Message-State: APf1xPDPh0yBC0M1mJsF675ml0sBnopS18phIYoX/idT4yzau9UQHU5t
	pYEs6y4uFA1t9GB3axbPayIWug==
X-Google-Smtp-Source: AH8x226Al6fgUNr1tOHSqNG/Zdzuq4FMLaoIRTuTCO9MpzsXcWQfRstd7bISl49YoweoVRF/4bDD2Q==
X-Received: by 10.99.176.68 with SMTP id z4mr6601394pgo.74.1519594423157;
	Sun, 25 Feb 2018 13:33:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:05 -0800
Message-Id: <1519594406-24490-15-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 15/36] cunit: move to recipes-test
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:42 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-devtools => recipes-test}/cunit/cunit_2.1-3.bb           | 0
 .../cunit/files/fixup-install-docdir.patch                                | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-devtools => recipes-test}/cunit/cunit_2.1-3.bb (100%)
 rename meta-oe/{recipes-devtools => recipes-test}/cunit/files/fixup-install-docdir.patch (100%)

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-test/cunit/cunit_2.1-3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
rename to meta-oe/recipes-test/cunit/cunit_2.1-3.bb
diff --git a/meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch b/meta-oe/recipes-test/cunit/files/fixup-install-docdir.patch
similarity index 100%
rename from meta-oe/recipes-devtools/cunit/files/fixup-install-docdir.patch
rename to meta-oe/recipes-test/cunit/files/fixup-install-docdir.patch
-- 
2.7.4


