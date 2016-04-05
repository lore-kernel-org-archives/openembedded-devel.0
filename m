Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 35F7877071
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a140so1213234wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3HZTp5j04Id0iVl8TCroA+o/mR8QAGsZiRp9Hp8a+XI=;
	b=Pnt5Bobg0n1OxIosTylo0L59RU5oQd9LYQESX2NbOmuoIcRt8eRNcQmCXlVT9rY9Ra
	vfIHTJi+AdgDhTO2XJmXsOAs3xLwztPVd9fX6FKoqMFWzfOOcGauPNxsrDCs4VIOTWVQ
	g0qLvjcZIl6Vus60w0QWUJIpjwB64NTEkBvJjmQldLb3eKO1/eI6HcswyEbqHS9myzZe
	eHZOtSExrNk6SmhdxJ/LYkimy3535PubDDAg523/Pi7E6Lwh6j7wwMXTEELSOrmUOo92
	idA9hVxo2JNfWOh82AdsQg78iQf4d1TTX/g5BIl6c/o1ze0VOZerF8W1KzPosbGpFAB5
	i3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3HZTp5j04Id0iVl8TCroA+o/mR8QAGsZiRp9Hp8a+XI=;
	b=JqWEm848HjzLtoBEV5Ms3S2E+JquexAUza5u2MkE82AtAj5OYuVUPXKGFTrCGaKbgl
	697XdzHUamVjxOeFn2HHQHXSDiCzErKlbxs9EG4cExnCyWtkKxcYr1W9cthicr6c7k9f
	MLc/DVFz+K2yquSK1FaSWBg2OG+fwAs7W1OviOHZjlJyueJJ/cjsCygo6zuc4vZBCbxf
	sODuHt9xECp01zIEgsx7EVSaYwnpj0Zs/+UdEtflFfE9qBZ6UiBusVX69SaGL8yOdAxT
	JObnz11Lgmr/hlrNlLDS6SCUaDqbR6ozDiUQHT5K6fa5mEjeZQVHYt8H8fUvMdNvfvv2
	H5qg==
X-Gm-Message-State: AD7BkJKrLugKA8WY3jHsaYXDV9YcTUbpeFO4RvoiFWEAoxGj6csvULPXCUBIT4Hp2RIWkQ==
X-Received: by 10.28.53.134 with SMTP id c128mr15694678wma.10.1459834749840;
	Mon, 04 Apr 2016 22:39:09 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:25 +0200
Message-Id: <1459834720-17165-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 16/31] qtwebkit: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:09 -0000
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


