Received: from [132.166.172.103] (helo=sainfoin.extra.cea.fr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gonzague.reydet@cea.fr>) id 1I7nja-00042h-RN
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 09:32:42 +0200
Received: from nephilia.intra.cea.fr (nephilia.intra.cea.fr [132.166.88.33])
	by sainfoin.extra.cea.fr (8.13.7/8.13.4/CEAnet-Internet.7.0) with ESMTP
	id l697R42q029188 for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2007 09:27:05 +0200 (MEST)
Received: from muguet2.intra.cea.fr (muguet2.intra.cea.fr [132.166.192.7])
	by nephilia.intra.cea.fr (8.13.8/8.13.8) with ESMTP id l697R4Rc012652
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2007 09:27:04 +0200 (envelope-from gonzague.reydet@cea.fr)
Received: from [132.166.133.116] (is003072.saclay.cea.fr [132.166.133.116])
	by muguet2.intra.cea.fr (8.13.8/8.13.8/CEAnet-Intranet-out-1.0) with
	ESMTP id l697R3QI005479
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2007 09:27:03 +0200
Message-ID: <4691E281.7060506@cea.fr>
Date: Mon, 09 Jul 2007 09:23:45 +0200
From: Gonzague Reydet <gonzague.reydet@cea.fr>
User-Agent: Icedove 1.5.0.12 (X11/20070607)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: perl-native-5.8.3-r0: task do_compile failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2007 07:32:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have an error when compiling the perl-native package:

make[1]: Entering directory 
`/home/gonzague/Wifibot/nylon-build-stable-1.0/tmp/work/perl-native-5.8.3-r0/perl-5.8.3/ext/IO' 

../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp  
-typemap ../../lib/ExtUtils/typemap  IO.xs > IO.xsc && mv IO.xsc IO.c
ccache gcc  -c   -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS 
-fno-strict-aliasing -I/usr/local/include -D_LARGEFILE_SOURCE 
-D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.21\" -DXS_VERSION=\"1.21\" 
-fpic "-I../.."   IO.c
IO.xs: In function 'XS_IO__Poll__poll':
IO.xs:239: error: invalid application of 'sizeof' to incomplete type 
'struct pollfd'
IO.xs:243: error: invalid use of undefined type 'struct pollfd'
IO.xs:243: error: dereferencing pointer to incomplete type
IO.xs:245: error: invalid use of undefined type 'struct pollfd'
IO.xs:245: error: dereferencing pointer to incomplete type
IO.xs:247: error: invalid use of undefined type 'struct pollfd'
IO.xs:247: error: dereferencing pointer to incomplete type
IO.xs:251: error: invalid use of undefined type 'struct pollfd'
IO.xs:251: error: dereferencing pointer to incomplete type
IO.xs:252: error: invalid use of undefined type 'struct pollfd'
IO.xs:252: error: dereferencing pointer to incomplete type
make[1]: *** [IO.o] Error 1
make[1]: Leaving directory 
`/home/gonzague/Wifibot/nylon-build-stable-1.0/tmp/work/perl-native-5.8.3-r0/perl-5.8.3/ext/IO' 


Does any body have any idea?

Regards,
Gonzague Reydet.


