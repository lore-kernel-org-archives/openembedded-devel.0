Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 394C57F7CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 16:46:41 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k1so910840pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EgZbOi6JvFEA4KQ1mdvyXrqmIy1zm2satngijaHXPiI=;
	b=laemo/DhRmo1+hLNlP/uCIWszJY+aJU0JcH48HXlNgOXEk9UFHQNwMPQBM4179juYu
	zdbupGwTmyAACdmUF55aVeLpgfGV6qtkiuUYI4X8Ci+R9OXQPutP39GUnhJPsK6cASPt
	ArUPx1+MUC1IWO9OELfh6/ReAUiIY4qId5/ReFAxAOiZfphVRL4HAlIc48Z7mjtW5B2d
	jJ0JdpCU1a73T6qL2t9YnE0/io0MNQHNbzXPL0LwAiR0b8oNWHyLz8KJqMHLFMYB6t+8
	iyXlGziiTpS9tKP9svxAdWTCKKL3Nl7dlIfQV6KBPExLmpTzooveM8S18OQwSFiBbvAW
	s47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EgZbOi6JvFEA4KQ1mdvyXrqmIy1zm2satngijaHXPiI=;
	b=pJirSNHY4o52LwWGgTKy/lU91XEzUzWhr/iiefpfEE2tcBF6sCoSagt258OOIWH9q+
	OQqXZPc1G9m87Os/vRKE3SD9f1mQ+zJmkI0VKR8hAEFto0Bh3zDIZVcpR8PKRUq634rj
	EacdYoSMYq78ncn4v+G9FmeHZbPPnc7IG8igwrNhmMXheCy3snAT9o9DyP7A9Vaxv79y
	nNbg3rZvv7yxKGBLFwTih9xDRUh3FvVjuihxuyVJW0vv2n3YrlqfjZV5owWVQGzZZxaT
	9/+8t79h0IjZC398R+fM8OZBjjJeUrdkLzLXFDwLIGC/zoEauC23Y9CqYJUdYpygTCmw
	imtQ==
X-Gm-Message-State: APjAAAUvXOR+orQma6yGEaWHG58jppOotK60izuYAYTzq/L9+8yZvs+e
	nCkgROJln7nvi+DDKvRtipxXvRmLnb4=
X-Google-Smtp-Source: APXvYqzvDCStQeHJvz1BhR5yiw4J2Q08IiWkJGfIOQvj/34S4oHL3FQZfkb0oX+Jrv1OAoqMGc7+ew==
X-Received: by 2002:a65:6245:: with SMTP id q5mr40388311pgv.347.1574786801711; 
	Tue, 26 Nov 2019 08:46:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	h195sm13985483pfe.88.2019.11.26.08.46.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 08:46:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 08:46:29 -0800
Message-Id: <20191126164629.4078139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-slip-dbus: Add missing rdep on six module
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
X-List-Received-Date: Tue, 26 Nov 2019 16:46:42 -0000
Content-Transfer-Encoding: 8bit

See [1] why this would be needed

[1] https://github.com/nphilipp/python-slip/blob/master/slip/dbus/service.py#L30

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-slip-dbus.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-slip-dbus.inc b/meta-python/recipes-devtools/python/python-slip-dbus.inc
index 0933b45593..9e726b5b92 100644
--- a/meta-python/recipes-devtools/python/python-slip-dbus.inc
+++ b/meta-python/recipes-devtools/python/python-slip-dbus.inc
@@ -24,6 +24,9 @@ do_compile_prepend() {
     sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
 }
 
+RDEPENDS_${PN} += "\
+${PYTHON_PN}-six \
+"
 # http://errors.yoctoproject.org/Errors/Details/184713/
 # python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
 CLEANBROKEN = "1"
-- 
2.24.0


