Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBA977E68
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:35:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p69so1328211pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iA6AK4MCiglRwrRMJtPGIxLD6032fKWdinnABqr2r8o=;
	b=cUdUL69eweA+PDG/63ADgLk99aR6qmpGOBI025adasZlHW9w2Gg9J0AcmLPzNh4UEr
	QlAaUkqcm5gYA6PEH3MZdwOfx7n0Vp9yu83h+GlOdCbZTmj4JPHVPMq1/ta/mc6Mf9SJ
	AKHfZW0sWeAV7OnvAZfRdCxeD0y1giG6f5cgG9N3RN/+UHBhxumX5epc6FSGy6+iBmq3
	7LuzsoxIF7XHj8n1RQOEg77n910upYDfP4sCZRJeBbKLFoYqixpdCBQYCYGacNjHXCvp
	2bTGBlOxk9mXD9qgflPobEdKxQ/4pKk6kNwRYCzQOM5HbkHcwtjIdCatbhrT8UB+18oN
	sIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iA6AK4MCiglRwrRMJtPGIxLD6032fKWdinnABqr2r8o=;
	b=g4mrO1+lEf7tAnu88CNyCYNMjvd+4q5IfHaroS4EpwzlvLLh6jRsFEM80J6lo8lJt1
	Fw0Zklbp9KY5v+Vy8Qvw+4XIAXmV88lwnmlHPTSjUarBhplFZkyUVsmS4JfxCd72wwg0
	xWUWssX0gML82PhYgnc1xlgAAggZO6kruYA+ltECjk3un1juXfWbv3zAobD9DIaEc5ZP
	tI5I5k9LYyzhA6YCKyM5r5zIwDs8IVSg5coGN+Mn05Uki8nT4YNwjxodakqewF/iQ6ZP
	xGU+IKsWGt3V3yjn55Qpuz62+jKtzlEHMjiisCf5AzN3iIq63pB7uOv11lOiUwEhhPOO
	1NIg==
X-Gm-Message-State: AHYfb5hu9pLyGpiWaLbTJZbEWfdt2NammFbG4JthvZNSnQ8XjMdN2/0S
	vBiQAgrmljjYzvDi
X-Received: by 10.98.212.92 with SMTP id u28mr2362838pfl.316.1503772531049;
	Sat, 26 Aug 2017 11:35:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	m2sm15240546pgs.72.2017.08.26.11.35.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 11:35:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 11:35:16 -0700
Message-Id: <20170826183521.34294-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170826183521.34294-1-raj.khem@gmail.com>
References: <20170826183521.34294-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/7] iscsitarget: Fix kernel with new 4.12+ kernel
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
X-List-Received-Date: Sat, 26 Aug 2017 18:35:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...vent-netlink_ack-now-requires-4-arguments.patch | 32 ++++++++++++++++++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch

diff --git a/meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch b/meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
new file mode 100644
index 000000000..cf647f024
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
@@ -0,0 +1,32 @@
+From cbc5f8151017f45231b75a826f18354a81c287c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 07:52:59 -0700
+Subject: [PATCH] kernel/event: netlink_ack() now requires 4 arguments
+
+see https://patchwork.kernel.org/patch/9670181/
+
+event.c:32:4: error: too few arguments to function 'netlink_ack'
+|     netlink_ack(skb, nlh, 0);
+|     ^~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kernel/event.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kernel/event.c b/kernel/event.c
+index ef4adcb..8ba5978 100644
+--- a/kernel/event.c
++++ b/kernel/event.c
+@@ -29,7 +29,7 @@ static void event_recv_skb(struct sk_buff *skb)
+ 		ietd_pid = NETLINK_CB(skb).portid;
+ 		WARN_ON(ietd_pid == 0);
+ 		if (nlh->nlmsg_flags & NLM_F_ACK)
+-			netlink_ack(skb, nlh, 0);
++			netlink_ack(skb, nlh, 0, NULL);
+ 		skb_pull(skb, rlen);
+ 	}
+ }
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 5c1e38e17..659366107 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${P
            file://access-sk_v6_daddr-iff-IPV6-defined.patch \
            file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch \
            file://build_with_updated_interfaces_of_linux_v4.8_and_above.patch \
-           file://fix-call-trace-of-ahash-API-calling.patch"
+           file://fix-call-trace-of-ahash-API-calling.patch \
+           file://0001-kernel-event-netlink_ack-now-requires-4-arguments.patch \
+           "
 
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
-- 
2.14.1


