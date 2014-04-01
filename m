Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id A90916F897
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:21:57 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id cc10so5389421wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=P0XcE68AH7K+jzBL18AuvUlKrTm5Wc/35sG7IVT9fHA=;
	b=nftrA5Lrg3KV4KhBOrgOgO9+n8/29ho/zirC5Q6WO7qufh6M4u8hVo79ZexnA7711e
	/W/Sa1xQaVTBtYg8WmkoQDpmGe5javCbtyV/uWxSlsfeCvUGeeYDtncOXKAQx6vLmHwf
	oRFXUubFCuGr1mVb0YKBmRfi8omRC5qaAKMdqrLQW5wrC1MJIVZAcev8YjSmT29OPY97
	hRyPBo1qse/dX5podlRxytAoPG7Nc3sXpf1xoLgJLJqCsmXBMGEwVs5P5c2pE9NE/22u
	HCEU4KFxA1lesR0A9gLSMQrdFw2umqrDvrDc0tEBfEJ4ycKtoO7lgF0Vt6n1BAEPQJbA
	dXEw==
X-Received: by 10.194.242.4 with SMTP id wm4mr4546335wjc.88.1396365718378;
	Tue, 01 Apr 2014 08:21:58 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.21.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:21:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:37 +0200
Message-Id: <1396365706-14220-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 01/10] xfce-git.bbclass initial add
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

common preparations for xfce-git-repos

* implement autogen.sh call in do_configure_prepend
* AUTOTOOLS_COPYACLOCAL = "1": In oe-core commit
  79ea036de331bde65a88fb777647dc099ef05acf copying aclocals was moved to
  do_configure[prefuncs]. These are called before do_configure_prepend which
  causes configure.ac not yet being created and autotools_copy_aclocals
  returning undone.

By using this class tons of errors like

| aclocal: error: couldn't open directory '/home/a.mueller/tmp/oe-core-eglibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/xfce4-settings/4.11.0+gitAUTOINC+b7a0e1fd77-r0/git/aclocal-copy/': No such file or directory
| autoreconf: aclocal failed with exit status: 1

are fixed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/classes/xfce-git.bbclass | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-xfce/classes/xfce-git.bbclass

diff --git a/meta-xfce/classes/xfce-git.bbclass b/meta-xfce/classes/xfce-git.bbclass
new file mode 100644
index 0000000..c4be554
--- /dev/null
+++ b/meta-xfce/classes/xfce-git.bbclass
@@ -0,0 +1,5 @@
+do_configure_prepend() {
+       NOCONFIGURE=yes ./autogen.sh
+}
+
+AUTOTOOLS_COPYACLOCAL = "1"
-- 
1.8.3.1


