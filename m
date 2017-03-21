Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 51C6F71B1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:36 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o126so20595154pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VzcVUSx/vM94y/jxS2y4iIjAlcu67DeM/tqI3FaDcng=;
	b=VNGqEm0hXqcIPIb9pLtstKWrJ6UwTl62YRS3jpi0ENgH+6BoFutZTgwXrpuT7yOhoa
	jYvLCruNLwEURe17Hp8FM7/+rU7c+KdB5elpN1Fwjlox15WCsqdoVFo9QO8CQtWrSpI4
	17AiOwaiTCKOt37NsJrBomXto2NRdMdUEUH11U/S/fyndmTgKF3uADdVHeURx3EGfp6k
	s66Y6a1bXM985xHj+Qqe/O+iLd/EMA8RN/O2vY4YsLLa4tHhE6LxDIJHmmHwmu9UUCIR
	xb0WHQ7hPh8gcv9BKu+e4zDoOTloCHGzpFLeboZKQCoX/5RMlgbP+Ez1KmtmMlVJucKR
	ToFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VzcVUSx/vM94y/jxS2y4iIjAlcu67DeM/tqI3FaDcng=;
	b=jkdy2EsEnJFT13hYSN2nrKFlXKW6hzU7R4B06CDzLNCdIsLfOH3WD6OWyzCdxSAbjJ
	doxo4fKKkVKCLdcIA0DGY0Q5Cqr3vXa/Gc3Ybovvr28bzvrd5LD5wNX+9C7Ds6rhbRqD
	an7S3SF+LlmhwXR22VTfIlJhUA9YWDK5AqVHJm4FOQb5e3JtJbBRw7gkcUS+kQy1bZVw
	x8Si/DiT8nXk73Ro6mmy7RXFeJ3oWDNcT0A4lruzMXufprjep0cyN15vLf0MD4/HGLr/
	Kqn6sjS50EaMw8Yp5RtfIs2WtEAgYK7TgG/01O3cayE1ol3a2T0UXm5ySr8+kQ1eiOre
	P/OA==
X-Gm-Message-State: AFeK/H1pOoT2FtVJRG4dYHQNjJypYJ98WbmI5udz7NZV3dXwQqBj3hX4T0zBHXsCtXge8w==
X-Received: by 10.99.63.68 with SMTP id m65mr23288261pga.17.1490077958448;
	Mon, 20 Mar 2017 23:32:38 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:21 -0700
Message-Id: <20170321063227.11565-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170321063227.11565-1-raj.khem@gmail.com>
References: <20170321063227.11565-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/8] libssh: Force to use gcc toolchain
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
index 6c2264971..79e7dc599 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
@@ -31,3 +31,4 @@ do_configure_prepend () {
 }
 
 FILES_${PN}-dev += "${libdir}/cmake"
+TOOLCHAIN = "gcc"
-- 
2.12.0


