Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1666.1792738467257281130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E+iIye7x;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06e79e152so289779b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738467; x=1793343267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qa6gOE6t1k3fcZ3jyp6RsA3YxnNJNyr6npe+hW9rL6c=;
        b=E+iIye7xpUtZBFxxRMooITpWjIivYKpnWyPlZG4gdlCVI3wMY6FSdJkBERJa5gOU/W
         vc9SZZQNsTXfrmZ08v2JOLAWLAAZaXWtlRAqe1/odAPad0wX12nc6YUQCxJrUrZrNSo6
         0JgNbNxYgjpuRDrxuYYSpbLkBqWWZD8dtBj0WIyaC1nCuec/+IP49Dbo9JqGX08j3CEk
         3Mw1r380H2c2l11wAOXeiEWjomx+SkglXwLCErx0xhFJBmGbHdaS4n1tLHVBZPDcG1LR
         0DbE9U4M/inUxxfemRsIec2lUpM6dwncOeR17RXRbjhLwFP7e14SmrpGrhS7drPORg7G
         PvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738467; x=1793343267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qa6gOE6t1k3fcZ3jyp6RsA3YxnNJNyr6npe+hW9rL6c=;
        b=Q3y25zT2i6BsxID2smyYivZOup6PaE01pz2GuBZMkbf00jw0J/q3O3v2tM6iDvcqDN
         g291QIczInrPzIR7svSZ6A1xdJu67x0oTyLD/ws91zgsLkRG0URVT6yFmk9538HhdXVI
         m8BIGn0pMZ4qGTuwid7uAs8/7CMombrFeQYm3SbgMUGejqP9ABMKzbbHojEH8Py6oY2g
         uCLKxHaYlHy4010cyz6zYDpIakQqPNC+paF1LIqyIFQrp7EPSS4VO/mleXRmpWtH19T1
         CvfP1O5RL7A93EyJ2gVBQOQaSg16ISW9398NDc4jDxe0G3WSQXnI+dZS9qehNS2EEzVC
         dBtA==
X-Gm-Message-State: AFq9FYJzjmXlhDG7nPv8CUGxM54qlndERYC0Ivxo/HJwIvkeSlJU3IV6
	tcudtFnZwHOltXS9o7G2jHFww5ipcHFNUuBCxuM+8puDC+TzrIJrltKtfK0Il2eI314=
X-Gm-Gg: AYBFou0Xj4zkFQN0v1KIhJ6E9oaov1aiWMNobWLHDvt9Q6WKhpXHHi8jLdpCO6+RGFh
	y6wmyXPAuoHDXNaxzVlNCpgNqPDAZ1b6EPFIPBmIZkUqJWNespimnBHjBS9Mn2Rw7kspHw5TicB
	IUDdaw1O4kQ8pQaMtWUOzBcH/rhTR0GU8cFdxaww4eTZGjiwml6KppT7zWw1SAuCVkOQUxIJHev
	C/2S2R2kz5S3GCG0IIcgusf+IcZTdtkc7XArwPZkNxpcbAuIRnAIPEWunaloxhcSyo8a0Y//5ZY
	tt+kOJ9JS3tBSbB5OQrZsR3xu4iCQfjKAO7y6vXcq+XVuStiNLsNU1HeRLdv9yT181irxHX8mdU
	s4dGH4r5kQ/VLQ+zeCCxkabnxYdo1X6fC2awMsKT+CDAVvMSp3CaQBURMOgX615yiz0AS7CcFlL
	NIZYjC4HFPu4NTOEgeYNobYciqHUtMPvh8RE6dfGUHkjkXv7/UO69qgXBGKXAeaLDZ2ioufMzW3
	HZlnlypk4bKPhnD7/ZJFORD8ERiIa3pMrcIODx4QeQw+id4DJQmI3ZibDWoZ4sSl29xooYfzeX1
	k1zWIxpUPB9pzoCntpvEYTomrTavKHji7Ns5cYzpyMLd3OHkeL8SUwn9tdO3ZwTOgSYBo0DqdPL
	M4KJzw2JU3bZ9RUcitYiY69QEQxti5jcgmVA3ku1rbdLS7urt3OoX2cQgLjvShlCUWOcpPW6Y8c
	xc8iT4diwr3pSwi01+K7aw3+BfxAszE1Cd3IP0TUTctys5CBa09p4VEBvf0UgSehKqFlxlL0TMo
	Ex0H/PcwRhljf5BoxBSxvcIjoygdr/wRoNN+42gFOPMtTWNNdC4
X-Received: by 2002:a05:6a21:e098:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-3e369203809mr1003488637.16.1792738466565;
        Thu, 22 Oct 2026 23:54:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 28/29] waf-samba: Reconfigure when the cross-answers file changes
Date: Thu, 22 Oct 2026 23:53:49 -0700
Message-ID: <20261023065350.3228996-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131352
Content-Type: text/plain; charset="utf-8"

do_configure reads the per architecture cross-answers file from the
layer by path rather than through SRC_URI, so editing it does not
change the task signature, and existing builds keep the old answers
until they are reconfigured by hand.

Make the answers directory a variable and add the file to
do_configure[file-checksums].

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/classes/waf-samba.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index cb78ce6b0d..fcec1bea16 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -65,10 +65,15 @@ def get_waf_parallel_make(d):
 # to help generate the cross answer when adding new board support.
 CROSS_METHOD ?= "answer"

+WAF_CROSS_ANSWERS_PATH ?= "${THISDIR}/../../files/waf-cross-answers"
+
+# The cross-answers file is read from the layer rather than through
+# SRC_URI, so add it to the checksums to reconfigure when it changes.
+do_configure[file-checksums] += "${WAF_CROSS_ANSWERS_PATH}/cross-answers-${TARGET_ARCH}.txt:True"
+
 do_configure() {

     # Prepare the cross-answers file
-    WAF_CROSS_ANSWERS_PATH="${THISDIR}/../../files/waf-cross-answers"
     CROSS_ANSWERS="${B}/cross-answers-${TARGET_ARCH}.txt"
     if [ -e ${CROSS_ANSWERS} ]; then
         rm -f ${CROSS_ANSWERS}
