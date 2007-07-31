Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IFpP5-0008Kw-Uy
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 12:56:40 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6VAsl1R030946; Tue, 31 Jul 2007 12:54:47 +0200
Message-ID: <46AF14F7.2030607@dominion.kabel.utwente.nl>
Date: Tue, 31 Jul 2007 12:54:47 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1185839805.7719.103.camel@localhost.localdomain>
	<46AF0E33.4000107@dominion.kabel.utwente.nl>
In-Reply-To: <46AF0E33.4000107@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Tue, 31 Jul 2007 10:56:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Richard Purdie schreef:
>> Hi,
> 
>> As people know the ability to build the latest head revisions of svn
>> (for example) repositories in OE with bitbake has been limited and less
>> than ideal.
> 
> What happens if I have no internet connection during parsing and do have a huge
> sourcemirror inside my firewall?

I did:

packages$ for i in */*.bb ; do sed -i -e s:'svn${SRCDATE}':'svnr${SRCREV}':g $i ; done

One of the results:

NOTE: <class 'bb.MalformedUrl'>: while evaluating:
${@bb.fetch.get_srcrev(d)}
NOTE: <class 'bb.MalformedUrl'>: while evaluating:
0.0+svnr${SRCREV}
NOTE: <class 'bb.MalformedUrl'>: while evaluating:
${PN}-${EXTENDPE}${PV}-${PR}
NOTE: <class 'bb.MalformedUrl'>: while evaluating:
${TMPDIR}/work/${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}/${PF}
NOTE: <class 'bb.MalformedUrl'>: while evaluating:
${WORKDIR}/trunk
NOTE: <class 'bb.MalformedUrl'>: while evaluating:
${S}
ERROR:  while parsing
/home/koen/OE/monotone/org.openembedded.dev/packages/openocd/openocd_svn.bb


The parser seems to dislike:

* recipes with SRCREV that weren't fetched yet (openocd in my case)
* recipes with SRCREV that do ;proto=http (libmatchbox)

Is there anything we can do to fix these cases?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGrxT2MkyGM64RGpERAqi0AKCkpdfJuvagyisqUKm3eZm1gS5N2ACfbZN9
iB83sV9Yf0wPoHO9kgX6Lkc=
=QKcE
-----END PGP SIGNATURE-----


