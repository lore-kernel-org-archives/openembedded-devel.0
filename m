Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CC7DB7016E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 18:41:39 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n89so5611934pfk.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 10:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=FMiKUt9lzyQZkmXOUWQIQPJYOuNiJpOVF3O6qT9mxYc=;
	b=pkHTIK2pjyHZVMtw+5xlGAKfpYg9o9CN31aSE6/6RnG5zoAp2RTIdQqgiY/sGQR68l
	F4t5hC8o0vwwMI73/JiNiXsmy/iiDTWSQUnPVVbL3+Tu3Q5p44YLr08xEb0/jzZQ2oHF
	ze49odaqWCK5Rfg+aGhexwzv8kPwj/rh/NzEKouPGrXqVxhvmzq04nlvuKTbG4ZaMExN
	KSS/TEtift3v6p1v6nPIehB36HbSxeqvIZgtU7EDXSQkP7wbrxX3+ySR44TxM9yNIyTL
	pUs65CKu1a9kvtbXK8ykjZNvPb6l6uQ/diQOtNOT1xeNq/S3sc9O/33KU/EvXgGqVjB0
	HQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FMiKUt9lzyQZkmXOUWQIQPJYOuNiJpOVF3O6qT9mxYc=;
	b=FwModaxTkW2G/fdkm+EMyxCzmUdaMulz8bZnPPz+zRQs23VJdOCa7SVhnetnyLk1zb
	J6CvFPuzP/eHnvj4ufJh6tHYo5P+ed12bHNcpr82GYRPk5650/uXDMu95SowY9e5itu2
	rPQ6tOfJ2Iu5HyzDJBkAem+0PMapWCzcXs67CPXN1p/oli4ZRH6L9tbNPUavvej17R1B
	WbWuDqXKs4du7dP9pg6IWbHzxuyptScELv5Zrk7scboXgxUOdw9Hx+hMF4b0T/Ef2eag
	JqNC3q4IvRV01HyK61zkGEzLbpDn8efX6XhYB+nW6dSpUFupVrYa1voEwC16BJ+Rvpnu
	Wgyw==
X-Gm-Message-State: AJaThX7jpmLqBHqjaBLFz/oysHfgvIflBCuC1K5if6Qonvf3FwNZ6hAt
	H+v0xrPp1ZI05Xgn8pgkRaA=
X-Google-Smtp-Source: AGs4zMazjaTNYgbyh7YrtvTpwDkS93vt1X5bO5xgfc453YZ/wr3Q+TMHmqPKlr4KKfLcRnEJSQUn6Q==
X-Received: by 10.84.211.79 with SMTP id b73mr11502164pli.419.1511116900733;
	Sun, 19 Nov 2017 10:41:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ed06:7472:604f:b02a])
	by smtp.gmail.com with ESMTPSA id
	s68sm1164971pfj.81.2017.11.19.10.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Nov 2017 10:41:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 19 Nov 2017 10:41:38 -0800
Message-Id: <1511116899-6122-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] UFL: add missing license
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
X-List-Received-Date: Sun, 19 Nov 2017 18:41:39 -0000

fixes
WARNING: ttf-ubuntu-font-family-0.80-r1 do_populate_lic: ttf-ubuntu-font-family: No generic license file exists for: UFL in any provider

http://font.ubuntu.com/ufl/ubuntu-font-licence-1.0.txt

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/UFL | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta-oe/licenses/UFL

diff --git a/meta-oe/licenses/UFL b/meta-oe/licenses/UFL
new file mode 100644
index 0000000..e78ac4a
--- /dev/null
+++ b/meta-oe/licenses/UFL
@@ -0,0 +1,97 @@
+-------------------------------
+UBUNTU FONT LICENCE Version 1.0
+-------------------------------
+
+PREAMBLE
+This licence allows the licensed fonts to be used, studied, modified and
+redistributed freely. The fonts, including any derivative works, can be
+bundled, embedded, and redistributed provided the terms of this licence
+are met. The fonts and derivatives, however, cannot be released under
+any other licence. The requirement for fonts to remain under this
+licence does not require any document created using the fonts or their
+derivatives to be published under this licence, as long as the primary
+purpose of the document is not to be a vehicle for the distribution of
+the fonts.
+
+DEFINITIONS
+"Font Software" refers to the set of files released by the Copyright
+Holder(s) under this licence and clearly marked as such. This may
+include source files, build scripts and documentation.
+
+"Original Version" refers to the collection of Font Software components
+as received under this licence.
+
+"Modified Version" refers to any derivative made by adding to, deleting,
+or substituting -- in part or in whole -- any of the components of the
+Original Version, by changing formats or by porting the Font Software to
+a new environment.
+
+"Copyright Holder(s)" refers to all individuals and companies who have a
+copyright ownership of the Font Software.
+
+"Substantially Changed" refers to Modified Versions which can be easily
+identified as dissimilar to the Font Software by users of the Font
+Software comparing the Original Version with the Modified Version.
+
+To "Propagate" a work means to do anything with it that, without
+permission, would make you directly or secondarily liable for
+infringement under applicable copyright law, except executing it on a
+computer or modifying a private copy. Propagation includes copying,
+distribution (with or without modification and with or without charging
+a redistribution fee), making available to the public, and in some
+countries other activities as well.
+
+PERMISSION & CONDITIONS
+This licence does not grant any rights under trademark law and all such
+rights are reserved.
+
+Permission is hereby granted, free of charge, to any person obtaining a
+copy of the Font Software, to propagate the Font Software, subject to
+the below conditions:
+
+1) Each copy of the Font Software must contain the above copyright
+notice and this licence. These can be included either as stand-alone
+text files, human-readable headers or in the appropriate machine-
+readable metadata fields within text or binary files as long as those
+fields can be easily viewed by the user.
+
+2) The font name complies with the following:
+(a) The Original Version must retain its name, unmodified.
+(b) Modified Versions which are Substantially Changed must be renamed to
+avoid use of the name of the Original Version or similar names entirely.
+(c) Modified Versions which are not Substantially Changed must be
+renamed to both (i) retain the name of the Original Version and (ii) add
+additional naming elements to distinguish the Modified Version from the
+Original Version. The name of such Modified Versions must be the name of
+the Original Version, with "derivative X" where X represents the name of
+the new work, appended to that name.
+
+3) The name(s) of the Copyright Holder(s) and any contributor to the
+Font Software shall not be used to promote, endorse or advertise any
+Modified Version, except (i) as required by this licence, (ii) to
+acknowledge the contribution(s) of the Copyright Holder(s) or (iii) with
+their explicit written permission.
+
+4) The Font Software, modified or unmodified, in part or in whole, must
+be distributed entirely under this licence, and must not be distributed
+under any other licence. The requirement for fonts to remain under this
+licence does not affect any document created using the Font Software,
+except any version of the Font Software extracted from a document
+created using the Font Software may only be distributed under this
+licence.
+
+TERMINATION
+This licence becomes null and void if any of the above conditions are
+not met.
+
+DISCLAIMER
+THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
+COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
+COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
+DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM OTHER
+DEALINGS IN THE FONT SOFTWARE.
+
-- 
2.7.4


