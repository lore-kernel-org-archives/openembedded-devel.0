Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A82D78864
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:07 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c6so1452398pfi.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cZM2Uaw+WKPd20qrsWDNG3xtR5cQD8XQPIFsX7/Yvuo=;
	b=m+1Pbynio4ZA4cPsuPxx3tcIycfjQY+aadVdRKuPsI7jcySGvqnPaTMgPGByJskJJb
	yNUIuPDYpm+f1eA/w8Mo82lV/vh5H3ZAs1eEIX22UuIzK6eqjBTIxiWkvzV7NnapMXdj
	jTEOyOP/V0kToZ/oJ0gXPJU4GlIOXCiq6LeA1b6WpXKuFyVH6LcpVo0OvSMBa1ne5cX4
	E0y4mh//g1F41kDhbcJr03yhnytkWDC/WOb8UEGjwL8C+sQUSAMZkwCzn7NYl5LqCsXf
	FJ/N2cqNkjNsC/vJcV/Y774BVZLd0eHSyZlbJfi5DjXKjmZ+ipdBMmrrQEIeM6KjCTUn
	zGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cZM2Uaw+WKPd20qrsWDNG3xtR5cQD8XQPIFsX7/Yvuo=;
	b=fViCkJDMS4pO/E/zTCp26Xr41M2moHPCw/3/ncmjMh8XYJk/SPZhFf+j6vjcZD0m/9
	O5f35h0q8CPvIEP2316AGZpeGeZoAUz+N78iCLYXx47t8JL4chlZ9nIUjaui3sbuM7aT
	B42GG58XJTkIQ1eQhEAhCA+Vg8UheoWZGenc/jw/9D/A/yMy8Yr3IjKIZsu5MqMmOWei
	AuDSZpJcpxWg5ODYoZ0kZiLyUwzgL7+GOFCMF7ERXoV+TuIKG5GBXeH3MZa2YMEKQgDQ
	CBgZOyYzM6AJZ+Hc92BoI+S5Wcp89KD/PyM6ARHwbMQTCR56JnwvXyWVnxR+hdz3sjpl
	3WUA==
X-Gm-Message-State: AKwxytc/ZWH/cslk4FdCeV9Y/KCLw0YbeSwBvjRCGPTYJdDqdEjySd78
	tzvrSfRHRHY44f9ExBQgY3A0pg==
X-Google-Smtp-Source: AH8x225IlJeE8Wy4HBUSHExtGwfdhKiDTcvUMFBGcqRED2ri2E1aAdlSWqUCMIgfT4X5PMU9J3tlFg==
X-Received: by 10.98.15.27 with SMTP id x27mr21233911pfi.197.1517023508972;
	Fri, 26 Jan 2018 19:25:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:31 -0800
Message-Id: <d5400dd1b2b5fb40588c40f2e5a8e83ace1e7b7b.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 31/36] arptables: Fix do_install task
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:07 -0000

From: Fabio Berton <fabio.berton@ossystems.com.br>

We need to run oe_runmake install with DESTDIR variable to install all
arptables files. Without this the only file installed in package is
systemd unit.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit f122ecd7171b2258452131cc75d809b02a1f4f02)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/arptables/arptables_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index 274a55d..cec1d1f 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -23,7 +23,8 @@ inherit systemd
 
 EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
 
-do_install_append() {
+do_install() {
+    oe_runmake install DESTDIR=${D}
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
-- 
2.7.4


