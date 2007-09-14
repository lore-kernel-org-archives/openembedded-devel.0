Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IW5Xs-0008JA-Uo
	for openembedded-devel@openembedded.org; Fri, 14 Sep 2007 09:24:57 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8E7LXxW027058 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2007 09:21:33 +0200
Message-ID: <46EA3685.2040809@student.utwente.nl>
Date: Fri, 14 Sep 2007 09:21:41 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200709111318.52432.openembedded@haerwu.biz>	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>	<1189545452.6163.65.camel@localhost.localdomain>	<46E71524.4CAFCDBC@vollmann.ch>	<1916151728.20070912014300@vanille-media.de>
	<46E78180.1050907@student.utwente.nl>
In-Reply-To: <46E78180.1050907@student.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Splitting up bluez in a sane way, was Re: Task-base is big :(
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
X-List-Received-Date: Fri, 14 Sep 2007 07:24:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Dr. Michael Lauer schreef:
>> Detlef Vollmann wrote:
>>> The difference to the original python .bb is the removing of
>>>  DEPEND: tk
>>>   This would build a whole X11 system, and I definitely don't want that.
>> Hmm, I'm sure it's just an example for you, but anyway I can't leave
>> it unsaid: Python's dependency on Tk just drags in libx11 and libxext
>> at build time -- I don't see this as being a problem, since they don't
>> end up the image unless you want to.
> 
> And bluez-utils is exactly the same.

What can be done is to make the default bluez-utils build only build bluez-utils* and have
seperate recipes for all the 3rdparty stuff it builds:

FILES_${PN}-alsa = "${libdir}/alsa-lib/libasound*"
FILES_bluez-cups-backend = "${libdir}/cups/backend/bluetooth"

That would solve both buildtime and runtime issues.

What do you think?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG6jaFMkyGM64RGpERApT1AKCd2c3/aLUbt2Tq6nf8Dy1GCTl8aACfWqE7
M4/wIIN/uJky4n1rqdGS7C0=
=o+aN
-----END PGP SIGNATURE-----


