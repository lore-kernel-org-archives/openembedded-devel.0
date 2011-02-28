Received: from rrcs-24-227-36-211.se.biz.rr.com ([24.227.36.211]
	helo=mail.eoimaging.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nharris@eoimaging.com>) id 1Pu41T-0004AN-Kl
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 15:24:28 +0100
Received: from [192.168.0.194] ([::ffff:192.168.0.194]) (AUTH: LOGIN nharris)
	by mail.eoimaging.com with esmtp; Mon, 28 Feb 2011 09:17:55 -0500
	id 0020864D.4D6BAE93.0000378F
Message-ID: <4D6BAE92.1080409@eoimaging.com>
Date: Mon, 28 Feb 2011 09:17:54 -0500
From: Nathan Harris <nharris@eoimaging.com>
Organization: Electro-Optical Imaging, Inc.
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: QA issues with libvmime
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
X-List-Received-Date: Mon, 28 Feb 2011 14:24:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am working on a recipe for the VMime library (http://www.vmime.org/).  
My target environment is the Overo (Gumstix).  Currently, bitbake is 
failing during the final QA.  My recipe, patch and bitbake output are 
below.  Hopefully, this error is familiar to someone.  Thanks!

Here's my recipe:

DESCRIPTION = "VMime is a free mail library for C++"
HOMEPAGE = "http://www.vmime.org/"
DEPENDS = "libgsasl gnutls"
PR = "r1"

SRC_URI = "${SOURCEFORGE_MIRROR}/vmime/${PN}-${PV}.tar.bz2"
SRC_URI[md5sum] = "d5b6de44f7f9ca0e4cefe597d1905605"
SRC_URI[sha256sum] = 
"3b66cb76d9bc7da80ef1f271cc29d3a183b5ff8b560ef60e85ff006bffb4d1ae"

SRC_URI += "file://sendmail_disable.patch"

# Older internal Libtool doesn't work
EXTRA_OEMAKE += "LIBTOOL='${HOST_SYS}-libtool'"

#S = ${WORKDIR}/${PN}-${PV}
#EXTRA_OECONF = "--disable-largefile --disable-rpath 
--with-included-readline=no 
--with-libgsasl-prefix=${STAGING_DIR}/${HOST_SYS} --with-gnutls-prefix=$
{STAGING_DIR}/${HOST_SYS}"

inherit scons

Here's my patch which disables sendmail from the build:

--- libvmime-0.9.1/SConstruct.orig      2011-02-24 15:46:44.185617415 -0500
+++ libvmime-0.9.1/SConstruct   2011-02-24 15:38:51.249617495 -0500
@@ -691,7 +691,7 @@
                         Exit(1)

  # Sendmail transport is only available on POSIX platforms
-if os.name != 'posix':
+if os.name == 'posix':
         if IsProtocolSupported(messaging_protocols, 'sendmail'):
                 print "WARNING: ignoring 'sendmail' support (only 
available on POSIX platforms)\n"


Here's the bitbake error:

NOTE: package libvmime-0.9.1-r1: task do_qa_staging: Started
ERROR: QA Issue with staging: vmime.pc failed sanity test (tmpdir) in 
path 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
FATAL: QA staging was broken by the package built above
ERROR: Error in executing python function in: 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Function do_qa_staging failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb 
do_qa_staging failed
ERROR: QA Issue with staging: vmime.pc failed sanity test (tmpdir) in 
path 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
ERROR: Task 4 
(/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_qa_staging) failed with 256
ERROR: 
'/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb' 
failed
FATAL: QA staging was broken by the package built above
ERROR: 
'/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb' 
failed



