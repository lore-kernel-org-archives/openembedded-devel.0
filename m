Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0807B77175
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:20:55 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id j37so2434936qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R7UvU6OWWogC4IDuvdN1POvpgNJ6u7uJ0fpdeePojv4=;
	b=AxjCyzLFIxoUAstPmf2VA1wALRZBrXDDH+L2+d9yssyq6yUPEElghjfqQNg8JNR3Pl
	qhUhM6+O4+l1PNJ8QMfp5+ltCKdtQaBqom5rs6dixg986L0J2TJw+aSefOJzG955BxO9
	eJOhb9t8ZFQZmLJtN7H8Wu8CFIa0utD5nOjcfjPZWXZxLWijOYaw0A4bogwxPFh/hCUr
	04GoKK5d2AsnbYbQAQxqzJ9Cqozja0i0VQH1xaYgwv1EJVETqbI4C8Q1KFo6WCR1304K
	lr8ObD0wkDM5jpW/VD0cutOGXdLN1qWhDICO+azqOGfvQ/cQkIOUp8k0APVI2n/ynxvy
	fjeQ==
X-Gm-Message-State: AEkoouuoL6x4THq9H/HaKNm0dk9bEZEy2U1S7xeNm7/VUjzMeJqZSqGefrfwTlDsHiPd4w==
X-Received: by 10.200.46.216 with SMTP id i24mr35115186qta.79.1471288856310;
	Mon, 15 Aug 2016 12:20:56 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	s52sm13171506qtc.4.2016.08.15.12.20.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:20:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:20:47 -0400
Message-Id: <1471288847-15080-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1471288847-15080-1-git-send-email-derek@asterius.io>
References: <1471288847-15080-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-jsonpatch: Fix RDEPENDS to work on minimal python install
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
X-List-Received-Date: Mon, 15 Aug 2016 19:20:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
index bc64ffc..c845eda 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.14.bb
@@ -8,5 +8,5 @@ inherit pypi setuptools
 SRC_URI[md5sum] = "cf4fbad8188f1389363433dbf867109f"
 SRC_URI[sha256sum] = "776d828d6f7b4581862529cf413439a652d74b9e3a0261fa08c36fd761a78b4a"
 
-RDEPENDS_${PN} += "python-re python-json python-jsonpointer"
+RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
-- 
2.7.4


