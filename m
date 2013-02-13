Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1U5hw8-00042L-Fw
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Feb 2013 20:24:10 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1DJ85hX026125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 13 Feb 2013 11:08:05 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>)
	id 1U5hga-00032b-Qd; Wed, 13 Feb 2013 14:08:04 -0500
Date: Wed, 13 Feb 2013 14:08:04 -0500
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130213190804.GA11672@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH][meta-selinux] policycoreutils dependency issues
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
X-List-Received-Date: Wed, 13 Feb 2013 19:24:23 -0000
X-List-Received-Date: Wed, 13 Feb 2013 19:24:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

policyutilutils: needs some dependencies unconditionally

policycoreutils will fail to compile if selinux isn't in the DISTROFEATURES.
We move these packages out of @target_selinux.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
--

 policycoreutils.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-security/selinux/policycoreutils.inc b/recipes-security/selinux/policycoreutils.inc
index cc54b36..9869a83 100644
--- a/recipes-security/selinux/policycoreutils.inc
+++ b/recipes-security/selinux/policycoreutils.inc
@@ -1,4 +1,4 @@
-PRINC = "2"
+PRINC = "3"
 
 SUMMARY = "SELinux policy core utilities"
 DESCRIPTION = "policycoreutils contains the policy core utilities that are required \
@@ -16,9 +16,10 @@ PAM_SRC_URI = "file://pam.d/newrole \
               "
 
 DEPENDS += "libsepol libselinux libsemanage"
+DEPENDS += "libcap-ng libcgroup libpam"
 
 inherit selinux
-DEPENDS += "${@target_selinux(d, 'libcap-ng libcgroup libpam audit')}"
+DEPENDS += "${@target_selinux(d, 'audit')}"
 
 RDEPENDS_${BPN} += "\
 	libselinux-python \


