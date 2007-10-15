Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IhP0o-00037o-5W
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 14:25:34 +0200
Received: (qmail 1474 invoked by uid 813007); 15 Oct 2007 12:19:10 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 15 Oct 2007 12:19:10 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2007 14:19:04 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200710151419.07302.openembedded@haerwu.biz>
Subject: [RFC] Handling of virtual/* namespace in packages
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
X-List-Received-Date: Mon, 15 Oct 2007 12:25:34 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


In OpenedHand we got hit by virtual/update-alternatives and packaging. 
Poky contains two providers for virtual/u-a:

1. update-alternatives-cworth
2. update-alternatives-dpkg

First one comes from IPKG source and is written in pure shell. Second one 
is in Perl so it fetch too much to be usable.

The problem comes when you build both of them (it happens on our 
autobuilder due to 'world' build) - package manager (ipkg) selects random 
one - in our case it is always 'update-alternatives-dpkg' so generated 
rootfs is too big to be usable.

Solution which came to my mind is quite simple. Our distro (Poky) already 
prefers 'u-a-cworth' as provider for 'virtual/update-alternatives'. So if 
package depends on 'virtual/update-alternatives' then let package.bbclass 
mangle its dependencies in such way that 'u-a-cworth' (preferred by 
distro) would be writen in package.

What do you think about it?

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         Computers are not intelligent. They only think they are.




