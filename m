Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.ranaldo@gmail.com>) id 1OYgRM-0008OK-Lo
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 16:27:30 +0200
Received: by wwb34 with SMTP id 34so409883wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Z/3DQyik3+8TdY8WzYfv8kJC+0gR9wGRrqiupRdq4K4=;
	b=ShG0eCseMPzPq4C7Cj59aBWP6MpNbfdICIEukBuWK356oWMLkx7Z5TNoqe/f60pLNq
	UyejhYZydUob5ZCxOliKmxikRyWEXjV0mdPLbwUtKsFuWvUmV+10AeH7RO1DVLQoAJDw
	rx5ZKqpbTW3/3DazOmqsyQfUyTFcHRDlEzCLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AdnsFIxq4c5TMwQyUJ9q5vm9+M+DxzHB7lD+j36YaUwPQknySKcZ+ZQaNQV97CO3y1
	6IZg5v0QKCHNpdOpvde8gkp1hHoXYQFQ0hoLVWpJCCRJKSAlE8q0bzzYNO6XJKr7uhIV
	RUwlBTQHGQ9hiFYGZsOC4jb+Y/jAHPRsVKxCU=
Received: by 10.227.129.149 with SMTP id o21mr232400wbs.176.1279030529061;
	Tue, 13 Jul 2010 07:15:29 -0700 (PDT)
Received: from localhost.localdomain ([192.132.34.244])
	by mx.google.com with ESMTPS id a27sm39821980wbe.0.2010.07.13.07.15.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Jul 2010 07:15:28 -0700 (PDT)
From: Nicola Ranaldo <nicola.ranaldo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 16:08:57 +0200
Message-Id: <1279030137-30479-2-git-send-email-nicola.ranaldo@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279030137-30479-1-git-send-email-nicola.ranaldo@gmail.com>
References: <1279030137-30479-1-git-send-email-nicola.ranaldo@gmail.com>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: nicola.ranaldo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] wmctrl_1.07: adding libxmu and glib-2.0 to DEPENDS
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
X-List-Received-Date: Tue, 13 Jul 2010 14:27:30 -0000

---
 recipes/wmctrl/wmctrl_1.07.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/wmctrl/wmctrl_1.07.bb b/recipes/wmctrl/wmctrl_1.07.bb
index f285b08..2b3c9f3 100644
--- a/recipes/wmctrl/wmctrl_1.07.bb
+++ b/recipes/wmctrl/wmctrl_1.07.bb
@@ -20,3 +20,5 @@ inherit autotools
 
 SRC_URI[md5sum] = "1fe3c7a2caa6071e071ba34f587e1555"
 SRC_URI[sha256sum] = "d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9"
+
+DEPENDS += libxmu glib-2.0
-- 
1.7.0.4



