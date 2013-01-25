Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tyi33-00034w-Oe
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 13:06:22 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so142133eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 03:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=R3crws3Wvla/eypfpUcq51D48O8IeFOxovjDo7+/gfc=;
	b=cJgTHa302uAtg9QAiFDZrcwWIRJXBP09Qg7GRK+q7AVqHma/hw9YiU6TyV3IF4dpYK
	adG/raT4+avX1BnI+3D2h9+DMA37bh46x4pBu55ZzblBGCJ+fw2e0qPPCKBsPP8dmxpL
	UE2qvhC9cL0RM+4unSqjqCqSvnHON1JDneQ9HgIra1+oDH7FSRSc5mfYDXpQUD/it/ce
	7IAyFXTNx/pmUnW9AAyp5G+6M1TGqPL9fu0qPmXrt0h81cU4jXmtEw3V5qP09m3//AEA
	SUFgPwj22AbRqw5UePYKnyLZywy04WrJx+mpKF+Stkqfv/FkV4STlsdFANQuviSvyIdS
	Zs/Q==
X-Received: by 10.14.2.5 with SMTP id 5mr17192332eee.30.1359114647907;
	Fri, 25 Jan 2013 03:50:47 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f6sm1244955eeo.7.2013.01.25.03.50.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 03:50:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 12:48:53 +0100
Message-Id: <1359114536-3823-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd 2/5] tumbler: update to 0.1.27
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
X-List-Received-Date: Fri, 25 Jan 2013 12:06:23 -0000
X-List-Received-Date: Fri, 25 Jan 2013 12:06:23 -0000
X-List-Received-Date: Fri, 25 Jan 2013 12:06:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{tumbler_0.1.26.bb => tumbler_0.1.27.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.26.bb => tumbler_0.1.27.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
index a066713..663e67c 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.27.bb
@@ -6,8 +6,8 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler"
 
 inherit xfce
 
-SRC_URI[md5sum] = "874621e7820b3bfe0e8ab66d17f1dc31"
-SRC_URI[sha256sum] = "6602ce700160d09edd88ea0b9bcb16abbc28974f372e646709e0ed8fbacc8a78"
+SRC_URI[md5sum] = "3fa90528c3e7e77d8ace4bffcf0a2748"
+SRC_URI[sha256sum] = "4c60b3b92877257fcc54d18acbbe4ad73c84a7ff7608a430ad5a05b452923869"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
1.7.6.5



