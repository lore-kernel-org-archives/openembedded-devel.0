Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5509372658
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:23:00 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lf10so14677444pab.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Fz68GBoDIefkskmirXiLzEHZ99T1KgWqK5Grxhh6Dpo=;
	b=K8dt0zcctP4lW+WQc9egwzA0V/jyjRnBNcSJEVJxv5Yqd80EvlsfVdP7/99TmgQW1H
	u6PK1FfrvMs02oIwFXi8E39cmtV6VStfQn6EO24FzNMY2hyYZP3gDxq6biE95+x7O9sc
	aZeGh7lxsqW6Hqirohz/teezpQHe10Lh32DLuxy8CpmF9aIsmfnHVv44/s1iNQ1MR8sm
	RGbuXs1KY0X24HTaZAHFgZxen8qI3e4BoEO6z9cTvRhgtoDuNXRqON56zPI+/Xsa0fge
	oH6aG6ndyzPalrh7kz10ATLV2pinXqiHQVQFOyX4pWAkZOyMq79uB6OVeVoTXruRPwSm
	ZIpQ==
X-Received: by 10.70.131.104 with SMTP id ol8mr75825134pdb.81.1419700981805;
	Sat, 27 Dec 2014 09:23:01 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:23:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:12 -0800
Message-Id: <c9b69b16dbdfc9ddc6253498329b78220c3e1634.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 25/27] mplayer2: use autotools-brokensep (B = S)
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
X-List-Received-Date: Sat, 27 Dec 2014 17:23:01 -0000

From: "Belal, Awais" <Awais_Belal@mentor.com>

The mplayer2 package does not support out of tree builds
and the do_configure step also tries to find the configure
script in the same build directory while the script lies in
the src directory.
This patch updates the builddir to point to the srcdir in
order to cope with the above issues.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index aa6c011..446562c 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -36,7 +36,7 @@ CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \
                     /usr/etc/mplayer/codecs.conf \
 "
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 EXTRA_OECONF = " \
     --prefix=/usr \
-- 
1.9.1


