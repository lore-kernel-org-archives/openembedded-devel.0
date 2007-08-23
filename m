Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IO8QN-0002Ga-NZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 10:52:19 +0200
Received: by fk-out-0910.google.com with SMTP id 18so405510fks
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 01:51:10 -0700 (PDT)
Received: by 10.82.106.14 with SMTP id e14mr3628323buc.1187859069892;
	Thu, 23 Aug 2007 01:51:09 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Thu, 23 Aug 2007 01:51:09 -0700 (PDT)
Message-ID: <74d0deb30708230151h6601b1c3r9011b2a8d8eea2e8@mail.gmail.com>
Date: Thu, 23 Aug 2007 10:51:09 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: glibc-package.bbclass: [ -f ] doesn't take multiple arguments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 08:52:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The "[ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]" fails if there
are multiple libgcc_s.* in that directory (libgcc_s.so and
libgcc_s.so.x.y)

--- packages/glibc/glibc-package.bbclass	2529c6468fce1e1b9ff4d39758addca2534e19fb
+++ packages/glibc/glibc-package.bbclass	7f658a24e4779696422ea29792ed63083a5985b8
@@ -144,9 +144,12 @@ do_prep_locale_tree() {
 		gunzip $i
 	done
 	ls ${D}/lib/* | xargs -iBLAH cp -a BLAH $treedir/lib
-	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]; then
-		cp -a ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
+	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
+		cp -a ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
 	fi
+	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
+		cp -a ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
+	fi
 	install -m 0755 ${D}${bindir}/localedef $treedir/bin
 }

cheers
Philipp


