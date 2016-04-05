Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA1E605BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:38:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 20so1203985wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5eoIBSK5YLzcFqGEajpkqNR0oxEOXNAp2IdZtbcxn00=;
	b=bUl/KLq+bMY+kEkkXI42B/CMjMiwg3GXK95tzKqLHNTDxkwdy920hE8EdX48IKc93C
	QpDA1HC5zIX4Yj709lWE8e35YrMwTmn/ZmLex9XxSByjtXuek8WyKLd6GT9pT6roPPa8
	t8BbZoZhy7JSM6BfMWwOzp+4cU3NKs35kjZLakh1PvUi8kloio0XszVSqHBoKSpUYy4g
	EMhTDS+WJoRucksofUF9FLe0ogXeEksQmR8224qRW8ub+5if7zK5wmQmrLC1XH7g2a6G
	Ytcd/OIz/Lryny7hAcVfI1dl8mdBbPokqKBZP9av+nqYeXhUycRXL7Ao3nasD4x4Yozj
	tpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5eoIBSK5YLzcFqGEajpkqNR0oxEOXNAp2IdZtbcxn00=;
	b=JvYlnmUVOpQ1lybP6ZVhXB7pHZxZDofENknL0Mc5NkhfwG7Y6iIHdUDNh6L+gcWQHN
	mUhnmDThANOuenq4tBq1uhepe+v24vBOVJ9Pw9EvBDksud3JjAum9e/ov9rDfd4i9YfW
	DZLkN4clda7inii7FhvYhijeSs3u64bpIsT+oKpuG6uewbVZ4rTOCRi+7Ay1o+bTXdjN
	AwErtYR8hRBI1jm0ZqQg8X02RvU6ltDPiUY+3pwKaWocwHlrNae2F2E0u5adM1W1mv+b
	V/vw+JyzgxAkMWWBZdrz1AHYqCH1XQnVJy47O89GFg3jxjJgISXxYydDos3v2o7LVymt
	jkrA==
X-Gm-Message-State: AD7BkJLwk28SdiGXccplAqFxTolkwXhoy4t2435HdhYLLLmTCPbXJBdNuntytcjdFAB7pQ==
X-Received: by 10.28.132.212 with SMTP id g203mr15623750wmd.30.1459834738516; 
	Mon, 04 Apr 2016 22:38:58 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.38.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:38:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:10 +0200
Message-Id: <1459834720-17165-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 01/31] qtbase-native: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:38:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 057edd4..0dba556 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "41706400f605524a5a9953714aa0cfbf811dba7e"
+SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
-- 
2.5.5


