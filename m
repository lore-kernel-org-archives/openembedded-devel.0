Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C5E2678741
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:40 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t15so5704543pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jJEzye/BOqOTxkm2cnTrtTz1IwRXVwqLrnZyICUPJ4A=;
	b=YUCHPecyxnxjfQFwHexc6bk7rFyyRFj91s9deKa6cMV6kJAkCWikR+VAGevwgSTEvo
	R0tTOABltF48OhkjLUIp8vzWzslR/i1MO7N+/vZE6c3WSPK3QkEOGzfeG90nUkTp9ILq
	iqZyxcFPeyLJxgMWPRCjzTQwL/mL1SPOV3GAM5kaJp2oP7F0Q+04sEeYnvJScDfrTpQB
	0cDqGsxBMspCdl+n6IPWPpn2mD0HfTDeFfn74amBnN/DYDY48BBBNNB5xHOYossVYBdO
	ZiHhr8sdLEYV2hN1gP5uaPhaO1rEMksZWU/WfvDwAL8tEezVac8IublgEG6tDqt7wRgs
	QTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jJEzye/BOqOTxkm2cnTrtTz1IwRXVwqLrnZyICUPJ4A=;
	b=KXpMvYbHrQqbNPli/9GjyqNdx7zH7BY9lAJ7vNuo7r3Erb3V6NxEROEz1d++3rwYnp
	ER8WNnxzQXTViDdFN02D0zIipTkBiGKclhKsKQYqfQ7xDKGeCnLl3XzWkgfeUNzxqC+u
	KjIcHhh7BH7v8t4mCl6vS65LDspqSuzdxD9bgLuVg1qLLc1pNZbRnOzR3EEN3seaT1wf
	ktEvAvwgpdYSNWDeF8fjiZl5jZXDZQ+mmcMGmwRIKWibF2Mr1jVkAbU9WNA9LCIewDU4
	dI+S2++/Nk5c7PLn619mf2zrkTw1a9yDaWi5/1hVi9f/U+2UDCZfT80mNSlSiKsJyGNp
	w1CQ==
X-Gm-Message-State: APf1xPCi3EMSowa5uYKxJ3mbhDsa33XnXqLFLzgUfF86kLV0vcuasSe/
	SKEhb0AtQANyDzYndhAYMmTVDw==
X-Google-Smtp-Source: AH8x227GbqTqrt7NGpvOtSHYnvQIQddO4g+Ar5typlQfmd+0bZYUj4Mkd8A5txuTEn0Fm9Qle1cyIQ==
X-Received: by 10.99.148.17 with SMTP id m17mr6721090pge.367.1519594421901;
	Sun, 25 Feb 2018 13:33:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:04 -0800
Message-Id: <1519594406-24490-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 14/36] pm-qa: move to recipe-test
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:40 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-devtools => recipes-test}/pm-qa/pm-qa_git.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-devtools => recipes-test}/pm-qa/pm-qa_git.bb (100%)

diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
similarity index 100%
rename from meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
rename to meta-oe/recipes-test/pm-qa/pm-qa_git.bb
-- 
2.7.4


