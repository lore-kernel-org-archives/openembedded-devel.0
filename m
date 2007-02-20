Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HJWkS-00024E-0q
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 16:17:44 +0100
Received: (qmail 29096 invoked by uid 813007); 20 Feb 2007 15:17:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Feb 2007 15:17:42 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Feb 2007 16:17:39 +0100
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200702201617.42247.openembedded@hrw.one.pl>
Subject: Linux kernel recipes
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
X-List-Received-Date: Tue, 20 Feb 2007 15:17:45 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Some time ago I added packages/linux/linux_2.6.19.bb (currently 
linux_2.6.20.bb) as some kind of generic Linux kernel recipe. Currently 
it is used for Progear and Simpad targets.

Today we got linux-x86_2.6.20.bb which differ in just one thing.. NAME. It 
does not contain any patches - just source archive and kernel 
configuration file. Can it be merged into linux_2.6.20.bb?

We have few other 2.6.20 recipes but they are more machine specific 
(efika, ixp4xx, dht-walnut).

Second thing is list of kernels. We have 149 files in packages/linux/ - 
some targets have few kernels there - can we get rid of not used ones? 
Many machines want 1-2 kernels (stable one and development one) so why we 
have 4-6 kernels for one machine? Can this be cleared in some way?

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

       In theory there is no difference between practice and theory




