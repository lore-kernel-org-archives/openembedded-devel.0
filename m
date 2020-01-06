Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id BCBA57FCA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:54 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id n96so7751106pjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aYPGjXLf6XivrgBH5cjcAjQXglcJR21U0Vx1oKVXJ2I=;
	b=EW5CC2W5q327I2F0+ZhvYTVFe6HWfZyyUuegZJkD3dCD/Z+0tGZxbzd0AmRNaJPJkr
	bT22tMeYZYxy/4yDcq0GeaUn+dRR1/msVnNmNpcv6DIEj+fHdD/53LUJ/J4JH7nn+DcD
	c54GjPBZ4k6czzzH7muzYcIWKDy9I4h/1cueueknJybhNv1fRA1purudEtVmMRNTeAQp
	AbYk9/YtOx3g89KY/0wr6ocsOjipVcw6mYeFpKrGQS1W48uQc2gQg+UT+KYTn2krfa4S
	0zr1n7AEEv5VPMsrJXgS3iV884tVAn2tVXzBDmaJ2h+9rczG42f7v6ZvWM3wtI/R7D6L
	aNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aYPGjXLf6XivrgBH5cjcAjQXglcJR21U0Vx1oKVXJ2I=;
	b=BNuc3KDruCHN3ICaWJXAT5tQQxA4opKUNSh29KiFf7AKOUC5+wUDl7ZcDC7fRKWap5
	DMIi5QJytuRKyRIqmOpbSWLngSWlaRH4GxhoJMeujmIAeQUmNuAEEXiGnkv88GxFXlZV
	THa0LP3Qa54ppd4Q3zlAxhuLElncPZLMt4W+0SK755x7kuOycmYR7RfXZVHO/EvxeKRZ
	yLk/+2UcvC7eIA3wAKKJ3Cms6r2h3Vqo6xC4pQcQ1f9zoSsx5573Da+AZojUWxSqE2zD
	yD8HGxKxAp05aDLaNhBoj/ajR45B5pZxgjQuMqCckJCQcsK4a3Cs3K92sbjTAP6iRa9q
	EWXQ==
X-Gm-Message-State: APjAAAXcah+Pv+/W9iwYSmkGrpe1O9CsJ7qfhTAOChIhyq1j7NkO7gqW
	GcgceRriI6jOAzTxVn3GRtxsyeVe
X-Google-Smtp-Source: APXvYqyu5FYTNGw18/lWuczdKSVG7F5Tyo2wHEI3zyt38l6n7Wsy5/8949jtIPYAeLfQzvidCeBc1A==
X-Received: by 2002:a17:902:fe17:: with SMTP id
	g23mr106868789plj.42.1578327655402; 
	Mon, 06 Jan 2020 08:20:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:26 -0800
Message-Id: <f224201b5003b89367d688b1f08a062754fce13a.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 18/25] lib/bb: Optimise out debug messages from cooker
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:54 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have bb.debug(2, xxx) messages in cooker which are useful for debugging
but have really bad effects on performance, 640,000 calls on recent profile
graphs taking tens of seconds.

Rather than commenting out debug which can be useful for debugging, don't
create events for debug log messages from cooker which would never be seen.
We already stop the messages hitting the IPC but this avoids the overhead
of creating the log messages too, which has been shown to be signficiant
on the profiles. This allows the code to perform whilst allowing debug
messages to be availble when wanted/enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f04cd931091fb0508badf3e002d70a6952700495)
---
 lib/bb/__init__.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/bb/__init__.py b/lib/bb/__init__.py
index c144311b..ce519ba3 100644
--- a/lib/bb/__init__.py
+++ b/lib/bb/__init__.py
@@ -43,6 +43,11 @@ class BBLogger(Logger):
         Logger.__init__(self, name)
 
     def bbdebug(self, level, msg, *args, **kwargs):
+        if not bb.event.worker_pid:
+            if self.name in bb.msg.loggerDefaultDomains and level > (bb.msg.loggerDefaultDomains[self.name]):
+                return
+            if level > (bb.msg.loggerDefaultDebugLevel):
+                return
         return self.log(logging.DEBUG - level + 1, msg, *args, **kwargs)
 
     def plain(self, msg, *args, **kwargs):
-- 
2.17.1


