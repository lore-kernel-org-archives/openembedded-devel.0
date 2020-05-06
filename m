Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.1964.1588750417326380078
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 00:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=BtZK4tOB;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=fjce=6u=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49H7cb3tvLzd
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 May 2020 09:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588750415;
	bh=ft3I9c3mzR7YY0dWq4xqwkdMPfRzusOgkPDiIolvJ0M=;
	h=From:To:Subject:Date:From;
	b=BtZK4tOBLMih00w4PRJn9nFZVmbqmg+Z0zUPiY2KHJLW+dnum5dkkxVC/4KDyd9Wn
	 aNN4phnzh5lBhTg3q+HW1gIAs1vX8beUswiIhbwrySw2VNIGMh8qBSjEnO2Wvo2oDx
	 TUO819biK7qc4J3Wrx68bRrp2K7d8J1zOMmGLWbviOi6Wdg/F/iiWe27y7MAckmcd7
	 WmGWQNahHn+1nTrwJGdcjdYB4TQE2ldMu3Zl/SrcCeMpCSpLwLJkJAMI5vwNh2VRfh
	 WxSshcec1TiFg36rYGtc0nqUE9XplBa6PVEyEQmmtTo+YslybY5G1/6MxwMOH0fVH3
	 6Z08fRcQA3V3rnAce1fDU11ero+4iDaMZMm8rzNmFpfu+iUHIXAJBr9+V7ZmRAZaXB
	 0tvZHWQ0ZNI7u3NhaShJxVs1tHmJ/+eNytmI+gaWdmsZJxPDqm4F9torttvB3b+EDl
	 ov3BEY2oCKo9jbdDRQZMLRXE9fVKBvmcnZcIXs4qU1ch1Rxolx68fnxaxR1kFRx3/U
	 14f+zV1UfC2tYbxc9vqtAGY3JmnrChFSR+57CtfbTUHSTlMlQga1+fVsoKFpgKsvBQ
	 2lFWvvITtB9sRi8cPlM5LxxO63bRig02TJ67sEMdTi2G/I6f2yW7b66GGI5wbPpLq1
	 6axAm4rRtr11IX+e4Y3eSdjk=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] uftrace: Fix PR
Date: Wed,  6 May 2020 10:33:34 +0300
Message-Id: <20200506073334.12115-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

The latest update moved uftrace from a stable release
to a git snapshot.

Adjust PR accordingly.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index c33fa048c..732fe3b45 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -10,12 +10,13 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-# v0.9.4
 SRCREV = "d648bbffedef529220896283fb59e35531c13804"
 SRC_URI = "git://github.com/namhyung/${BPN} \
            "
 S = "${WORKDIR}/git"
 
+PR .= "+git${SRCPV}"
+
 LDFLAGS_append_libc-musl = " -largp"
 
 def set_target_arch(d):
-- 
2.17.1

