Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HPJm4-0002DL-3z
	for openembedded-devel@openembedded.org; Thu, 08 Mar 2007 15:39:20 +0100
Received: from [130.89.138.116] (wlan138116.mobiel.utwente.nl [130.89.138.116])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l28EdBLr011219 for <openembedded-devel@openembedded.org>;
	Thu, 8 Mar 2007 15:39:12 +0100
Message-ID: <45F0200B.9080002@dominion.kabel.utwente.nl>
Date: Thu, 08 Mar 2007 15:39:07 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <a7f8874a0702280825j22bdf3bbw94e58cfd4a0fab93@mail.gmail.com>
In-Reply-To: <a7f8874a0702280825j22bdf3bbw94e58cfd4a0fab93@mail.gmail.com>
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
X-List-Received-Date: Thu, 08 Mar 2007 14:39:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Henry von Tresckow schreef:
> I think I may have stumbled across some potential bugs in glibc-package.bbclass:
> 
> it seems like the standard value for datadir is /usr/share which will
> cause the following problems in output_locale_binary:
> 
> 1) i18npath will be set to /usr/share/i18n instead of
> treedir/usr/share/i18n becouse path.join is too braindead to remove
> leading / on path entries.
> 2) the --inputfile option in localdef opts uses datadir instead of
> treedir, so it looks like it would use the locale files installed on
> the host instead of the ones we are buildig for.
> 

There now is a base_path_join function in OE, that doesn't have that bug. No idea why
glibc.bbclass hasn't been updated to use that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF8CALMkyGM64RGpERAtfLAKCOxA7HXzE3gec8hEeTRZXALOtwKACfcD3O
RgVrnKYxJM3MzxL56Etc1rQ=
=+hl1
-----END PGP SIGNATURE-----


