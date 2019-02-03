Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7097C2F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2019 15:06:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b7so5577871pfi.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 07:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JhYFSbE+oEMz69jC2FB8adwBJFP1T/YWtTLxKRKSQPc=;
	b=hUc373j2XbwuMUdt1mfNPzJ/bu9WZZCo9HE3xNDeHTVlld/hc2o5H3i+R+HPUldONe
	yzXE+xulGDsNO32QW+Mfk52rGNzU7d7goF9GA/upKw19fFoftWP/334BlnkfYegi13Om
	t/3Rw8r/ZR5oCcRWEmwyVP+cOPP9tGFFnEy2454U9gDFs9RBaPP0yX/kIG1bwaIYrqNj
	0+CWo8n1Q3ybn+PryRUgAJz0JEJtRl6VTnus9s+05bPTt6IwKIr/3OswDfGhc6CuqYrP
	mkfmWy6Inr5Fdtjmh/2Zdxu0LE3QeF/plbn/HicXovgVSdX7CKKN3duZBUCLyVaLhgZI
	fpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JhYFSbE+oEMz69jC2FB8adwBJFP1T/YWtTLxKRKSQPc=;
	b=qmYPid/76G+I84ErLfhTA4xZywxEKCecLB6zqKQtlPTfrwbE7DDeLoHecW096F1R/h
	DT/vhPpXaklyvC7gWksHR8niyswYv6B4Te7fSPq5U4tRUQWPYgwkzPAgLHHkNaNnbrGy
	obPfiwCrDfj5IDfMM7szZ73CtV25RRrYYMutJ8mWG0OVJiPY+ESB9JqLko467hAUFOEh
	NxM5ideiCrRvzhWDVKv6fN0joYUvpVosgdPVx8v98d879gNSGONv2DENPYJSvD4S9U/2
	eNwqrBdDc2ufk04TIQluREzZa61Q2h+X1wjqtp8AXK6TtKRa87C1MoFR6ehcR5WyfeTI
	/Dzg==
X-Gm-Message-State: AHQUAuZF8kYBkzI593R+wOx6cCPUJugk3DQrWmyy/obdUxmpxnr8sPwj
	WMPeLMmA79OkqYu+z8Kf2/SSKItB
X-Google-Smtp-Source: AHgI3IbTNE0sm1lseBCiWytRiVsy4d1QofGYIRYZDFHeBIfORo+M/e/fEkWeQHv5MU2RYgRLpbLQqw==
X-Received: by 2002:a63:f515:: with SMTP id w21mr9665473pgh.220.1549206385810; 
	Sun, 03 Feb 2019 07:06:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	a90sm24349645pfj.109.2019.02.03.07.06.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Feb 2019 07:06:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2019 07:06:05 -0800
Message-Id: <20190203150606.2484-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190203150606.2484-1-raj.khem@gmail.com>
References: <20190203150606.2484-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH 3/4] owfs: Inherit systemd
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
X-List-Received-Date: Sun, 03 Feb 2019 15:06:25 -0000
Content-Transfer-Encoding: 8bit

Fix
ERROR: QA Issue: owfs: Files/directories were installed but not shipped in any package:
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/owfs.service
  /lib/systemd/system/owftpd.service
  /lib/systemd/system/owhttpd.service
  /lib/systemd/system/owserver.service
  /lib/systemd/system/owserver.socket

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
index 50865cccda..326ce0aea8 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p2.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/owfs/owfs \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep update-rc.d pkgconfig
+inherit autotools-brokensep update-rc.d pkgconfig systemd
 
 EXTRA_OECONF = " \
                  --with-fuseinclude=${STAGING_INCDIR} \
-- 
2.20.1


