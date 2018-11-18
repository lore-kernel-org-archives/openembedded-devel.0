Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B63C6C100
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 17:08:21 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id g62so10409825pfd.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 09:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=HaO9L/vk4c5aRW0LDgd9zQ4djk9GoLKiRlg6Y/OqPPs=;
	b=ePkn819dmHHqy0L/7KqYsJIS5hHGVZtT/m/OxJ3NwVesylwekX3uXw03eenLUEJqVz
	xXy0Q/+5HlqzidBYClbtVJNpq8IMAcOWvtCPB79kvI3+sfslQ/IvIG/8ZzAnmUNMHTL9
	LkwQRJ5+xj74dI1CABLrA0t3UHkebaf2JqMYiqvQpDylD2Er7WwQ7ptTuE+I2rHISOnh
	TjBBQvsXN3mcR1H+8o01fLa4coxQnpkxycBHlTCoTeyxRupseFsxwDJ7ZbZP6HxvsIgh
	wkHemJp3xqGkzj2pNXagkfZ+4rg8kHY8L+dDQ2+fEI6uZHPI8zaKOL62H7IfW0BkEe5A
	2liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HaO9L/vk4c5aRW0LDgd9zQ4djk9GoLKiRlg6Y/OqPPs=;
	b=L5b9IxFAs3AhvIB8IL7Ed+E9LVEwvfPmQE8tkjSLUjn2CRERClxVbaCvG8tUzoGgxN
	wR8gjsr0E0JOYDGNQzVP7JHy1aqEqPPws1u8/KfJ6Wcuzz8aDJlUE1Pv+fBUp+bBwxsh
	qI3fTeZqxocRlV4aqMXH1ThIivC4WvyZ/Y0g6k575dVtWkA2BSHz2YEJj6CgQ46TYmmK
	VoT/aF8XO+4solvG+Yhx7+GMv1z/YKIEA27p38J9xiqVeruoauckWKujRtvvjh8zWxIi
	vq7w8z8YMLfxDAbED2Mw9zTgKvcprikWNsNS2D4AHUhYAxvO89Q2Xg1J8vRUrQ/UfSU/
	LHyw==
X-Gm-Message-State: AGRZ1gI1yhePJ2uGfw8/M7DIAkLyOX2+nlJu7OhmKMAkTqdBr0uuubV7
	SsPOt1d3zYCCQ38ngZVSshg7NXu+
X-Google-Smtp-Source: AJdET5cGtAevmovBOEPTtJtxIGtLxAAzOX+xNbVYt07nNlURY7ixYKIdqxbDVMC9vJwvkjQ15gE9tw==
X-Received: by 2002:a63:c141:: with SMTP id p1mr17123987pgi.424.1542560901458; 
	Sun, 18 Nov 2018 09:08:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8599:3a91:5ee0:9f77])
	by smtp.gmail.com with ESMTPSA id
	w11sm9924707pgk.16.2018.11.18.09.08.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Nov 2018 09:08:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Nov 2018 09:08:19 -0800
Message-Id: <1542560899-8877-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] ndctl: fix compile issue
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
X-List-Received-Date: Sun, 18 Nov 2018 17:08:21 -0000

| No package 'systemd' found
| configure: error: systemd support requested but pkg-config unable to query systemd package

add PACKCONFIG to disable systemd

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/ndctl/ndctl_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
index b20915f..048f166 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_git.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
@@ -21,6 +21,9 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[systemd] = "--with-systemd-unit-dir=${systemd_system_unitdir}, --without-systemd-unit-dir,"
+
 do_configure_prepend() {
     ${S}/autogen.sh
 }
-- 
2.7.4


