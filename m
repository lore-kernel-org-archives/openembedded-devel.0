Return-Path: <Alexey_Firago@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F281E78226
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 20:47:07 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e9dRE-0003MG-L9 from Alexey_Firago@mentor.com ;
	Tue, 31 Oct 2017 13:47:08 -0700
Received: from localhost.localdomain (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 31 Oct 2017 20:47:06 +0000
From: Alexey Firago <alexey_firago@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Oct 2017 23:47:01 +0300
Message-ID: <1509482823-26267-1-git-send-email-alexey_firago@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH 0/2] Add grpc support
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
X-List-Received-Date: Tue, 31 Oct 2017 20:47:08 -0000
Content-Type: text/plain

This series adds changes and recipes to build C based gRPC libraries
and framework.

Alexey Firago (2):
  glflags: Build native version
  grpc: Add recipe for grpc v1.6.6

 ...when-cross-compiling-the-host-grpc_cpp_pl.patch |  68 +++++++++
 ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch |  68 +++++++++
 ....txt-Fix-libraries-installation-for-Linux.patch | 157 +++++++++++++++++++++
 ...ht-protoc-executable-regardless-of-protob.patch |  77 ++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb        |  38 +++++
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb     |   2 +
 6 files changed, 410 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb

-- 
2.7.4


