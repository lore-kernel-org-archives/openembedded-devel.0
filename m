Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 651C66CF3F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 22:43:51 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so4293136eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hmyle1by1ZYFKHZGDsVd+jP+7vDHZrnOXeaSRkG/iws=;
	b=IpfsLf/elrr/cx2vPvGJZjQJm0ejc8GAaUXTbySAYiarLyRMdPvU2JdoBlo01zKlMe
	6tpmVc2F4Va+0MWfgKuywmBaT94+nGqJZi2J8mNjRaVyZc6svAlBPzsBygd1dbIfwoDi
	aYcMVTT7kNrldNOHRbv9RkmC9cnv56+8YfZMJs3oveDj1udjK9lwV7GpF93/NsN9PZ+L
	fLCZ3XxdSd4vFzjV9CPSUYvETKnVfLkzzff831gGEU0U17XrOkrfDkb1bzmdZEnML6UH
	QPHiyXuQUq/1CLuODV+/afOkxRFt72IPqdiZ9ML5dWYRT0EAwKO6lpOqtLV6lJhckUVv
	tghQ==
X-Received: by 10.15.91.3 with SMTP id r3mr1074567eez.4.1381272232567;
	Tue, 08 Oct 2013 15:43:52 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id k7sm81048514eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 15:43:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2013 00:43:43 +0200
Message-Id: <1381272223-7380-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto-handhelds.inc: split COMPATIBLE_MACHINE filtering
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 22:43:51 -0000

This allows to add new machines to one single kernel variant

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-handhelds.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
index 2e0b7a9..145dbc6 100644
--- a/recipes-kernel/linux/linux-yocto-handhelds.inc
+++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
@@ -1,4 +1,5 @@
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+COMPATIBLE_MACHINE_linux-yocto .= "|akita|c7x0|collie|poodle|spitz|tosa"
+COMPATIBLE_MACHINE_linux-yocto-tiny-kexecboot .= "|akita|c7x0|collie|poodle|spitz|tosa"
 
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
-- 
1.8.1.5


