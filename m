Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpu-0006mg-Rn
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:53 +0200
Received: by mail-ea0-f175.google.com with SMTP id h10so984158eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=0T6c+/7qMsKl3ddsF+k1XSR3OClF0vNBLAAgL7ynsUw=;
	b=zC3r59+IpeT5W5pqAdcXM5jhKisP/TFKTGEqwjZ436+/w261Je0KoD8HAHfI3t+dVx
	oAyOE8Wh4olzoQZImT0DXrgpfm+Z008And0mM1STQwNMKY3sUHhRryI6SqhZsmMVLVIc
	j1LV4VwnMXtETSTZxjgX7NsV3peRTBb6YvMk7Pl1jSkyTMXNp53DWYqVT9YtdJD1LlK+
	S7T/KhqHNqmADQZ/NyljMpU4L3ri7MY4B37+Hm46W/xA+ol4WzclSbDUxxLkTJz6Lqyj
	UT9jg5JbEu0l4Cn4sX/bRled2gdG2TW6KLhWG4P/yh4syAbhma//AbjT9pFCVWl8fZJT
	MQxQ==
X-Received: by 10.15.93.193 with SMTP id w41mr94049714eez.22.1368631418280;
	Wed, 15 May 2013 08:23:38 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:53 +0200
Message-Id: <1368631259-13401-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 08/14] xfce4-terminal: update to 0.6.2
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...4-terminal_0.6.1.bb => xfce4-terminal_0.6.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.1.bb => xfce4-terminal_0.6.2.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
index a8cff39..470bf60 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.2.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "98613ce500fef2ed62cdbe788084acca"
-SRC_URI[sha256sum] = "61346427e55af79e86511572bfabb2e025cb13720879226ea1b98a92f0bcd4c8"
+SRC_URI[md5sum] = "d5cdb302bd770c9f2d30262c26639006"
+SRC_URI[sha256sum] = "3d92422288d26311880af694bb4e02c9235997ca307a5e85001bf6bef65c3b35"
-- 
1.7.6.5



