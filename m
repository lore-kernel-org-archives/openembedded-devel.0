Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hl0d2-00043Z-E5
	for openembedded-devel@openembedded.org; Mon, 07 May 2007 12:39:40 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l47AdFLr005972 for <openembedded-devel@openembedded.org>;
	Mon, 7 May 2007 12:39:15 +0200
Message-ID: <463F01CF.5010601@dominion.kabel.utwente.nl>
Date: Mon, 07 May 2007 12:39:11 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <a7f8874a0702280825j22bdf3bbw94e58cfd4a0fab93@mail.gmail.com>
	<45F0200B.9080002@dominion.kabel.utwente.nl>
In-Reply-To: <45F0200B.9080002@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Potential Problems in glibc-package.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2007 10:39:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hans Henry von Tresckow schreef:
>> I think I may have stumbled across some potential bugs in glibc-package.bbclass:
> 
>> it seems like the standard value for datadir is /usr/share which will
>> cause the following problems in output_locale_binary:
> 
>> 1) i18npath will be set to /usr/share/i18n instead of
>> treedir/usr/share/i18n becouse path.join is too braindead to remove
>> leading / on path entries.
>> 2) the --inputfile option in localdef opts uses datadir instead of
>> treedir, so it looks like it would use the locale files installed on
>> the host instead of the ones we are buildig for.
> 
> 
> There now is a base_path_join function in OE, that doesn't have that bug. No idea why
> glibc.bbclass hasn't been updated to use that.

See http://bugs.openembedded.org/show_bug.cgi?id=1821#c9 for the proposed solution for at
least 1).

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGPwHPMkyGM64RGpERAjMsAJ9hwzbjdM/QDmpE/gPkB9taIK7wgACePfxv
E306nGzJX80t3kuMxbtqe+Y=
=W3Un
-----END PGP SIGNATURE-----


