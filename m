Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1L8EJM-0002Jl-VK
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 14:32:09 +0100
Received: from [172.20.1.5] (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	mB4DSOVR032609 for <openembedded-devel@openembedded.org>;
	Thu, 4 Dec 2008 14:28:24 +0100
Message-Id: <AC214253-0411-451F-9A25-04D0F6174B90@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel <openembedded-devel@openembedded.org>
In-Reply-To: <1228396188.14968.188.camel@hammer.suse.cz>
Mime-Version: 1.0 (Apple Message framework v929.2)
Date: Thu, 4 Dec 2008 14:28:21 +0100
References: <1228384295.14968.63.camel@hammer.suse.cz>
	<gh8ge9$gff$1@ger.gmane.org>
	<1228396188.14968.188.camel@hammer.suse.cz>
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.929.2)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: broken shared-mime-info and MIME typing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Dec 2008 13:32:09 -0000
X-Groupsio-MsgNum: 6839
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-11-981998560"
Content-Transfer-Encoding: 7bit

--Apple-Mail-11-981998560
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 4 dec 2008, om 14:09 heeft Stanislav Brabec het volgende geschreven:

> Koen Kooi wrote:
>
>> * shared-mime-info does *NOT* include freedesktop.org.xml to save  
>> space
>> * mime.bbclass *DOES* check for /usr/bin/update-mime-info
>> * mime.bbclass *DOES* add rdepends to freedesktop.org.xml when needed
>>
>> This means that people not needing freedesktop.org.xml don't get it
>> installed and people that do need it get it installed automagically  
>> when
>> using mime.bbclass
>
> NOTE: adding mime postinst and postrm scripts to libgeda
> NOTE: adding shared-mime-info dependency to libgeda
>
> This would not work. Without freedesktop.org.xml the command
> "update-mime-database /usr/share/mime" will ruin the database.

That does work, had you looked a bit better:

mime.bbclass does:
		rdepends.append("freedesktop-mime-info")

shared-mime-info_0.51.bb does:
		RDEPENDS_freedesktop-mime-info = "shared-mime-info"

So how will that *NOT* install freedesktop.org.xml?

I tested it on 2 devices and it does the right thing:  
freedesktop.org.xml gets installed before the update-mime-database  
command is run.

FWIW: this is a subscriber only list, so quit with the reply-all

--Apple-Mail-11-981998560
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFJN9r3MkyGM64RGpERAs7dAKCRAhqtUdT9LggDWIZYBENNyT1X0wCdHCB5
bELNHX47DDIwpNd2fxS0vDw=
=YLJt
-----END PGP SIGNATURE-----

--Apple-Mail-11-981998560--
