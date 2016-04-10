Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD804771F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 19:41:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l6so16767204wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3HZTp5j04Id0iVl8TCroA+o/mR8QAGsZiRp9Hp8a+XI=;
	b=C92Fn2ZfqvjbiVeJpI3W7Jfa+dxP6JhBBd8tgjpD3F1y5ze8WqWClMpudPkiCJLN1p
	QNAIAuqnG9CIHidVk/99itSuVgzbM/KwTAbU2F/eHJBoVEu4XW0oCzhGDgIh/BL58k62
	2i+mXtYWZZ2ovwSv7ZO/YQRsq1eBT4M2EMaxVs6M74EJYzixhhV20tWP7MGddtX28z/v
	CQ2AknIxJKjSBHFLg110ExuxHZOP5hr7b4YjINMnX714v9c2vJUViknXOItJcfj0sKR6
	rt5OpueUIReaaqBUahVX55h+dFHexvFyRFxX13e3LlJ3W5L9h7qq/Bi5zvDodHasVWwM
	oJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3HZTp5j04Id0iVl8TCroA+o/mR8QAGsZiRp9Hp8a+XI=;
	b=NfWcfV3bkoTcYVzTmqjDo7aQWZ4MvdG8lxPUpSaUffYyJOWPHzHkLQkEyuVF8Ko8+o
	j0wser0ASj6+Zn7qvn1f5Zl5zzc2J2Y5TjrGJIfpKuVLpXrjH5uz8L0dxpeQ7Vq1dvRe
	ksVSPp2kVVKMHndVfUJN+7O8O4vC36HgH5EkPuBP7jXlDhKZinSjTVlxWGNxQrME+lBL
	rfKN1XouAXEuuWGDghC2VobZYCmCfAQtlYZY3AkqQKLiQAKEmiqRVR3Rm/8WpMFpBkq+
	Ivp7O1lmqb/kVxwY3xdBz1YPu5PxIQtBXZUDvkPsguJMwKcwc3FxBmmjjsN/M6MbbgUQ
	vwbQ==
X-Gm-Message-State: AOPr4FXUOvLbuFOweTYt9dQ5w41XLFy2ht6BiTiw86NT2blsVVvXqYHGoPppHpAHMWsKyQ==
X-Received: by 10.194.223.70 with SMTP id qs6mr6620757wjc.119.1460317319530;
	Sun, 10 Apr 2016 12:41:59 -0700 (PDT)
Received: from localhost.localdomain (p5B0A33F1.dip0.t-ipconnect.de.
	[91.10.51.241]) by smtp.googlemail.com with ESMTPSA id
	u79sm13612910wmu.8.2016.04.10.12.41.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Apr 2016 12:41:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 21:41:15 +0200
Message-Id: <1460317290-4787-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 16/31] qtwebkit: update sources to 5.6.0
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
X-List-Received-Date: Sun, 10 Apr 2016 19:41:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 04cefad..3f59ba0 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -72,4 +72,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "d2ff5a085572b1ee24dcb42ae107063f3142d14e"
+SRCREV = "be8e169ba38c84562194906047d0da04bf3ae91a"
-- 
2.5.5


