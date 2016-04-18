Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 29BB060616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 18:27:14 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id er2so52808044pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=oHWiSNGyKuL0ygzyrWgNIosVu355Ke55YJOBvi6Zmyg=;
	b=RW099w7PD6BKRMOYD1l0uVvWaSJLAHU0eniA66bPNdnJLksSnISh9Q8wilh9tU/VLE
	vE4qpy0ytnAgcsIKOTqmRVTfBZ9VHnrBeUvvSR2QKL2kCMq5APWhiiMSKrkyYHBITWO4
	PgT4pS6yYGH7pu6FEjYFI9nqob9XGbaLVoimSH2DaiyV7CEUCkGZBP2jkl0LrQ/f56ZM
	yKcf/p2qPo0gRvnmT9YjJFUBdcEJe9z6ldL4kWWKypaa96nZ+GOMkC2J4sujlFZ3oBDu
	dd9nP0X2m2KCjTKtFh6ekV8gk73FCC24gukXAshWI91ITmIvVbOw4yy7ASo0ZZcO3/3t
	WA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=oHWiSNGyKuL0ygzyrWgNIosVu355Ke55YJOBvi6Zmyg=;
	b=aT1lRryrxkO5pCew14JTBGNeLVE6boZm8xY5YyRuR0ntWsDw22OCmmimTQjHf/R5cw
	NtU5ixqErU7o1Oq3/mW87owJxmlVC0I5Ib2lA+wYG4ibNEVWbRXOTprvJM1Osf7SXz/3
	s/L0JNMixwuCNZFdFdu+bYQgRPzlgcN5Amjfwesil65b/7zNRqbH57FqV107w7eErH6r
	7xxXECiNnu7Lgp21FXp+u7ksgFZW9hlALDbHm+OSu4Cr2Jy1+Qbu+7pmhfwNl6hfIBDB
	Kag2jP4eCpHsBgrJJFQ4uk3HQrDa8Fl/2ibLjGczUd9/7JILXplAlZgT2X6PYFjokC9j
	Nbhw==
X-Gm-Message-State: AOPr4FWUaeb5S9X6zEYOYAher8UZtAGU9ZqFGPFIx9nkKC9u4wueC8u23ZO4chxxjeYjvw==
X-Received: by 10.67.7.37 with SMTP id cz5mr51698869pad.18.1461004035476;
	Mon, 18 Apr 2016 11:27:15 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	s63sm29542442pfb.71.2016.04.18.11.27.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 11:27:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 11:26:58 -0700
Message-Id: <1461004019-20893-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH 1/2] xcursorgen: fix Licnese issue
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
X-List-Received-Date: Mon, 18 Apr 2016 18:27:17 -0000

WARNING: xcursorgen: No generic license file exists for: ManishSingh in any provider

copied COPYING file to meta-oe licenses to fix issue.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/ManishSingh | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/licenses/ManishSingh

diff --git a/meta-oe/licenses/ManishSingh b/meta-oe/licenses/ManishSingh
new file mode 100644
index 0000000..0243ddf
--- /dev/null
+++ b/meta-oe/licenses/ManishSingh
@@ -0,0 +1,19 @@
+Copyright (C) 2002 Manish Singh
+
+Permission to use, copy, modify, distribute, and sell this software and its
+documentation for any purpose is hereby granted without fee, provided that
+the above copyright notice appear in all copies and that both that
+copyright notice and this permission notice appear in supporting
+documentation, and that the name of Manish Singh not be used in
+advertising or publicity pertaining to distribution of the software without
+specific, written prior permission.  Manish Singh makes no
+representations about the suitability of this software for any purpose.  It
+is provided "as is" without express or implied warranty.
+
+MANISH SINGH DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+EVENT SHALL MANISH SINGH BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+PERFORMANCE OF THIS SOFTWARE.
-- 
2.3.5


