Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HNzbv-0006GB-Ez
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 23:55:23 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l24MtGLr009517 for <openembedded-devel@openembedded.org>;
	Sun, 4 Mar 2007 23:55:16 +0100
Message-ID: <45EB4E52.2000107@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 23:55:14 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200703042228.03665.openembedded@hrw.one.pl>
In-Reply-To: <200703042228.03665.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Task-base rewrite
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
X-List-Received-Date: Sun, 04 Mar 2007 22:55:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> During last two months I was working on new version of task-base. It was 
> done from time to time without too much testing as I had many other 
> things on my todo list.
> 
> The main problem of task-base is that it give one package as result so if 
> you want to create smaller rootfs for only few features you need to 
> create own-task-base and base image on it.
> 
> My version create several task-base-*, task-distro-* packages which cover 
> several features one by one. Some features contain extra stuff only if 
> other features are available (for example Bluetooth on USB bus only if 
> distro supports BT and device support USB Host).
> 
> Code needs cleanup, changes here and there but it should be better then 
> current implementation. Recent changes made to task-base in .dev are not 
> in my version yet.
> 
> Opinions? Ideas? Patches? Suggestions?
> 
> 
> 
> ------------------------------------------------------------------------
> 
> DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
> PR = "r17.6"

PRs are cheap, no need to go beyond the decimal point :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF605SMkyGM64RGpERAsK+AKCc2AbDLqBzKq4jMBiJKzak2lB7igCdGOrE
DWvfAAh7vZW+MTAhveI+iTM=
=ROC0
-----END PGP SIGNATURE-----


