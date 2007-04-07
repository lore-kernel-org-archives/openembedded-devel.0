Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Ha7tS-00058q-EF
	for openembedded-devel@openembedded.org; Sat, 07 Apr 2007 12:11:38 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l37ABXox014383 for <openembedded-devel@lists.openembedded.org>;
	Sat, 7 Apr 2007 12:11:34 +0200
Message-ID: <46176E51.2030608@dominion.kabel.utwente.nl>
Date: Sat, 07 Apr 2007 12:11:29 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: [RFC] rm_work
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
X-List-Received-Date: Sat, 07 Apr 2007 10:11:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I want to propose making rm_work inherited by default with the following changes:

* a KEEP_WORK = "1" var in bitbake.conf so it is opt-in
* a KEEP_WORK_pn-${PN} option to mark packages in local.conf
* a KEEP_WORK option in recipes to mark them, e.g. for llvm

Summary: it will default to 'off' (keep the workdir), but can be switched globally and per
package.

In the last few weeks that I've used rm_work, I haven't found any big problems with it,
but as Graeme points out, there is no easy way to disable yet.

What do you think?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGF25RMkyGM64RGpERAtDZAJsH34WyVDZaQCnrcpgEF8ezNySLfgCgu30W
299vq8pM/5y1KQMaplmmlhY=
=U4ym
-----END PGP SIGNATURE-----


