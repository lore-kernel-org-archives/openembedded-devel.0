Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OZYTZ-00049u-Ef
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 02:08:26 +0200
Received: by pxi12 with SMTP id 12so796027pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 17:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=5QU4yZ+YwPmXY2DavZ5MUrQ5DSdDX7MLPWQOqH28I2Q=;
	b=cNaSAd+nmlKzo32cB6Olhew/AYWSuJxSHQgXyHOonBMUyXY56JfcMFw47f2Zqhab3v
	wFTX9Mp3jtF5utEqqyfXJsq6NIMs44eoWTw9PdaaWJNJSpGlze3ibpL6vauuiEHgfFcz
	GhxhAtgDOceFDTXSlEYFnmrm6i+Nb6sTokjZw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=CXYlsrJjaspSA9XU4+eXxpUPO3ITTxjgRk/m9jFQC9QRr3airCiEHfXEjiC1yPRVkc
	/WUBwSs4zQ6lAGhrYHDlG/eTqKs4+2RePqhlc43yW7k9ld5F4G5Z5lCvXohXVZD7xxnw
	Nuh9c8XBd4L0Td1IdXKlhxWn4rpAgiibPbqg0=
Received: by 10.114.131.13 with SMTP id e13mr283684wad.201.1279238899576;
	Thu, 15 Jul 2010 17:08:19 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	c15sm12468638rvi.11.2010.07.15.17.08.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 17:08:18 -0700 (PDT)
Message-ID: <4C3FA2D7.6020006@gmail.com>
Date: Fri, 16 Jul 2010 09:37:51 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lsof_4.83.bb: Make recipe buildable again.
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
X-List-Received-Date: Fri, 16 Jul 2010 00:08:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Breakage introduced by 74e32f114272668dfa4c88805741cf55ef965989.
Other recipes which call base_do_unpack directly do not share this issue.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/lsof/lsof_4.83.bb |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/recipes/lsof/lsof_4.83.bb b/recipes/lsof/lsof_4.83.bb
index d74c574..0a5d557 100644
--- a/recipes/lsof/lsof_4.83.bb
+++ b/recipes/lsof/lsof_4.83.bb
@@ -9,17 +9,14 @@ SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2;nam
 SRC_URI[lsof483tarbz2.md5sum] = "8f731a6251b8c0143d585df0d5ca779e"
 SRC_URI[lsof483tarbz2.sha256sum] = "b89f930bbe36b970e3cd070b9860ee701d8c7285ffedf2fbcec0e5fa3cb1f544"
 
-LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
+LOCALSRC = "${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
 
-# the tar.bz2 file contains another tar, cde below unpacks it
-python do_unpack () {
-	bb.build.exec_func('base_do_unpack', d)
-	src_uri = bb.data.getVar('SRC_URI', d)
-	bb.data.setVar('SRC_URI', '${LOCALSRC}', d)
-	bb.build.exec_func('base_do_unpack', d)
-	bb.data.setVar('SRC_URI', src_uri, d)
+# The tar.bz2 file contains another tar.
+do_unpackpost() {
+	tar x --no-same-owner -f ${LOCALSRC} -C ${WORKDIR}
 }
+addtask do_unpackpost before do_patch after do_unpack
 
 export LSOF_OS = "${TARGET_OS}"
 LSOF_OS_linux-uclibc = "linux"
-- 
1.7.1



