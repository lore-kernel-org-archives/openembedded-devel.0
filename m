Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id C83587FCA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:56 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x7so27079650pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pYJZrlTM0BAkluFIzDyFJq8aVbNCeqKkRa7nWMZK0No=;
	b=Sh+BvUKMT88azpZ3hziTuaIA9qQ8PX7FODxtsVYVsYlS85X984UBU2raxJfmC1j1CV
	PCF80QOwyxqhU+vGGkqIAbwACOvt9JsfntJz/j0u85upcyvSPJuYLQfQvanGhpJCLVO+
	mzOMOD8drR2ZexsPpd3IqTCgKleay0VMesXUN+s3M66jVfryT5tjc/8zObWr7lh4wzOK
	NJckPtcX89U2IRgW47eScJri1bOLbGzkJHx+yVPSe6M78PbzK6NA7ZYjxIUbRfKyWKCn
	mpU9lSIYewCyOcl48UbmLG39xVbKR0Xcy2JHdjn5upokClQ02YCKrlekMDAVezcwb2DC
	QTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pYJZrlTM0BAkluFIzDyFJq8aVbNCeqKkRa7nWMZK0No=;
	b=PxFGZXQWhKGoyZMJMB1p3WtZL00d40VTsPQa2V+6rAKaT1rD3fU655Y7D1CKMU/lIg
	yddk6+lmcfyVFGXkwdcxyJZsHWGAcKrzOr81GBdG8egA9KAApVAYoQk2s8HgxdxdLp9J
	58Y4RUDk7jhsR9BF7Pp2qz5Igj+AgZ7aE2Oe5Js4TZkUbBPHcGGbX0ca5KaqRdhzxxwy
	8J8qTiV9zOuwQ4ONUP3GHbCNnQAi7azVG6NQJwWCCfWOXxiogQxgN/lZnLFQj00PmKV7
	0aaHXfpG+aXMCULFz8jVyMr0Okc6VJZUel4m1K/HllCLW+0HCXNq7qe4K1ba9ZRIZli8
	q81w==
X-Gm-Message-State: APjAAAUrareqKMZhT41mpRu6PJsUf1UpstcBus/EYANmpgrdS8ZiLvV+
	GNqZq6YrqqHLVNoJ5UaJdWUNyG0u
X-Google-Smtp-Source: APXvYqwLMWI6hwQa4RURZeL+TPeBJPpV7wUvku42XnXIrUCnhSgYortf9krr7aBP9BErrJpcnnKImg==
X-Received: by 2002:a63:d442:: with SMTP id i2mr115176860pgj.349.1578327657568;
	Mon, 06 Jan 2020 08:20:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:28 -0800
Message-Id: <e731f72ca86629eb935bb1c4f7323421a125aace.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 20/25] prserv/serv: Use with while reading pidfile
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:56 -0000

From: Ola x Nilsson <ola.x.nilsson@axis.com>

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6fa8a18ea4994031fdd1253fe363c5d8eeeba456)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 lib/prserv/serv.py | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/prserv/serv.py b/lib/prserv/serv.py
index 6d8142fc..446e1fe1 100644
--- a/lib/prserv/serv.py
+++ b/lib/prserv/serv.py
@@ -292,10 +292,9 @@ class PRServer(SimpleXMLRPCServer):
         logger.addHandler(streamhandler)
 
         # write pidfile
-        pid = str(os.getpid()) 
-        pf = open(self.pidfile, 'w')
-        pf.write("%s\n" % pid)
-        pf.close()
+        pid = str(os.getpid())
+        with open(self.pidfile, 'w') as pf:
+            pf.write("%s\n" % pid)
 
         self.work_forever()
         self.delpid()
@@ -353,9 +352,8 @@ def start_daemon(dbfile, host, port, logfile):
     ip = socket.gethostbyname(host)
     pidfile = PIDPREFIX % (ip, port)
     try:
-        pf = open(pidfile,'r')
-        pid = int(pf.readline().strip())
-        pf.close()
+        with open(pidfile) as pf:
+            pid = int(pf.readline().strip())
     except IOError:
         pid = None
 
-- 
2.17.1


