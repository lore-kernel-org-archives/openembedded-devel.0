Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MIIXh-00008Z-4O
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 10:36:49 +0200
MIME-version: 1.0
Received: from [87.201.169.70] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00CE3Y34ZG80@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	21 Jun 2009 01:25:57 -0700 (PDT)
Message-id: <08E9BB6D-02FB-4AE3-9E5E-0330A4FC4FF5@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <F69BF2F7-2158-4DA3-80D9-A2530B4BFB9A@mac.com>
Date: Sun, 21 Jun 2009 12:25:36 +0400
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
	<77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
	<DAFBDF74-F5AF-4D06-87DB-1276AE4A3005@mac.com>
	<F517AB64-1555-4988-BC93-B8A614C840D0@mac.com>
	<F69BF2F7-2158-4DA3-80D9-A2530B4BFB9A@mac.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Writing a test program for libserial
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
X-List-Received-Date: Sun, 21 Jun 2009 08:36:49 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	I've got the basic recipe working now, but would like to tidy it up,  
just to learn how to make good bitbake recipes.

Now, if I look at the folder /tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-test-1.6.0-r0,

I can see that the output files are located in three places:

a. directly in work/armv7a-angstrom-linux-gnueabi/libserial-test-1.6.0- 
r0/
	libserial-test-read-port
	libserial-test-write-port

b. armv7a-angstrom-linux-gnueabi/libserial-test-1.6.0-r0/image/usr/bin

c. armv7a-angstrom-linux-gnueabi/libserial-test-1.6.0-r0/install/ 
libserial-test/usr/bin


If I compare with the other recipes, I don't see the output files in  
the root folder of the work/recipe i.e. work/armv7a-angstrom-linux- 
gnueabi/libserial-test-1.6.0-r0/ doesn't contain the output files.

This is cause by my do_compile () code, i think

do_compile () {
    ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/src/read_port.cpp -o  
libserial-test-read-port
    ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/src/write_port.cpp -o  
libserial-test-write-port
}

What would the correct approach be for this case? I'm attaching the  
current version of my recipe below.

Best regards,

Elvis


File: libserial-test_1.6.0.bb

DESCRIPTION = "Serial port read & write test programs for libserial"
SECTION = "bin"
LICENSE = "GPL"
DEPENDS = "libserial"

LDFLAGS_append += "-lserial"

SRC_URI = " \
	file://src/read_port.cpp \
	file://src/write_port.cpp \
	"
	
S = "${WORKDIR}"

inherit autotools_stage
AUTOTOOLS_STAGE_PKGCONFIG = 1

do_stage() {
	autotools_stage_all
}

do_compile () {
    ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/src/read_port.cpp -o  
libserial-test-read-port
    ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/src/write_port.cpp -o  
libserial-test-write-port
}

do_install () {
    install -m 0755 -d ${D}${bindir}
    install -m 0644 ${S}/libserial-test-read-port ${D}${bindir}
    install -m 0644 ${S}/libserial-test-write-port ${D}${bindir}
}



