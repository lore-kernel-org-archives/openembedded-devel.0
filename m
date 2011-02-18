Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqO3c-0006Hu-C0
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 11:59:29 +0100
Received: (qmail 12180 invoked by uid 503); 18 Feb 2011 10:36:00 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 18 Feb 2011 10:36:00 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 12:58:17 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 18 Feb 2011 12:58:16 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 11:58:41 +0100
Message-Id: <1298026721-16036-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5820902520219086153
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH v2] oestats-client: only send report when task has failed
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
X-List-Received-Date: Fri, 18 Feb 2011 10:59:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

actual behaviour is to send a report for *each* task runned by bitbake
this is ok for one personnal oestat server but doesn't scale well when
dozen of peoples are running test builders which all send reports to
the OE's infrastructure.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
v2: cleaner way to handle the problem as per pb & Jay2 suggestion

 classes/oestats-client.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/oestats-client.bbclass b/classes/oestats-client.bbclass
index 4233d4a..f9ac88f 100644
--- a/classes/oestats-client.bbclass
+++ b/classes/oestats-client.bbclass
@@ -202,8 +202,10 @@ python oestats_eventhandler () {
 		oestats_stop(server, e.data, e.getFailures())
 	elif getName(e) == 'TaskStarted':
 		bb.data.setVar('OESTATS_STAMP', repr(time.time()), e.data)
-	elif getName(e) == 'TaskSucceeded':
-		oestats_task(server, e.data, e.task, 'Succeeded')
+	# Temporary disable sending sucess report as this generates to much trafic
+	# for the oestat server
+	# elif getName(e) == 'TaskSucceeded':
+	#	oestats_task(server, e.data, e.task, 'Succeeded')
 	elif getName(e) == 'TaskFailed':
 		oestats_task(server, e.data, e.task, 'Failed')
 }
-- 
1.7.0.4



