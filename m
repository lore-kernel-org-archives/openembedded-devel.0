Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NCBX2-0000ri-Dr
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 13:27:11 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NCBVe-0004y7-3a for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 07:25:42 -0500
Date: Sun, 22 Nov 2009 07:25:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911220719570.13278@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: more observations on the usermanual dir and docbook translation
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
X-List-Received-Date: Sun, 22 Nov 2009 12:27:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  since i've done a fair bit of docbook processing, i took a quick
look at the usermanual dir, and here's another observation from the
README, where it reads:

  For html and xhtml you need xsltproc installed.
  For the other you need docbook-utils installed.

at least under fedora, that's not all -- you'll need the
docbook-utils-pdf package as well:

$ rpm -ql docbook-utils-pdf
/usr/bin/db2dvi
/usr/bin/db2pdf
/usr/bin/db2ps
/usr/bin/docbook2dvi
/usr/bin/docbook2pdf
/usr/bin/docbook2ps
/usr/share/man/man1/db2pdf.1.gz
/usr/share/man/man1/docbook2dvi.1.gz
/usr/share/man/man1/docbook2pdf.1.gz
/usr/share/man/man1/docbook2ps.1.gz
$

  not sure what the situation is under other distros.  also, the last
time i looked, most output formats can now be generated with no
reference to SGML or DSSSL or jade, but i'd have to go back and verify
that.  (pdf output can be generated using fop.)

  if no one else wants to handle this, i can start putting together
patches to bring that directory up to date as long as i can do it in
bite-size pieces.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


