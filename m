Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4146FA53
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:33 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so7637261wgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YOiABCGi6JjJED3W1kC1jqf0gPc8k9WBmFTPjZRKAJ8=;
	b=rhEmbN+dvJtQTxwv4kZ8GyFsh0jUJA7GXpT6S5Zq+CUjKz+lmRLQrI+ZllDeU5XY6d
	ATGDCv/6BgvE5OAF1HtyLwiD9zeLzPXSJoCO5JuR5zYxA0OD9/yfZcjjj9pjjyD2Y2Ha
	sutTBo1Euqbwlq9AvvfZYpnsM/oUheQ9EFqAf0VnVMomQ6r+v+LL+UH1/g01/Fr4QMiu
	ap6AAi1iF/qJwcO6op/21+f0WnNYtw4D+m7BjVXS53K7pZW2G8VZpnaDDOTWq39SQYUR
	5gwfxPhvNoukS7TpyXFBqBg/jCU2p4tp5qQ1JfDQs3YM1iei2rHbPLkCT2ebJT4UuIMC
	u8Xg==
X-Received: by 10.180.7.133 with SMTP id j5mr8858330wia.55.1396372534407;
	Tue, 01 Apr 2014 10:15:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e42sm41843874eev.32.2014.04.01.10.15.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:50 +0200
Message-Id: <1396372434-10710-42-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 42/46] libgnomecups: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
index 8f4a6eb..fe0d34e 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -6,7 +6,7 @@ DEPENDS="glib-2.0 gtk+ pango cups intltool libgnomeui"
 
 PR = "r2"
 
-inherit gnome pkgconfig
+inherit gnomebase pkgconfig
 
 do_compile_append () {
     cp libgnomecups-1.0.pc libgnomecups-1.0.pc.old
-- 
1.9.1


