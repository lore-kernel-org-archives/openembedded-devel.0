Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id DFB177FC87
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:11 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c9so25042671wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ymGoInxhBYk5bbniOYKbNYjZ7vQXxkPqPjJqviEFah4=;
	b=pVcpBqahbFed1mIAlZWphPHc1IPMmMzxPxDD0IeAKGed/m8JMZfI3f+QievCMTVICD
	0ACM4Mb7EhByNXwR/i8ACTW01EbyZEBT4/zaInoQoH+E10eZtsvEojUPXAvqJA699Y/S
	DEOzIFkcj2U1NR0f642jDiEpvhjV1Eb/pJjV8oOVRGn4J7IYbOyne1I10f2NIg0V6yDL
	iWHSBGevva67k6oxX+gEV5eltqTHhSb/L96grA2IZHLZxZlPou7VahV/eUsn2cJ5tElE
	87gzWiE+2uRSjf1STDQLRjhZxj2f4n/rUL82QUfY36o+OODfntQo6NyZp8q+pbulIKWy
	xxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ymGoInxhBYk5bbniOYKbNYjZ7vQXxkPqPjJqviEFah4=;
	b=r7vvR2iIdeZow8SPtHJyPVpHJnxo/mZO3UxFJbEmSIThnGWIkrqJ25F9QQau2rdXQk
	+rAmvlz5kjsY8vj8nGFnyR09LvZhzxYU5/9n1szFyPTeglxgLKNQRjj63NlcFuuB50Q2
	xSB1Bs4KgWCkESrzgQWsmKadF5LfSBmnyWUXjF8c3ewUXoR4VFiGbEVOODBU2nYHFxyN
	n+OJxM+w/1qAyPynuGugsA2AD1jXVVdrFAiz+ge9jfBuXW/GMnj1/OHxlLMrGWhcfUHQ
	saKChGJJMnM5Tg1WHmLTVNLsic85k5xuwhPwVAWOA54EpfsgTfVLM6S1xmG8pWGIzls6
	8dEg==
X-Gm-Message-State: APjAAAVEVLAFpaPfvGKaobEGAb9N80s4xWWOrrdy2xMII97CIt+tVv4y
	X82ifi0BVdG/JDdmh/k8oxceNGoE2Ko=
X-Google-Smtp-Source: APXvYqzCYGJ6uOMX8khKeGmaLeuUZRRS5yJKltIWNGgQXUtq4kejidIB3cCgTZf90TBRE1ClFxTQZg==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr7962006wrn.404.1579346892334; 
	Sat, 18 Jan 2020 03:28:12 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:41 +0100
Message-Id: <20200118112757.5287-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/23] catfish: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb b/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
index 4152e1583..27b5d5ed4 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
@@ -3,7 +3,7 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-inherit xfce-app distutils3 gtk-icon-cache
+inherit xfce-app distutils3 gtk-icon-cache mime-xdg
 
 DEPENDS += "python3-distutils-extra-native"
 
-- 
2.21.0


