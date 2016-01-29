Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id EE7A76FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:14:29 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id x125so47606296pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=uAflVfZEnX82gz5cyx73AwlIi5hK9whFJbo1sNQLZw0=;
	b=SuwXE+6bQ5OT0haeYS83mfzNvwobX5e/g8HBpIs65pVErO8fNaPhIfjqWog/LW+2WD
	eclcw8yhNqOC7T2TqRv44Fi7cWUsDqPC9mGPhWy6FdLBwI6HFRrRN4rgnURUEvKLOQj6
	M8um6+XmEkBIaSkDllkDF9v+q2WiqV/T9KySwHQY9KDAwOnZOJDIpzznl35ulePuR1rY
	mE2JC4pwv8ZJGYKg7NLl9cc9HkuvGRPSKcSlnnVEBugFwsRR+S61iVgg9B4dA/rGVxVW
	nVXmsL4AfDEyZUx+jkrWO4P/koSsAU+sTTSj6e3Chzor1plzwvh3YbL93xhqNn3un7rT
	KZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uAflVfZEnX82gz5cyx73AwlIi5hK9whFJbo1sNQLZw0=;
	b=PqAuGelZQY9Sq5kDV/4bn7gMo6gsE4rCDEl9BxsPaN8XC5uHkgbP+sREHIhBsYcnyo
	L6oCeZv8wKo2Xohhx3W/vhTIF4Ayo7o9wS+qQXBfc+3+neFpuSLKWcQh0qDqkAxayept
	2IdZfZyjy3+NCdLvXRWUYtqeaFrvOvwnpmtpwBRi5WN6TgOBPJp5OOb+j5uU9Zfl99Vq
	3RL+kdVLmzVdxUd8C5B+R6u6ympmO8Atn00pe8+DKTO5suImpxs1dYu4/pNPKNBPDSxF
	/6jRQXbiGLimrjfnwl2geG9P2PU59tyYIw2EK52HjwPO2MDNQ9kdeQDxeC0N5EvSPc0V
	PEAg==
X-Gm-Message-State: AG10YOThOJ/SNN3REYaLQ3W5cJzVOv5ofOpPoz/3DBpYJA/N55Xb7RvdPrrT8vb/flia7Q==
X-Received: by 10.98.75.22 with SMTP id y22mr16473646pfa.147.1454098470188;
	Fri, 29 Jan 2016 12:14:30 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	dz8sm25517963pab.19.2016.01.29.12.14.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:14:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Fri, 29 Jan 2016 12:14:26 -0800
Message-Id: <1454098466-11683-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] ntp: update 4.2.8p6
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
X-List-Received-Date: Fri, 29 Jan 2016 20:14:32 -0000

QA error fix:
ERROR: QA Issue: ntp: Files/directories were installed but not shipped in any package:
  /usr/libexec

CVES addressed:

Bug 2948 / CVE-2015-8158
Bug 2945 / CVE-2015-8138: origin: Zero Origin Timestamp Bypass
Bug 2942 / CVE-2015-7979: Off-path Denial of Service (DoS) attack on authenticated broadcast mode
Bug 2940 / CVE-2015-7978: Stack exhaustion in recursive traversal of restriction list
Bug 2939 / CVE-2015-7977: reslist NULL pointer dereference
Bug 2938 / CVE-2015-7976: ntpq saveconfig command allows dangerous characters in filenames
Bug 2937 / CVE-2015-7975: nextvar() missing length check
Bug 2936 / CVE-2015-7974: Skeleton Key: Missing key check allows impersonation between authenticated peers
Bug 2935 / CVE-2015-7973: Deja Vu: Replay attack on authenticated broadcast mode
Bug 2947 / CVE-2015-8140: ntpq vulnerable to replay attacks
Bug 2946 / CVE-2015-8139: Origin Leak: ntpq and ntpdc, disclose origin

NTP-4.2.8p5
NtpBug2956: Small-step/Big-step CVE-2015-5300

Bug #2829 Clean up pipe_fds in ntpd.c
Bug #2887 stratum -1 config results as showing value 99.
Bug #2932 Update leapsecond file info in miscopt.html.
Bug #2934 tests/ntpd/t-ntp_scanner.c has a magic constant wired in.
Bug #2944 errno is not preserved properly in ntpdate after sendto call.
Bug #2952 peer associations were broken by the fix for NtpBug2901 CVE-2015-7704
Bug #2954 Version 4.2.8p4 crashes on startup on some OSes.
Bug #2957 'unsigned int' vs 'size_t' format clash.
Bug #2958 ntpq: fatal error messages need a final newline.
Bug #2962 truncation of size_t/ptrdiff_t on 64bit targets.
Bug #2965 Local clock didn't work since 4.2.8p4.
Bug #2967 ntpdate command suffers an assertion failure
Bug #2969 Seg fault from ntpq/mrulist when looking at server with lots of clients.
Bug #2971 ntpq bails on ^C: select fails: Interrupted system call

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p4.bb => ntp_4.2.8p6.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p4.bb => ntp_4.2.8p6.bb} (96%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
similarity index 96%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
index f9f900e..1836dd9 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "6af96862b09324a8ef965ca76b759c8b"
-SRC_URI[sha256sum] = "0d6961572548d2c4af96f58f763e22ac620f5afef717384ddc317a0e365cfdb9"
+SRC_URI[md5sum] = "60049f51e9c8305afe30eb22b711c5c6"
+SRC_URI[sha256sum] = "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
@@ -124,7 +124,7 @@ RSUGGESTS_${PN} = "iana-etc"
 
 FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
     ${NTP_USER_HOME} \
-    ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
+    ${systemd_unitdir}/ntp-units.d/60-ntpd.list ${libexecdir}\
 "
 FILES_${PN}-tickadj = "${sbindir}/tickadj"
 FILES_${PN}-utils = "${sbindir} ${datadir}/ntp/lib"
-- 
2.3.5


