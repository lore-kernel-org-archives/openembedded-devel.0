Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8194.1795739682721825179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=S9fdhFkE;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386bd881d39so7949542eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739682; x=1796344482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8p6gDsUU6jWtQ69+WKZzRRBSJ//SERLe0ZF7WeHdCY=;
        b=S9fdhFkEUWTwBp1D28xAJzKOb69l0qifiN0Hn7cHJkxbO2v4KaA5YLF4LEVQjRMAG9
         wcEkBmzpBsdSzOgicwaL28KdKGotk5YdCpUtCdODf+k13OvUSwPJ17MzxIHb3Hzzmwwx
         HYt9nC5i064it+ad67mXJGDRhpZ5qBQ+jUPw0+0YtVjDFybuYxHkO5s8U34OIe6fdVHS
         mlXLZaeSA+VghoiS/25BQ/a1XC1PE9pySKru16+as3j9/6XHYoapbimhzL9znBRppYWV
         f3bv/rhP7oq/zmaVk/x0PKf3nE3zOXwwqjvxGjnHWz4oOv35vi2qtBsBDiwhzbjm0WeN
         4Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739682; x=1796344482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8p6gDsUU6jWtQ69+WKZzRRBSJ//SERLe0ZF7WeHdCY=;
        b=M7gVAcJDiuxArVjf8wV9KAEfjurF8xWWGUEHUyZXJsbiTnmW0jE3sxHuwA4fNi7WOi
         g6KGUyDrfA+bhLwXfVfN3nx9qbU7rJd2hznHHRNWmVRitAelk+xIy+O+6F1/XU+zT6zb
         S4vfOysGyy9jqMCGnhec86TbPKiA75BhlHuw9YHYiEUCY/cipI7gGeY8CmOduNX8IaZl
         M4Duol3GlUN6EAOGvqFxSytGx1TBa1u/Bw+22HY+k3NLPjiaadWPKwFRC3bjfyRNz6P7
         fzXi2pzBtb6PYM7r/H/biwfGO2FzzaNbyumNV0PlYwNedOOa8UUZVrtwTpUOVDMF5gll
         5FmQ==
X-Gm-Message-State: APuU4Z9cKgs0o9HzySJKer189wiUXHiB1cE6pC2drDXeZ7nO8zvdThwj
	ywJeZbXNU7vJz8TueSd+GCtr0+VTomMCTNFcZI3XbRpO6mK2HkziWr9pUtDjdxSZ
X-Gm-Gg: AZFdTZcalkw8Ak2rjm8gxmit748u6U6pcmQEhdgrSoHql9rPzQkjkbYyMxKMWymTEWa
	odmNi05hffwMnhnZBF0omoo9ysvIqcWGWjj2H+aXN7W3leU0dKJ6yf7vJ3/G8NkOFWIUhQH9KV5
	5RmvUF2xK4t6bugcbf6XnWlrIE1A6a72VNw2fDj4KGgANbAIkESy1XTTRz1rfk1yQCwfiZb1lyo
	pjlzL2cFd1RlCJ6FF6bu3nKFr7szaGz7ZRSBwCuLjvp6HuxX6iX7TEc+iE0u8GGF3sFQH5pdF8R
	u9ns1n/LdTS6Wx/UFJaqAkRkB4xxgAXyfC+7sACUVbefBZPZXotoGiwx7SlYzGWVb7KT8qqqch9
	rFfcEhDnc5rcyex5yOYgur0H6oovh7Nzp3gJLY1sFQWlcOJM0hdw7fex2rRdL9Hgx73/gWUKOY+
	4+iKT4XB1Z6EDkNFy1NTZoYW3jiyBbg/KlfF8pgRapdbFG97/x9/O4qc+68qFgGffTage8YAXZG
	7NPp6Dbpy05nTnPmY0Rj5wnp894Klpw/D9ENX61n7POI7lFKlpZKgz9PskveW0cJfT3QwBc1tSo
	7GfjlZ7WzCff3j/dMd2YScaUgBaNeWYSxUm7bL8nC+wf3ucXOEjYEROGB5d/DPMs0k2sbyNtD2Q
	evIiR/nUvgfuaKE2xQS1CDqIdDkJFdpWPzrMiCoYQTAppD5MxnE2Amzn/vmlswGdNy6OARmgSEW
	IJR8YWv7WPZu5UA/c0RruQP6aC9Fr8R7a97gNHCBCrwg9nrx3/vNZkS5N3XncjqClo2h3tA1t+h
	D3UmV4x2EnXMWIhcV+PL8NFINr7ln/kHhs52qgiT11qAPEFmk0WBLeQISeO6gNDJqGtFU1T1rS3
	AYda
X-Received: by 2002:a05:7300:c00f:10b0:381:1eb7:938e with SMTP id 5a478bee46e88-3856c9a61c1mr27432339eec.4.1795739682066;
        Thu, 26 Nov 2026 16:34:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/69] taisei: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:27 -0800
Message-ID: <20261127003425.2166632-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133111
Content-Type: text/plain; charset="utf-8"

The default tag regex matched the numeric prefix of the
v1.4.99-dokomi2024-preview tag and reported 1.4.99. Only match plain
vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
index cc6031adf8..c099619124 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
@@ -26,6 +26,8 @@ SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=h
 		  "
 SRCREV = "6a484e6e61cc51a22a9943762dc2ff6883914f38"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 inherit features_check meson mime mime-xdg pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
