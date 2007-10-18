Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IiTYq-00079m-FS
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2007 13:29:08 +0200
Received: (qmail 26587 invoked by uid 813007); 18 Oct 2007 11:22:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 18 Oct 2007 11:22:27 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2007 13:22:20 +0200
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200710181322.22572.openembedded@haerwu.biz>
Subject: Checksums update
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
X-List-Received-Date: Thu, 18 Oct 2007 11:29:08 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As some of you know during OpenEmbedded builds there is checksums checking 
(in do_fetch task). We have list of checksums stored in metadata in 
conf/checksums.ini file.

But not all sources are covered there. I added some code into base.bbclass 
to automatically generate TMPDIR/checksums.ini with data for missing 
sources. Please review its output after building and commit/submit new 
entries. But please do not submit entries for files which are generated 
daily (source snapshots for example) as they are useless.

Another thing is getting sure that already fetched sources are the proper 
ones. I pushed script into contrib/source-checker/ which was written for 
this task. Simply run it with OE conf/checksums.ini against your sources 
(DL_DIR directory). If any archive is wrong then this script will tell 
you that. To confirm does it really apply (OE conf/checksums.ini contain 
some bugs) please fetch archive from it's location, generate md5 and 
sha256 and compare against checksums.ini file. Please commit/submit any 
fixed entries.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

     If you can't learn to do it well, learn to enjoy doing it badly.
     		-- Ashleigh Brilliant




