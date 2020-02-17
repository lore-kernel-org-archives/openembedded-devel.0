Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E77766140D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:43:01 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d9so6104875plo.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wXcWQks2vQOPaw8bOOMNEokwwWL4MdZGcAEEg0VcSUY=;
	b=VHBzX41HrSt+Puv5CnPJIBFE86fFlkbAy9lbYTnBP4RazTrd3Md4RbhJR9JyKQETp+
	v94Ff6ZWZETnEWxhKr4UeS4px3zvwyA6CsyQoAQ6NfrzbZu5yKG99hkKyWMot+4OkxcA
	xo8+hSJGJQniiU6LDblf24m54rwY8V7I4wsVcOxvQ2yE4iFSz0Ro0g2+Iy+ep4JxG71A
	zAgtHv2rnl+VSgqvPE2ZYmzqyqUk0C0JNooqlrwq+8v2bVmP1J6ERUMtVnvsUUQNA/dK
	wmMvxN4MH30U2xqTbtUY+G+YKMDernyV3e7fJdSuVI0Oq6umjioOcqQEen9P5diCc0g9
	mA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wXcWQks2vQOPaw8bOOMNEokwwWL4MdZGcAEEg0VcSUY=;
	b=q128fZu+PE9Y6zNXN/AJ3Tsg0U3gsendotAkvxC3FADdYi4P95V7MZBfXinY7c8srI
	rTag9ti5ON4gIqMPvrmsLeYv7esjFU2qo0e1y8hVwtdT8QXEidX6XFhB1hbfcwC7RzoI
	xzpiw3EsTUragwAiJbUoxzY2sBtIiWngePFYSdH6uVSD2Gqdc/pnawsKY9/DnTgDq07u
	w5EB3wok4Ra4Ih8/84fuuWuQv13aBdIYQ1PaFEK0FCNnkumwj2KRPzRKtFrW9By+0Tla
	MEWE6zQJFU9uF+n91btr8Si+/yZ/GJ3ukH3UBMINsxOYr3qn4jMfk8hcgGEcxEMVNW2E
	aGyA==
X-Gm-Message-State: APjAAAWjKY4rj56CwyNt2L0cY/vIWDAUMCxZT5z78W1zPxrSx9egwNhi
	6DFfF1d/TDqPCjaJRq7nX4nIg6sZiLQ=
X-Google-Smtp-Source: APXvYqwVOWMvFabWawrZPJY2cvYH3aLAMiQ4cV3SGUNrXt3R/vGj+g5TVUAWg0LQhafGJQ770ZjF0Q==
X-Received: by 2002:a17:902:9a42:: with SMTP id
	x2mr14826895plv.194.1581907382757; 
	Sun, 16 Feb 2020 18:43:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	64sm14141008pfd.48.2020.02.16.18.43.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:43:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:43:03 -0800
Message-Id: <20200217024304.1131392-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217024304.1131392-1-raj.khem@gmail.com>
References: <20200217024304.1131392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/7] gtkwave: Inherit mime and mime-xdg
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
X-List-Received-Date: Mon, 17 Feb 2020 02:43:02 -0000
Content-Transfer-Encoding: 8bit

Use += for depends to not override prior ones

Fixes
gtkwave-3.3.103: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: gtkwave path '/work/aarch64-yoe-linux/gtkwave/3.3.103-r0/packages-split/gtkwave/usr/share/applications/gtkwave.desktop' [mime-xdg]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
index 286d9aa6a1..fec3c7ce1a 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
@@ -10,9 +10,9 @@ SRC_URI = "http://gtkwave.sourceforge.net/${BP}.tar.gz"
 SRC_URI[md5sum] = "5a9a5913f9a02a333b2b23626f153fd7"
 SRC_URI[sha256sum] = "c325abf7cf26c53309a67c0ecaaf196774fa982a717a102c599ac8a516eeeaf7"
 
-inherit pkgconfig autotools gettext texinfo
-DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
-RDEPENDS_${PN} = "tk-lib"
+inherit pkgconfig autotools gettext texinfo mime mime-xdg
+DEPENDS += "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
+RDEPENDS_${PN} += "tk-lib"
 
 # depends on gtk+ which has this restriction
 inherit features_check
-- 
2.25.0


