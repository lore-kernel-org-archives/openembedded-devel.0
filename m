Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id D65746161D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:53:52 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m10so2279823wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7TmCajEFQmqk7CfZ2j5JQNah7QnTvsPA35KB/ZncfGg=;
	b=GNmGFQls4WdQ39ea7sD8U73wSnWMoCL0dTwnqHVqtKhgOLpAVHqUyrdrrgBLiI/8vv
	vCU2aBYPDYuia5tEKcOqKb1LT53ccNHzijxO2iUgrVw4QOvXqOgX6GE8C3K2GTEcQXyM
	wJJjOPnmReIBtLpEZX5V8WfQxTVPKIbQA1aAFzkql+IWkL0afhVHyARMxiL09spwdFEG
	P5XEmE3PvjOo8ND8y3HxhxEWASkzaVSf+XnJLeb53g2eufxvj88OQ/RXcWHxi2KQtA4E
	CUGNcaFZdg+5PzpcDgBqjDgNS2bnkcRRIrFoF0tChitxPLQ6Ii+vR+rcjw1U/HeX3kTT
	J0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7TmCajEFQmqk7CfZ2j5JQNah7QnTvsPA35KB/ZncfGg=;
	b=iBgHX8YW5mzGI5Tee/ZHIej0dN1IreTcLwAXMsbIThKgarDg8f0s/IHEvYToj5K2th
	+3sHQPvusJMuc8AXv38fz56A9PtwMJyIhjlm4jVTclHBOBDLUcqRgrlh0EtzqqNBbBYd
	bylEQ8eXKeueLxGnQ9yz9ZjEfutB8pJQixBbr9O9sPtZjn2CZFwQu5Yfz0qO3AzntsId
	0qgHgmvjse4pyiX+INJTMQE2XvcQP2XBgS8j5/2vInENfrPe8h2inqTaNxzMK8xXfUWU
	E3aVhzxafmg/VVYbULZfbf7b6dCF2qDzpbmHp5RyWmnqos3c2mfmz+fWsefxoQTUZPrd
	jvmA==
X-Gm-Message-State: APjAAAW8/O65JAAXTBEqPYPOntvWLMirfOO9VcXS7ABBdzNlyNirXtGX
	8xDt4zspg32qPv/7Z2CbEuYln0aI
X-Google-Smtp-Source: APXvYqxXw4kOv7X90EGO0oZtun5MZuyd7wp/yMIAs1381iQrOKLifRAgQgeaXD/xjLxpVNXeJaYB7w==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr5404384wmh.22.1582638832936;
	Tue, 25 Feb 2020 05:53:52 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	y17sm23946880wrs.82.2020.02.25.05.53.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 05:53:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 14:53:46 +0100
Message-Id: <20200225135346.13344-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225135346.13344-1-Martin.Jansa@gmail.com>
References: <20200225135346.13344-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/2] python-backports-init: enable native and nativesdk
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
X-List-Received-Date: Tue, 25 Feb 2020 13:53:53 -0000
Content-Transfer-Encoding: 8bit

* needed for python-backports-functools-lru-cache-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-backports-init_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/python/python-backports-init_1.0.bb b/recipes-devtools/python/python-backports-init_1.0.bb
index 29e712a..8b226aa 100644
--- a/recipes-devtools/python/python-backports-init_1.0.bb
+++ b/recipes-devtools/python/python-backports-init_1.0.bb
@@ -23,3 +23,5 @@ do_install() {
 }
 
 FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


