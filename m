Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3F97FA0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id p9so22032398plk.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Vyo4msbjtScoNFMhi70j40sFrkLNLYqVfPl4iRz/apw=;
	b=NfbiZpYVYUeZAwISmEiutAzKFHgu9ASwOV3fWrwPcAk5Od9TKh9Wu27KbBIcVkJApN
	X/05cWDo97atHaG/eXZWUe19G4Z4kfCpYE9VMaepMouehcoPm05IJkl06LEIF2cGDkqh
	D2BeKzwUmJAw/S1WOJvLw1cBFucw/HRxIXiXqvN4n9l5yJo2tMmKfl17Zxx8Tppi7z8V
	/f5sjfdd07+73ZpdPEwfLe7KusRPdAp4zhGc+EdzmrUJ/wXKj+JqxhFhX822rIbIdLqu
	3+sw2CH6qwmlkk1YWNYjm0wdAdi10+HcXBwbvYSUoSQQQaY9FTGUJcBJXB6w3lu2UO+i
	D10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Vyo4msbjtScoNFMhi70j40sFrkLNLYqVfPl4iRz/apw=;
	b=NszCOT5lgBDmrHthYqfXTaXcknFxYKd060jtxo6/7maIH0BkkWfxgFai3BmlWHSNWF
	F25oNuPM3mVBgDRDpsxLpxBCxFCMzDj2BLW0ja72cO8ExaNV1BWi+pIZMwsXlJbnd6Ps
	GdMNjp2rSNjTmiNwQcbGStAwAS6umK6j/WXONsLrisJ5nV/XayLYqY1o1UxgcHvgI/6Q
	1XtRKhpW2aVzUW9RW9gzM48sdiYluPK2z9j71DSHXxpz7EYunrhaoPNKaf8XMn8t/5o6
	1Nhl+7RZ5/PsVr+ZPYkjo3vUqqijaYG9sGQPApg88uGaXnPiFJeKm+XIZvmm4m9BkdJj
	cf5g==
X-Gm-Message-State: APjAAAWZ+tsO47hw3zd/e9eqb579ZvuIKGqnU1P5YaVaIZPwCPOJnsYQ
	3mkvvV1UEhTXhGGWnYPgFpboLNz+
X-Google-Smtp-Source: APXvYqzmRTEsSOyrbGFR/Pn/YeD6bjZY8+gXx/hAMErwjdfBJCjTBrj3kERZsBba2PGD9xIGGN83oQ==
X-Received: by 2002:a17:90a:bd82:: with SMTP id
	z2mr44638287pjr.17.1578327648514; 
	Mon, 06 Jan 2020 08:20:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:19 -0800
Message-Id: <480939538f5887a70d11c2f7cf74446100e25fab.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 11/25] runqueue: Fix task mismatch failures from incorrect logic
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:47 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The "no dependencies" task case was not being correctly considered in this
code and seemed to be the cause of occasionaly task hash mismatch errors
that were being seen as the dependencies were never accounted for properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 608b9f821539de813bfbd9e65950dbc56a274bc2)
---
 lib/bb/runqueue.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index a45b27ce..b3648ddb 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -2286,7 +2286,7 @@ class RunQueueExecute:
             current = next.copy()
             next = set()
             for tid in current:
-                if not self.rqdata.runtaskentries[tid].depends.isdisjoint(total):
+                if len(self.rqdata.runtaskentries[p].depends) and not self.rqdata.runtaskentries[tid].depends.isdisjoint(total):
                     continue
                 procdep = []
                 for dep in self.rqdata.runtaskentries[tid].depends:
-- 
2.17.1


