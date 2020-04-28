Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.6936.1588079371670883923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=ZXvQCkP6;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.194, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f194.google.com with SMTP id 71so17120117qtc.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0QACzDMYPsn49sEVPRUY4ZCgjAjWGFC9h7D6fIzpbMw=;
        b=ZXvQCkP67IRA3/aOyL+fGlRPnhU83H/EzQayVvA2ZoZOo4Cff6bh4PUjDnDrUHQJd6
         u4fU8IRMsXxMJE8imLULJd2sd7cu5+88QTgc1epuZJnpnoWenYrAljxDESA1N1D+xNKN
         T+3ko7lz0WrMrMvoJYp4l/QoH93cjAEE3Lg142ENy4+7pRbk9X4abx/r/Q2O/viqKEWz
         QuZzpTtZdjwXtQKlSY0C2AQBsS/0TeTyt2KBHZ3ec3DBEUEwOGktXBdCXKZVfeTjntVw
         V4orkfbPuqYtCccvyF6UP4VSYsuH5IWXG2PbUUy0aoHoqyiS1YtC9BZxz0PpgRnb4amW
         WzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0QACzDMYPsn49sEVPRUY4ZCgjAjWGFC9h7D6fIzpbMw=;
        b=p7uo52kZR3WGax6fy5r9Ou1yr9Dvv/9kTQ39QRzaFOms50zWuPcIHcnzSGtqW++psE
         TrEe0qf8Agb+099ut2PyXUHhbgug3kQ27Z5mnq6h8Y+2ygAV5TGoX6cTXEnGSNrggeeu
         XrbhE8nNQFwetqdODPFJ7Z/pHvJNygqDTmnkhILwI4ksxksq/FdsP79EQKAAyn6Xqv1A
         0ihpejKdqtE9W4ngDMuJTNnFniBJvIy+tmTH/jqpez/Py9fC5K501JH7HqHis6mvbbmc
         iVmUrQczr11bskc9OJRSwANNM9AkdC5ojJlcDytShHFxQ0xuXQj08dtUOgWMAJQyBW1Q
         8aNg==
X-Gm-Message-State: AGi0PuYV3Ysejf32RY3P+yD6CwUNXJyBD51XzvSdMFU3aj09Toqzke1y
	3fXVMZ7ApmkBvfuLpYhSvL5tVCNEgnU=
X-Google-Smtp-Source: APiQypK36DaxJxBkoD3EKnHYKw0zNaqLQsHDoGb12dWrOMQAiVIn7ZPCCe8AMuPrL70j39Uhh55OYg==
X-Received: by 2002:ac8:2bce:: with SMTP id n14mr28234871qtn.18.1588079370697;
        Tue, 28 Apr 2020 06:09:30 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:30 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 2/8] python3-flask-jwt: Add recipe version 0.3.2
Date: Tue, 28 Apr 2020 10:09:08 -0300
Message-Id: <20200428130914.17398-2-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
References: <20200428130914.17398-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-flask-jwt_0.3.2.bb              | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
new file mode 100644
index 000000000..779a2e25e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt_0.3.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "JWT token authentication for Flask apps"
+HOMEPAGE = "https://github.com/mattupstate/flask-jwt"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ff00db41c47ec84b4567a8b3c246a959"
+
+PYPI_PACKAGE = "Flask-JWT"
+
+SRC_URI[md5sum] = "878ad79a12afa70ad38a12d5ffd2dc1e"
+SRC_URI[sha256sum] = "49c0672fbde0f1cd3374bd834918d28956e3c521c7e00089cdc5380d323bd0ad"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pyjwt ${PYTHON_PN}-flask"
-- 
2.17.1

