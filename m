Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1P4H8W-0001EV-7G
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 19:53:40 +0200
Received: by pxi9 with SMTP id 9so305802pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0ipUcrKRzAFuKyDVdQKZjkfVGwFySAmaBDVko940jes=;
	b=Sf4OfwsGsSmJo7OyoypioBxx1nT8+o0ulghIaoSlfOTGXaEOr86HohpMpdzwtZq6Tr
	WmJf3ct9VjMAsS4LH3G9z9fOuWEJtVoXn7+gcykO98Jybp0nqrOBJ/IR3Mz7YAYWaJuT
	bIagzxmSkKr58FwPCuarL8Sdbt6epXvw4J0cM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=n3owul9y9/HLINN0m2vvk/fhhTxfIlI1TT7gghIfHXwERHWhGr9mHJFqy+UNSd/MG9
	UxCjLCQj1ufCo0h6fK3PdlxhnLKuD127a9l+3QWa+bp1AIKzjfRxzehZ9mvdGS+2jD1e
	bko0y7+YzFkTaS6cOICcB1tNz6NzWIP9eEJ+Y=
Received: by 10.114.135.12 with SMTP id i12mr3187480wad.50.1286560395140;
	Fri, 08 Oct 2010 10:53:15 -0700 (PDT)
Received: from localhost.localdomain ([76.205.222.173])
	by mx.google.com with ESMTPS id q6sm5800158waj.10.2010.10.08.10.53.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Oct 2010 10:53:14 -0700 (PDT)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Oct 2010 10:51:33 -0700
Message-Id: <1286560293-22228-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fix gdb-cross-sdk on older build systems
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
X-List-Received-Date: Fri, 08 Oct 2010 17:53:41 -0000

run autoreconf to lessen dependency on host autotools version
Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
---
 recipes/gdb/gdb-cross-sdk.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.inc
index d7bc2ab..4c58612 100644
--- a/recipes/gdb/gdb-cross-sdk.inc
+++ b/recipes/gdb/gdb-cross-sdk.inc
@@ -6,7 +6,7 @@ inherit sdk
 DEPENDS = "ncurses-sdk zlib-sdk flex-native"
 EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils' LDFLAGS='${BUILD_LDFLAGS}'"
 
-do_configure_append () {
+do_configure () {
 	cd ${B}
 	oe_runmake configure-host
 	sed -e 's,-lncurses,${STAGING_LIBDIR_NATIVE}/libncurses.a ${STAGING_LIBDIR_NATIVE}/libtinfo.a ,g' -i ${B}/gdb/Makefile
@@ -16,4 +16,6 @@ do_configure_append () {
 	for SIM in ${B}/sim/*/Makefile; do
 		[ -f $SIM ] && sed -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i $SIM
 	done
+
+	oe_runconf
 }
-- 
1.7.0.4



