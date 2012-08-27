Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T5v10-0002WF-PE
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 10:49:46 +0200
Received: by bkcik5 with SMTP id ik5so1161743bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=4MBUh2zyfFkeX0eGS53QRr78ma4AFa3OXDIwj1S3ZSQ=;
	b=nGI8BnCZ+zGocmjml1WhywTtIveNj46QHazLQtXK6wHr31aUrUGH/u9UsBiwnhOLNl
	MUYvQjxx4DbvA6VmtwS+Poyk5A11WJKe1LsPz6zG/o5Mjfp+eR44TIZFXI41w0KcjKyW
	Nv/pmT2AX7bgqudvgOMwebpFJA/mN+xJSgaolUrgAv3VlqIY5enueunEnXJnlwUZfraM
	rDSx5oPUOWmYEQ6zVAU+yanRNu9/O9AUrPSaDd18/78uyLhxeWFf3BmBX43luCe09k4V
	AovowcmBKUpWd8ZMTS158DW5nDI7xWumt6H/NN4/Ybq/f9ck4fDWPwRi+cZ48XsMY0ni
	qEjA==
Received: by 10.205.133.11 with SMTP id hw11mr3655241bkc.46.1346056655569;
	Mon, 27 Aug 2012 01:37:35 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id m9sm9940391bkm.10.2012.08.27.01.37.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 01:37:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2012 10:36:49 +0200
Message-Id: <1346056611-31432-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd 0/2] xfwm4 bugfixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2012 08:49:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is my last bugfix for xfce 4.8 before updating to 4.10. It fixes the
following items:
* undeprecate update-alternatives
* the beloved missing window frames when starting a xfce session for the first
  time are history.

Andreas Müller (2):
  xfwm4: cleanup update-alternatives deprecated code
  libxfce4ui: fix xfwm4 crash (no window borders) on first start

 ...-private-xfce4-keyboard-shortcuts.xml-fix.patch |   31 ++++++++++++++++++++
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb    |    3 ++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb        |    8 ++--
 3 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/files/0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch

-- 
1.7.6.5



