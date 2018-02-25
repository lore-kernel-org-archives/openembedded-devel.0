Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11EC27878B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:30 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id v9-v6so6112229plp.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XY2lzW7wNUh3uxf8m1tU4NupVox3fQVLWkUiCGXpNWA=;
	b=RHkcR+jpvp9ErfEoFyxV5VAEeFYgtPoavWHjpH1tq6yubsKLhWkWy+MIyEYz7CpEt2
	YzO4+PGFAYN5km18NxdN9vzb677XRphbsF7Ew8EzTByrhMZPaELooN3a3rlpB405FJw7
	6VWnlI0rzCCTKO8XJGmq7qD16N2qo6JkY2J1eQzOkJOPiWuJ5WTVqrIRI8CeZ93xCe9+
	39LyJ7aZVvifHeuTMa4f1/EDOYw7F+eOUAfmEbqoQBbyCBHhKY1iG4FEKYS9G6f9xj2P
	5kI1ySIhtdJ3o4ytMgfXTxBI2axFRU57qRaMdS+JZmCZOvplD8m1djTrMfcYqgdxkm+E
	bNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XY2lzW7wNUh3uxf8m1tU4NupVox3fQVLWkUiCGXpNWA=;
	b=XSGNANOqqgeTNZ2+rumHIh28x8cQWYBO6/i5+hukhKBcgEAsSUXJsviHLJA7IudOYA
	o9E0WAd6gHVb4OAOku2BBPwlORYDY5p/X/AKAzaOX90p3+LG4gEjxRvtjIbmo1hMG4UG
	l5sCTnsHHqIuDzYvqY4I1SNNGdTF/sAf9wYBxhuqdJljfHwJUO/MeasuPFrEdcr4tSvb
	YfUXROJd2eqsBjVbWoNqiRa+9DdQyesmgbakvlDBktiKnYdb5aGCjqmPS00/75sA5dHJ
	SnwdfhlahbjU5sgkMfGHhZmu7wlRWOvT7XSAG9SFjoylCfuckKVPPaniDAQLCfLrv29H
	K0ag==
X-Gm-Message-State: APf1xPD8PUqt5alBoGolbFz2V1AvADn1BugkirXIPuIo0/omPr3czLFY
	o5w3stH8ka87HYPpBj/mAdAgBA==
X-Google-Smtp-Source: AH8x226rM7ZeqtwQw5Dg1O5qMeiKnWAOHSJ7R/UJjtfqsejfEhW5z4DcXcgQmwz14lfX3lTdbYdEeQ==
X-Received: by 2002:a17:902:c1:: with SMTP id
	a59-v6mr8300347pla.284.1519594412224; 
	Sun, 25 Feb 2018 13:33:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:55 -0800
Message-Id: <1519594406-24490-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 05/36] psqlodbc: move to recipes-dbs
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:31 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch           | 0
 .../psqlodbc/files/psqlodbc-fix-for-ptest-support.patch                   | 0
 .../psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch  | 0
 meta-oe/{recipes-support => recipes-dbs}/psqlodbc/files/run-ptest         | 0
 meta-oe/{recipes-support => recipes-dbs}/psqlodbc/psqlodbc.inc            | 0
 meta-oe/{recipes-support => recipes-dbs}/psqlodbc/psqlodbc_09.05.0300.bb  | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-dbs}/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/psqlodbc/files/run-ptest (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/psqlodbc/psqlodbc.inc (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/psqlodbc/psqlodbc_09.05.0300.bb (100%)

diff --git a/meta-oe/recipes-support/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
similarity index 100%
rename from meta-oe/recipes-support/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
rename to meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
diff --git a/meta-oe/recipes-support/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
similarity index 100%
rename from meta-oe/recipes-support/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
rename to meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
diff --git a/meta-oe/recipes-support/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
similarity index 100%
rename from meta-oe/recipes-support/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
rename to meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
diff --git a/meta-oe/recipes-support/psqlodbc/files/run-ptest b/meta-oe/recipes-dbs/psqlodbc/files/run-ptest
similarity index 100%
rename from meta-oe/recipes-support/psqlodbc/files/run-ptest
rename to meta-oe/recipes-dbs/psqlodbc/files/run-ptest
diff --git a/meta-oe/recipes-support/psqlodbc/psqlodbc.inc b/meta-oe/recipes-dbs/psqlodbc/psqlodbc.inc
similarity index 100%
rename from meta-oe/recipes-support/psqlodbc/psqlodbc.inc
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc.inc
diff --git a/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
similarity index 100%
rename from meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_09.05.0300.bb
-- 
2.7.4


