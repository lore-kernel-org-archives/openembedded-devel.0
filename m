Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IXgiC-0001i1-0a
	for openembedded-devel@openembedded.org; Tue, 18 Sep 2007 19:18:12 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8IHELxW010928 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2007 19:14:22 +0200
Message-ID: <46F0077F.3050807@student.utwente.nl>
Date: Tue, 18 Sep 2007 19:14:39 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Revisiting bitbake stamp handling
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
X-List-Received-Date: Tue, 18 Sep 2007 17:18:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

For a number of features in OE (e.g packaged-staging, rm_work) a change to bitbake stamp
handling would make things a lot easier. As I understand it bitbake currently does for
'bitbake foo -c compile':

if(dependency stamps are missing OR depency stamps have newer mtime) then start from scratch

For rm_work we want to remove the do_unpack upto do_install stamps, but leave do_fetch and
do_package_write* and for packaged-staging we want to only create a do_populate_staging
stamps. So 'bitbake foo -c compile' would only do:

if(depency stamps have newer mtime) then start from scratch

this has implications for do_clean and do_rebuild, and possibly other things. Since this
looks to good to be true, I want to know what else might break and how we could solve that
when implementing this. This just a gedankenexperiment for now, so bitbake hackers can
relax now :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG8Ad/MkyGM64RGpERArW7AKCY91yVx8se1jUej3FiZyVRTpuZVgCghoca
n9KyhcAJ4a4VhBvxh360wto=
=152E
-----END PGP SIGNATURE-----


