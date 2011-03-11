Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PxzH0-000591-PD
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:08:42 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1] helo=[10.225.64.94])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PxzFP-0008Fu-U0
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 10:07:04 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D79E2E2.2080701@xora.org.uk>
References: <1299804808.5437.22.camel@computer> <4D79E2E2.2080701@xora.org.uk>
Date: Fri, 11 Mar 2011 11:06:58 +0100
Message-ID: <1299838018.2321.2.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [PATCH] libevent: recipe for 2.0.10-stable version
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
X-List-Received-Date: Fri, 11 Mar 2011 10:08:42 -0000
X-Groupsio-MsgNum: 30059
Content-Type: multipart/mixed; boundary="=-y+kVOC5RAN+G0CowirDh"

--=-y+kVOC5RAN+G0CowirDh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> Your patches have been corrupted by MTA, please send as attachments.
> 
> The transmission ones can have
> 
> Acked-by: Graeme Gregory <dp@xora.org.uk>
> 
> Graeme
> 

Thanks, libevent patch attached.

Best,
Lukas

--=-y+kVOC5RAN+G0CowirDh
Content-Disposition: attachment; filename="libevent_bump-2-0-10.diff"
Content-Type: text/x-patch; name="libevent_bump-2-0-10.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Lukas-David Gorris <lukas.gorris@gmail.com>
Date: Fri, 11 Mar 2011 01:47:24 +0100
Subject: [oe] [PATCH] libevent: add recipe for 2.0.10-stable version

---
 recipes/libevent/libevent_2.0.10-stable.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libevent/libevent_2.0.10-stable.bb

diff --git a/recipes/libevent/libevent_2.0.10-stable.bb b/recipes/libevent/libevent_2.0.10-stable.bb
new file mode 100644
index 0000000..fa656dc
--- /dev/null
+++ b/recipes/libevent/libevent_2.0.10-stable.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "The libevent API provides a mechanism to execute a callback function \
+when a specific event occurs on a file descriptor or after a timeout has been reached. \
+Furthermore, libevent also support callbacks due to signals or regular timeouts."
+HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
+SECTION = "libs"
+AUTHOR = "Niels Provos <provos@citi.umich.edu>"
+LICENSE = "BSD"
+PR = "r0"
+
+SRC_URI = "http://monkey.org/~provos/libevent-${PV}.tar.gz"
+
+inherit autotools
+
+SRC_URI[md5sum] = "a37401d26cbbf28185211d582741a3d4"
+SRC_URI[sha256sum] = "a4b55810a9e21e9991b86ba5e82dbc9280598cc070544c4ecef4ab91b93dfc55"
+
-- 
1.7.1

--=-y+kVOC5RAN+G0CowirDh--
