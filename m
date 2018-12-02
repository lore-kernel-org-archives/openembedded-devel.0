Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1E42D6C5AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:19:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u3so9686508wrs.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uakr7Eyao+qNToqIikq00Q0VPwcA+DmHqhA6F6WZFCc=;
	b=sW9cts6LOeBK2Ho/lHl0UrRwjNOSUoK41/3ElDq4gaKHwQNUmliPyM5ZWOYNiGlzqx
	M/9K0oFbIWkZmDK6RpZkjNFHjNrchhZrhCiFIceW8wDkFklXOcgh/D9qz4/5y+pvKH9F
	iNGFoCZriDjcUF1+KjZqpbjvpXrvHEYZz8AMhpdWiY25OYgjUWaMjRndbB+SBJ212pdb
	81qGUa/DxZX8+Re/E8lMEMtfW6gOjvLfn0BV8q+MvanK24oxHOCmba1BMGQ+kKRXVUUZ
	mWLfK9Yu82aMzS8x6qlbBdo1wVdCt37CpjFU5gS6OxmeGqmHxVa3zybQaEJ31LMQg4PC
	CKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uakr7Eyao+qNToqIikq00Q0VPwcA+DmHqhA6F6WZFCc=;
	b=aKCwMcMKvLaMmjj2NTLRedW1Ek9lYBMe8AK+MyO9XYIxKXKdaEb9YxA7++daWiiQQg
	0Y0xTOjzAD6DdpdRUyLSupYUELbcuGIQvdGelEVtVqB2bmvpxtT2bEkhZhxf5C7/Vrqe
	8ziJUWt3yaz5DEc/gn1M1l32yZ8nY7wzC7dzQKHFMTPEUGOKAM82I+BxKFKz62rPtG+o
	gveSqkxSp/+kq+dHdCO2uALPpd6ksqQEhYrzkdl0f8S39DvsrqE4Sfck71pFZ1XEsnhU
	OtIY5RKvUdpnCm/htMkO7wvCiIBNEOGj4pYQMeqrUKUY69RrBzQiheiKj+WBMefI5yv1
	CeKQ==
X-Gm-Message-State: AA+aEWZ2tdx2/Fbn8svIQo7odrxlaap5ArIYk4u4eO4EblfQ5UQOpl7O
	ibgdINFpnk3O69CGsBJcSEekuJD+
X-Google-Smtp-Source: AFSGD/XM3JXpLfCvr1pjZnhLqtsi1GUPzfr85vwSjNzcvwYkTVlROjuw91AyQq1QSe+UV8mAMXBbRQ==
X-Received: by 2002:a5d:480d:: with SMTP id l13mr12045274wrq.175.1543767595497;
	Sun, 02 Dec 2018 08:19:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	g67sm9928578wmd.38.2018.12.02.08.19.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 08:19:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Dec 2018 17:19:49 +0100
Message-Id: <20181202161950.5453-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] packagegroup-meta-oe: drop ptest packages that do not exist
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
X-List-Received-Date: Sun, 02 Dec 2018 16:19:55 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 08b4bbfc4..2a23a6170 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -234,19 +234,15 @@ RDEPENDS_packagegroup-meta-oe-test ="\
 
 RDEPENDS_packagegroup-meta-oe-ptest = "\
     zeromq-ptest \
-    libxml-ptest \
-    soci-ptest \
     leveldb-ptest \
     psqlodbc-ptest \
     lua-ptest \
     protobuf-ptest \
-    libdbi-ptest \
     rsyslog-ptest \
     oprofile-ptest \
     libteam-ptest \
     uthash-ptest \
     mcelog-ptest \
-    openldap-ptest \
     libee-ptest \
     numactl-ptest \
     poco-ptest \
-- 
2.17.1


