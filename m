Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC6z-0007G6-21
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:25 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkU6021261;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-000154-CZ; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:37 +0200
Message-Id: <2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 04/13] siteinfo.bbclass: add cygwin and mingw32 support
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:25 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 classes/siteinfo.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index 039afbb..85dcf72 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -40,6 +40,14 @@ def get_siteinfo_list(d):
                "i486-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
                "i586-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
                "i686-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
+               "i386-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
+               "i486-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
+               "i586-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
+               "i686-cygwin":             "endian-little bit-32 common-cygwin ix86-common",\
+               "i386-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
+               "i486-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
+               "i586-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
+               "i686-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
                "mipsel-linux":            "endian-little bit-32 common-linux common-glibc",\
                "mipsel-linux-uclibc":     "endian-little bit-32 common-linux common-uclibc",\
                "mips-linux":              "endian-big bit-32 common-linux common-glibc",\
-- 
1.5.4.3



