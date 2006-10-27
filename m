Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GdU9s-0006FR-Vy
	for openembedded-devel@openembedded.org; Fri, 27 Oct 2006 18:02:13 +0200
Received: (qmail 24269 invoked by uid 813007); 27 Oct 2006 16:01:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 27 Oct 2006 16:01:53 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Oct 2006 18:01:51 +0200
User-Agent: KMail/1.9.5
MIME-Version: 1.0
X-UID: 21
Organization: OpenEmbedded
Message-Id: <200610271801.52172.openembedded@hrw.one.pl>
Subject: RFC: More granular libraries packaging
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
X-List-Received-Date: Fri, 27 Oct 2006 16:02:13 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit


One of our strong points is granular packaging. We have extra packages for 
locales, documentation, development stuff etc. But we can improve it a bit 
more.

Many packages has multiple libraries in package. Not everytime it is 
useful - for example libusb had dependency on libstdc++ just because it 
had libusbpp in same package as libusb.

My proposition is - let split each library to separate package. This will 
enlarge feeds (so ipkg will get hurt more ;( but in some situations can 
give us smaller rootfs.

Probably best solution to get this done will be some extra code in 
package_ipk.bbclass.

Example of package to 'fix' is obexftp:

NOTE: Multiple libraries (libbfb.so.0, libcobexbfb.so.0, libcobexpe.so.0, 
libobexftp.so.0) found and LEAD_SONAME not defined
Packaged contents of obexftp 
into /home/hrw/devel/build/3541-feed/tmp/deploy/ipk/obexftp_0.10.3-r1_arm.ipk


-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

   Fear leads to anger, anger leads to hate, hate... leads to suffering.
   		-- Yoda




