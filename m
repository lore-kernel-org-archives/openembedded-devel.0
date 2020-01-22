Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 527797FD4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 22:19:59 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id n96so201156pjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sm3kKhB0PSDvXcTwcb5/PlwwzFRfhA9DKN+7KRR/hNs=;
	b=sinowgag8vVZYLPCylvTRgJNWNrukc0RW4Iaar+OwEQmWXjIjZeJQJvKODXb9+2WgM
	Pl1w7gl1fjobJOCBOPiHq7yLXeIoiu6toBMwWg8s9oFy8ZtyxIdAnDO8oB9jRgi7ofGX
	0uL8/cpLTeEd2SIhC5TmTXE5xNqVmH4p+p+cqUB4zn+j+eHrh5N326kmnFDAA5pLAQt7
	+b1uah/Sd/CGtsS0C45MLFhC+5jGKqoDof54MyU0+sr4DxxfaPJZOHr7JMbUf3bxZdv+
	cvW0sY7G72MY/+jZyL4J7c5sninm3zDzAPlDQY8+BgtlWVDAQJY9icxnEsR10KxA2Da4
	SQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sm3kKhB0PSDvXcTwcb5/PlwwzFRfhA9DKN+7KRR/hNs=;
	b=KP5XASI1uQb7tvB/pO3Ze7TB4fvxYTfIKOSUytg3SV9xdEIwMR88k0Ip3vnGouLpN4
	8EveDT7rlhTI0j0LR4PazdpE+BT7Bk9g+ZBFUgsX4GbohXAAydKYgQFNryiT+LmrU4gr
	914guy+DFkWYIAmG/NSEOwK1Ds332EtH3I8WDYOtgrdrFy9b2vh6qRasc/4gx1JiZgV/
	Ln2E0GWo1qqn2h5Gcl6yQCl0K3fG0TeygNc1Az8YWJq801Kw/6m8UL5tEyeSN8Uq2JeV
	7VlT69ULrkyOHejFJ4UKHcDikO2yvaZ7NQInLvbC1T/+Ab3ZzW4DlAWLqBk6sWvPx4lk
	/A1g==
X-Gm-Message-State: APjAAAXnzAi+i5F/+dP+MRftG4CeLqeCfevR+w0YjpXiLSWMv/0qp2e6
	TNS6aKx202zhkgStL8oHCgP4yfabXyg=
X-Google-Smtp-Source: APXvYqzjbPavE57m435rzipSa+2NDKpptzwxelep7HgyqO3k/QHKt38ucH/Z+UJgMtPZEVMqCrdEiA==
X-Received: by 2002:a17:90a:d804:: with SMTP id a4mr777965pjv.11.1579731599816;
	Wed, 22 Jan 2020 14:19:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id d14sm8284pjz.12.2020.01.22.14.19.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 14:19:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:19:57 -0800
Message-Id: <20200122221959.1407586-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] openipmi: Correct the dep to use python3
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
X-List-Received-Date: Wed, 22 Jan 2020 22:19:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
index 7962d44075..126b37f118 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
     net-snmp \
     openssl \
     popt \
-    python \
+    python3 \
     swig-native \
     readline \
     "
-- 
2.25.0


