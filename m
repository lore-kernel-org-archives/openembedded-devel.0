Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MIK6R-0007m1-UJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 12:16:48 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MIJvw-000862-7B
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 11:05:56 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <08E9BB6D-02FB-4AE3-9E5E-0330A4FC4FF5@mac.com>
References: <7DD56667-6DAE-4017-B636-C82258C4E15F@mac.com>
	<1245531218.29153.296.camel@lenovo.internal.reciva.com>
	<77001CAF-4335-4154-8721-C71AF237BFF3@mac.com>
	<DAFBDF74-F5AF-4D06-87DB-1276AE4A3005@mac.com>
	<F517AB64-1555-4988-BC93-B8A614C840D0@mac.com>
	<F69BF2F7-2158-4DA3-80D9-A2530B4BFB9A@mac.com>
	<08E9BB6D-02FB-4AE3-9E5E-0330A4FC4FF5@mac.com>
Date: Sun, 21 Jun 2009 11:05:52 +0100
Message-Id: <1245578752.29153.330.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Sun, 21 Jun 2009 10:16:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-21 at 12:25 +0400, Elvis Dowson wrote:
> If I compare with the other recipes, I don't see the output files in  
> the root folder of the work/recipe i.e. work/armv7a-angstrom-linux- 
> gnueabi/libserial-test-1.6.0-r0/ doesn't contain the output files.

That's just caused by the layout of your source code (loose files in
SRC_URI rather than a tarball).  It isn't anything to worry about.

> This is cause by my do_compile () code, i think
> 
> do_compile () {
>     ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/src/read_port.cpp -o  
> libserial-test-read-port
>     ${CXX} ${CXXFLAGS} ${LDFLAGS} ${WORKDIR}/src/write_port.cpp -o  
> libserial-test-write-port
> }

If you wanted to, you could change this to "-o
src/libserial-test-write-port" to make the binaries go into the src/
subfolder.  Of course, then you'd need to adjust your do_install()
method to look for them there rather than in ${WORKDIR}.  Personally I
wouldn't bother: it's fine as it stands.

Also, just as an aside, you don't need to specify the full path to the
source files (i.e. starting with ${WORKDIR}).  The do_compile() method
runs with ${S} as the current directory so you can just refer to them
with relative pathnames if you want.

> inherit autotools_stage
> AUTOTOOLS_STAGE_PKGCONFIG = 1
> 
> do_stage() {
> 	autotools_stage_all
> }

These lines are unnecessary: your recipe doesn't have anything to stage
and, even if it did, it isn't using autotools so these lines wouldn't
help.  You might as well delete them.

p.




