Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IIlHm-0001Su-Pd
	for openembedded-devel@openembedded.org; Wed, 08 Aug 2007 15:09:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l78D6U1R021006 for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Aug 2007 15:06:31 +0200
Message-ID: <46B9BFC9.60402@dominion.kabel.utwente.nl>
Date: Wed, 08 Aug 2007 15:06:17 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IIkwT-00010u-Ld@linuxtogo.org>
In-Reply-To: <E1IIkwT-00010u-Ld@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev matchbox-panel2 ship plugin *.la in debug package (QA fix)
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
X-List-Received-Date: Wed, 08 Aug 2007 13:09:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mickeyl commit schreef:
> matchbox-panel2 ship plugin *.la in debug package (QA fix)

> +FILES_${PN}-dbg += "${libdir}/matchbox-panel/lib*.a ${libdir}/matchbox-panel/lib*.la"

No, those go into -dev packages.

- From bitbake.conf:

FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
                /lib/*.a /lib/*.o ${datadir}/aclocal"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGub/JMkyGM64RGpERApHtAKCjez4xhvL0SvJgYtzXCc8/KbuaeACffbgc
PcXRJoPGJHIDzOcos2ZqD74=
=yXrr
-----END PGP SIGNATURE-----


