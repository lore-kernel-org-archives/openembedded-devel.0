Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8BE7680C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:03:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L7334j001216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Oct 2015 00:03:03 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 21 Oct 2015 00:03:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Oct 2015 15:02:16 +0800
Message-ID: <1445410936-10590-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] postfix.inc: do not hardcode userid and groupid
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
X-List-Received-Date: Wed, 21 Oct 2015 07:03:04 -0000
Content-Type: text/plain

It hardcoded to assign vmail's userid and groupid with 5000,
which caused the following useradd/groupadd is increased from
5000 at do_root time. Such as 'tracing' group id is 5001
(tracing group is added in lttng-tools).

It is better to allocate it dynamically.

BTW, you may google to find the hardcoded 5000 in following site:
https://help.ubuntu.com/community/PostfixVirtualMailBoxClamSmtpHowto

In its main.cf, it also hardcoded virtual_uid_maps and virtual_gid_maps.
...
virtual_uid_maps = static:5000
virtual_gid_maps = static:5000
..

But in meta-oe's main.cf_2.0, it assigned virtual_uid_maps and
virtual_gid_maps with a search.
...
virtual_uid_maps = static:`grep vmail /etc/passwd | cut -d ":" -f 3`
virtual_gid_maps = static:`grep vmail /etc/passwd | cut -d ":" -f 4`
...

So please feel free to forget 5000.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 3e7f918..6d39570 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -36,9 +36,9 @@ INITSCRIPT_PARAMS = "start 58 3 4 5 . stop 13 0 1 6 ."
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = \
 "-d /var/spool/postfix -r -g postfix --shell /bin/false postfix; \
- -d /var/spool/vmail -r -u 5000 -g vmail --shell /bin/false vmail \
+ -d /var/spool/vmail -r -g vmail --shell /bin/false vmail \
 "
-GROUPADD_PARAM_${PN} = "--system postfix;--system postdrop;-g 5000 --system vmail"
+GROUPADD_PARAM_${PN} = "--system postfix;--system postdrop;--system vmail"
 
 export SYSLIBS = "${LDFLAGS}"
 
-- 
1.9.1


