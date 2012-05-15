Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SUEcV-0005Xz-4a
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 12:04:43 +0200
Received: by bkcjm2 with SMTP id jm2so4896704bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=f4s55cJeMEoZwjWup9Vce7/MQbl+GGyNwnbKlod77ns=;
	b=B3LIzXZqfN2ClNIyvWl8vLbSmMv+AlyZbqyJDUWOtQLpLkhPXj2ZcodFkGRvlZYrDA
	wEW9FnU1LTRMhsedyQJymllhL/4B+Ucp+7e/rJ5RBfp6eJUR+Egk69ZkcghRWDKTE+Kl
	YREUKrHpM2i+4qBwUX99p7QeH2NcRKgnZLL5WhLF05niypRFjYYBMb5YR7btQuREVXDA
	9159sm/S0deWuySgRKJCbAhwwqBXFrOE2GcNoG3Mv5cuZ5zKvUK34gJTIL3dsp+znWkk
	TqXz4slUVLzpvKEZ6j4GrSVeC3RP8lNe0GqmNQY3/hcYkp2dblQbWoav/RoPhC1eo7Gj
	walg==
Received: by 10.204.154.138 with SMTP id o10mr4316839bkw.34.1337075683321;
	Tue, 15 May 2012 02:54:43 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id e20sm8275446bkw.3.2012.05.15.02.54.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 02:54:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 11:54:38 +0200
Message-Id: <1337075678-10009-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-chromium] Add bbappend for gnome-settings-daemon to make it build (deteministc) when using meta-chromium
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
X-List-Received-Date: Tue, 15 May 2012 10:04:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After including meta-chromium configure of gnome-settings-daemon detects nss
and fails during compile with

| In file included from gsd-smartcard-manager.h:27:0,
|                  from gsd-smartcard-manager.c:25:
| gsd-smartcard.h:26:20: fatal error: secmod.h: No such file or directory
| compilation terminated.
| In file included from gsd-smartcard.c:21:0:
| gsd-smartcard.h:26:20: fatal error: secmod.h: No such file or directory
| compilation terminated.

The append makes build deterministic and fixes build error.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-settings-daemon_2.32.1.bbappend          |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bbappend

diff --git a/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bbappend b/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bbappend
new file mode 100644
index 0000000..01e607d
--- /dev/null
+++ b/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bbappend
@@ -0,0 +1,3 @@
+DEPENDS += "nss"
+
+CFLAGS += "-I${STAGING_INCDIR}/mozilla/nss"
-- 
1.7.6.5



