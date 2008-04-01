Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JgaJm-0005QE-Sq
	for openembedded-devel@openembedded.org; Tue, 01 Apr 2008 08:50:03 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JgaJm-00083p-Ef
	for openembedded-devel@openembedded.org; Tue, 01 Apr 2008 06:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 01 Apr 2008 06:50:02 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 01 Apr 2008 06:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 01 Apr 2008 08:47:57 +0200
Message-ID: <fsslqt$uhe$2@ger.gmane.org>
References: <47F185E1.9070307@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47F185E1.9070307@gmx.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: trouble with cp command in autotools.bbclass
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
X-List-Received-Date: Tue, 01 Apr 2008 06:50:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert Schuster schreef:
| Hi,
| lately the following copy operation has been added to autotools.bbclass:
|
| # Otherwise libtool wasn't used, and lib/ can be copied
| # directly.
| echo "cp -fpPR ${STAGE_TEMP}/${libdir}/* ${STAGING_LIBDIR}"
| cp -fpPR ${STAGE_TEMP}/${libdir}/* ${STAGING_LIBDIR}
|
| I have trouble with this and a package that creates an empty ${libdir}.
| Shell globbing (*) wont find a file and instead tries to copy a file
| named "*" ... and fails and so does my built.
|
| I would like to replace this with the following lines which uses find
| and is more robust:
|
| # (The find command handles an empty ${STAGE_TEMP/${libdir} correctly)
| echo "find ${STAGE_TEMP}/${libdir} -mindepth 1 -maxdepth 1 -exec cp
| -fpPR {} ${STAGING_LIBDIR}" \;
|
| find ${STAGE_TEMP}/${libdir} -mindepth 1 -maxdepth 1 -exec cp -fpPR {}
| ${STAGING_LIBDIR} \;
|
| Ok for commit?

or use:

autotools_stage_dir ${STAGE_TEMP}/${libdir} ${STAGING_LIBDIR}

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH8dqdMkyGM64RGpERAuRsAKCZscg8u3San7ui3qkZfjJPwOWvPACgp7oF
Qzjxe69KN+cq/BayJRi1/Ic=
=iHP3
-----END PGP SIGNATURE-----



