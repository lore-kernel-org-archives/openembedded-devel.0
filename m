Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IiV7E-0000Nk-Kk
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2007 15:08:48 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9ID1rUo011227 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2007 15:01:55 +0200
Message-ID: <47175943.9060303@student.utwente.nl>
Date: Thu, 18 Oct 2007 15:01:55 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200710181322.22572.openembedded@haerwu.biz>
In-Reply-To: <200710181322.22572.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Checksums update
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
X-List-Received-Date: Thu, 18 Oct 2007 13:08:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> As some of you know during OpenEmbedded builds there is checksums checking 
> (in do_fetch task). We have list of checksums stored in metadata in 
> conf/checksums.ini file.
> 
> But not all sources are covered there. I added some code into base.bbclass 
> to automatically generate TMPDIR/checksums.ini with data for missing 
> sources. Please review its output after building and commit/submit new 
> entries. But please do not submit entries for files which are generated 
> daily (source snapshots for example) as they are useless.
> 
> Another thing is getting sure that already fetched sources are the proper 
> ones. I pushed script into contrib/source-checker/ which was written for 
> this task. Simply run it with OE conf/checksums.ini against your sources 
> (DL_DIR directory). If any archive is wrong then this script will tell 
> you that. To confirm does it really apply (OE conf/checksums.ini contain 
> some bugs) please fetch archive from it's location, generate md5 and 
> sha256 and compare against checksums.ini file. Please commit/submit any 
> fixed entries.

On my dldir:

./oe-source-checker.py  ../../conf/checksums.ini ~/OE/downloads/ | grep md5
curl-7.16.2.tar.bz2 has wrong md5: 1ef8d748ed567611450cd93898f5f3bc instead of 37a1de15c4300ca9413d39d2bcea9b36 url: http://curl.haxx.se/download/curl-7.16.2.tar.bz2
libX11-X11R7.0-1.0.0.tar.bz2 has wrong md5: 1164f1fb39a0132633302f0787ecf3f1 instead of dcf59f148c978816ebbe3fbc5c9ef0e1 url: http://xorg.freedesktop.org/releases/X11R7.0/src/lib/libX11-X11R7.0-1.0.0.tar.bz2

on the angstrom source mirror:

rpm2cpio-1.2_2.tbz has wrong md5: 76f8b7060500191c7cde078f831c7f0c instead of 801fd27c30c2e68ab4f193f15f81abb3 url: ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2_2.tbz
curl-7.16.2.tar.bz2 has wrong md5: 1ef8d748ed567611450cd93898f5f3bc instead of 37a1de15c4300ca9413d39d2bcea9b36 url: http://curl.haxx.se/download/curl-7.16.2.tar.bz2
libnotify-0.4.2.tar.gz has wrong md5: 25585318503079a513af7064bb59c04d instead of ab588f9ce651feddab6a8225c102d24c url: http://www.galago-project.org/files/releases/source/libnotify/libnotify-0.4.2.tar.gz
tomoe-0.2.1.tar.gz has wrong md5: b564fc425f81b2bca2bd4612cf791cb4 instead of 95eca127a1d519ff4e836b3d00d7fa84 url: http://keihanna.dl.sourceforge.jp/tomoe/16048/tomoe-0.2.1.tar.gz
wx-cvs-Gtk.tar.bz2 has wrong md5: ded9acf4af61cc305aa6c6391af2ab4b instead of cac58d215b73189e8574d1c361e771a6 url: http://biolpc22.york.ac.uk/pub/CVS_HEAD/v1/wx-cvs-Gtk.tar.bz2
obby-0.4.1.tar.gz has wrong md5: b79146369fc76a61d6d4056a937c71c8 instead of 84c35d0cc6b603442e5ba0083fc1b8bb url: http://releases.0x539.de/obby/obby-0.4.1.tar.gz

<ctrl-c>




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHF1lDMkyGM64RGpERAl0/AKCLRdLLwcdrHBAPHtFKhg230RMEGwCcCljn
O+fkjuvOj+BDkQN9/uPTaCk=
=+BUd
-----END PGP SIGNATURE-----


