Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zG-0006Dl-2B
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:18 +0200
Received: (qmail 1793 invoked by uid 813007); 23 Jun 2009 08:57:15 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:15 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:30 +0200
Message-Id: <1245747394-31806-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230941.30107.marcin@juszkiewicz.com.pl>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [STABLE][PATCH 024/125] tinderclient: support sitting behind proxy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jun 2009 09:08:18 -0000

From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/tinderclient.bbclass |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/classes/tinderclient.bbclass b/classes/tinderclient.bbclass
index 0b7fc1d..d2b2b33 100644
--- a/classes/tinderclient.bbclass
+++ b/classes/tinderclient.bbclass
@@ -1,10 +1,20 @@
-def tinder_http_post(server, selector, content_type, body):
+def tinder_http_post(d, server, selector, content_type, body):
     import httplib
+    from bb import data
     # now post it
     for i in range(0,5):
        try:
-           h = httplib.HTTP(server)
-           h.putrequest('POST', selector)
+	   proxy = data.getVar('HTTP_PROXY', d, True )
+	   if (proxy):
+		   if (proxy.endswith('/')):
+			   proxy = proxy[:-1]
+		   if (proxy.startswith('http://')):
+			   proxy = proxy[7:]
+		   h = httplib.HTTP(proxy)
+		   h.putrequest('POST', 'http://%s%s' % (server, selector))
+	   else:
+		   h = httplib.HTTP(server)
+		   h.putrequest('POST', selector)
            h.putheader('content-type', content_type)
            h.putheader('content-length', str(len(body)))
            h.endheaders()
@@ -12,8 +22,8 @@ def tinder_http_post(server, selector, content_type, body):
            errcode, errmsg, headers = h.getreply()
            #print errcode, errmsg, headers
            return (errcode,errmsg, headers, h.file)
-       except:
-           print "Error sending the report!"
+       except Exception, e:
+           print "Error sending the report! ", e
            # try again
            pass
 
@@ -116,7 +126,7 @@ def tinder_build_start(d):
     #print "selector %s and url %s" % (selector, url)
 
     # now post it
-    errcode, errmsg, headers, h_file = tinder_http_post(server,selector,content_type, body)
+    errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
     #print errcode, errmsg, headers
     report = h_file.read()
 
@@ -151,7 +161,7 @@ def tinder_send_http(d, status, _log):
     new_log = _log
     while len(new_log) > 0:
         content_type, body = tinder_format_http_post(d,status,new_log[0:18000])
-        errcode, errmsg, headers, h_file = tinder_http_post(server,selector,content_type, body)
+        errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
         #print errcode, errmsg, headers
         #print h.file.read()
         new_log = new_log[18000:]
-- 
1.6.3.1





