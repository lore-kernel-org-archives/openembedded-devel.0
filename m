Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1AA788E6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:34:02 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id w21so8113400plp.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=umsJ8iIAeyR4p7nBYqjfQc4sobylyO7kTvVItSab800=;
	b=j29Nc2AVDoZOvqcLgylH3ISZhkOqUKNWjS2qpGDkpY9RAyIOy2kIuaX8hUQ8UMKxz7
	ZLrc3gH8JDAWJzUHefCzsjYRdeuq0r0MkwG8p62gJ/kJf2yEtWlwLj9AXCZZ8LBt5hFE
	d5H7Li1h9tAzdJRhHo6O4wt5o6DrrBKrT2Foer8KcFLBAOJlZh8ea6jO1KD9C/2JqM+x
	r8prg2xcaaUsY5ZpJ/lBlB8d37g6YNQc6isT/wgBuwo3lggLMCjiAiLUWqQgTaN9+EOz
	b/PAKCK0/eG8I0GkI5KjOl1kJWBSAtG4909crBIZbq5dSFbuJ36Qq25r75q2KrgKFou+
	6Kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=umsJ8iIAeyR4p7nBYqjfQc4sobylyO7kTvVItSab800=;
	b=YtgOFieNq8pGjuNr4THKoaJ7aqmUK9k/Dfz4b3WD+diXYjhT1Xk/I47ndUXvcozsCP
	bwrQ+ibTUyEI8iVHI3/yfW9LheYMV4NJw1tRgpN/CxGiBI0T3OqpcSVu0to82FNLVqjT
	TASFXDlP4C2dLQ7ilHzHvJwU7IvQNVWo4JB5w6qRAYWyrs9VMu/D4bkk9TKKUmi0f9IU
	NETwcB/thbbNK66bmTmn70uzZrTs2uKo+llMK0JcvFn71yv0F/ajwDgergwWcuEsvvJZ
	LksrI+TVl2jioAFBH8Eo7ZRJIS19DJ5KJqvOcArOScOqzcuhxZr7G0S0e0AyJmF4xqLq
	r1Pw==
X-Gm-Message-State: APf1xPBIBi0oRYN0uNLSoehXrtxFJjcViLxFhvUAqnD7WI+Sjp05Ygg7
	tMx6iJCSWq7M1aPLYIbLsBAecg==
X-Google-Smtp-Source: AH8x226Bu19j0zI37NoonUklXpQ5zrYD0ZDTJAd87pXEqA2gIZ6xO+Mpcf9G2TngoxIZnHh1jkQ+6w==
X-Received: by 2002:a17:902:d893:: with SMTP id
	b19-v6mr8418143plz.332.1519594443823; 
	Sun, 25 Feb 2018 13:34:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.34.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:34:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:25 -0800
Message-Id: <1519594406-24490-35-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 35/36] dash: move dash to recipes-shell
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
X-List-Received-Date: Sun, 25 Feb 2018 21:34:02 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dash/dash/0001-Fix-printf-format-errors-with-clang.patch              | 0
 meta-oe/{recipes-extended => recipes-shells}/dash/dash_0.5.9.1.bb         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-shells}/dash/dash/0001-Fix-printf-format-errors-with-clang.patch (100%)
 rename meta-oe/{recipes-extended => recipes-shells}/dash/dash_0.5.9.1.bb (100%)

diff --git a/meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch b/meta-oe/recipes-shells/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
similarity index 100%
rename from meta-oe/recipes-extended/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
rename to meta-oe/recipes-shells/dash/dash/0001-Fix-printf-format-errors-with-clang.patch
diff --git a/meta-oe/recipes-extended/dash/dash_0.5.9.1.bb b/meta-oe/recipes-shells/dash/dash_0.5.9.1.bb
similarity index 100%
rename from meta-oe/recipes-extended/dash/dash_0.5.9.1.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.9.1.bb
-- 
2.7.4


