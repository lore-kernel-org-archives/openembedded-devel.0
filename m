Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MDy7u-0008Hg-Aw
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 12:00:18 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id CD39214030; Tue,  9 Jun 2009 11:50:42 +0200 (CEST)
Date: Tue, 9 Jun 2009 11:50:42 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090609095042.GB1405@zlo.nu>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [Patch] (e)glibc's do_prep_locale_tree() in bbclass
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
X-List-Received-Date: Tue, 09 Jun 2009 10:00:21 -0000
X-Groupsio-MsgNum: 11175
Content-Type: multipart/mixed; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

do_prep_locale_tree() in both recipes/eglibc/eglibc-package.bbclass and
recipes/glibc/glibc-package.bbclass do an
"ls ${D}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib"

That works fine as longs as there are no directories in there. When
there are directories in there (which is the case in my situation at
least, using org.openembedded.dev), ls produces "directory:" lines which
obviously confuse the cp command.

Simply adding a "-d" flag to ls solves this issue.

Patch attached.

Marc

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=p

commit b4098e51e5bc76dda6755e2f949b107ccd85a088
Author: Marc Olzheim <marc@iphion.nl>
Date:   Tue Jun 9 11:39:11 2009 +0200

    Fix do_prep_locale_tree() for eglibc as well.

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index f2acc96..e8bb333 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -156,7 +156,7 @@ do_prep_locale_tree() {
 	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
 		gunzip $i
 	done
-	ls ${D}/lib/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
+	ls -d ${D}/lib/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
 	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]; then
 		cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* $treedir/lib
 	fi

commit 6a703c95b135290b617d5b9dd14a4d08a8b1131b
Author: Marc Olzheim <marc@iphion.nl>
Date:   Tue Jun 9 10:47:24 2009 +0200

    Fix do_prep_locale_tree().

diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index 2bf08ce..2da6818 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -147,7 +147,7 @@ do_prep_locale_tree() {
 	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
 		gunzip $i
 	done
-	ls ${D}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
+	ls -d ${D}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
 	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
 		cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
 	fi

--WIyZ46R2i8wDzkSu--
