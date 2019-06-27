Return-Path: <jean-tiare.le-bigot@easymile.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 426DC78F72
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:59:08 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n9so1610532wru.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=easymile.com; s=easymile;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XFq3/T3xgj4Ac9Qvs7m83YqXni/vlP+gQ2uPnzKwkp8=;
	b=KI48ZyYP7I4YT0fBy3UEOzNRKAayHyhTy0tzxbjgcH0RM+GF34GDjwyIt/CUyPo1hu
	eIkGU5tYKDan3Ws3zCAmqQIeRJd3i+yTDsrKDEKaY9X3LtjuJzeOYN4yYjW5lWxl80Vu
	gbqmpLPjM+2X0FkfTWKrRV2PzFZ0i+BXa4vCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XFq3/T3xgj4Ac9Qvs7m83YqXni/vlP+gQ2uPnzKwkp8=;
	b=UaZDAtfFYJVzZNqMl2dajyuphQAmX/y9tvIR2Y0D/5lx4dOycp5d027lcdhHxvxeIT
	Cj3ZjuuQF/8Yfamp7wy/liYmlb3D9C1D/NaDqnZVhZ1z/dHN28zfY57lWQ7QtRNXzcm9
	Wy9M1hFRj0HghAHdiwhXMk3kUzSy4oDafpogz3gs35VFSbsrbnOYZs7iFLvexcT6iz8T
	iqEnGxycVKfgv++KviuZWbfZHVAMwqYPSP7G8XD8rhZEbarYShREPnIIyfWyAM7Mp61V
	vJI0VApruq45P8r9eZbTfPq73dQuo+1lqdRTV6AEHGXHAbFLfpgYg97l+feIkQYS/hrN
	GgfQ==
X-Gm-Message-State: APjAAAXXRqWnI31xMrBSqA3QglsQlXbYcWAh1wLfZbvSr50ICA5uiJ7C
	a9trXVsKgsieKGkG/bJzbesu9oaYVCb0kO6ZYJ84YfvSp5IaKkMhV0z/XSJfG/gR2NxCNs9bpxn
	3YWjU4ptMygk2CIGN4Lee2d80kVdETegR/rogofKT4qi7dNku0MFyMs8eH2+0k6yU1hbNyA+TZ3
	1bvh1ZkIbJY8Mbdsy5xpj0/erk19jHIz2faA==
X-Google-Smtp-Source: APXvYqwzGjx3FgQQVDiinUB1qrywj5T2mMoZ4cjX4kuvsSsQVtV6mZjXQLp4Oy+tiGG55DR/s7q28Q==
X-Received: by 2002:a5d:484e:: with SMTP id n14mr2216831wrs.348.1561625948827; 
	Thu, 27 Jun 2019 01:59:08 -0700 (PDT)
Received: from localhost.localdomain ([185.116.129.142])
	by smtp.gmail.com with ESMTPSA id r5sm4434354wrg.10.2019.06.27.01.59.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 01:59:08 -0700 (PDT)
From: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 10:59:04 +0200
Message-Id: <20190627085904.9461-1-jean-tiare.le-bigot@easymile.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Jo=C3=ABl=20Esponde?= <joel.esponde@easymile.com>
Subject: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 27 Jun 2019 08:59:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joël Esponde <joel.esponde@easymile.com>

populate_packages relies on ``mkdir`` to both create a directory and set
its permissions. However, ``mkdir`` honors the ``umask`` value.
Therefore, some bits may be lost in the operation. In our case, the
setgid bit on the directories were lost.

This commit fixes this by having a distinct call to create the directory
and to set the permissions.

Signed-off-by: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 20d72bba79..cd223a121e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1216,7 +1216,8 @@ python populate_packages () {
                 src = os.path.join(src, p)
                 dest = os.path.join(dest, p)
                 fstat = cpath.stat(src)
-                os.mkdir(dest, fstat.st_mode)
+                os.mkdir(dest)
+                os.chmod(dest, fstat.st_mode)
                 os.chown(dest, fstat.st_uid, fstat.st_gid)
                 if p not in seen:
                     seen.append(p)
-- 
2.19.1


