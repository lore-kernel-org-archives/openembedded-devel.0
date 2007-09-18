Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IXhKn-0006cS-6h
	for openembedded-devel@openembedded.org; Tue, 18 Sep 2007 19:58:05 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8IHsFxW016692 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2007 19:54:16 +0200
Message-ID: <46F010DA.10803@student.utwente.nl>
Date: Tue, 18 Sep 2007 19:54:34 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200709111318.52432.openembedded@haerwu.biz>	<46EA57E9.4020202@dominion.kabel.utwente.nl>	<46EB97FE.1030906@student.utwente.nl>	<200709151431.07995.openembedded@haerwu.biz>
	<46EBD74D.6030501@dominion.kabel.utwente.nl>
In-Reply-To: <46EBD74D.6030501@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l8IHsFxW016692
Subject: Re: Splitting up bluez in a sane way, was Re: Task-base is big :(
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
X-List-Received-Date: Tue, 18 Sep 2007 17:58:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Marcin Juszkiewicz schreef:
>> Dnia sobota, 15 wrze=C5=9Bnia 2007, Koen Kooi napisa=C5=82:
>>> Koen Kooi schreef:
>>>> Marcin Juszkiewicz schreef:
>>>>> Dnia pi=C4=85tek, 14 wrze=C5=9Bnia 2007, Koen Kooi napisa=C5=82:
>>>>>> What can be done is to make the default bluez-utils build only
>>>>>> build bluez-utils* and have seperate recipes for all the 3rdparty
>>>>>> stuff it builds:
>>>>>> That would solve both buildtime and runtime issues.
>>>>>>
>>>>>> What do you think?
>>>>> bluez-utils-cups, bluez-utils-gstreamer, bluez-utils-alsa? Sounds
>>>>> good for me - especially first both.
>>>> bluez-utils-cups and bluez-utils-alsa can be done for sure, but I
>>>> haven't looked at where gstreamer comes in and if it can be a
>>>> seperate package.
>>> What do you think of this patch?
>> Looks ok - in cups you can disable hid2hci and in both probably few ot=
her=20
>> options can be disabled but their compile time is small rather so bett=
er=20
>> leave as they are.
>>
>> Did you tried to create separate gst-plugin-bluez recipe?
>=20
> Not yet, I wanted the easy stuff (bluez, alsa) to get seperated first.

Committed, please report (or better fix :) ) any problems with it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG8BDaMkyGM64RGpERAgFCAJsGSwSH59nQFio5HIgEfCz9yGzvLACgh65H
cuZPF+12wtemuBh+4J4pxZg=3D
=3Dj9DI
-----END PGP SIGNATURE-----


