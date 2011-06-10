Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <needemesleepe@gmail.com>) id 1QV3NB-0004Tg-Ip
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 17:11:45 +0200
Received: by pzk36 with SMTP id 36so1350420pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2011 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=503gFJCt6xKPT4gug1fE/eUbYp2sVV+SvDKp/Gmylnw=;
	b=Ai4WW/7EA/XfpL76HpU2qL3oXM0SnNLk9KUKFax/NxoR2Gu7+03k0GH4cvDyp2K6SO
	ioaEfCJaBfCfB0shz7XPRI0kKJINKtOVuPC3ON/vh/G5SysMSCZvfBW9VOMs5ToQdkaC
	B7R/c7dRtogT5CiVQHz+F7l5yZyNbTvzYBqq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Kn+aKvm9fO45eVa6BpM2wgwgc4x53LP5w4usi+XCt2QdAu6fNwe6jA8NE2JDc9Nl3V
	CK6ZDE0KEznLPunWNX3AayxR6pgbhW7u/m2jAdzRO2dMw5WswQ1DCv+5GJuaZnLIUyGX
	iW07pgbeWyLx6Wr1RbhKa1z3393dL09lwdq+8=
MIME-Version: 1.0
Received: by 10.68.19.227 with SMTP id i3mr987407pbe.303.1307718503270; Fri,
	10 Jun 2011 08:08:23 -0700 (PDT)
Received: by 10.68.40.161 with HTTP; Fri, 10 Jun 2011 08:08:23 -0700 (PDT)
Date: Fri, 10 Jun 2011 11:08:23 -0400
Message-ID: <BANLkTin341=s1g=vSKKJU-QECTBKKwkpgg@mail.gmail.com>
From: Martin Bures <needemesleepe@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] /contrib/python/generate-manifest-2.6.py: added contextlib to included modules
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
X-List-Received-Date: Fri, 10 Jun 2011 15:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

* Added the contextlib library to python-lang subsection.  This module was
built but
 not included in any python- package.  This library is part of the
 Python runtime services and is a collection of utilities to support
 with-statements.

Signed-off-by: Martin Bures <needemesleepe@gmail.com>
---
 contrib/python/generate-manifest-2.6.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/
generate-manifest-2.6.py
index 1b11266..0a56c43 100755
--- a/contrib/python/generate-manifest-2.6.py
+++ b/contrib/python/generate-manifest-2.6.py
@@ -256,7 +256,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-lang", "Python Low-Level Language Support",
"${PN}-core",
     "lib-dynload/_bisect.so lib-dynload/_collections.so
lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
     "lib-dynload/array.so lib-dynload/itertools.so lib-dynload/operator.so
lib-dynload/parser.so " +
-    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.*
heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
+    "atexit.* bisect.* contextlib* code.* codeop.* collections.* dis.*
functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
     "tokenize.* traceback.* weakref.*" )

     m.addPackage( "${PN}-logging", "Python Logging Support", "${PN}-core
${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
-- 
1.7.0.4

