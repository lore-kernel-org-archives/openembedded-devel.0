Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 88C6272BCE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:54:11 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id z12so12820975wgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=NZrVHHjC4nZsWNVgT/7Ci0FqBfzubd/jYB0h0Q34mwQ=;
	b=LShQXgrSjEEojUD8dgEo7MATXu0dRcntD0xPWolJTdJFRn16V1ArFm66UnUqKOrF6Q
	mcRPvjlKQVMuJXy7xCr3fUJ13Kr7rITxkyFC3ryco7GYWcagwAmc2wqwYJqL98hAM3LR
	0LdEyVyg+OOA3RMTYk4DdkgfcpWEDeJuCI08qOtxWuQSINREsV5eG0GnIGaZk398NbsE
	3iO1F5VTlCTRt9uPbfzA6Qc1kWAi0yV4Lx52JeJE4Q4BiYv/jKcPMX7Kpptg+RJr0sEt
	57ATJrBg3V/aZYBZyFV+WLSVgoAW1CW9sAOeH7iZhtNxeATVDqEmRObZazqSt47m7nJb
	LYmg==
X-Received: by 10.180.96.4 with SMTP id do4mr3428612wib.46.1422338051625;
	Mon, 26 Jan 2015 21:54:11 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id
	gm10sm16610857wib.19.2015.01.26.21.54.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 21:54:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 06:53:53 +0100
Message-Id: <1422338033-18521-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 5/5] add gdb append to enable python packageconfig
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
X-List-Received-Date: Tue, 27 Jan 2015 05:54:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

debugging with qt-creator on target requires gdb build with python support

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-devtools/gdb/gdb_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-devtools/gdb/gdb_%.bbappend

diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-devtools/gdb/gdb_%.bbappend
new file mode 100644
index 0000000..41592c4
--- /dev/null
+++ b/recipes-devtools/gdb/gdb_%.bbappend
@@ -0,0 +1 @@
+PACKAGECONFIG ??= "python"
-- 
1.8.3.1


