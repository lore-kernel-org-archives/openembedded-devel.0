Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8055.1795739675767581622
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CWjQqjSA;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c71feeeaso3977341eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739675; x=1796344475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VT2mkuSgX4q9xOsI2rXm562Z1MB4xXdqpcxpx2KRn7c=;
        b=CWjQqjSAvBHzJ1ZBSdVDe+usMt0xgjPRmj60ap3FybskrpIAaHqOUPR9UhhNVm+fXf
         dlouocYje7XlPazqedI0fZ1T38flatjzdri5o+d1mH0++BsJIdW0mCgN8TH6vZnCfjLO
         xjC6G6O8kiIIThZMOHC7wtdhfiNhPitkpRNsVGch6Ft+62MHi8QF/MNMFCr+95JK3rV+
         3Xwnej7RSJrlsFhPGB9kiKDMDKiXADS9bSgFkXXae6LgJLED5dElzDLT+EL8fQyQsksd
         1D9seqnnHiLaLo5DKvhIgZxkGUXRL4kOk8xcHpeyRa3++h7yVdk4WEaXtjvERRRIuTvh
         ayrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739675; x=1796344475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VT2mkuSgX4q9xOsI2rXm562Z1MB4xXdqpcxpx2KRn7c=;
        b=RX1bawg9j7dN0R1sBllGZWKEwzYVn/6ftNKmbPnXP99RUYsxwHcGPviQ+UQidCzND/
         vyRGHWyncdIE8ZoYvNye+BP9O83tuyt8VEIZMb7nMBSpegKnFpVae9Ofrefg2YVXoI/c
         FVTBn0A+Labc472oo4tEFVOcx1xj/dpzHQEe50Cyldja1zn66Gaa38RImUUB3SJos+uP
         6VGYU24b4UHA6BQ/C1TznvjHEWB3LSNHF8WN9RQLdRJvf8LbWeF+JqXv0g7IHXi8ri5U
         7waeOu/WQfsGvKA8cOwAovSFhJW0rlRqS7ZBxl8jalQDITt5923wiZyzaJhzsRJ1zu7e
         pTZw==
X-Gm-Message-State: APuU4Z+IK5/JdDmLJz6NMVkQvDUtLiATlvHbg/RJtis+W5ELpyekaDqZ
	eI0JwR6gr7r4OuFS2eAXZUqvZEh5T6IoDwAIfvwm4I+1JipbpukyGwUiFlieOzja
X-Gm-Gg: AZFdTZdGdAXAjB6TiFoqWN8s+mVpMt1bwScuPdxuSwP2rIo+WEOgve3ktmugw3Xc0jx
	dKKPdPD+2ptyNhg+1RcWwI1qL4iIVqkQhZj0EsqOPq6CdbA12gBz8pbY1mbaDvn0CTqobLnuK40
	zQhe/jNxz6kaKwjOgmjqr4IMBg1ZP4FkD6drMlGeZG5K9eesG4Jlc6qvgyH4Ton+c8RNNNSvsSD
	6yhCxYP79GMyGLgYA0hulVNDTbYXzLc5S76TjwtIT3JP4he3agbyzWaJ5cq1KEWRDym4OC2nGnG
	r3PCML0CiXvgpZLdSSICkPWaepAl6GUZeoL33vtFnA/woIK+W7Vs7AjSzSNuNMRVIFomu4OJ4oK
	PfTL9n/fH7s563Xg4TPzLUvoD56VjUUYfucfFn4S3hpgwNjzaLGW8ObgIsT5Q1ufrXNJzyck/c9
	DpYhhwlxZ/nUkXm6NSGL4T3P+73Dc0QchorwuShMY5pvg0MdUdYkPUITTkEgJP29Ios1wrgQWjH
	8Qk+3rubxjxXSdiQ2p2TMwX2UTO46DqwYVJao+lUmGYymyciS8p/OAfQk5nw2xWHF0GEG60C97C
	54z+cAIf6K+SaBO9UdsHA9uF97JxM6AhRsiagGhUp285NqLIigrAeu70K62r3Td7V8dWTjH98qm
	MSR89oxXEzGkhXey+7bqdi8I54iRirG/UoVNRKWIuOmLmqTnQQn5/gV9a6nKDr6RsTTMoZcz83+
	kbp6uPNP9gQXIrmyWQ4SlkQ0WNmoXxcGxAGUvlgA6LfbUpsBQrnUk2RWejr5QtIMBjEO8Cg0afc
	mkMRD99bKn+DEeNIx6HlyYRNmo29R80/qeqTr80N5BMhBPip5hn+1ldI6TXasv5AWj9XtcQjD5D
	pQ1C
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr17293436eec.3.1795739675077;
        Thu, 26 Nov 2026 16:34:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/69] gammu: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:20 -0800
Message-ID: <20261127003425.2166632-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133104
Content-Type: text/plain; charset="utf-8"

The GitHub releases page no longer links the Gammu tarballs directly,
so the default tarball regex found nothing. Match the release tag
links instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb
index d787a75ba4..3af6610fb7 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.45.2.bb
@@ -14,6 +14,7 @@ S = "${UNPACKDIR}/Gammu-${PV}"
 SRC_URI[sha256sum] = "92478c1c6d8df193f3d5e36648fd05fc3eff26254034f025cad2a0ffba5aec23"
 
 UPSTREAM_CHECK_URI = "https://github.com/gammu/gammu/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0 udev libgudev unixodbc"
 
