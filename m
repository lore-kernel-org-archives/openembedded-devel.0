Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IWXIr-0001iK-WB
	for openembedded-devel@openembedded.org; Sat, 15 Sep 2007 15:03:20 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8FCxkxW008181 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2007 14:59:46 +0200
Message-ID: <46EBD74D.6030501@dominion.kabel.utwente.nl>
Date: Sat, 15 Sep 2007 14:59:57 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200709111318.52432.openembedded@haerwu.biz>	<46EA57E9.4020202@dominion.kabel.utwente.nl>	<46EB97FE.1030906@student.utwente.nl>
	<200709151431.07995.openembedded@haerwu.biz>
In-Reply-To: <200709151431.07995.openembedded@haerwu.biz>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l8FCxkxW008181
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
X-List-Received-Date: Sat, 15 Sep 2007 13:03:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz schreef:
> Dnia sobota, 15 wrze=C5=9Bnia 2007, Koen Kooi napisa=C5=82:
>> Koen Kooi schreef:
>>> Marcin Juszkiewicz schreef:
>>>> Dnia pi=C4=85tek, 14 wrze=C5=9Bnia 2007, Koen Kooi napisa=C5=82:
>>>>> What can be done is to make the default bluez-utils build only
>>>>> build bluez-utils* and have seperate recipes for all the 3rdparty
>>>>> stuff it builds:
>>>>> That would solve both buildtime and runtime issues.
>>>>>
>>>>> What do you think?
>>>> bluez-utils-cups, bluez-utils-gstreamer, bluez-utils-alsa? Sounds
>>>> good for me - especially first both.
>>> bluez-utils-cups and bluez-utils-alsa can be done for sure, but I
>>> haven't looked at where gstreamer comes in and if it can be a
>>> seperate package.
>> What do you think of this patch?
>=20
> Looks ok - in cups you can disable hid2hci and in both probably few oth=
er=20
> options can be disabled but their compile time is small rather so bette=
r=20
> leave as they are.
>=20
> Did you tried to create separate gst-plugin-bluez recipe?

Not yet, I wanted the easy stuff (bluez, alsa) to get seperated first.

regards,

Koen



