Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 91E197FCB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:53 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id l24so27099843pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uqsU4iahV6ya7AsZvE73RbOcH+y0VC0dy9bHnjPg1qg=;
	b=GvWls5MQ9pXzv48lEz25LX4rF4GpDu2lelaA0F2B9pVFszBbXcTwfj8eEWZLFS1MaS
	9/p2pKI3YOH0EY7ne5p8vPuwcNhpSz80EN1zeP5aRi37MO/Y1V02ukWMNrtHoyD8ByMu
	KU9Sfboo61+V90wEU59oh0m9bLqaA/IV0AUuqwUqexiKjE6fRuyxJnZRRT9cKzRbCa+s
	12yzvOw6ezkkkDgfif90q0fMbY0pzg6M4HEBCZUEOHEknI8x+gyujZO+sMmQGoaSyQEN
	6zBfe02+cPyCuvgY79wN3lZ6CVgJHBycVfXAeMk2sJ4TzInj7mk5O9c9UPzeoa0ZU5wr
	kl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uqsU4iahV6ya7AsZvE73RbOcH+y0VC0dy9bHnjPg1qg=;
	b=WabfLVOJJKi/vNujWnRCM4XTk3DEtblJqYG/un4yyZK2IZFvU2gRWmu7vamjbc1prJ
	IPgS6OIHRt4PONjuo85XZSJvoK5x6NDAe0Rnef49GXP/ScR75gq0wkv6eTC3JPfI3m87
	osZxAMhOEN8LybeqTjl3TJNBmE9t1ASWDTYX/OEivYuOf0dSB+bC20x2KmihGJXH8BND
	eQaOEkVnvuY/ymTsIArFxr7oRZS6Cy3E/Au/xsnjHHPi1t1X1exGam4MI6GXOt+hLLY2
	UUQVMjoQNTXAkg8ev9jIt70WfTjCSTcT9+58GZrM4Qo+MSmFiSHOOjudzBdr2jC/uRjJ
	ywjQ==
X-Gm-Message-State: APjAAAUq67fG17RBNCult2Qjs5DHl8cNfEpAku1uCxigWVAqJ90+SP0m
	8kx7T5swFxrYyR4uPUcgl9y2mz4x
X-Google-Smtp-Source: APXvYqxHwcXJz5cdGgQun7upHASENYJ6WsJggl1ulkBZE4dz4mImAAKry5DkCaTSpq85d8xKu7I6jA==
X-Received: by 2002:a63:cc4f:: with SMTP id
	q15mr112990776pgi.159.1578327654408; 
	Mon, 06 Jan 2020 08:20:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:25 -0800
Message-Id: <53a3cba93401c902d1d214cafe0bc036e1b101e5.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 17/25] runqueue: Only call into the migrations function if migrations active
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:53 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This doesn't save much time but does make the profile counts for the
function more accurate which is in itself useful.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d446fa89d206fbc6d098215163c968ea5a8cf4a9)
---
 lib/bb/runqueue.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
index b90ac875..729439ef 100644
--- a/lib/bb/runqueue.py
+++ b/lib/bb/runqueue.py
@@ -1959,7 +1959,8 @@ class RunQueueExecute:
         """
 
         self.rq.read_workers()
-        self.process_possible_migrations()
+        if self.updated_taskhash_queue or self.pending_migrations:
+            self.process_possible_migrations()
 
         if not hasattr(self, "sorted_setscene_tids"):
             # Don't want to sort this set every execution
-- 
2.17.1


