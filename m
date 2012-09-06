Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9fFM-0006MY-M0
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:48:04 +0200
Received: from localhost ([127.0.0.1]:45419 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9f3M-000655-Aa
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 16:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=A2qUHL2MzWtQ3VGU3DkjpMtNI6M=; b=uJGQ/prtcBj79LayOjjMXfEhpbtO
	Yof5XVgeGgjvh+xO0+FrloMqrHwjDUx7mRDljwG7+tGmmdPChHHV2Yp4OgutzZGN
	70hMTt4UZDg1tz/QM7mzCPJCiccanZ1wk2WnQotoCCUkM8rvhMgbveYzIv6tIzjL
	lrUnM17gv2OeePU=
Received: from [195.171.99.130] (port=57457 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9f3M-000651-8Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 16:35:40 +0000
Message-ID: <5048D11C.9050108@communistcode.co.uk>
Date: Thu, 06 Sep 2012 17:36:44 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
	<1346944624.2673.200.camel@phil-desktop>
	<5048BF04.2000904@communistcode.co.uk>
	<5048C7D5.70301@communistcode.co.uk>
	<1346947708.2673.201.camel@phil-desktop>
	<5048CC32.30705@communistcode.co.uk>
	<1346948364.2673.203.camel@phil-desktop>
In-Reply-To: <1346948364.2673.203.camel@phil-desktop>
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 16:48:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/12 17:19, Phil Blundell wrote:
> On Thu, 2012-09-06 at 17:15 +0100, Jack Mitchell wrote:
>>      do_compile() {
>>         oe_runmake LD="${CXX}"
>>
>>         ${CXX} -fpic -shared -o lib${PN}.so.0.${PV} \
>>           -Wl,-soname,lib${PN}.so.0 $(ls *.o | grep -v xmltest)
> You need to get -fpic into ${CXXFLAGS} and/or ${CFLAGS} so that it's
> used to build the individual objects as well.
>
>>      FILES_${PN} = "libtinyxml.so.0.${PV}}"
> That should be ${libdir}/lib${PN}.so.0, with fewer }s on the end.  The
> name of the file you ship needs to match the soname that you give it, or
> at least be symlinked to that name.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Right, I've almost got the little swine.

DESCRIPTION = "A simple, small, C++ XML parser that can be easily 
integrated into other programs"

LICENSE = "zlib"
LIC_FILES_CHKSUM = 
"file://tinyxml.cpp;endline=23;md5=b97285d8fafcc49b761ca785816cc397"

SRC_URI = 
"http://ftp.debian.org/debian/pool/main/t/tinyxml/${PN}_${PV}.orig.tar.gz"

SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
SRC_URI[sha256sum] = 
"15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"

S = "${WORKDIR}/tinyxml"

TINYXML_USE_STL = "YES"

do_compile() {
   oe_runmake LD="${CXX}"

   ${CXX} -fpic -shared -o lib${PN}.so.0.${PV} \
     -Wl,-soname,lib${PN}.so.0 $(ls *.o | grep -v xmltest)

}

do_install() {

   install -d -m 0755 ${D}/usr/{lib,include}
   install -m 0755 lib${PN}.so.0.${PV} ${D}${libdir}
   install -m 0644 ${PN}.h tinystr.h ${D}${includedir}

   (cd ${D}/usr/lib
     ln -s lib${PN}.so.0.${PV} lib${PN}.so.0
     ln -s lib${PN}.so.0.${PV} lib${PN}.so
   )

}

FILES_${PN}-dbg = "/usr/src/debug \
                    ${libdir}/.debug \
"


[jack@archHP packages-split]$ tree
.
|-- tinyxml
|   `-- usr
|       `-- lib
|           |-- libtinyxml.so.0 -> libtinyxml.so.0.2.6.2
|           `-- libtinyxml.so.0.2.6.2
|-- tinyxml-dbg
|   `-- usr
|       |-- lib
|       `-- src
|           `-- debug
|               `-- tinyxml-2.6.2-r0
|                   `-- tinyxml
|                       |-- tinystr.cpp
|                       |-- tinystr.h
|                       |-- tinyxml.cpp
|                       |-- tinyxmlerror.cpp
|                       |-- tinyxml.h
|                       `-- tinyxmlparser.cpp
|-- tinyxml-dev
|   `-- usr
|       |-- include
|       |   |-- tinystr.h
|       |   `-- tinyxml.h
|       `-- lib
|           `-- libtinyxml.so -> libtinyxml.so.0.2.6.2
|-- tinyxml-doc
|-- tinyxml-locale
|-- tinyxml.shlibdeps
`-- tinyxml-staticdev

17 directories, 12 files

One last thing though, should the libtinyxml.so be in the -dbg package?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



