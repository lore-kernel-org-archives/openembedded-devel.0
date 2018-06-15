Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 9341874FF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=yOvQEpxMSeIfnJbIvIK1jAacnCpL3GW0T6LrKgDL6Jg=; 
	b=nI+VXhIflBbQQkEPKevBS5AA7AzhM1W4YaFzmKzNnZ+bZD7Lo/MYRPhFjrDwD+DPTG8qbVhYKtvh1d5VkCctFAoyq37U9e3oXVga/5JBQK25hLwBUK58hvhQLXtbSJD2SLAP71ocIzT13RmKvoennVKhIoER+3FdGuRUxjXbYDCFsW7QlVGvSUKy9Y4171Thz0iSh1fWE/WbE3mgsyFSknYYXmjs69OqzLBVWfjpffUtt+occhCwVfJYt+Fj3BdoSYc4yaXoQ2mDfOd28Ll6JisL+E2ocL+4cLBO4pQZ7JECeDTcWBuKioB5LYuHQ1nrul6W0vTkNN6F4K91IM1U+Q==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1fTkjN-0007YY-TT
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 11:09:17 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jun 2018 11:08:47 +0200
Message-Id: <20180615090847.62109-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-cloud-services] [PATCH] Ruby-shadow upgrade to 2.5.0
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
X-List-Received-Date: Fri, 15 Jun 2018 09:09:17 -0000

Ruby was upgraded to 2.5.0 in sumo. A upgrade in the ruby-shadow is
needed to build

Upstream changes:

* Updates code source reference
* Fixes for rubinius and tests
* Add friendlier method names
* Start to add some smoke tests
* Provide info on implementation

Finally, this version of the package is alrady added in Debian Buster
as well.
---
 recipes-support/ruby-shadow/ruby-shadow_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb b/recipes-support/ruby-shadow/ruby-shadow_git.bb
index 75588f3..e7db6d1 100644
--- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
+++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/apalmblad/ruby-shadow"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=137882914e5269b7268f0fe8e28a3f89"
 
-PV = "2.4.1"
+PV = "2.5.0"
 
 SRC_URI = "git://github.com/apalmblad/ruby-shadow.git"
-SRCREV = "4231a4838fd50022b112838f114ee0586e119605"
+SRCREV = "d2e822d8a8bda61f0774debbfce363a7347ed893"
 S = "${WORKDIR}/git"
 
 inherit ruby
-- 
2.11.0


