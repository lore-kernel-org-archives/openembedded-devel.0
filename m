Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5A9731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:12 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id pv5so24115138pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VIEFw8+/P3J0VE4BjIxppgIMPteJynpbb0F3567RiAw=;
	b=tF9mGT2BWAJkx1eHj3PXN0h52COzzDoBHz2rp7AA7EjscXXb9O5Shji9xdaasdBnpM
	tl1Sxjhawg+y8vIQebi3JoMn6rq1hJygwWGRCi/KXDwGb3MrVA930t9Vh7FkCivck/dP
	0AS2FbRSZSxv+pf3wNjwy5O8khxYtRuOnlcZYYASev02iSY6sIvKU06R2dGz4joueQp3
	T5VH7vYAgoRMxviK/NgS+OWwe474ZA3d3YhkuUoa4P5bPl5P3muPGpTOaOhoWe1CKYEm
	O4kb1NqLE65cNeOietev5HsB9CqEn75WXHZmS6edqPAcjJ2N/3gP+9cObwyEB+nYNNU6
	1UhA==
X-Received: by 10.67.5.69 with SMTP id ck5mr170322969pad.125.1452387613587;
	Sat, 09 Jan 2016 17:00:13 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	dz6sm176347833pab.19.2016.01.09.17.00.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 97549FCC850; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:45 -0800
Message-Id: <929d79a18fb2932ccda73e8478698756fc6d7235.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 22/22] fltk: Fix license warning
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:12 -0000

WARNING: fltk: No generic license file exists for: FLTK in any provider

Add license

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/FLTK | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-oe/licenses/FLTK

diff --git a/meta-oe/licenses/FLTK b/meta-oe/licenses/FLTK
new file mode 100644
index 0000000..27a32a2
--- /dev/null
+++ b/meta-oe/licenses/FLTK
@@ -0,0 +1,43 @@
+                             FLTK License
+                           December 11, 2001
+
+The FLTK library and included programs are provided under the terms
+of the GNU Library General Public License (LGPL) with the following
+exceptions:
+
+    1. Modifications to the FLTK configure script, config
+       header file, and makefiles by themselves to support
+       a specific platform do not constitute a modified or
+       derivative work.
+
+       The authors do request that such modifications be
+       contributed to the FLTK project - send all
+       contributions to "fltk-bugs@fltk.org".
+
+    2. Widgets that are subclassed from FLTK widgets do not
+       constitute a derivative work.
+
+    3. Static linking of applications and widgets to the
+       FLTK library does not constitute a derivative work
+       and does not require the author to provide source
+       code for the application or widget, use the shared
+       FLTK libraries, or link their applications or
+       widgets against a user-supplied version of FLTK.
+
+       If you link the application or widget to a modified
+       version of FLTK, then the changes to FLTK must be
+       provided under the terms of the LGPL in sections
+       1, 2, and 4.
+
+    4. You do not have to provide a copy of the FLTK license
+       with programs that are linked to the FLTK library, nor
+       do you have to identify the FLTK license in your
+       program or documentation as required by section 6
+       of the LGPL.
+
+       However, programs must still identify their use of FLTK.
+       The following example statement can be included in user
+       documentation to satisfy this requirement:
+
+           [program/widget] is based in part on the work of
+           the FLTK project (http://www.fltk.org).
-- 
1.9.1


