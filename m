Received: from [17.148.16.97] (helo=asmtpout022.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MIEzM-0001uX-EC
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 06:49:08 +0200
MIME-version: 1.0
Received: from [87.201.169.70] by asmtp022.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00L8ONJIST20@asmtp022.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 21:38:17 -0700 (PDT)
Message-id: <DAFBDF74-F5AF-4D06-87DB-1276AE4A3005@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
Date: Sun, 21 Jun 2009 08:37:40 +0400
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
	<77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
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
X-List-Received-Date: Sun, 21 Jun 2009 04:49:09 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	Here is what my test program recipe looks like.

I have the following files In the user.collection/recipes/libserial- 
test folder:

libserial-test-1.6.0.bb
read_port.cpp
write_port.cpp

I get some compilation failures related to iostream not being  
included. How can I fix this?

ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libserial-test-read-port-1.6.0-1.0-r0/temp/log.do_compile.2442)
| /tmp/ccisTInQ.o: In function  
`__static_initialization_and_destruction_0':
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/ 
include/c++/iostream:77: undefined reference to  
`std::ios_base::Init::Init()'
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/ 
include/c++/iostream:77: undefined reference to  
`std::ios_base::Init::~Init()'

The read_port and write_port.cpp files require the following headers

#include <SerialStream.h>
#include <iostream>
#include <fstream>
#include <cstdlib>

I have included a copy of my files below, if someone could help teach  
me how to write this recipe, it would be great!

I checked the OE HelloWorld tutorial already, but it didn't cover how  
to fix these issues.

Best regards,

Elvis

libserial-test-1.6.0.bb

DESCRIPTION = "Serial port test programs for libserial"
SECTION = "bin"
LICENSE = "GPL"
DEPENDS = "libserial"

#LDFLAGS_append += "-llibserial"
#CFLAGS += "-I. -include -L${STAGING_LIBDIR}"

SRC_URI = "file://*"

S = "${WORKDIR}"

inherit autotools_stage
AUTOTOOLS_STAGE_PKGCONFIG = 1

do_stage() {
	autotools_stage_all
}

do_compile () {
    ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/read_port.cpp -o libserial- 
test-read-port
    ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/write_port.cpp -o libserial- 
test-write-port
}

do_install () {
    install -m 0755 -d ${D}${bindir}
    install -m 0644 ${S}/libserial-test-read-port ${D}${bindir}
    install -m 0644 ${S}/libserial-test-write-port ${D}${bindir}
}

FILES_${PN} = "${bindir}/libserial-test-read-port"
FILES_${PN} = "${bindir}/libserial-test-write-port"

read_port.cpp


#include <SerialStream.h>
#include <iostream>
#include <unistd.h>
#include <cstdlib>

int
main( int    argc,
       char** argv  )
{
     //
     // Open the serial port.
     //
     using namespace LibSerial ;
     SerialStream serial_port ;
     serial_port.Open( "/dev/ttyUSB0" ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "[" << __FILE__ << ":" << __LINE__ << "] "
                   << "Error: Could not open serial port."
                   << std::endl ;
         exit(1) ;
     }
     //
     // Set the baud rate of the serial port.
     //
     serial_port.SetBaudRate( SerialStreamBuf::BAUD_115200 ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not set the baud rate." <<  
std::endl ;
         exit(1) ;
     }
     //
     // Set the number of data bits.
     //
     serial_port.SetCharSize( SerialStreamBuf::CHAR_SIZE_8 ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not set the character size." <<  
std::endl ;
         exit(1) ;
     }
     //
     // Disable parity.
     //
     serial_port.SetParity( SerialStreamBuf::PARITY_NONE ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not disable the parity." <<  
std::endl ;
         exit(1) ;
     }
     //
     // Set the number of stop bits.
     //
     serial_port.SetNumOfStopBits( 1 ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not set the number of stop bits."
                   << std::endl ;
         exit(1) ;
     }
     //
     // Turn off hardware flow control.
     //
     serial_port.SetFlowControl( SerialStreamBuf::FLOW_CONTROL_NONE ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not use hardware flow control."
                   << std::endl ;
         exit(1) ;
     }
     //
     // Do not skip whitespace characters while reading from the
     // serial port.
     //
     // serial_port.unsetf( std::ios_base::skipws ) ;
     //
     // Wait for some data to be available at the serial port.
     //
     while( serial_port.rdbuf()->in_avail() == 0 )
     {
         usleep(100) ;
     }
     //
     // Keep reading data from serial port and print it to the screen.
     //
     while( serial_port.rdbuf()->in_avail() > 0  )
     {
         char next_byte;
         serial_port.get(next_byte);
         std::cerr << std::hex << static_cast<int>(next_byte) << " ";
         usleep(100) ;
     }
     std::cerr << std::endl ;
     return EXIT_SUCCESS ;
}


write_port.cpp

#include <SerialStream.h>
#include <iostream>
#include <fstream>
#include <cstdlib>

//
// This example reads the contents of a file and writes the entire
// file to the serial port one character at a time.
//
int
main( int    argc,
       char** argv  )
{
     //
     if ( argc < 2 )
     {
         std::cerr << "Usage: " << argv[0] << " <filename>" <<  
std::endl ;
         return 1 ;
     }
     //
     // Open the serial port.
     //
     const char* const SERIAL_PORT_DEVICE = "/dev/ttyUSB0" ;
     using namespace LibSerial ;
     SerialStream serial_port ;
     serial_port.Open( SERIAL_PORT_DEVICE ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not open serial port "
                   << SERIAL_PORT_DEVICE
                   << std::endl ;
         exit(1) ;
     }
     //
     // Set the baud rate of the serial port.
     //
     serial_port.SetBaudRate( SerialStreamBuf::BAUD_115200 ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not set the baud rate." <<  
std::endl ;
         exit(1) ;
     }
     //
     // Set the number of data bits.
     //
     serial_port.SetCharSize( SerialStreamBuf::CHAR_SIZE_8 ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not set the character size." <<  
std::endl ;
         exit(1) ;
     }
     //
     // Disable parity.
     //
     serial_port.SetParity( SerialStreamBuf::PARITY_NONE ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not disable the parity." <<  
std::endl ;
         exit(1) ;
     }
     //
     // Set the number of stop bits.
     //
     serial_port.SetNumOfStopBits( 1 ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not set the number of stop bits."
                   << std::endl ;
         exit(1) ;
     }
     //
     // Turn on hardware flow control.
     //
     serial_port.SetFlowControl( SerialStreamBuf::FLOW_CONTROL_NONE ) ;
     if ( ! serial_port.good() )
     {
         std::cerr << "Error: Could not use hardware flow control."
                   << std::endl ;
         exit(1) ;
     }
     //
     // Do not skip whitespace characters while reading from the
     // serial port.
     //
     // serial_port.unsetf( std::ios_base::skipws ) ;
     //
     // Open the input file for reading.
     //
     std::ifstream input_file( argv[1] ) ;
     if ( ! input_file.good() )
     {
         std::cerr << "Error: Could not open file "
                   << argv[1] << " for reading." << std::endl ;
         return 1 ;
     }
     //
     // Read characters from the input file and dump them to the serial
     // port.
     //
     std::cerr << "Dumping file to serial port." << std::endl ;
     while( input_file )
     {
         char next_byte ;
         input_file.read( &next_byte, 1 ) ;
         serial_port.write( &next_byte, 1 ) ;
         //
         // Print a '.' for every character read from the input file.
         //
         std::cerr << "." ;
     }
     std::cerr << std::endl ;
     std::cerr << "Done." << std::endl ;
     return EXIT_SUCCESS ;
}

