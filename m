Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6378760AD9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 20:44:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id s5so179013wrg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rMbcOB9JJc1+dlb3UQyINbOvlhrf7bCMX4J/iq738gQ=;
	b=BgHNqOkxucGXGcydMnhvn1KcF3950aXC4/v5QZ6QSKCZ/alQJzX3kRenLSgwOB817P
	TqLuwdGYt09qsfKCtJiNjHRNmsX9j/P4GN/Wv+DyXqpJUAuwKIYxdq/f4TIk25gHfLEb
	k2lpAMNSfpjoFt+GQ54rzRi8XYr/NPshjQycOAgv64IJH4sbIDLv2DxdXp9YZ0V7n13U
	sLi22Dq1rIDLBvplUAiHJ2B9ENYhxB9LmuW7ETu08Sjjn7MXukqBKyVakUaCo8s+vmfI
	6vTBXNFY0Zk6LOUR0KUNT+pzYm8g+fPD1TDfEPl9KtcV4BaC75xYBdSiFhgFNdA+nT6m
	BRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rMbcOB9JJc1+dlb3UQyINbOvlhrf7bCMX4J/iq738gQ=;
	b=A3v5Ii4OIC2rI/EhuBdETIAE23P+7GPa0p/ebSdzUH6TTRSGh+PnMveph9eXXTOCB/
	7Vzng1PizpRfbZCYSLOQA5e11z8BTcIlNsJ6oo3qfb5avPBrG9bwCZ8AavCAt3pwPkem
	pNa52fS4QjD2IrBBFw9IZga7KRL0BY5OJfPFgeEJL1xwQscIlVi+inF0pfISpbWu89yr
	8h/SEwY2geQTMI8hqz+H2nV5C1eN5duQpDYhucY4OQglyVEEtiIV/C/LQCgQYOD6I5Lm
	nf1ktpTD4pE4rWI+dR4204WfzzC5KzClpNE/pZD7WvXjLF19ZD7xQvWwdKoVmNGuPYcy
	EzkQ==
X-Gm-Message-State: ANhLgQ1hcu+xYKvNksSHjKiRatUhw1Vu8O7s0CbqFsejAmOrJKPq7jP8
	cHzftkSDm423zZtU6ta5yIFJus4wYt8=
X-Google-Smtp-Source: ADFU+vt87i71UViB36ewsCM60iR5D4jwTnNpyA8nkZrAm2bt/tTg2KMXV5mQX3lT6WgkmRiEQC2Ggw==
X-Received: by 2002:adf:9465:: with SMTP id 92mr7560157wrq.122.1584564273393; 
	Wed, 18 Mar 2020 13:44:33 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id
	j188sm3982590wmj.36.2020.03.18.13.44.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 13:44:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 21:44:11 +0100
Message-Id: <20200318204411.12996-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200318204411.12996-1-schnitzeltony@gmail.com>
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] gnome-control-center: replace network-manager-applet by libnma in DEPENDS
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
X-List-Received-Date: Wed, 18 Mar 2020 20:44:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-control-center/gnome-control-center_3.34.4.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
index c4ba833a1..253322063 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
     gnome-settings-daemon \
     gnome-desktop3 \
     gnome-online-accounts \
-    network-manager-applet \
+    libnma \
     gnome-bluetooth \
     grilo \
     libgtop \
-- 
2.21.1


