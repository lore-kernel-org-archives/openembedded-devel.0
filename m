Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqNrS-0005y2-61
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 11:46:54 +0100
Received: (qmail 25517 invoked by uid 503); 18 Feb 2011 10:23:25 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 18 Feb 2011 10:23:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 12:45:42 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 18 Feb 2011 12:45:41 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 11:46:06 +0100
Message-Id: <1298025966-5116-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5608388911684169033
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.500001/N
Subject: [PATCH] oestats-client: only send report when task has failed
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
X-List-Received-Date: Fri, 18 Feb 2011 10:46:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

actual behaviour is to send a report for *each* task runned by bitbake
this is ok for one personnal oestat server but doesn't scale well when
dozen of peoples are running test builders which all send reports to
the OE's infrastructure.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 classes/oestats-client.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbclass
index 4233d4a..b568442 100644
--- a/classes/oestats-client.bbclass
+++ b/classes/oestats-client.bbclass
@@ -172,8 +172,8 @@ def oestats_task(server, d, task, status):
 	# send report
 	# FIXME: resend on http/url error?
 	try:
-		response = oestats_send(d, server, "/tasks/", vars, files)
 		if status == 'Failed':
+			response = oestats_send(d, server, "/tasks/", vars, files)
 			bb.warn("oestats: task failed, see %s%s" % (server, response))
 	except:
 		bb.warn("oestats: error sending task (%s), disabling stats" % get_exc_info())
-- 
1.7.0.4



