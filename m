Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED5E7832A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:04:30 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id w125so33042855qkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 08:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZU2V7nOECjvM9T5SEbWF0ydl9cwZiYYjbOWwZEpJ/Bg=;
	b=gxS/XMMyz1e/hMvM+xzSTslDlnaEFxIPe6pv/ZPIyd9uJAj8S5b/99jaP7rz7EPYwe
	Y9HZGGdhYYgYnMe7cwe1wnxx34keBW3w6H6MmxdLv4/itZ25hA5FCrAzm7q3yEjaAei8
	AYeum4sFGrXOCyz2yoBhiRinU025OgxbBOJnKi+OH55IDEg9rD9t2zqzURihxTQTq0Vd
	0nScWPNYSjyxg7quuXi/QU5x3uVIgHu8zwvfAY57q5/UFYOlkqfDDvicJ/NCtX6c3yZ5
	9K7/fJ7oDUPRxVoYtZiv3b/h/13u1XeYqPF1T74yL19UOwMqolBZCdXiGb1dvwSPKu0d
	mo8w==
X-Gm-Message-State: AJaThX6+pupOSCS5hVlj/GfrZ9zcYgyvWlS3JUQvb1MFOA4RSo+4kuXu
	6O8MpIJoTUlGQ4kzDxJkFRVIIoz3
X-Google-Smtp-Source: AGs4zMZV+ucD+4wWiAhirof79/VG3jguLYt2GB5dC3g3ziOlClN+2Yv7QGG0zF7x3CwEuUHFDWHBOw==
X-Received: by 10.55.214.153 with SMTP id p25mr60659634qkl.97.1511798671145;
	Mon, 27 Nov 2017 08:04:31 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id l9sm20953182qkh.2.2017.11.27.08.04.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 08:04:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 11:04:23 -0500
Message-Id: <1511798664-17286-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511798664-17286-1-git-send-email-derek@asterius.io>
References: <1511798664-17286-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/3] python-django-south: add native to BBCLASSEXTEND
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
X-List-Received-Date: Mon, 27 Nov 2017 16:04:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django-south.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-django-south.inc b/meta-python/recipes-devtools/python/python-django-south.inc
index ce904b6..e4f03b9 100644
--- a/meta-python/recipes-devtools/python/python-django-south.inc
+++ b/meta-python/recipes-devtools/python/python-django-south.inc
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef
 PYPI_PACKAGE = "South"
 inherit pypi
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-django \
-- 
2.7.4


