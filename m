Received: from [17.148.16.95] (helo=asmtpout020.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MII6X-0002dF-2l
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 10:08:46 +0200
MIME-version: 1.0
Received: from [87.201.169.70] by asmtp020.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00IJXWSBAU80@asmtp020.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	21 Jun 2009 00:57:52 -0700 (PDT)
Message-id: <F69BF2F7-2158-4DA3-80D9-A2530B4BFB9A@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <F517AB64-1555-4988-BC93-B8A614C840D0@mac.com>
Date: Sun, 21 Jun 2009 11:57:31 +0400
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
	<77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
	<DAFBDF74-F5AF-4D06-87DB-1276AE4A3005@mac.com>
	<F517AB64-1555-4988-BC93-B8A614C840D0@mac.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 21 Jun 2009 08:08:46 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	I found out the reason for the linker error. It was quite silly  
actually. The lib prefix is automatically pre-pended, so I just had to  
specify

LDFLAGS_append += "-lserial"

Thats it!

Here is the full recipe for the test program. Could someone please  
comment on this recipe? Am I using the right OE functions, etc?


libserial-test_1.6.0.bb

DESCRIPTION = "Serial port test programs for libserial"
SECTION = "bin"
LICENSE = "GPL"
DEPENDS = "libserial"

LDFLAGS_append += "-lserial"

SRC_URI = " \
	file://read_port.cpp \
	file://write_port.cpp \
	"
	
S = "${WORKDIR}"

inherit autotools_stage
AUTOTOOLS_STAGE_PKGCONFIG = 1

do_stage() {
	autotools_stage_all
}

do_compile () {
#  oe_runmake CC="${CC}" CXX="${CXX}" CFLAGS="-O3 ${CFLAGS}"  
CXXFLAGS="${CXXFLAGS}" LD="${LD}" LDFLAGS="${LDFLAGS}
   ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/read_port.cpp -o libserial- 
test-read-port
   ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/write_port.cpp -o  
libserial-test-write-port
}

do_install () {
   install -m 0755 -d ${D}${bindir}
   install -m 0644 ${S}/libserial-test-read-port ${D}${bindir}
   install -m 0644 ${S}/libserial-test-write-port ${D}${bindir}
}


Best regards,

Elvis

