Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpo-0006lH-Fy
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:44 +0200
Received: by mail-ee0-f43.google.com with SMTP id d41so866884eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=KsLh2HoSQopuS6nJF4eBlAq23ZAf5MHk+fTJ/PFjy84=;
	b=WWJFF+DdEaxMYsWEyVYsRb48FTeULk1auV7euDaShYSoSRGSHWbPlRkTyjEGLF2zWj
	dl1t7iJCAH4OzQ8oyWfxTEbvMFh+1mnXOFFk4gKJHbWLxfz7BfAIAs1vXbskIW8qNcfj
	neuCsZhzMqPytSl4e+u7+4WLH5t6K1Y84VxS2WcIGIE9P+tiRgAozG06DvHtbBsYFfnB
	+i9U2cQkoZC2NeBLPC4DIVmGR3SbLzG2EzfT9kSU5hXC4tedIKepTjuphwmwjJZoKpko
	nKXiH6LYUze+kY00yIBSyqxtyW8RURjuoMxv5AsJhWMvOlmrrWuEy+sOuqK0arHnlQ6J
	yBew==
X-Received: by 10.15.23.69 with SMTP id g45mr104248961eeu.25.1368631411900;
	Wed, 15 May 2013 08:23:31 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:47 +0200
Message-Id: <1368631259-13401-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 02/14] thunar-plugin.bbclass: initial add
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
X-List-Received-Date: Wed, 15 May 2013 15:41:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/classes/thunar-plugin.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/classes/thunar-plugin.bbclass

diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
new file mode 100644
index 0000000..4ec073a
--- /dev/null
+++ b/meta-xfce/classes/thunar-plugin.bbclass
@@ -0,0 +1,10 @@
+inherit xfce
+
+DEPENDS += "thunar"
+
+SRC_URI = "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+
+FILES_${PN} += "${libdir}/thunarx-2/*.so"
+FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug"
+FILES_${PN}-dev += "${libdir}/thunarx-2/*.la"
+
-- 
1.7.6.5



