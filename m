Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6D83D78891
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:52 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q13so5717195pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h7m7ZFXaecq/o0rO0YWON1iIYKwrFGL8FV/LBm+hYzA=;
	b=SvinQFcKDqwgn5JrmBEAMJzeYmIzqw3AMnAR4kFj2il5GReAoFkdoQ3N5iFAUlqN2d
	+3Zw+uHcSmSyUTL/x0CJUC6oxOvZoEF5JZpApfNiGp6fUM6RvqL6VnE8qYLRyxGNhcho
	NzjHnE5CV22YhzKl20JDKGyPIJo73Wak4gxzRK93VvBCvJ7mc7G2ln0S+cfL2qy8UEZA
	olB4hY/xN562mEMLdxgjnjtVtAd+t7U5/ILjrr+akrQ/OASF0gBUAs4+ABQdiAdOs1vo
	vMohdZgqpSzf2h+qmOedyU/Rq+acMjc/DdQnIpa2u6APbfpdECev+Gv8avGtXRhty/hj
	iS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h7m7ZFXaecq/o0rO0YWON1iIYKwrFGL8FV/LBm+hYzA=;
	b=U3tLDI0wI4aDxruXa2zi3CTee8zGJC0yWIHLlCK3Ff7R+4cV4dvbTxc8LrPBMa7vNV
	04FjdhD8OGQOS0jqO0eKaeRWavVrsKiVNcvWMjGG7bpCH0TFdu2qBrbhUvHu3BBv6GOS
	ZUWgCrah73ML/bCIM5k3XBzys9ji4TOAvJg8ABJHT9r2TqoIJ7Swmbf5shHC8Ay+4R0B
	yFvEs0SW1MyJAT/auwpl/sHrUZYP+AImSLV4xtHFN4hlneMW+pL+9lxzYkH98NGU+/Je
	uH+8e7piwnjh73A0EWOvbmjSbxjKxNhnj5/iYRsRyTJYsJd9NCbtdpvUyQu4TYmOPykV
	GKpw==
X-Gm-Message-State: APf1xPAX4P1SItIU756KTHgnDALpLDCUw1cdpeD9J7tNNNNdpjuXA3Cm
	htJKIpCoLwpMO89iTbX9XpZIHg==
X-Google-Smtp-Source: AH8x227sbuP5gHlcOlAc0Mx8v6sYvgsun7FwoyuF00x6FXfQNOAYPkGqvYFmW4/9DAz4ugF4yP7bsQ==
X-Received: by 10.98.0.67 with SMTP id 64mr8322221pfa.63.1519594433761;
	Sun, 25 Feb 2018 13:33:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:15 -0800
Message-Id: <1519594406-24490-25-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 25/36] passwdqc: move to recipes-security
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:52 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../passwdqc/passwdqc/makefile-add-ldflags.patch                          | 0
 meta-oe/{recipes-support => recipes-security}/passwdqc/passwdqc_1.3.1.bb  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-security}/passwdqc/passwdqc/makefile-add-ldflags.patch (100%)
 rename meta-oe/{recipes-support => recipes-security}/passwdqc/passwdqc_1.3.1.bb (100%)

diff --git a/meta-oe/recipes-support/passwdqc/passwdqc/makefile-add-ldflags.patch b/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
similarity index 100%
rename from meta-oe/recipes-support/passwdqc/passwdqc/makefile-add-ldflags.patch
rename to meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
diff --git a/meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb b/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
similarity index 100%
rename from meta-oe/recipes-support/passwdqc/passwdqc_1.3.1.bb
rename to meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
-- 
2.7.4


