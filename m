Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QQ3yu-0006Xj-Ql
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 May 2011 22:50:05 +0200
Received: (qmail invoked by alias); 27 May 2011 20:46:59 -0000
Received: from p5B0A2270.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.112]
	by mail.gmx.net (mp040) with SMTP; 27 May 2011 22:46:59 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/AvJFGvhbAeFj12ZynJHZeM45yt12jwQ+FIMScvc
	NhdrPnBixbhy12
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 May 2011 22:47:53 +0200
Message-Id: <1306529273-9450-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH] utils.bbclass: modify create_wrapper to correctly follow symlinks
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
X-List-Received-Date: Fri, 27 May 2011 20:50:05 -0000

* taken from OE-Core [1]
* thanks Khem for pointing out[2]
* fixes build failure perl

| env: ./perl5.10.1.real: No such file or directory
| make[1]: *** [pod/perlapi.pod] Error 127

[1] http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=a10bd976f4cef54ac50b0c82f885c17a26e5989f
[2] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/002975.html

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 classes/utils.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 7591d47..936f7fd 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -407,7 +407,8 @@ create_wrapper () {
    cmdname=`basename $cmd`.real
    cat <<END >$cmd
 #!/bin/sh
-exec env $@ \`dirname \$0\`/$cmdname "\$@"
+realpath=\`readlink -fn \$0\`
+exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
 END
    chmod +x $cmd
 }
-- 
1.7.4.4



