Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GH0Mk-0002YH-8Y for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 17:46:34 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 3EAE34014D2; Sat, 26 Aug 2006 08:25:28 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826152528.3EAE34014D2@tinman.treke.net>
Date: Sat, 26 Aug 2006 08:25:28 -0700 (PDT)
Subject: [Bug 1363] New: konqueror-embedded_20030705 fails in configure stage (no qte library found)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Aug 2006 15:46:34 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1363

           Summary: konqueror-embedded_20030705 fails in configure stage (no
                    qte library found)
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: manuel.teira@telefonica.net
         QAContact: tinderbox-oe@gmx.net


Running:

bitbake -b
../org.openembedded.dev/packages/konqueror/konqueror-embedded_20030705.bb

Fails with message:
...
| checking for libjpeg6b... no
| checking for libjpeg... -ljpeg
| checking for Qt... configure: error: Qt (>= Qt 2.2.2) (library qte) not
found. Please check your installation!
| For more details about this problem, look at the end of config.log.
| FATAL: oe_runconf failed

It seems that the library to be linked should be libqte-mt. I workarrounded it
with the following patch:

--- org.openembedded.dev/packages/konqueror/konqueror-embedded_20030705.bb     
2006-08-03 13:38:14.000000000 +0200
+++ konqueror-embedded_20030705.bb      2006-08-26 17:42:21.000000000 +0200
@@ -39,7 +39,7 @@
                 --with-extra-includes=${STAGING_INCDIR}
--with-extra-libs=${STAGING_LIBDIR}     \
                 --with-ssl-version=0.9.7c --with-ssl-dir=${STAGING_LIBDIR}/.. 
                 \
                 --with-qt-dir=${QTDIR} --with-qtopia-dir=${OPIEDIR}           
                 \
-               --enable-libsuffix=""                                          
                '
+               --enable-threading --enable-mt --enable-libsuffix=""           
                '

 CXXFLAGS += "-DOPIE_NO_ERASE_RECT_HACKFIX -DOPIE_NEW_MALLOC"


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


