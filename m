Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GXDIe-00083y-O7
	for openembedded-devel@openembedded.org; Tue, 10 Oct 2006 10:49:20 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9A8h9ZS027254 for <openembedded-devel@openembedded.org>;
	Tue, 10 Oct 2006 10:43:09 +0200
Message-ID: <452B5D2B.3000806@dominion.kabel.utwente.nl>
Date: Tue, 10 Oct 2006 10:43:23 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: [RFC] removing pre-modular X from .dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 08:49:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

A number of users have been seeing problems with their builds due to mixing pre-modular X
stuff with Xorg 7.x stuff. I want to propose the following:

  'Remove all pre-modular X servers, libraries, proto's and extentsions from .dev'

There are a number of reasons to do this:

 * premodular X is using unsupported releases
 * when pulling from cvs, we use a unsupported and obsoleted cvs tree
 * Xorg 7.x is present and supported in distributions like debian and suse, while the
premodular X stuff we use is not
 * Accidentily building xextensions will break your Xorg 7.x build in non-obvious ways.

I've been wanting to send this RFC to this list for a long while, but was prompted by
something on IRC: The git-version didn't fetch due to firewall issues, so let's use the
cvs version.

The change will basically consist of removing the recipes mentioned in
http://www.openembedded.org/repo/org.openembedded.dev/conf/distro/include/preferred-x-versions-pre-X11R7.inc

comments?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFK10rMkyGM64RGpERAscBAJ4gUXl8V8QdCySgzOzRf4STIwL4gACfWTPF
G8GdnV9F5JR9SmRm6j6pK1w=
=plXa
-----END PGP SIGNATURE-----


