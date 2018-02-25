Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E14D77883A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:43 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so1107992pgs.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YCbjPg6ZCdlxBTjE35JIa0oCNElOwbtWYeL7mwyEjUE=;
	b=YTGmpHrs0SFEcu2KG0ocHFVXnVnmPVhRf5pExQb2EQzsRe3KjNHUgV2QsZ4dfJEiAx
	GABho5SkFhnta9WIQF/1ZdZM0aU+vmz20b8/KSJAxjmdRJrDSYBl/2ogG8PCjt/Szekc
	M9W3fQhCmo8mHYKToSuTWtRg0nZZbOZUYWalNCbbNZfKjR8fHXzKxOeVbE3b0urkxUTc
	k+C/eryT5lP4CpXkZJbQ/gJtiXx1+lDTcCk6G2v6L/wyY6rmLKH4iUXaag25Gxajgflv
	fSioA1fRDaTGpeYxYxydG7Z+RzQ5SJC/RkQSf3yxwHiMZwnPvGGmft+FMvOYKvKbvKle
	4oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YCbjPg6ZCdlxBTjE35JIa0oCNElOwbtWYeL7mwyEjUE=;
	b=O2gF/uvjQ+rQXdAULA5RxYTMRzs5anNWGIM3PVTyCBsnqN8/VWjkIBcrzvgeaaqahs
	/m2XWGzfM6kL3vU68xtWHWlz6cP7b79V/Xc+wJrF7Rddms55wmSjBT3YsQLybi85bfQJ
	Gop65ydPsm924kyWtEAO5PYe5K2ozRYdPEeTM5RbTnrrVPswx/DOyl/fAF37arj8XEYm
	NChTOvTYftyYSVlTuhp7JaTAfSKupSCRCRF/pa3E9wvst3rD5ej5EInwWqQq9NV6rWRG
	3cP0p7u8kgIxB7NOqMA/W9MqcRWS1/yPdZhNlLRqHWMTstirWIVQrdovZ0b+32XoRxNm
	nqYQ==
X-Gm-Message-State: APf1xPBSBSYAl6scb7AapZ5FFpQ7ghABvScTrKfUPbYvOuNFEtEAv3fc
	GreFl1K25YArekIqpM30pGHiWA==
X-Google-Smtp-Source: AH8x224XSGerQINQ2ze0TeTrot2XxFwOIL/xv+wN42bejg2XxLsbVyIl7V3dFA63EJe4I0HBVTqr6A==
X-Received: by 10.98.185.24 with SMTP id z24mr8463631pfe.185.1519594425217;
	Sun, 25 Feb 2018 13:33:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:07 -0800
Message-Id: <1519594406-24490-17-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 17/36] tomoyo-tools: move to recipes-secuity
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:44 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb                                    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-security}/tomoyo-tools/tomoyo-tools_2.5.0.bb (100%)

diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
similarity index 100%
rename from meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
rename to meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
-- 
2.7.4


