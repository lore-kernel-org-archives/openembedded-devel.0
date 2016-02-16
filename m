Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id AA23D65CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 11:41:00 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u1GBevOB023382
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 12:40:57 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.41]
	(may be forged))
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u1GBevMB022560;
	Tue, 16 Feb 2016 12:40:57 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Feb 2016 12:40:43 +0100
Message-Id: <1455622845-14510-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-webserver][PATCH 0/2] nginx: make mainline and stable version available
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
X-List-Received-Date: Tue, 16 Feb 2016 11:41:03 -0000

Nginx has two supported branches, mainline and stable.
Currently meta-webserver contains the mainline version (1.9.x) of nginx.
For embedded system it might however be more appropriate to use the stable version (1.8.x)
which only receives security updates and bugfixes.

This changeset restructures the nginx recipe to provide recipes for both 1.8 and 1.9 branches.

Pascal Bach (2):
  nginx: split parts out of the recipe into nginx.inc
  nginx: add stable version 1.8.1 as alternative to the mainline version
    1.9.x

 meta-webserver/recipes-httpd/nginx/nginx.inc       | 136 +++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb  |   4 +
 meta-webserver/recipes-httpd/nginx/nginx_1.9.10.bb | 136 +--------------------
 3 files changed, 141 insertions(+), 135 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx.inc
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb

-- 
2.1.4


