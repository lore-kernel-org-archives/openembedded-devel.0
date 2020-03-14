Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC13600B0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 22:04:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y2so1117229wrn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2020 15:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=E+PMYUh2XF/pZYfDLRcjMWGDSmBZk4jSE2wOmGO0yKY=;
	b=JyKpakFsdvmDlxLZNw0EVIFrGXSUs9gusC7+ba302CiSad71felnUdO2UqCZBxwhtc
	BewSvWb/bLZlwMb2VfPzBP6KbXlLKxOZU5mfNE7qSvrJ7K9QlsLCvg+jMTU10hmnMSzy
	uH6oAfHBwXcLgzSA/DgMAvodwnK4CPQgqYbK/MMagVMesd1AdF2+nlk7BPg8Q1Z5MDkG
	yMZdZ5DWw/Buc/QCtO57CoQ/w8QhaN5HlC3NEyQLWBfiIKgiRflcwZ5QX2LljlUp6mNy
	e1k/w91eFsJt9PcCv/a17tYSNa3r+wQR76FwZpidb0+MmQdWqxxATGlqdke6hvfZTUxv
	4pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E+PMYUh2XF/pZYfDLRcjMWGDSmBZk4jSE2wOmGO0yKY=;
	b=Kwq3mjOj2njS93CoDPzZZD6g0WtGHFq1f8nYbDRuIE1TqaiaAz2q4n5F3q0Z+DAhza
	IyhvBs/YwCmE7NScFSihbPEIPLETHZnXgwlzrNRadjD2QUPS2n6lD+x/Cu0fsY4jZC8J
	ekAGb8+t+18B661iI9yb4B2Q+XtuxZ0I8B7NjsKdyuqieKywibOOBV453K2mD1jiwzY7
	clmvPGEk7A77hlw4jtx0n4s7Rq9POScA88z+YKzvZ8Vg7tzu0o8vR2jJ5QLTlX0CGRp9
	nN1vhINCg3yBngTHatfNWiAcOzLbtuq7+TbABrEVdQmSpWBih/RAu4ymTgZBvPN+STtE
	aRGw==
X-Gm-Message-State: ANhLgQ33FXYNJ3iIIQIo87ji6J+eUwwtoUNQCCAt225ffgdc+viOP+8J
	KylZ1K2cpGgDxuM8iYjTavsx92mZ4AQ=
X-Google-Smtp-Source: ADFU+vv999YUwVDzA1dPA9E12DIo3q7hkLxCbXQWJCkvWWlWTjoCLvPr5Vv05evzZjV+bzEfikmDfQ==
X-Received: by 2002:adf:ed06:: with SMTP id a6mr25743252wro.346.1584223494025; 
	Sat, 14 Mar 2020 15:04:54 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0BEB41AD3B47880472491F.dip0.t-ipconnect.de.
	[2003:f0:7f0b:eb41:ad3b:4788:472:491f])
	by smtp.gmail.com with ESMTPSA id
	v10sm15287835wml.44.2020.03.14.15.04.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Mar 2020 15:04:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Mar 2020 23:04:40 +0100
Message-Id: <20200314220440.5983-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200314220440.5983-1-schnitzeltony@gmail.com>
References: <20200314220440.5983-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mutter: depend on pipewire-0.2 in PACKAGECONFIG[remote-desktop]
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
X-List-Received-Date: Sat, 14 Mar 2020 22:04:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
index 7979802d2..c90559cae 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
@@ -52,7 +52,7 @@ PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_bac
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=true, virtual/libgl"
 PACKAGECONFIG[glx] = "-Dglx=true, -Dglx=false"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
-PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
+PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire-0.2"
 PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
 PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
 PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, -Dstartup_notification=false, startup-notification, startup-notification"
-- 
2.21.1


