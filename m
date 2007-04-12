Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hc5y6-00082F-Qn
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 22:32:34 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3CKWULr032187 for <openembedded-devel@openembedded.org>;
	Thu, 12 Apr 2007 22:32:30 +0200
Message-ID: <461E975A.2080901@dominion.kabel.utwente.nl>
Date: Thu, 12 Apr 2007 22:32:26 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <bdb0025f0704121326y3fef7ab6q62eb7b906ce3e947@mail.gmail.com>
In-Reply-To: <bdb0025f0704121326y3fef7ab6q62eb7b906ce3e947@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: gcc (and others) missing some links to binaries
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
X-List-Received-Date: Thu, 12 Apr 2007 20:32:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rodrigo Vivi schreef:
> Hi all,
> 
> When I was using mamona I've noticed that gcc was installed but
> without the gcc command... Then I realized that in package there were
> only this files
> 
> /usr/bin/arm-mamona-linux-gnueabi-gcc
> /usr/bin/arm-mamona-linux-gnueabi-gccbug
> 
> but not the /usr/bin/gcc or gccbug
> 
> Then I tried to build angstrom to see if this error was happening just
> in mamona and for my surprise the gcc deb package for angstrom just
> have this 2 binary files too:
> 
> /usr/bin/arm-angstrom-linux-gnueabi-gcc
> /usr/bin/arm-angstrom-linux-gnueabi-gccbug
> 
> I've noticed that this is happening to binutils too...
> 
> Does any body have any idea about it?

Yes, the gcc-symlinks and binutils-symlinks packages contain the symlinks:

lrwxrwxrwx root/root         0 2007-03-21 17:07 ./usr/bin/cc -> gcc
lrwxrwxrwx root/root         0 2007-03-21 17:07 ./usr/bin/gcc ->
arm-angstrom-linux-gnueabi-gcc


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGHpdaMkyGM64RGpERAqaPAJ4ua0VrshF7WnlpFmWI3SfGR2427gCfQTFJ
UFSDcuWKnyrhrRR/SMapekQ=
=yRPI
-----END PGP SIGNATURE-----


