Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9eyQ-00062o-H6
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:30:34 +0200
Received: from localhost ([127.0.0.1]:37669 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9emQ-0005Pi-6U
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 16:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=iI3EczGJJQLt9FjKjeSNQioZGpo=; b=hL1tis7wWbKjwKs54rnS82mnxgZN
	sMw/hcX1RoAlrp6WgiXuL3w2BTHHtqkvjCbT3i8zLoXWMtVFK0YYHdEQ2DV5n9z6
	h+kyHUsgKB7ZWToCHSlCTk3HYr6E2d2AGfOI3Tw5x0sQ7yww5XDQP0MHm2Kb/kh5
	l78URJRNTScC97E=
Received: from [195.171.99.130] (port=14538 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9emQ-0005Pf-25
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 16:18:10 +0000
Message-ID: <5048CD03.6040309@communistcode.co.uk>
Date: Thu, 06 Sep 2012 17:19:15 +0100
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
In-Reply-To: <5048CC32.30705@communistcode.co.uk>
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
X-List-Received-Date: Thu, 06 Sep 2012 16:30:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/12 17:15, Jack Mitchell wrote:
> On 06/09/12 17:08, Phil Blundell wrote:
>> On Thu, 2012-09-06 at 16:57 +0100, Jack Mitchell wrote:
>>> I take this back, It built correctly but it seems the makefile doesn't
>>> build the shared library to link against?!
>>>
>>> The Archlinux package has something similar to:
>>>
>>>     ${CXX} -shared -o lib${PN}.so.0.${PV} \
>>>       -Wl,-soname,lib${PN}.so.0 $(ls *.o | grep -v xmltest)
>>>
>>> Which seems to collect all the objects and link them together into a
>>> shared object? Is there anywhere else in OE we do this so I could see
>>> how it is formally done?
>> Yeah, pretty much that.  If you're going to make it into a DSO then you
>> also need to make sure that all the objects are compiled -fpic.
>>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> Ok, so this is where I am at:
>
>    DESCRIPTION = "A simple, small, C++ XML parser that can be easily
>    integrated into other programs"
>
>    LICENSE = "zlib"
>    LIC_FILES_CHKSUM =
> "file://tinyxml.cpp;endline=23;md5=b97285d8fafcc49b761ca785816cc397"
>
>    SRC_URI =
> "http://ftp.debian.org/debian/pool/main/t/tinyxml/${PN}_${PV}.orig.tar.gz"
>
>    SRC_URI[md5sum] = "c1b864c96804a10526540c664ade67f0"
>    SRC_URI[sha256sum] =
> "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
>
>    S = "${WORKDIR}/tinyxml"
>
>    TINYXML_USE_STL = "YES"
>
>    do_compile() {
>       oe_runmake LD="${CXX}"
>
>       ${CXX} -fpic -shared -o lib${PN}.so.0.${PV} \
>         -Wl,-soname,lib${PN}.so.0 $(ls *.o | grep -v xmltest)
>
>    }
>
>    FILES_${PN} = "libtinyxml.so.0.${PV}}"
>
>
> However, libtinyxml.so.0.${PV} doesn't get packaged, even though it is 
> listed in the {S} directory. Am I missing something with the FILES_${PN}?
>

And it's not the double curly braces typo in FILES_${PN}. ; )

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



