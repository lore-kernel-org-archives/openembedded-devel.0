Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J9kHK-0000rc-Kq
	for openembedded-devel@openembedded.org; Tue, 01 Jan 2008 17:47:46 +0100
Received: from Powerbook-2.local (vpn006027.vpn.utwente.nl [130.89.6.27])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m01GfN0k003821 for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jan 2008 17:41:23 +0100
Message-ID: <477A6D33.9060308@student.utwente.nl>
Date: Tue, 01 Jan 2008 17:41:23 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4774C182.20501@gmail.com>	<200712281208.44069.openembedded@haerwu.biz>	<1653907704.20071231211045@vanille-media.de>
	<1199143139.4664.23.camel@localhost.localdomain>
In-Reply-To: <1199143139.4664.23.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Tosa kernel bloat
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
X-List-Received-Date: Tue, 01 Jan 2008 16:47:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

> We do have a problem with kernel sizes in recent kernels, one we can't
> really afford to ignore any longer.

- --- packages/linux/linux-rp.inc 0754d43aed9f1733a268bc5a327d596268b601e3
+++ packages/linux/linux-rp.inc 4b074ddc2ac5e4e9c7531684c078362c386641ba
@@ -95,7 +95,7 @@ do_configure() {

        if [ "${TARGET_OS}" = "linux-gnueabi" -o "${TARGET_OS}" =
"linux-uclibcgnueabi" ]; then
                echo "CONFIG_AEABI=y"                   >> ${S}/.config
- -               echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
+               echo "# CONFIG_OABI_COMPAT is not set"             >>
${S}/.config
        else
                echo "# CONFIG_AEABI is not set"        >> ${S}/.config
                echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config

saves a few precious kB.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHem0zMkyGM64RGpERAlkNAKCYL0VKRpWLYudrTInnizFlw+lXiwCeMK2U
KXIOpSsblomJoNTfwT5VWF4=
=nXRL
-----END PGP SIGNATURE-----


