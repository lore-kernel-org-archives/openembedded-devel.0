Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MaWNY-0003uF-Rs
	for openembedded-devel@openembedded.org; Mon, 10 Aug 2009 17:01:41 +0200
Received: (qmail 15472 invoked by uid 813007); 10 Aug 2009 14:45:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 10 Aug 2009 14:45:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Aug 2009 16:45:24 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc5-00256-g8e6bcae; KDE/4.3.0; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200908101645.25246.marcin@juszkiewicz.com.pl>
Subject: State of Perl in OpenEmbedded
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
X-List-Received-Date: Mon, 10 Aug 2009 15:01:42 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

It is over 2 years since we got Perl 5.8.8 from Jamie Lenehan. We are 
able to cross-compile Perl, we can build CPAN modules but thats all.

I wanted to run irssi on sheevaplug (under Angstrom). But this IRC 
client is more usable when compiled with Perl support. It is not 
possible at all with OpenEmbedded. Why?

1. We do not stage libperl at all. Fix is simple but see next point.
2. Software checks for perl cflags/ldflags by calling Perl. This means 
   that on my system x86-64 libraries/headers are used nevermind for
   which target I try to build. Result is disaster.

Any ideas how to solve that? I gave up.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




