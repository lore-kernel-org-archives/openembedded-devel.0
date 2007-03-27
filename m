Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HWGOj-0001Vy-Sa
	for openembedded-devel@openembedded.org; Tue, 27 Mar 2007 20:27:57 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2RIRtLr022324 for <openembedded-devel@openembedded.org>;
	Tue, 27 Mar 2007 20:27:55 +0200
Message-ID: <46096227.8000404@dominion.kabel.utwente.nl>
Date: Tue, 27 Mar 2007 20:27:51 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HWGLL-0001QZ-N9@linuxtogo.org>
In-Reply-To: <E1HWGLL-0001QZ-N9@linuxtogo.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev apt.inc: provide an example on how to provide the glibc version to configure
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
X-List-Received-Date: Tue, 27 Mar 2007 18:27:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

koen commit schreef:
> apt.inc: provide an example on how to provide the glibc version to configure

> +# Apt wants to know the glibc version by running a binary file, which will fail, so we have to tell configure which version to use
> +# Since I don't know the impliations of setting a wrong value I only provide one for angstrom, which uses glibc 2.5 (which claims to be 2.4)
> +# Koen - 20070327
> +EXTRA_OECONF_angstrom += " ac_cv_glibc_ver=libc6.4"

I would really appreciate if someone can come up with a better way of doing this.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGCWInMkyGM64RGpERApD6AKCXFAulXGL/ySAgKqgRnJXgC3LaFACgrf5U
uCAK1MToZj+uZ3OaRWVE5gs=
=4Z35
-----END PGP SIGNATURE-----


