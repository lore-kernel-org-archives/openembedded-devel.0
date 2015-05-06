Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 67CB773755
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:19 +0000 (UTC)
Received: by widdi4 with SMTP id di4so208441044wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=0UzcY6wThjxCoZeoyLRpLzy5/ztFOuxU9oogj2ln79o=;
	b=k55AqJpMJ7IqN9PHad5WUcMJRPhgTOCh7hqAmCpOS2u7vLc5908WYO6RdNZBfGCAaZ
	u/ZyCQVZjA2//mqQYmASMo1q+yRL4UF29/ehkQ5EkyHFDyA+k6TVMWndpBtFYOEnsCxw
	Mf8PzbzxH7Yn+eR5JhpMcSt6QyLa9kc19/UQ/FzTWfxaInRxuI83nLojPLdBYc85Tt1H
	hkGneQYu0L2t2mkcGTXNlXMGiEUDpT+QtUVinvwOwZnEdk7gjS0QlX2tOkeFl3ULoY6P
	W+ATIbT4JDyzzWOuHvQUBNcdOzi6CDEPX3Lgo8wDdNxhR1blQOSGLEn+PG75j4QgownE
	b6cw==
X-Received: by 10.180.106.137 with SMTP id gu9mr15614064wib.54.1430928679998; 
	Wed, 06 May 2015 09:11:19 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:40 +0200
Message-Id: <1430928646-2007-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] xfce4-session: update to 4.12.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 May 2015 16:11:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-session_4.12.0.bb => xfce4-session_4.12.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.0.bb => xfce4-session_4.12.1.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
index eaef4c6..81c56cc 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
@@ -7,8 +7,8 @@ RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
 
 inherit xfce update-alternatives
 
-SRC_URI[md5sum] = "d75b257bc0954c238d3c82ce498525aa"
-SRC_URI[sha256sum] = "68c85453b097d3ada573dcb7e72acd06e0fc34531996122c10d20096405b7b06"
+SRC_URI[md5sum] = "f4921fb2e606e74643daf1212263076c"
+SRC_URI[sha256sum] = "97d7f2a2d0af7f3623b68d1f04091e02913b28f9555dab8b0d26c8a1299d08fd"
 SRC_URI += " \
     file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
-- 
1.9.3


