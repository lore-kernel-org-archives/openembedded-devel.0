Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9E67C37F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q9so7557294wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fNufWuRZPPPM9serwjwkq8Xh0R/zkpst/qKys5OjO0E=;
	b=Cz6RNZg070Ko6mT7+Xd9VpuYU2d0RhJ8m1KDWvdJwGXMJGy0danf5xgaeuM1ZGgKBy
	273RapJWZNeisbWkpsX4P0dSHKXUz1hfABmU1BSpxV/6QhavWQUZ0whrut0j5a4oMMzb
	Q4ybymbzZGJndACXqF3RpUc4WZHY66M+EtE27SQm08w7FXsNp4N4WsIYdGURy0s6jmE7
	VCvWxo+k9WoCkz2OnYTwIjNbki/cRw6odNGo/x7c1LnYEymabd7v58TOHHRBC3CtIITi
	ABasiGr13KlLYTDXPz+8uXKcznX0wnD/dRxgEu5oJR62GX7T0guNFMYFNk07ZErvp3zv
	n92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fNufWuRZPPPM9serwjwkq8Xh0R/zkpst/qKys5OjO0E=;
	b=D1MU9EicmtixsfuUOpGAJm89uRp2SDqsJrkhs4H4hm3AN9F7Pe9QJdN+QXqMu7xZb0
	XVYXgiuW86RR5yosFFFFXAvthZtWAnzJumFEYgIIlpM2jcXpF3aLF5jpTKw4t6iOdYr9
	BpRNe3M4TuLOKfm46HkV0YGonuIBBovsBHXz1t/kbYF4mCDKUGkuzgxmXZ+hcGkg6N3t
	hhEckxR9fUlW6iZzMgJ6iNYUtr7jAMQGCkm9YWoYHBW2RAA0FPpXoJpxLdmIiZp2wNLR
	Gl3RA0E5gqKdJUVorvujjnAvKwCjXXBBhhcGoUEjkKncjISjtwhwZUbHrej01ekx3MAm
	r+Ag==
X-Gm-Message-State: APjAAAXORKJgeWAUUkTIAw3/duzcxp3AVTT3bGbn7OkNrfhX1ucG0e3Z
	UPD5S2yFDqKXBkbGhyMuZrTSuEFdM8w=
X-Google-Smtp-Source: APXvYqziS4OwXD2aIgnOEe8CJmLkIojgL/hgu38RuOlVl3y/CNXtAmO8lSMv/b1jZ1myEQj1JEhlyw==
X-Received: by 2002:a1c:66d6:: with SMTP id
	a205mr20964196wmc.171.1577482289820; 
	Fri, 27 Dec 2019 13:31:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:00 +0100
Message-Id: <20191227213120.3930-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/23] catfish: upgrade 1.4.10 -> 1.4.11
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugfixes & translations:

Release notes for 1.4.11
========================
General:
- Radio indicators are now displayed on the layout options

Bug Fixes:
- Fix crashes when GdkDisplay or GdkScreen calls return None (LP:
- Fix configuration of preferred window layout (Xfce #16085)
- Fix finding files in the target directory (Xfce #15985, #16233)
- Fix symbolic link looping (Xfce #16272)
- Fix home (~) expansion for the start path
- Fix asv-summary-has-dot-suffix (https://appstream.debian.org/sid/main/issues/catfish.html)

Translation Updates:
Albanian, Belarusian, Catalan, Chinese (China), Chinese (Taiwan),
Croatian, Czech, Dutch, French, German, Interlingue, Italian, Korean,
Lithuanian, Malay, Norwegian Bokmål, Portuguese, Portuguese (Brazil),
Russian, Serbian, Slovak, Spanish, Thai, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../catfish/{catfish_1.4.10.bb => catfish_1.4.11.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.10.bb => catfish_1.4.11.bb} (72%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.10.bb b/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
similarity index 72%
rename from meta-xfce/recipes-apps/catfish/catfish_1.4.10.bb
rename to meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
index 602368b3a..4152e1583 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.10.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.11.bb
@@ -9,8 +9,8 @@ DEPENDS += "python3-distutils-extra-native"
 
 B = "${S}"
 
-SRC_URI[md5sum] = "1b8e7bfd955364b7912fb0a248329b3a"
-SRC_URI[sha256sum] = "2573a004105031f871c92fed22a0c4b15bb96f2dff6e36c4f2959f56b62e343d"
+SRC_URI[md5sum] = "67e23d45fded026ef3445bc7fe1d1653"
+SRC_URI[sha256sum] = "617baf9309e3cdfb20c8357ac786eb26f30e6fd4280d4534d3cdd742c7ffcd85"
 
 FILES_${PN} += "${datadir}/metainfo"
 
-- 
2.21.0


