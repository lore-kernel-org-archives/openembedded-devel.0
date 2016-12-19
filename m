Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id BFB00772F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 19:11:02 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id w68so3280307pgw.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qZOjRjEfEwccMvCg6hpnyNodHM4XOxkcpuniw57pLz0=;
	b=JOkgrhi0X1SDwOtCZ5znT6/dJlyJk/5HChGTa/05xz3ip7F5ajX7Om+eXQO/C/GaWc
	foP6p97Ppuf9L+bOL0os149i+fBd+euiiR1W3A7uYvoKbTDY2+5StVnXJpLccrepY+kA
	Y+ygTun1jyjHEy9TXseMedN7HbnHPH8S2naGXUlVVJl2kXADqB5jZ9wfn+5Zkh5cuQjD
	KhIoTa5PbOixr7279wlW7El5X6FHenHdBHFp0vJcIYLUtL57IPMSrVCeDn0+GB1E8TA5
	h0emWvHi7VZZEK8inrN0HnKC6eF8T/dcUaEjN+7phCUj02K6idvCE5ilovAzJRjNF1U5
	SfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qZOjRjEfEwccMvCg6hpnyNodHM4XOxkcpuniw57pLz0=;
	b=FdGtMcRoYGqau8UI1mhm/YrEav1s0E4nhGWX29osmT4VpfpVZsiZF4BircHybOFxDV
	TtdgMt+pDlcK8aZIcJHw21UkSiA3Zu+81GJApxwLwpq0i905rx2mi0+9nVwVX71UVjbI
	T/roAeICZm5v46v9FrWz7nFwaTJkdAR0AIC777ZRy4QUr3pTW3GsoljPu1UQ9ZzmziQt
	9uJVvhQ14zKtuZK81IOYAAgh/pnk0RWDe3XKhSVaWBLrkZQwQQPaXDuDKSvM0/TKawKL
	UzfzJg6G5nUD8nfGGCkrwNuprqmSgV54fwcqm27G1R0gFDGby9N6htOFRf0b2E28HsOr
	eg6g==
X-Gm-Message-State: AKaTC034z2bxYGHwFMuovSVuI0K/Do9bTw2KDPqk1CI5WgWd286YXp0Wp/yUhd7cdpVDwA==
X-Received: by 10.84.176.131 with SMTP id v3mr37551221plb.51.1482174663991;
	Mon, 19 Dec 2016 11:11:03 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	p67sm33309939pfb.2.2016.12.19.11.11.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 11:11:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2016 11:10:52 -0800
Message-Id: <20161219191053.17952-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-multimedia][PATCH 1/2] gst-plugins-bad_0.10.23.bb: Add packageconfig for zbar plugin
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
X-List-Received-Date: Mon, 19 Dec 2016 19:11:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
index f8e77e199..38fccc8d0 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
@@ -43,6 +43,7 @@ PACKAGECONFIG[rtmp] = "--enable-rtmp,--disable-rtmp,rtmpdump"
 PACKAGECONFIG[voamrwbenc] = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
 PACKAGECONFIG[voaacenc] = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[resindvd] = "--enable-resindvd,--disable-resindvd,libdvdnav libdvdread"
+PACKAGECONFIG[zbar] = "--enable-zbar,--disable-zbar,zbar jpeg"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
2.11.0


