Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GwJfU-00077V-Bw
	for openembedded-devel@openembedded.org; Mon, 18 Dec 2006 15:40:40 +0100
Received: (qmail 30552 invoked by uid 813007); 18 Dec 2006 14:38:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 18 Dec 2006 14:38:29 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@openembedded.org
Date: Mon, 18 Dec 2006 15:38:26 +0100
User-Agent: KMail/1.9.5
Organization: OpenEmbedded
MIME-Version: 1.0
Message-Id: <200612181538.26399.openembedded@hrw.one.pl>
Subject: Self hosted build of OE
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
X-List-Received-Date: Mon, 18 Dec 2006 14:40:40 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

During weekend I was working on getting self hosted build of OpenEmbedded. 
I built Angstrom-2007.1 for progear and chrooted into resulting image. 
Then installed some packages, copied OE metadata, archives for SRC_URI and 
finished 'bitbake nano' build.

Some packages was needed to be installed - I added them into new task 
named 'task-self-hosting' which should contain everything needed to get 
self hosted build running.

But there are some problems:

1. glibc-utils/rpcgen require 'cpp'

This can be solved by adding RDEPENDS_glibc-utils = "cpp" into glibc.bb 
recipe. But this is theory because we need 'glibc' to build 'gcc' so 
dependency chain is result.

2. glibc-dev 'conflict' libc-linux-headers-dev 

Few headers exists in both packages - I do not know which one are more 
important. In my build I forced glibc-dev ones.

3. binutils-symlinks 'conflict' busybox (and elfutils)

#1465 has details

4. subversion has problems with building - I need to check do I have some 
not-yet-commited patches for apr(-util) and subversion.

5. Perl is too granulated - I installed all 861 perl packages to get 
quilt-native happy instead of checking which are needed.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

       We're here to give you a computer, not a religion.
       		-- Bob Pariseau, at the introduction of the Amiga




