Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3880D7F9C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:42:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d73so8087491wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 08:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YYylZYnlwkXyPRsPj8uPYy+s35e3aPFfKB/D29plm/E=;
	b=j5MlJqvXxpvxX+6Xs0RdZ12xyI81UnCqSW/TsJI5CAHzyiwL7n1PsVGs9NuodXExDz
	RjDJw9aNzUxWl7iN+EBwB3R7q5EzVmHxZY2m6zCBoWxL7ruxYUqdcZFNqfY688YBqoGX
	ttnzWnOSQCXsfpvzFYbK4YuNY0f7QLMXk2WrsV8J47ToKoCi2abRLIYAy2sW+sMm3/z4
	WOLVYq3mII03NI+BXNoTZcyNrfGY8CxOXZnF9DnhTFjlE1VOdVFas577fBAp3hJ45Aoq
	DAIJ+c8yzy7wFSQXwzH89ulo3eFHmu0oclQiBsYkQYQYIhoRwWhE6NvfPo5Fbu5ai9Dz
	mh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YYylZYnlwkXyPRsPj8uPYy+s35e3aPFfKB/D29plm/E=;
	b=gScM4gMLi62NH6oumaNlz911i46yNEMc2IL9Dc/3jtE340xeV+3SQm4/TJXnfifvwN
	oOYgXRTk7ICfWNSc53yksSd+K5P3QqPZPsTQdZ3ZX4DZLMWnrJBvnyc4QByl3SvKw6UN
	3jFF2dp/7LC/NLpzy8HMj6jixplFyf4IKacdyKNlY2eqJ9+AUWvtQcvhPZTFMGgy+VvJ
	id4EsAqWdawXQytr5j1cB2fDqhXEYq6IPIkBm8rLcG9PeC/5PRMjCMg+xxOjAQFyGW4I
	KVUokNul6wC/nO8pM/CpnFlnSwNhFLOfqLLJOm4I0e9MvmwVQ58tyZ3u01w78Yk4kixJ
	Ts7g==
X-Gm-Message-State: APjAAAWWB0sApZkj2yJTGQtN8dbE/q8HsdaexaWJnCsxYtRQn+fOhFWq
	MTqo6jEG6PllzW1SaYpFsUp+oLlJ
X-Google-Smtp-Source: APXvYqyyBghyjHW4yuBLKw2hhcuqi9oBRm4FfosLkL5tI9hv/cwG54rBMQqWu++8O6V6MK1Texyp2A==
X-Received: by 2002:a1c:6404:: with SMTP id y4mr5238952wmb.143.1579279346765; 
	Fri, 17 Jan 2020 08:42:26 -0800 (PST)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	s8sm33594583wrt.57.2020.01.17.08.42.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 08:42:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 17:42:16 +0100
Message-Id: <20200117164217.11435-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH 1/2] evolution-data-server: remove pythonnative from inherit
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
X-List-Received-Date: Fri, 17 Jan 2020 16:42:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pythonnative is about to be removed and evolution-data-server builds fine without

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index 08bd778d0..7f267b497 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -6,7 +6,7 @@ DEPENDS = " \
     dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
 
-inherit gsettings gobject-introspection features_check cmake gtk-doc gettext perlnative pythonnative
+inherit gsettings gobject-introspection features_check cmake gtk-doc gettext perlnative
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.1


