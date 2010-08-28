Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRy4-0001qj-CY
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:43 +0200
Received: by mail-pv0-f175.google.com with SMTP id 6so1648285pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=TYHNNrdLJv3+y8JkQO83zwxdVVLEuPr0pC8tMZN3bPs=;
	b=m40gScP7LnsRYnfad2EXRU86hNSmyE9wwO7vDgyNquFw4YAgrb0Suu9QlHWNlM1cIA
	zYrrY2cFUQwIhqM+SkwnOWLx4i8NJEx4u3QfgPt3D9punXir6OgBYEdF/8zoteazAe7f
	7LfSLbLjt/d0Oe6xnT/7KZKTSC3WXJ1m6slU0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ibdX4WHpopqDfiWTKTd3erJm+DhTAT0B/2DPYA76NomBXaaFjSev0NSyYE/p3P6Otp
	xUJA9UrTFn1svB5fjhR3Zbxs7sdYop2I/vsOhTqPcrXt8MmYfmdCifpVlq1TfOjy5xy6
	nRsAf5Fr65gsEKkQu276ny52PG3RmIPYDhSa0=
Received: by 10.142.147.7 with SMTP id u7mr2685648wfd.221.1283027106759;
	Sat, 28 Aug 2010 13:25:06 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:31 -0700
Message-Id: <1283027073-12308-22-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 21/23] xqt2_20060509.bb: DEPEND on libxmu instead of xmu
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Aug 2010 20:25:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/xqt2/xqt2_20060509.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xqt2/xqt2_20060509.bb b/recipes/xqt2/xqt2_20060509.bb
index 7634d27..4492bc7 100644
--- a/recipes/xqt2/xqt2_20060509.bb
+++ b/recipes/xqt2/xqt2_20060509.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Xqt2 is an X-Server than runs within the Opie environment"
 HOMEPAGE = "http://xqt.sourceforge.jp"
-DEPENDS = "freetype libxi xmu flex-native virtual/libqte2 libqpe-opie"
+DEPENDS = "freetype libxi libxmu flex-native virtual/libqte2 libqpe-opie"
 LICENSE = "GPL"
 SECTION = "opie/applications"
 APPTYPE = "binary"
-- 
1.7.1



