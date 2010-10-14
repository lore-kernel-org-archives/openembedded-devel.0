Received: from na3sys009aog112.obsmtp.com ([74.125.149.207])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1P6Pig-00015C-Kw
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 17:27:52 +0200
Received: from source ([209.85.216.41]) by na3sys009aob112.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTLchNCOR2utYAISpv9TfDUU1wTnjsmfs@postini.com;
	Thu, 14 Oct 2010 08:27:24 PDT
Received: by qwb8 with SMTP id 8so1549564qwb.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 08:26:42 -0700 (PDT)
Received: by 10.224.68.7 with SMTP id t7mr8273040qai.227.1287066262733;
	Thu, 14 Oct 2010 07:24:22 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id t35sm6040568qco.18.2010.10.14.07.24.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 07:24:20 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 10:24:14 -0400
Message-Id: <1287066254-23579-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <AANLkTimV_Xf9geTryw8tvYknhe=5_BrSSr5YT2qHnxEJ@mail.gmail.com>
X-SA-Exim-Connect-IP: 74.125.149.207
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Christopher Larson <clarson@kergoth.com>
Subject: [RFC, PATCH, resend] gmp: assign --target to --host to avoid configure error
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
X-List-Received-Date: Thu, 14 Oct 2010 15:27:52 -0000

When trying to build angstrom-2008.1 from
f58a5d59b755bdb725497f574a8059529c134c27 of master or from
b78fc95424b5f0fb28246e8c61bb8b4d6a9d733a of stable/2009 the builds failed on
gmp-native (then later gmp). The error was that "--target is not appropriate
for GMP".

To avoid the error printed by the following code snippet from configure.in:

configure.in:
"
if test -n "$target_alias" && test "$target_alias" != "$host_alias"; then
  AC_MSG_ERROR([--target is not appropriate for GMP
Use --build=CPU-VENDOR-OS if you need to specify your CPU and/or system
explicitly.  Use --host if cross-compiling (see "Installing GMP" in the
manual for more on this).])
fi
"

this patch assigns the value of the '--target' argument to the value of the
'--host' argument.

Tested by 'bitbake gmp' and 'bitbake gmp-native'

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
CC: Christopher Larson <clarson@kergoth.com>

---

This patch will change the argument passed in --target for all versions of
gmp. Would it be better to restrict the change to newer versions only?

I resent this patch to the list since I did not see it show up in the
patchwork system 17hrs later.

---
 recipes/gmp/gmp.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/gmp/gmp.inc b/recipes/gmp/gmp.inc
index 522189d..8ffeb91 100644
--- a/recipes/gmp/gmp.inc
+++ b/recipes/gmp/gmp.inc
@@ -8,6 +8,8 @@ SRC_URI = "${GNU_MIRROR}/gmp/gmp-${PV}.tar.bz2;name=gmp \
 	   file://configure.patch \
 	   file://amd64.patch"
 
+TARGET_SYS = "${HOST_SYS}"
+
 inherit autotools 
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.0.4



