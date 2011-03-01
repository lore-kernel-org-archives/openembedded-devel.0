Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PuL7F-0004sT-FR
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 09:39:33 +0100
Received: by fxm8 with SMTP id 8so4367877fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 00:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=QOCYpUXlUOE1zdTED5SORypykQfdb3Bt1geOLHF7Bms=;
	b=mZRA1OoX8kEYdFnDVI+3CDmCesxPLX5/sAsx39L2ADu1yTi8R/A4yV5Htfd60dMa3T
	RBXbTq9Z9UP1JZLBtBtIaKOlDJ8y3pgj79Mv0c6O3qETeqBYBS9xPk5TfX+uKrxp9rpf
	dFFH3kXzDA5hAt+70peXfzO/KJa1Sc8OzD3Wk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bs5HUxn4f13k4JxA7mhpd+ibOCFku5emmvGZKAe+IRJwy7lwbmLOrjkDWACWu6t7ZW
	qEEjKSIRmzq3vLLATa1RvyKGWb9uHODnIYxTp9Y1zX3j/ghCVL3Ew6xehvVVkc2a0c9b
	9ZfdSZKsm6WTjxkKMK3ebkyC/RIxA6OzQHf4E=
Received: by 10.223.85.208 with SMTP id p16mr2480680fal.107.1298968687225;
	Tue, 01 Mar 2011 00:38:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o17sm1987183fal.1.2011.03.01.00.38.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 00:38:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2011 09:37:52 +0100
Message-Id: <1298968672-14034-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294832897-3343-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] libvpx: force arm mode to be able to link with ffmpeg where arm mode already is forced
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2011 08:39:33 -0000

* v2: updated INC_PR after 0478950960e5c600efc77c25559fc7eee311f686
---
 recipes/webm/libvpx.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/webm/libvpx.inc b/recipes/webm/libvpx.inc
index a1e02b1..fd82d77 100644
--- a/recipes/webm/libvpx.inc
+++ b/recipes/webm/libvpx.inc
@@ -1,11 +1,15 @@
 DESCRIPTION = "vpx Multi-Format Codec SDK"
 LICENSE = "BSD"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2"
 S = "${WORKDIR}/libvpx-v${PV}"
 
+# ffmpeg links with this and fails 
+# sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'
+ARM_INSTRUCTION_SET = "arm"
+
 CFLAGS += "-fPIC"
 
 export CC
-- 
1.7.4.1



