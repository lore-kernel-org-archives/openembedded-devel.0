Received: from [17.148.16.97] (helo=asmtpout022.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MIH8D-0003K3-V5
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 09:06:26 +0200
MIME-version: 1.0
Received: from [87.201.169.70] by asmtp022.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK001L6TWIAL80@asmtp022.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 23:55:34 -0700 (PDT)
Message-id: <F517AB64-1555-4988-BC93-B8A614C840D0@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <DAFBDF74-F5AF-4D06-87DB-1276AE4A3005@mac.com>
Date: Sun, 21 Jun 2009 10:55:14 +0400
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
	<77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
	<DAFBDF74-F5AF-4D06-87DB-1276AE4A3005@mac.com>
X-Mailer: Apple Mail (2.935.3)
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
X-List-Received-Date: Sun, 21 Jun 2009 07:06:26 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I noticed that the error that I'm getting is a linker error:

| /tmp/cch3Qpaj.o:(.rodata._ZTIN9LibSerial12SerialStreamE[typeinfo for  
LibSerial::SerialStream]+0x8): undefined reference to `typeinfo for  
std::basic_iostream<char, std::char_traits<char> >'
| collect2: ld returned 1 exit status

I also notice that libserial is called LibSerial::SerialStream. But my  
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib folder, I  
have the files as:

libserial.a
libserial.la
libserial.so

In my bitbake recipe, I have specified

LDFLAGS_append += "-llibserial"

and in my

do_compile () {
    ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/read_port.cpp -o  
libserial-test-read-port
}


So, shouldn't it be picking up libserial from the LDFLAGS?

Best regards,

Elvis




