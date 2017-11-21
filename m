Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3223C78536
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 11:55:05 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d125so11609420qkc.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=4HDEIOvkU3TuFdhV3KYHikDhoFPXQ+gRnlsf9VlPHsc=;
	b=OWGdMbGiL/gjFoZx2rtnamYxAfzGgVId4jFnk3d4x9+tBWxibHuOUZQPVCWfLfwsUk
	+zULGdBs5pFUukKkDFXlnXM7thjb1Qgke1ubMwBMN3gt4/fA1F2OhMlItg2N1RxmTj73
	GlM0yB07Ehh0Lgm6YKCiYTUtdfs6OoT3pRzhQfGWg6o5YlblJffd6Lfy8HlXVzx70bFb
	QqdyLYIbLUlHblSPutw0YUkDIh4VrKn1dCl8kojivPzHUF80Fd8UCeS0dQHONFA2olO2
	M+PRnktIGMvxsar2pCk/dkMOLIdYlb9S22CWZufAK/qxAkubPyd17vFL7hifUc7oLIIv
	PsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=4HDEIOvkU3TuFdhV3KYHikDhoFPXQ+gRnlsf9VlPHsc=;
	b=c7whiU8/KToJcoAM8jYg/3BG4fGwXEWtR5Gzmz7iiQMHolzsobwnbsYri2aDMfXzWP
	VizGQyNSvAxLz1J1F5P/KZj4ncLqUqWQ9WFmw7UleMThgfNoF2nQkG6BsL6nNtjchnIw
	U+SUz4sZ93+bjki7sDoNAIw0h1zRJbwBr0sB/+Oy3Zt9jHDG317YtUjW/4CBgPIlYueT
	jwxebrEGJ1Yt/esyWnn7ya1Cdvu93V54MYfoBWPKCAIt8tUJYWEW2/ZbHKA4GoL8qVvC
	q1kKmVb6Xknk8YaeW4gmlpyOjixlLCWCT2MdQWi16SY6fDx+bVgZmOlHf/xTUe7W6BM+
	+fTQ==
X-Gm-Message-State: AJaThX65ovjw5+BvykWDh018VL+7sfY95RDCmHN+1IGUHYjv92nMswJF
	OaoI9rI1RRA17+5D66pviEan8f2M
X-Google-Smtp-Source: AGs4zMb2GU0LKJHl4cGA1rb7kAPhvceG5CQZAF36Lj2Lt+hHGkjKGw58IN664/hdWOCRsuVPigWxIA==
X-Received: by 10.55.58.14 with SMTP id h14mr24140410qka.132.1511265306898;
	Tue, 21 Nov 2017 03:55:06 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r22sm3928994qkl.35.2017.11.21.03.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 03:55:06 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Nov 2017 09:54:44 -0200
Message-Id: <20171121115444.5028-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][krogoth][PATCH] samba: fix the hardcoded path in init script
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
X-List-Received-Date: Tue, 21 Nov 2017 11:55:06 -0000

From: Jackie Huang <jackie.huang@windriver.com>

Replace the hardcoded path with base_bindir in init
script to fix the error:
/etc/init.d/samba.sh: line 15: /usr/bin/ps: No such file or directory
/etc/init.d/samba.sh: line 17: /usr/bin/sed: No such file or directory
/etc/init.d/samba.sh: line 16: /usr/bin/grep: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit 1aedb972bc8818a9315eac1bb1c9597ddb2bab32)
---
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 6a2220ac1..34e30e24d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -110,6 +110,7 @@ do_install_append() {
             -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
             -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
             -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \
+            -e 's,/usr/bin,${base_bindir},g' \
             -i ${D}${sysconfdir}/init.d/samba.sh
         update-rc.d -r ${D} samba.sh start 20 3 5 .
         update-rc.d -r ${D} samba.sh start 20 0 1 6 .
-- 
2.14.2


