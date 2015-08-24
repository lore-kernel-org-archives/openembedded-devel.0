Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3125876B69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:36:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7OFaIoP006943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 08:36:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 08:36:17 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 24 Aug 2015 23:31:55 +0800
Message-ID: <1440430315-10963-5-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440430315-10963-1-git-send-email-kai.kang@windriver.com>
References: <1440430315-10963-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] atftp: build with gcc 5.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 15:36:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

atftp fails to build with gcc 5.2:

git/tftp_def.h:54:14: warning: inline function 'Strncpy' declared but never defined
git/argz.c:44:8: error: redefinition of 'argz_next'

GCC 5 defaults to -std=gnu11 instead of -std=gnu89. The semantics of
inline function changes. Pass '-std=gnu89' to gcc to compile atftp.

Ref:
https://gcc.gnu.org/gcc-5/porting_to.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/atftp/atftp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index b53f637..0ece58f 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -32,6 +32,8 @@ USERADD_PACKAGES = "${PN}d"
 USERADD_PARAM_${PN}d = "--system --no-create-home --shell /bin/false \
                         --user-group nobody"
 
+EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -std=gnu89'"
+
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
-- 
1.9.1


