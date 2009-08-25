Received: from [203.97.33.64] (helo=smtp3.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1MfoDV-0000oL-MC
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 07:05:10 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp3.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KOX009A11AA3810@smtp3.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Tue,
	25 Aug 2009 16:46:59 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id B97C75CE258	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 16:46:58 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id CzBobHfjY9r7	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 16:46:58 +1200 (NZST)
Received: from [192.168.1.129] (unknown [192.168.1.129])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 4EC5D5CE153	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 16:46:58 +1200 (NZST)
Date: Tue, 25 Aug 2009 16:46:56 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
To: openembedded dev <openembedded-devel@lists.openembedded.org>
Message-id: <4A936CC0.70409@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
X-Spam-Flag: NO
X-Spam-Score: -1.302
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-Spam-Status: No, score=-1.302 tagged_above=-99 required=5
	tests=[ALL_TRUSTED=-1.44, AWL=0.138]
X-Spam-Level: 
Subject: CMake and Qt4
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
X-List-Received-Date: Tue, 25 Aug 2009 05:05:11 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit

Hi,

The FindQt4.cmake distributed with cmake (for some time now) is unable 
to find the libs installed by qt4e (I haven't tried qt4x11).
This is because the libs installed by openembedded use an unusual naming 
convention that isnt known in FindQt4.cmake.

The below patch fixes the problem.

~Matt


diff -rNuap cmake-a/Modules/FindQt4.cmake cmake-b/Modules/FindQt4.cmake
--- cmake-a/Modules/FindQt4.cmake       2009-02-22 09:36:50.000000000 +1300
+++ cmake-b/Modules/FindQt4.cmake       2009-08-25 16:24:25.560194623 +1200
@@ -642,7 +642,7 @@ IF (QT4_QMAKE_FOUND)
     FOREACH(QT_MODULE ${QT_MODULES})
       STRING(TOUPPER ${QT_MODULE} _upper_qt_module)
       FIND_LIBRARY(QT_${_upper_qt_module}_LIBRARY_RELEASE
-                 NAMES ${QT_MODULE} ${QT_MODULE}4
+                 NAMES ${QT_MODULE} ${QT_MODULE}E ${QT_MODULE}4
                    PATHS ${QT_LIBRARY_DIR} NO_DEFAULT_PATH
           )
       FIND_LIBRARY(QT_${_upper_qt_module}_LIBRARY_DEBUG




