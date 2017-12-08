Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 90CDB7865F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:30 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u25so6518642pfg.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yecWduOlkbL+biEHoIY43cykl+Jlqm6t9VFPLJRO0js=;
	b=QPSKKd3kB6kSG3pkRP8GH1cz6ZhdOEYe05Km/W3feCf2JJ4bErAwFkdnRQH2kV5K7Q
	NCmPcNvQOGcBPy1TmHkapwHW6c0fcWXTr4SSi24tVyThf/BD0uKSHvzQ77ANE/W+o4Z3
	2umf8unXCUO9fKjKxvFci1qhnMJ3a5xwIMkIidpPiphARwUgwpyqLYJB7CoHcDYQbWMV
	Nz7iexdA+ozyRI4WYnV03Xby30lBwRPyUeCKpEWh+5w9G3Ou56bqZjq6lhWX+QkHGVf2
	6+FRQfhF8uxiSckLu6PY6rHN+ECgz4/jy4PHAMXWCF/YvwsJL/DQ6WG5KbY2VqKUA7hv
	PbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yecWduOlkbL+biEHoIY43cykl+Jlqm6t9VFPLJRO0js=;
	b=ig4mcLyTH5yrjn5fsdgxIKa12tDYXbKFltcq9ERH9yOZAprmUsCIPDhzAWCZG0leWk
	scClBfKUa8YuyJTHS9szjPbnkYDPq027MfV5eq3vBGQ2E+0PvqexjyTidHR1quJ0VlpX
	cRqEU4trJTG0ZE1zSXIN8Yk382du6tNfM3fWXqOO4CC3gQji3hGttJ3E34aTmVdxDRyy
	ZssNfy4Idu7yTOiXWameZHro1Wh94go7KP1DOATrMay6BvTXPoqg80PInQyqjdHFQV0v
	sQxfUR+I3TA4ewfy4+hHnu3MTcZdVTdsXCnwAuqHhM/kLyWZXkz8bRCBQuZqYfaMT0me
	W+YQ==
X-Gm-Message-State: AKGB3mJpyDWKPE+tZnfgzIAbTd/9E56pijX4UfJ2HAX779YYyRn423L8
	Nm2gHpmxJRGirx54VjYvDweKSw==
X-Google-Smtp-Source: AGs4zMbDOHVstEbKlazgu1uGDo292qBXXyaCxEYFpVgAQXOrnf28XA+DZjiv75RySPFhsO/QtrWtFA==
X-Received: by 10.159.253.144 with SMTP id q16mr11767684pls.104.1512711991154; 
	Thu, 07 Dec 2017 21:46:31 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:30 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:42 -0800
Message-Id: <20171208054548.26218-7-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 06/12] python3-flask-sqlalchemy: new recipe
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:30 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
new file mode 100644
index 0000000..07f45bc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.3.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-sqlalchemy.inc
-- 
2.7.4


