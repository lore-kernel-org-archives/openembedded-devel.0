Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ763-0001Wz-CI
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:44 +0200
Received: by ywg8 with SMTP id 8so1747192ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=qc3XzUau0m52Ztcstk5lNxlZOrseU+sMt2ut7fZeMEM=;
	b=mHM/4m4OXosDw8ILv47j+H9hun/yJ+UZjuOHUhjlNJ/JVfXOmmSC0yd8bXcC47qHr2
	XmlOry16Vwb1vWnAswT0BNb0Zejuek/u4Vx81TgRYYLexDPZ6pj5QzKXUc27PAC942Rx
	bSJOAwMXroZE9KQo1C/7R+ax3T9Y2xhSkaPnE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=R8MQZhWGVWXL5CDcMKQnDLT2RWfQv2LG7IIipR9nSCw20eVf8ZAkInLQbdiXV9UKE3
	2jOQt9GQWKjDpVQuZw/xAL+BQEUj1TXpuNcjS3i0uhue6EngGzFhQl4LQVwxWmOrhlGt
	zGMmqYyKwjNOj00KeaMotyEb6K+zzZ5nPw/cw=
Received: by 10.236.73.134 with SMTP id v6mr3064648yhd.75.1304872918293;
	Sun, 08 May 2011 09:41:58 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.41.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:41:57 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:29 +0000
Message-Id: <1304872895-21596-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 05/11] pixman.inc: use Xorg mirror
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
X-List-Received-Date: Sun, 08 May 2011 16:44:44 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/xorg-lib/pixman.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman.inc b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
index 539a33a..5661fae 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman.inc
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
@@ -7,7 +7,7 @@ DEPENDS = "perl-native"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://cairographics.org/releases/${BPN}-${PV}.tar.gz;name=archive "
+SRC_URI = "${XORG_MIRROR}/individual/lib/${BPN}-${PV}.tar.gz;name=archive "
 
 INC_PR = "r5"
 
-- 
1.7.2.5



