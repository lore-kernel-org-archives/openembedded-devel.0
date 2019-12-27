Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 671626C1C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so27202938wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=woX/AzhAFxph/7AkmS4BQbLtSKIFCBwxfYU7MmTy6SM=;
	b=usK6C5PvFJBBfIHaBuztgz5US1QR65m8pFgTWy9jt4oy4qaSzZtBZvRguibpjHdTGa
	s3SLBOyRGMfflcIUuzUZ5atQf3lt4C/pCJMwS+D5POke+kUydINns2carfDVcMYkhX8v
	NMl6/wAmugJVprytTINMsicAMHkKtXt74bc9F7eeV5aJUIWUPqV//vSJm5rja8eWVJi5
	7bpO+4Rlo1reYO5jmqEsmhwHZpz6emO+3ITSiM5KWXSp14WGAM8r2EWX/0vkTfHtv+H3
	q22SEojmONQpLVJFN66bGvr5ivNZyKHr5cqJfe732AOZsD0dEbT+o4UhGAy9Rns7ddk2
	vY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=woX/AzhAFxph/7AkmS4BQbLtSKIFCBwxfYU7MmTy6SM=;
	b=aqlyZn/z0UjVjXsLr9nNiouPggrcE4njyNxsGFUju0ejWj+dGGK387aZXOw9LYRnON
	d5fsmcJirDqaTSJHEoV5ZviYj45lWC3+RdyRDU0xElLjgkozxbnTKMG8L3EuH6ZV7clA
	fE/B76v/RsQ25giob5PVKIffaIzFuYUTMdwfn+4UpO/uAijj18HiY4ejkLPv3w0+mt7z
	SqjRWFpIxZW3E95CsBma95UBEWX5nBsrh58wNQejArFD1PVq4C4czu5t2KSb5Le80v82
	p6UqAeku/CsVySvKRBH9Jdv+smQg+/o8RjzhBZsKqv4mS9NbI+RhmvLIjp5QiW8V2LEH
	WaTA==
X-Gm-Message-State: APjAAAWzapepNmAki5io71BFgmUrLFaxPyRRsbfAl11rrk3rz0ugqtsZ
	iA/Vy5Zs9Gjp3aUFwHu8yacNXhYwRpI=
X-Google-Smtp-Source: APXvYqzLovflaXp+Vo6sMrIl5wK4sxomUtouWQF3/94Hq46qjC80iRtbzzTkJ2CuWwTcMV4gSA6lQw==
X-Received: by 2002:adf:f311:: with SMTP id i17mr52120298wro.81.1577482288909; 
	Fri, 27 Dec 2019 13:31:28 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:30:59 +0100
Message-Id: <20191227213120.3930-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/23] tumbler: upgrade 0.2.7 -> 0.2.8
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bugfixes & translations:

Release notes for 0.2.8
=======================
- Fix thumbnail orientation (Bug #15011)
- prepend $XDG_DATA_HOME/thumbnailers/ to thumbnailers directory (Bug #15858)
- Translation Updates: Galician, Portuguese, Slovenian, Spanish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../tumbler/{tumbler_0.2.7.bb => tumbler_0.2.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.2.7.bb => tumbler_0.2.8.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.7.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.8.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.2.7.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.2.8.bb
index 434f8741a..e0d4845a0 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.7.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.8.bb
@@ -6,8 +6,8 @@ DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgs
 
 inherit xfce gtk-doc
 
-SRC_URI[md5sum] = "a59b2a545c9c128dbd2b960a7779dec0"
-SRC_URI[sha256sum] = "f704c35f16716cbee3c94883cee2a8d865e9cf2535d0e84f57e1c8cce00314e4"
+SRC_URI[md5sum] = "5d541608b3962fd2b16e23a266fd7a10"
+SRC_URI[sha256sum] = "0999b9a3deb57010956db6630ae7205813999147043171049a7b6c333be93e96"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
2.21.0


