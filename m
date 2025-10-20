Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA26CCD1A7
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 18:54:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.263.1760986444673516712
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 11:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QOxur9Fu;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47106fc51faso55281425e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760986443; x=1761591243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5DPbzRvi7m2fKM/XjRA/8uud7Oe4YKkEdt1tEblzNs=;
        b=QOxur9FuDfjU5CC3t4TitPWic8tqMsHtOCIaCoAI1Fc5RzTbCG7TgFxhIojENswqR6
         LFlvY5w4K/g6YIxVYIuk7aJPzqGVK5el2+A8DwMvqsgcXUeLlmk1UtIlmY0cLPL/i1Pq
         Wxyp3q85WCXSQp+IaeC0/KEh3qSCGCIHelCf8gpCac7/TBnSiJeRGSgShs04BFPeJf+5
         lcHYz4FIEXOcY/1c7idIFLOdPDl1N4VVgPgi3iNS5+J99hgElGIkYFj9/UXbtwI34NVz
         6xfQWz5ZBokwrnPgXuTVmGwZyTWQWc7KvYhKJi48iD/MIwAsgW91TNR+ugeyIdTILJ2i
         Kp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760986443; x=1761591243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5DPbzRvi7m2fKM/XjRA/8uud7Oe4YKkEdt1tEblzNs=;
        b=qckcG/fmqpVj5jVoEiRzfFM0v6gReYegQ6SPp/KmsMMbtiX+4w7OyRHziwKzcjFQo8
         ZFbglb2JgZdZ1oGOeiFsQjZWLVmOUvB3+vgRCqMFW7w2/BS7uL67G9NqPKuv7FrBCRPa
         hRSD8RuF9tLSxdJ0+zOAUxincde/YixhaD7YPHUSnWyOrXJ48KkgVMzeUWC5JsgbLXq1
         OM/HhWutYAsilLNkV835RluW4V2WoGIm+mbgSRGaI3aYr5IH1WNKVxiK/dm9HyOtRNbW
         2X5QDqQPRGS5Z2rsVdyB8TsUvhF7npn7iveLSWY1+yb0WrpKubpQ9r1qUa5OAVQWg9fc
         vGjg==
X-Gm-Message-State: AOJu0YwbpsMiBVw+Ixh81jECOSGobHnTLjEabCflNkUOQakDVZTK8wmj
	ZmCSNj8bL7v48mC2Qd7lEmynLvnE+F2hkF9rs85+Edv/UBHX+9iVm8xEUp8V0A==
X-Gm-Gg: ASbGnctwqgGLmvjCp0DgOiv5N+ThvW7tUxCkyNpbllUz/UG69WOrdQcYRyO1QlZ7m7f
	MxlsT2Ex2P6+4MhbdqXXMDcaekNL/g9B3Hh2sXs46dHXkGOXcIfh1Xb531/RKCSTpTKAS9NFuZw
	h9g4suqocT2jEyWLJznLljlaeXwuyhWKGlYdOCdW+qsDqC1oYxCS9IAgtauR7WDKMJglLaijy4C
	fIAdnuYaGpQWl4UMlCPi5EBxV9O2d6Bn3io7EaHq6IfUD8B19T7mKAlfpsrEpkWDbiq0E8ENBSh
	e/tmgVG6/Nq4U9AMI2JKmNTGeVHlo6fq+80zyvDN72j6Q5CG/LhCQm4Wkk5S5xXfnPniesunIkt
	cdrIHQzbYsi9alLTQ7L4JKCMcqUcc6qPfh7RVYj/COTaIaB1kvRboQWZifYm29m3LN3hwAeJS9Y
	R3cNkiQgfW2lyVTkYvGs0=
X-Google-Smtp-Source: AGHT+IGoFnTMdiPZlfGYZWSN27IpkbmaIRHmYZCpuhFYfddb2HMxfI1ADGKQqmcBW9MYOQGZk4sSCQ==
X-Received: by 2002:a05:600c:3e05:b0:471:16f3:e542 with SMTP id 5b1f17b1804b1-47117870720mr123840415e9.2.1760986442869;
        Mon, 20 Oct 2025 11:54:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711442dbaesm244999575e9.8.2025.10.20.11.54.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:54:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] postgresql: update sysv init script
Date: Mon, 20 Oct 2025 20:54:01 +0200
Message-ID: <20251020185401.3511011-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 18:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120820

postmaster binary doesn't seem to be installed by default, making the
sysv init script fail to start postgres.

Adjust it to use pg_ctl to start the service, just like its systemd
service counterpart.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/files/postgresql.init | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/files/postgresql.init b/meta-oe/recipes-dbs/postgresql/files/postgresql.init
index 1791e68b58..6d20c60a56 100644
--- a/meta-oe/recipes-dbs/postgresql/files/postgresql.init
+++ b/meta-oe/recipes-dbs/postgresql/files/postgresql.init
@@ -56,7 +56,7 @@ pidfile="/var/run/postmaster.${PGPORT}.pid"
 script_result=0
 
 start(){
-	[ -x "$PGENGINE/postmaster" ] || exit 5
+	[ -x "$PGENGINE/pg_ctl" ] || exit 5
 
 	PSQL_START=$"Starting ${NAME} service: "
 
@@ -109,9 +109,9 @@ start(){
 
 	echo -n "$PSQL_START"
 	test x"$PG_OOM_ADJ" != x && echo "$PG_OOM_ADJ" > /proc/self/oom_score_adj
-	$SU -l postgres -c "$PGENGINE/postmaster -p '$PGPORT' -D '$PGDATA' ${PGOPTS} &" >> "$PGLOG" 2>&1 < /dev/null
-	sleep 2
-	pid=`head -n 1 "$PGDATA/postmaster.pid" 2>/dev/null`
+	$SU -l postgres -c "$PGENGINE/pg_ctl start -D '$PGDATA' -s -o '-p $PGPORT' ${PGOPTS} -w -t 300" >> ${PGLOG}
+
+        pid=`su postgres -c "pg_ctl status -D /var/lib/postgresql/data" | grep "PID:" | grep -o [0-9]*`
 	if [ "x$pid" != x ]
 	then
 		echo -n " [ OK ]"

