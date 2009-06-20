Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI7Ke-0000fr-TW
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 22:38:37 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00HLA0U7SQ40@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 13:27:48 -0700 (PDT)
Message-id: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Sun, 21 Jun 2009 00:27:27 +0400
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Writing a test program for libserial
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
X-List-Received-Date: Sat, 20 Jun 2009 20:38:37 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	What is the best way to write a test program recipe for libserial.  
I've taken the read_port.cpp file, and would like to package it as a  
separate recipe for testing purposes. Not that I'm going to submit  
this test recipe, its just for me to learn how to write a test recipe  
that uses an existing library.


DESCRIPTION = "Read serial port test program for libserial"
SECTION = "bin"
LICENSE = "GPL"
HOMEPAGE = ""
DEPENDS = "libserial"

#LDFLAGS_append += "-llibserial"
#CFLAGS_append  += "-I${STAGING_INCDIR}"

SRC_URI = "file://* "

S = "${WORKDIR}/${PN}-${PV}"

do_compile () {
    ${CC} ${CFLAGS} ${LDFLAGS} -o libserial-test-read-port read_port.cpp
}

do_install () {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/libserial-test-read-port ${D}${bindir}
}

FILES_${PN} = "${bindir}/libserial-test-read-port"

When I try to build the recipe, I get the following error:

ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libserial-test-read-port-1.6.0rc1-1.0-r0/temp/log.do_compile. 
31500)
| arm-angstrom-linux-gnueabi-gcc: read_port.cpp: No such file or  
directory


Where should I put my test program sources ? and how should I include  
it in the SRC_URI field? Currently it is in the same level as the test  
program recipe file.


Best regards,

Elvis


