Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIK-0007jb-My
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:03:58 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so671753eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=OeCtTeUzhWdSp3Ltji4V4n9o4CvkaJ0ABtaKmy6ZAJI=;
	b=FvoSHOqJN4kC5Ikz7h23G0EjO+PUPmdAZEEEzlEqXMVCdHI17Mo9lVUp3lsTcFJ58+
	Q5tcyts6JHgOzrp8HSlHhz2rY/6S56pRLxb7kRoFrWikforkM14G+0DXmu7VTxwlnmNh
	CqLzohAdk33+w6XYdbcXxJJJRfIASa6yJcY7PUJsLPq59WtdIf5MhRIYnPlhG29finsY
	Bkj0UahejlwqwX/ASYGSvdQd26LYgJ4AvrRjtN6vb+Jai9o6JQoyEkIz4/oFKeSfioPc
	6+O2cmmzTJ16HuzdopksHDZkCl6SFFIie7i02jhEI7WnsT9+oKVCp0qIVAxYI2LmaDZd
	xu3Q==
X-Received: by 10.14.5.137 with SMTP id 9mr11309658eel.30.1365677194104;
	Thu, 11 Apr 2013 03:46:34 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4946895eei.4.2013.04.11.03.46.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:33 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:46:05 +0200
Message-Id: <1365677165-9296-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnXsul+p7ayMRnppf7afi8J4NXVeYpDByxF2VnB9hX7TIfdMita0VNcGJPj0wr+nmN1JNui
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 8/8] cloud9 bbappend: add EnvironmentFile
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
X-List-Received-Date: Thu, 11 Apr 2013 11:04:08 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
index f805ea9..495b131 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
@@ -4,6 +4,7 @@ ConditionPathExists=|/var/lib/cloud9
 
 [Service]
 Restart=always
+EnvironmentFile=-/etc/default/node
 ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
 
 [Install]
-- 
1.8.1.4



