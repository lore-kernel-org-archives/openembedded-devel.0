Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB7974E1A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:49 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id w8-v6so5089879pgp.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g15aJWUw6F4hZLX54HTkMmzOmJgQ8tkhIF5jsATcDTA=;
	b=GTnkReQ8TrFk5o6mkmDR6KgpK4xofp2izQW0TTUz89cQcS+W1oEzhJfvkEKB+G3Wgp
	diaNax2qHtN0mcd5iDV83aXOoUsFTsmXgFcZYKiw4c6/q9kbDwwRrEpqe3OSAigWs+BU
	ah4JNykyCvVc8UPSkUIJNoRXEbTkLdW691o1QuA/gJhuY6xOgH5ysfvLeqmuxKtYcm2L
	E4HM++VWZGYsL0gXYQ2FzSKWipwq2WpZMldFThZjkrAlE913zPWQ7y7cO3WyW3DAHErw
	crAGcm7WukD0uWtoSft7u1hQhnZliJWb5of66UhafSE9aBJgV84bKFbM/ULes5TkN4ej
	s4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g15aJWUw6F4hZLX54HTkMmzOmJgQ8tkhIF5jsATcDTA=;
	b=nB7bObm96InMgvshl8lfK5yUVogi1bIGLMtPP1+IN9jbDvCSVMK9Ce2dxGG1TucJ3L
	gGn2GSQ5ZfHzi9HeQ+UyKTuw9y++rEhg/4rfasuSbU8qYAg6W6XC16hDprNSGgfKszkF
	XQbCg3DlnwuvalQpUxCGXfwNd+yzFqoJn1+/860tvzPWk+SrjuP/gsTABuGwXFO+4uJt
	iryk4f51/pu1z4kLIkXZLFxcqxmlnfIjlj6LbAD7DI/mPNORZB5iYYL/H0oZMXX42I/F
	nzFjaV0uk349HTPaRfgRC6SuqmjYfIgu1mBGeUpHrH4N/nsG3d9Y1W5ckEURTf7gCjUX
	lYwA==
X-Gm-Message-State: APt69E1fSgSZO2uoeGxjDhVnDwbYqOt6Fk4MqmpoCCJ+tJaUBnslIL/j
	EoJkcrnDajGTBcNaocJ9yuYXnQ==
X-Google-Smtp-Source: ADUXVKIVfnGoVKTEJy3JT/zaDX8uRJ0d1T84ydYqdqoak1gKz9qh2WMty0DDBGVMUEvTtJ+p1aETlQ==
X-Received: by 2002:a63:6e82:: with SMTP id
	j124-v6mr8355168pgc.349.1529867990473; 
	Sun, 24 Jun 2018 12:19:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:45 -0700
Message-Id: <20180624191845.31082-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 20/20] metacity: allow for warnings during compilation
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:49 -0000

From: "Slater, Joseph" <joe.slater@windriver.com>

Add a PACKAGECONFIG option which lets us permit warnings during
compilation until warnings from new compiler versions are
dealt with.

enable the packageconfig by default since we default to gcc8
which produces these warning

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
index ce97a803f1..189f6ec558 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
@@ -23,6 +23,11 @@ SRCREV = "c0d4b2fc0fcd6f2d3c37da935923f9e9ed5eb99f"
 
 EXTRA_OECONF += "--disable-xinerama"
 
+PACKAGECONFIG ?= ""
+
+# enable as neccessary until new warnings are dealt with
+PACKAGECONFIG[werror] = "--enable-Werror,--disable-Werror,,"
+
 do_configure_prepend() {
     cd ${S}
     aclocal --install || exit 1
-- 
2.18.0


