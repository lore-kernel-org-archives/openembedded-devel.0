Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DB117752AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j4-v6so4788090wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QWdq/370KCX/7EMbXXqLl1vAqvLJrjlleBT0+uCTfQg=;
	b=awWjXivvlGycbGID7TJkUamudHmDbfHlNcUyWQWhltkByLD2WUX+HAa+rbFOM/HP0h
	Wq7CnJOvj4FBQ+Ej4oIoNsCHVbKpFmCGSGPMIF3XwTJZit/dl39XnhH2hl/2gVxqKDWP
	hV8IDkFqo8ViZpPuSM5/E7lMF2/e/xKNVNCQitb3XwIlUcXUgTa/64xXPZ8Z8gZ+Ka8h
	0shieK2mvY3YFwv5CLlgKqEUwFC31klpcdwfEEWfnSiz0uirfX3Q6LE9x/xxoZMRqeBu
	GsSstFq7WC28rSu5yIGNtLbBH05rtQJFxoNXtcROoiwiWBkI8McXbwX/Hp9g7qQ5BM09
	rv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QWdq/370KCX/7EMbXXqLl1vAqvLJrjlleBT0+uCTfQg=;
	b=WQ+dUOIf9BuPeXhVa6pOXcLSe++4/Tnm9i9DEFlAmcjC/5B4TlQF8rVAz8FiM/ho/9
	Vv13QTWMLzvNjP7BzvTXQgmMIB15MdgK5Ca6gD7QjSBuYDT+2qSiDy5wMQlKhCskEdyp
	1O+vneHL40EHRM6uHKljLX2KSaeaY3IhEuSAmkY7U43nQbly7djAL40myBKlQsPcRsOU
	q+zlrRNY0PdCT9OHgZ43++igd3rAJGkbZlWaPT1EUVPgzYVan972nYI5Gk4AAJklVpfj
	Jmzo/J9z7mq2Nk7eoG514LHWelzZyeV3AjXZDqC1YnvCzsDUtOsYWCGupDyMjNEuDYsG
	zlZA==
X-Gm-Message-State: ALKqPwcuyOhLhT+hdLnVX5LIMtBP0IID3rWIndumJ3uYnXKDsy2BYeoS
	d7lx5axYVxVvNFPghg9c6tLJPg==
X-Google-Smtp-Source: AB8JxZoZhJpIKB3MYIbDAW7x2W5bkr5NY5i7/hk6o+lk3FkciOcnPkV8lk3dyG1rNeCnwqEgFaqdag==
X-Received: by 2002:a1c:d755:: with SMTP id
	o82-v6mr1532338wmg.71.1525968871220; 
	Thu, 10 May 2018 09:14:31 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:15 +0200
Message-Id: <20180510161415.12827-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] parole: update 1.0.0 -> 1.0.1
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
X-List-Received-Date: Thu, 10 May 2018 16:14:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/parole/{parole_1.0.0.bb => parole_1.0.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.0.bb => parole_1.0.1.bb} (86%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.0.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
similarity index 86%
rename from meta-xfce/recipes-multimedia/parole/parole_1.0.0.bb
rename to meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
index 479f1a4df..05d92ffd4 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.0.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.1.bb
@@ -19,8 +19,8 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[md5sum] = "d00d3ca571900826bf5e1f6986e42992"
-SRC_URI[sha256sum] = "6666b335aeb690fb527f77b62c322baf34834b593659fdcd21d21ed3f1e14010"
+SRC_URI[md5sum] = "46fe86bbe0c4aa02c53244d66e62e90c"
+SRC_URI[sha256sum] = "8ad2931fdb35415cc3d7551b5f2207bfaa1aba15545accbacbb4984cdabd7099"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
-- 
2.14.3


