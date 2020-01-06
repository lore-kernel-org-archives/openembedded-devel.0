Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id D4A147FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 16:20:37 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id w62so27166450pfw.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6bQKooXyuoH7psTkcZwWKaBo2B1xCfR1d+uO6pvRaa4=;
	b=YLRZxmCNKsJ9tqD+JLeIKLZWrv5AsRxa1G0NPN51nn5TVpmpIN5CgNVfTPTPt/l3ks
	BDaLPEpUvXEB+Sw+JJdMOtrlVHf1JpmqReZgJgC1KLlHlqkCyBRxxkU4dOBDfKNj0Hmc
	zXzq4Nz2WMv3IKHXoUGn15aLRFZ5JzV1A+RNluImcSqt1Zc7/ulW1mElaKRbcI9ZH2et
	PhrVMEukYWG8XbM2lhK/5cnPLd/YJA5888NFrKFR0H2V1RFoLy/vaw+xZeZ0Fuo2k+Kl
	Q4sYey7JJEuTJwEKPihO9LHkdTh4wW0wwK34Du4W/ST3HOxswxrFPQ84Iowjj7im6Phz
	U1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6bQKooXyuoH7psTkcZwWKaBo2B1xCfR1d+uO6pvRaa4=;
	b=jaL+m+e1BdmO98pPtyAnnzwyKKb16IViuVc8edurEyYduXqYDOh5IeDNmp49zqyJ4R
	6I4JjL/cCp9d5dbtjj7wl73F/K+YKA9f+omv89ftaeLnuPJU4Gb3Q5Y7p/+OOBbz/JBJ
	CYY8yxluEznmnAVji4pwHewQ4rjbWe7gaWBLI3zldptGdBxnsHURFyT9YXOqYx44JoJ3
	IgaaoUS2IFGgQnNmrceFOh2DpSDrST5Zp5SX1CK8xr2uHyE9ZKhan8AYjzO9RpZ3Vday
	u8eQMlhqDB18LY32SLVTaBDqIkmvLm9kTLyHyAza95HirwrvPbU0eHjpP3VgY+sx1ga0
	QY5g==
X-Gm-Message-State: APjAAAWbIIKZVj0V7Q0yCDDcFNaW8/poxbQrok0OFs/V94FxG93EFy3C
	q9AO6D2y2UhNyxVViVrO1kdEOgMh
X-Google-Smtp-Source: APXvYqwgAHM71KETOJkAeoies0PdbOARoebNk0Yto7ON06sUDA7vEzNPQD9DQSJAAu0fL69f1t30xg==
X-Received: by 2002:a63:5924:: with SMTP id n36mr112085978pgb.43.1578327638484;
	Mon, 06 Jan 2020 08:20:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	g26sm69999588pfo.130.2020.01.06.08.20.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 08:20:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 08:20:09 -0800
Message-Id: <0d154434ed8e3e88ad440a8dd21a164e72ba4ac5.1578327474.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578327474.git.akuster808@gmail.com>
References: <cover.1578327474.git.akuster808@gmail.com>
Subject: [1.44 01/25] hashserv: Add support for equivalent hash reporting
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
X-List-Received-Date: Mon, 06 Jan 2020 16:20:37 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The reason for this should be recorded in the commit logs. Imagine
you have a target recipe (e.g. meta-extsdk-toolchain) which depends on
gdb-cross. sstate in OE-Core allows gdb-cross to have the same hash
regardless of whether its built on x86 or arm. The outhash will be
different.

We need hashequiv to be able to adapt to the prescence of sstate artefacts
for meta-extsdk-toolchain and allow the hashes to re-intersect, rather than
trying to force a rebuild of meta-extsdk-toolchain. By this point in the build,
it would have already been installed from sstate so the build needs to adapt.

Equivalent hashes should be reported to the server as a taskhash that
needs to map to an specific unihash. This patch adds API to the hashserv
client/server to allow this.

[Thanks to Joshua Watt for help with this patch]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 674692fd46a7691a1de59ace6af0556cc5dd6a71)
---
 lib/hashserv/client.py |  8 ++++++++
 lib/hashserv/server.py | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/lib/hashserv/client.py b/lib/hashserv/client.py
index f6595661..ae0cce9d 100644
--- a/lib/hashserv/client.py
+++ b/lib/hashserv/client.py
@@ -148,6 +148,14 @@ class Client(object):
         m['unihash'] = unihash
         return self.send_message({'report': m})
 
+    def report_unihash_equiv(self, taskhash, method, unihash, extra={}):
+        self._set_mode(self.MODE_NORMAL)
+        m = extra.copy()
+        m['taskhash'] = taskhash
+        m['method'] = method
+        m['unihash'] = unihash
+        return self.send_message({'report-equiv': m})
+
     def get_stats(self):
         self._set_mode(self.MODE_NORMAL)
         return self.send_message({'get-stats': None})
diff --git a/lib/hashserv/server.py b/lib/hashserv/server.py
index 0aff7768..cc7e4823 100644
--- a/lib/hashserv/server.py
+++ b/lib/hashserv/server.py
@@ -143,6 +143,7 @@ class ServerClient(object):
             handlers = {
                 'get': self.handle_get,
                 'report': self.handle_report,
+                'report-equiv': self.handle_equivreport,
                 'get-stream': self.handle_get_stream,
                 'get-stats': self.handle_get_stats,
                 'reset-stats': self.handle_reset_stats,
@@ -303,6 +304,41 @@ class ServerClient(object):
 
         self.write_message(d)
 
+    async def handle_equivreport(self, data):
+        with closing(self.db.cursor()) as cursor:
+            insert_data = {
+                'method': data['method'],
+                'outhash': "",
+                'taskhash': data['taskhash'],
+                'unihash': data['unihash'],
+                'created': datetime.now()
+            }
+
+            for k in ('owner', 'PN', 'PV', 'PR', 'task', 'outhash_siginfo'):
+                if k in data:
+                    insert_data[k] = data[k]
+
+            cursor.execute('''INSERT OR IGNORE INTO tasks_v2 (%s) VALUES (%s)''' % (
+                ', '.join(sorted(insert_data.keys())),
+                ', '.join(':' + k for k in sorted(insert_data.keys()))),
+                insert_data)
+
+            self.db.commit()
+
+            # Fetch the unihash that will be reported for the taskhash. If the
+            # unihash matches, it means this row was inserted (or the mapping
+            # was already valid)
+            row = self.query_equivalent(data['method'], data['taskhash'])
+
+            if row['unihash'] == data['unihash']:
+                logger.info('Adding taskhash equivalence for %s with unihash %s',
+                                data['taskhash'], row['unihash'])
+
+            d = {k: row[k] for k in ('taskhash', 'method', 'unihash')}
+
+        self.write_message(d)
+
+
     async def handle_get_stats(self, request):
         d = {
             'requests': self.request_stats.todict(),
-- 
2.17.1


