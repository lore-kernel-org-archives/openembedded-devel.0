Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H4230-00024S-Ei
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 22:28:50 +0100
Received: (qmail 13145 invoked by uid 813007); 8 Jan 2007 21:27:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 8 Jan 2007 21:27:09 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Jan 2007 22:27:08 +0100
User-Agent: KMail/1.9.5
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Message-Id: <200701082227.08898.openembedded@hrw.one.pl>
Subject: RFC: get rid of virtual/libsdl
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
X-List-Received-Date: Mon, 08 Jan 2007 21:28:50 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


I see more and more reports where people has problems with building SDL 
stuff just because they have 'virtual/libsdl == libsdl-qpe' in build 
config. We all know that libsdl-qpe is set of hacks applied to hacks 
which evolved from other hacks and thats that all is in state which no 
one want to have something to do. No one ever sent parts of it upstream, 
no one tried to update it to more recent SDL version etc.

I would like to have one small change in OE: removal of virtual/libsdl at 
all or some kind of other change which would mark libsdl-qpe as not 
providing virtual/libsdl at all. 

Most of SDL stuff in OE builds without problem with libsdl-x11 and most of 
them even works when user with libsdl-qpe tries to use it. But if someone 
tries to build SDL apps with libsdl-qpe then he is hit with linking 
problems, with '-no-rtti/-rtti' problem etc. I'm tired of it.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    If you're not the part of solution then you're part of the problem.




