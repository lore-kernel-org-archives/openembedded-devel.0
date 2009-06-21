Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MIEFr-0004CC-9O
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 06:02:07 +0200
MIME-version: 1.0
Received: from [87.201.169.70] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK009FCLD7JJ20@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 20:51:16 -0700 (PDT)
Message-id: <77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245531218.29153.296.camel@lenovo.internal.reciva.com>
Date: Sun, 21 Jun 2009 07:50:50 +0400
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sun, 21 Jun 2009 04:02:07 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Phil,
	
On Jun 21, 2009, at 12:53 AM, Phil Blundell wrote:

>
> SRC_URI = "file://read_port.cpp"
> S = "${WORKDIR}"
>

How can I get past the following errors:

ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libserial-test-read-port-1.6.0-1.0-r0/temp/log.do_compile.32715)
| /tmp/ccIFRDHR.o: In function  
`__static_initialization_and_destruction_0':
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/ 
include/c++/iostream:77: undefined reference to  
`std::ios_base::Init::Init()'
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/ 
include/c++/iostream:77: undefined reference to  
`std::ios_base::Init::~Init()'
| /tmp/ccIFRDHR.o: In function `basic_ios':
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/ 
include/c++/bits/basic_ios.h:456: undefined reference to  
`std::ios_base::ios_base()'
| /tmp/ccIFRDHR.o: In function `basic_istream':
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/ 
include/c++/istream:97: undefined reference to `std::basic_ios<char,  
std::char_traits<char> >::init(std::basic_streambuf<char,  
std::char_traits<char> >*)'
| /tmp/ccIFRDHR.o: In function `basic_ostream':
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/ 
include/c++/ostream:87: undefined reference to `std::basic_ios<char,  
std::char_traits<char> >::init(std::basic_streambuf<char,  
std::char_traits<char> >*)'


Best regards,

Elvis

