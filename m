Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JGwOB-0002k5-Gs
	for openembedded-devel@openembedded.org; Mon, 21 Jan 2008 14:08:35 +0100
Received: (qmail 22232 invoked by uid 813007); 21 Jan 2008 13:08:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 21 Jan 2008 13:08:35 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@openembedded.org
Date: Mon, 21 Jan 2008 14:08:31 +0100
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200801211408.31701.openembedded@haerwu.biz>
Subject: Bug 2430 -- TrueType fonts handling and solution for it
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
X-List-Received-Date: Mon, 21 Jan 2008 13:08:35 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


http://bugs.openembedded.net/show_bug.cgi?id=2430

Rolf Leggewie tries to solve problem when TrueType/OpenType fonts are used 
in OPIE or other environments.

Currently installing new font does not add it into list of available ones 
as there is no consensus how to handle it. I want to tell how I see it.

1. There will be /etc/update-fonts.d/ directory where
   packages/environments will add own scripts for handling fonts
2. There will be "update-fonts" package which contain script which calls
   all those scipts (via "run-parts /etc/update-fonts.d/" command)
3. "opie-ttf-support" script will install "update-qtttffontdir" command in    
   ${bindir} and script which will call it in /etc/update-fonts.d/
4. "fontconfig-utils" will also store own script in /etc/update-fonts.d/
5. packages/ttf-fonts/ttf.inc will RDEPEND on "update-fonts" and will call
   it in postinst/postrm
6. qpf.bbclass (which should be renamed to qpf.inc and moved to
   packages/qpf-fonts) will also RDEPEND on "update-fonts" and will call
   it in postinst/postrm
7. qpf fonts will also RDEPEND on qte-fonts-common which
   provide "update-qtfontdir" script

This way we have solution which can be extended to any format of fonts and 
into any environment without changing anything. If someone will 
create "XDE" which do not use fontconfig but use TrueType fonts then it 
will only need to install own script into /etc/update-fonts.d/ to have 
them supported.

Any ideas/objections?

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          bloody internet
          there was once peace and then the internet came in :-)




