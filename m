Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id C65C86A5AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 21:52:44 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so992220eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=CNp+h+KF9pbhGH1g7Xm4ryiVY8PcsrNi7tckV5fiJFU=;
	b=r5rMWOlno9KWGrc/2pHDf1FG1uOaEkv5tIqHBsSjP/CAiAbwkg0LCwwtWfv84wZkm5
	5Y3pHIdOPfJ1RDxA7OwF1OEsr39xiNA67OBEpqrJQwSJUmQIjUCauM505CG3/pCEz9Sw
	11LBrpF9edOLZ2I7LAsFu8FE7InknjkcQ1EGbwRwTFlbl1yKWfetysU/xNGru2T/OZ8U
	XmP6p0twhaJIShqztk4jXEbwAK9rDlZo/Qt0KNZCCFyRlTMi+DAQmcNqb2810pCYvz7F
	RdMH39EWEM2w+WyuMXJRCb4sMV7Xclzhvcjs/WgGsdlG2xOmDVVL0KVX+39lnCYozKJQ
	6aqg==
X-Received: by 10.15.31.198 with SMTP id y46mr8827198eeu.135.1372974765518;
	Thu, 04 Jul 2013 14:52:45 -0700 (PDT)
Received: from mizar.localdomain
	(host69-50-dynamic.0-79-r.retail.telecomitalia.it. [79.0.50.69])
	by mx.google.com with ESMTPSA id
	ci50sm8418690eeb.12.2013.07.04.14.52.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 14:52:44 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jul 2013 23:52:36 +0200
Message-Id: <1372974756-24764-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1372974756-24764-1-git-send-email-andrea.adami@gmail.com>
References: <1372974756-24764-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] linux-yocto-tiny-kexecboot_3.8: use 'require' instead of 'include' for compliance
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
X-List-Received-Date: Thu, 04 Jul 2013 21:52:45 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
index ec83a60..eb02812 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
@@ -8,4 +8,4 @@ KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
 KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
 KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
 
-include linux-yocto-handhelds.inc
+require linux-yocto-handhelds.inc
-- 
1.8.1.5


