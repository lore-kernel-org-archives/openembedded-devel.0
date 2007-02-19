Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HJ7Aw-0006FZ-J8
	for openembedded-devel@openembedded.org; Mon, 19 Feb 2007 12:59:22 +0100
Received: (qmail 10759 invoked by uid 813007); 19 Feb 2007 11:59:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 19 Feb 2007 11:59:20 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Feb 2007 12:59:23 +0100
User-Agent: KMail/1.9.6
References: <45D98799.1080309@dominion.kabel.utwente.nl>
In-Reply-To: <45D98799.1080309@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200702191259.25200.openembedded@hrw.one.pl>
Subject: Re: RFC: splitting deploy/ipk into subarchs
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
X-List-Received-Date: Mon, 19 Feb 2007 11:59:22 -0000
X-Groupsio-MsgNum: 1412
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_dEZ2FbBRTpfn+kx"

--Boundary-00=_dEZ2FbBRTpfn+kx
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 19 lutego 2007, Koen Kooi napisa=B3:

> When using multimachine and ipkg deploy/ipk gets awfully crowded after
> a while. I want to propose sorting it by subarch. Attached is a patch
> that adds support for that to rootfs_ipk.bbclass.
>
> What do you think about that?

I like this idea. ipkg-make-index is slow enough already.

Attached fixed, tested version of your rootfs_ipk.bbclass change. Also=20
added patch to package_ipk.bbclass which will store package in proper=20
dir.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         Great minds discuss ideas; average minds discuss events;
         small minds discuss people.

--Boundary-00=_dEZ2FbBRTpfn+kx
Content-Type: text/x-diff;
  charset="iso-8859-2";
  name="build-rootfs-from-split-ipkdir.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="build-rootfs-from-split-ipkdir.diff"

# 
# old_revision [bc83c51286e87a2b8aa3f79f074cadc05dedb7de]
# 
# patch "classes/rootfs_ipk.bbclass"
#  from [7824b4ee6ac7524e12d7411575e8bbf4b8a9d321]
#    to [a30d56a031d7b85d13bb62d4956e77252a4b79fa]
# 
============================================================
--- classes/rootfs_ipk.bbclass	7824b4ee6ac7524e12d7411575e8bbf4b8a9d321
+++ classes/rootfs_ipk.bbclass	a30d56a031d7b85d13bb62d4956e77252a4b79fa
@@ -18,17 +18,25 @@ fakeroot rootfs_ipk_do_rootfs () {
 		
 	mkdir -p ${IMAGE_ROOTFS}/dev
 
-	if [ -z "${DEPLOY_KEEP_PACKAGES}" ]; then
-		touch ${DEPLOY_DIR_IPK}/Packages
-		ipkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m ${DEPLOY_DIR_IPK}
-	fi
+	ipkgarchs="${PACKAGE_ARCHS}"
+
+	for arch in $ipkgarchs; do
+		if [ -z "${DEPLOY_KEEP_PACKAGES}" ]; then
+			if [ -e ${DEPLOY_DIR_IPK}/$arch/ ] ; then 
+				touch ${DEPLOY_DIR_IPK}/$arch/Packages
+				ipkg-make-index -r ${DEPLOY_DIR_IPK}/$arch/Packages -p ${DEPLOY_DIR_IPK}/$arch/Packages -l ${DEPLOY_DIR_IPK}/$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/$arch/
+			fi
+		fi
+	done
+
 	mkdir -p ${T}
-	echo "src oe file:${DEPLOY_DIR_IPK}" > ${T}/ipkg.conf
-	ipkgarchs="${PACKAGE_ARCHS}"
 	priority=1
 	for arch in $ipkgarchs; do
 		echo "arch $arch $priority" >> ${T}/ipkg.conf
 		priority=$(expr $priority + 5)
+		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
+		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${T}/ipkg.conf
+	    fi
 	done
 	ipkg-cl ${IPKG_ARGS} update
 	if [ ! -z "${LINGUAS_INSTALL}" ]; then

--Boundary-00=_dEZ2FbBRTpfn+kx
Content-Type: text/x-diff;
  charset="iso-8859-2";
  name="store-package-in-proper-ipkdir.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="store-package-in-proper-ipkdir.diff"

# 
# old_revision [bc83c51286e87a2b8aa3f79f074cadc05dedb7de]
# 
# patch "classes/package_ipk.bbclass"
#  from [6f5d44fb7cf065ce7b680009e5c9bcb554f760c4]
#    to [57535d540caec17311adeb1e15f49d290d6cc8ac]
# 
============================================================
--- classes/package_ipk.bbclass	6f5d44fb7cf065ce7b680009e5c9bcb554f760c4
+++ classes/package_ipk.bbclass	57535d540caec17311adeb1e15f49d290d6cc8ac
@@ -75,6 +75,9 @@ python do_package_ipk () {
 	if not outdir:
 		bb.error("DEPLOY_DIR_IPK not defined, unable to package")
 		return
+
+	arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
+	outdir = "%s/%s" % (outdir, arch)
 	bb.mkdirhier(outdir)
 
 	dvar = bb.data.getVar('D', d, 1)

--Boundary-00=_dEZ2FbBRTpfn+kx--
