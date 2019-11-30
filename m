Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 14D367F898
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:58 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id l24so7559339pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pO3vazFqTYpXFb+fjyJx1hCE3fLoh/VZsM1lGAoPqns=;
	b=N/bGvQj7obWpVrbeRQiz+oseNubjBlJrxB1CfPeRVUcBP+lRDCKO0B8J/l2gZNXrK9
	+QSg2GRRDRS1485nNpLTXLIXbU1PS0zt4MHfl4vgn4O/ALK8sc54Nya2xXGC6izBUCvF
	l5R879C8tWHZDJIxEJDoq3dLrNhY/8HUvh35sfDM+NGxP2C0Znn2/Q+s7B7L+6+TjIeU
	vdTNQePUDgbM1wpbRbjDSKEbAl1cOI7Umpt+6q8G2eOLv56lolePbLtiXmxkzV79/Dse
	1gTT09zAycIV65NDeL3kaNY4O5xNHgzPDlfhrc+hneX+5DMJaEzlwQEhQgpW+5rdtVuI
	n+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pO3vazFqTYpXFb+fjyJx1hCE3fLoh/VZsM1lGAoPqns=;
	b=T7XiAzh0QwU2U5LvnIlrcDgPnn32SbPUtmosWcdAAeboxmnKnQFGc7QY0rXCTeqFjZ
	TwTkbQ2RN67p8CmvnCWTPIANpy8OdyleBUoASqEAnJlnt7ibFH4w2InQnQo14KNNrq4d
	n9+A/0qVZV+H9mVAs6jrCi9+6z9d330AfBNFcsQ3jyZpCQmPYzR9B857tsQWmSbUGNw3
	ErJLB1Y5kzu9brfAPylvZTRDWs/A/X/IRKyzqU0lTZh10XdxMSKpRLssIk2QoaV8DND1
	JtoaQ2qlZl6kzY0/XnylZQho/T4aXbsRFEmWShEwjBawmY6+6yTCCtN/S6uxWWzgneVS
	XyDA==
X-Gm-Message-State: APjAAAUFnnOQ451AZEXuMVO0kbBmr6Us4YSsDy4kFqV8mScq9njzTnuE
	tj5DltKZsX8Ev4Ug1AuiYvEBnC9B
X-Google-Smtp-Source: APXvYqxnhSubr1BnYy2w+vdSN7quqoQaKQSZ82GrQjTIJDuiD/4WZVMFupwkFg1YF/ZLlH5vbgqQ4A==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr4606575pfo.82.1575137459996; 
	Sat, 30 Nov 2019 10:10:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:42 -0800
Message-Id: <0d15888c61c2072d1525889a0c0ad6af5676f11d.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 12/15] rsyslog: Dont force enable atomic builtins on mips
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:59 -0000

From: Khem Raj <raj.khem@gmail.com>

This would ensure that checks are performed properly before using them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index f50f9a3..8287d2b 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -39,6 +39,7 @@ inherit autotools pkgconfig systemd update-rc.d ptest
 
 EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
 EXTRA_OECONF += "--enable-imfile-tests"
+EXTRA_OECONF_remove_mipsarch = "ap_cv_atomic_builtins=yes"
 
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
-- 
2.7.4


