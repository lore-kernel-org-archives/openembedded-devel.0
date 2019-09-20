Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 328B07FE9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 01:28:50 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id h17so330965pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 18:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+mcimDmUhTMuVuHSNWEQGdV/9rsm+gx06sgJOYvP0w=;
	b=N8Tx+C2V0AWStRBpOk9rgTVhyQJpKRHphmQfxTQdD38HU+IwmjmixjbSsaasfm6RRD
	2uCRbL0W19s6PhAH3B9HyNjZpBZq5dSGhjqqjHtOi7goMhLS0KBgnFZC+PQNMQ1kHGxr
	6opiwcW3hOJtOos7qaKZ9rdhVUEeUTXQO+J5V+xQHxkmVLaJKXfyvu3R1oOjKRky1l06
	sP7fcee/8ZpBNhIYJZjG1qYzOzmgBwzxpFwsUEISvDOMe/xlf4tqlUAmqAkDhXAwHNvB
	zkrhHtyw3xGtVP7vEAEWRxOWrBu6xAPniswOo6ZFF1bNoA4qFlpTA4LY8+q8P72HIxFY
	lyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E+mcimDmUhTMuVuHSNWEQGdV/9rsm+gx06sgJOYvP0w=;
	b=KHl9yaBv4oB3n92dSKT3DEB6TBbejQFNKxlYQqLqQnl4LvzPeNIwrQRFczOCLdUHpD
	DSrze5n4x/8vn+8NM6SfZkt8KTUlarFz3cFiVRfiKW7NmRPr0OBl0jb1j76tjIG0+wBc
	9qFiJTQPRRWGgS3Z3Elpe8fUpy4vE9GvWVUXf/kpOvuInv2K3MQJINQn7hSWDAz5s1Wo
	fG2qpEVnoQbWfZk6i60pMvmr4+8cGY9inZrwemSmSrNywzui+eDtzdHZ/MCSTUIHeWvo
	aDZ+RWtLDhs0GUuPEd2Tky3yDeEjOYQI6tTz4mv/5w1d65Qy/St6BrBtI1fE9yhsUfI8
	4diQ==
X-Gm-Message-State: APjAAAXjKlYOi2LqrhTpxiY3rwmnFnEITINur/A2xmfGfnI5rok720hg
	HMmG7HB8Iu01qDPvKIxRACPH652OJb4=
X-Google-Smtp-Source: APXvYqwyYp44MY7DSG1Mt60lG28wGG05YabIQ7LG96KUOnTxZNQ2938MRDwGkfxWe9dEjbWjCqqaUQ==
X-Received: by 2002:a63:3483:: with SMTP id
	b125mr12007811pga.285.1568942930586; 
	Thu, 19 Sep 2019 18:28:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id u17sm220038pjn.7.2019.09.19.18.28.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 18:28:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2019 18:28:35 -0700
Message-Id: <20190920012835.1632438-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: cjhasu <sumit.jha420@gmail.com>
Subject: [meta-python][PATCH] Remove "werkzeug-test" in RDEPENDS
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
X-List-Received-Date: Fri, 20 Sep 2019 01:28:50 -0000
Content-Transfer-Encoding: 8bit

From: cjhasu <sumit.jha420@gmail.com>

werkzeug-test is not required for building "python3-flask".Hence it should be removed.And also there is no recipe for building werkzeug-test .Hence it is causing error for while building python3-flask.Please add this change ASAP

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index 66ad1a6e74..ffd783f3df 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -13,4 +13,4 @@ CLEANBROKEN = "1"
 
 PYPI_PACKAGE = "Flask"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-werkzeug-tests ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
+RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
-- 
2.23.0


