Return-Path: <prvs=072d76755=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id D451E7D71B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 11:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1561463645; x=1592999645;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=fgLGSL5NUQ+DUGCCZkzhtopmjH07WMXwj2OsPP0gwZE=;
	b=bX9+cv/pre1QgYMUEge6+aG70qudt6j3e+uBbfPoasJLBuiNIa4QXl5s
	I3lgU/gO6NeixlkugJA6RVrI6p+wf/drlWMsTNlTT4f/suqU7bKxsVZgr
	hKfDq6tSfVzXtKUU3Z0eJ4qjdPgsUb6076Xp0b6BeQeya61xccnlcrj7c
	HyRckrMEAPfDXHh4PlBEqs2ix5ils0soe9/0jJ7FMnM57hfsHUMJq6dc8
	AaeAfpueunHTRRsy0TKw+onFl26BbS+XBuuxiVpD8Twiq1rTpzbzw3sHA
	ssbVY3zk+5SXn/010jiZUFb+Xs5ksO5nv4SxCELiKxlXzVNwJmpvVNfD3 w==;
IronPort-SDR: qFrSPlXlJHHXFQs0UhGIsbteYxcLTb9ElauOe20lpv/XBLlBXx3KqJtg8gBmX1gKbgyipATXIT
	VPCbowuGi2iwyuBAZtC90tQxzgSwU0zW2q5vsvRYbSvrO925lC/aBnx5Z5dmCWT8vYa8kdozEy
	tn0aimdq4EUj4Y+IFI6zmAZxjZio8cdESGG/ZTk/nmzo2CE0FBPYmPB4yaY8T9R8pNsyD/VCGW
	d25ddwvWMlYZqT0t6Wqg88hl5Wgu4+fOqdCYLLO0tz79aNrbBR6os0zcx3ColxhbhaRVTd2fSL
	iIw=
X-IronPort-AV: E=Sophos;i="5.63,415,1557180000"; d="scan'208";a="17958597"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jun 2019 13:53:25 +0200
Message-ID: <20190625115327.9314-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625115327.9314-1-richard.leitner@skidata.com>
References: <20190625115327.9314-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 2/4] README: rewrite build host dependencies
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
X-List-Received-Date: Tue, 25 Jun 2019 11:54:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Create a list of dependencies for building meta-java and mention the
c++14 std needed by the latest cacao revision.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/README b/README
index 7906324..743418c 100644
--- a/README
+++ b/README
@@ -122,7 +122,7 @@ BBLAYERS ?= " \
   path_to_source/sources/meta-java \
   "
 
-Please note that libstdc++ static is needed on your host to compile icedtea7-native
-(install libstdc++-static on a Fedora).
-
-For debian-based distributions you need the libstdc++6-$compilerversion-dev package.
+Build host dependencies
+-----------------------
+ - gcc with c++14 support
+ - libstdc++ static
-- 
2.20.1


