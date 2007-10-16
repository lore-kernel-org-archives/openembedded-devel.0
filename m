Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ihp5Z-00062k-9I
	for openembedded-devel@openembedded.org; Tue, 16 Oct 2007 18:16:13 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9GG9a98008180 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2007 18:09:36 +0200
Message-ID: <4714E23F.4060402@student.utwente.nl>
Date: Tue, 16 Oct 2007 18:09:35 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <JQ09JU$226B655F90BD312D7F024131EBD56EA2@scarlet.be>
In-Reply-To: <JQ09JU$226B655F90BD312D7F024131EBD56EA2@scarlet.be>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Patches to svn based recipes
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
X-List-Received-Date: Tue, 16 Oct 2007 16:16:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Philippe De Swert schreef:
> Hi all!
> 
> 
>> Could people please stop doing stuff like:
>>
>> openmoko-panel-bt_svn.bb: Drop panel-bluetooth.patch, as it was applied upstream
>> # delete "packages/openmoko-panel-plugins/files/panel-bluetooth.patch"
>>
>> openmoko-dialer2_svn.bb : patch is now applied upstream
>> - -SRC_URI += "file://openmoko-dialer.patch;patch=1"
>>
>> matchbox-keyboard: Bump svn revision and remove some patches in the bb file
>> since these patches were applied upstream.
>> - -        file://matchbox-keyboard-applet.patch;patch=1;pnum=0 \
>> - -	file://matchbox-keyboard-hide-delay.patch;patch=1"
>>
>> And use ;minrev= and ;maxrev=. Removing patches makes regression testing and
> building
>> older versions impossible.
> 
> Ok. So all those things are forbidden. Good. So what are we expected to write
> in the commit message then?

Write what you want in the commit message, as long as you update the SRC_URI to use
;minrev= and ;maxrev=
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHFOI/MkyGM64RGpERAvwmAKCDYxlc2fi/PWu2VI2KUu1/+GLI+QCeIWML
c6rJKitTc4u90z2FiSbQt44=
=vqS+
-----END PGP SIGNATURE-----


