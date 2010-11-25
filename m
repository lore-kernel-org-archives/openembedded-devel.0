Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1PLfKD-0001W0-DR
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 18:09:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id DA3452C7DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 17:07:40 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bwz45ROGjX+h
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 17:07:36 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 39A562C798
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 17:07:36 +0000 (UTC)
Message-ID: <4CEE9800.9020601@gmail.com>
Date: Thu, 25 Nov 2010 18:08:16 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CEE737B.4050703@sirius-es.it>
In-Reply-To: <4CEE737B.4050703@sirius-es.it>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sysvinit modify for usb_serial_console
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
X-List-Received-Date: Thu, 25 Nov 2010 17:09:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Matteo Facchinetti ha scritto, Il 25/11/2010 15:32:
> Hi,
>=20
> There are many evaluationboard that use mini-usb port like as a serial
> port + power supply.
> Using it as serial console have to force getty with no need for carrier
> detect.
> For these boards have to use USB_SERIAL_CONSOLE variabile in config fil=
e
> instead of SERIAL_CONSOLE and getty runs with -L parameter.
> By this way is simple to use usb serial port unless know in depth getty
> manpage.
>=20
> Can you merge this patch in mainline?
>=20
> Regards
> Matteo Facchinetti
> Sirius Electronic Systems
>=20

Matteo,
Looks ok to me, thanks.

BTW IIRC your patches should have prefix [PATCH]
http://wiki.openembedded.net/index.php/How_to_submit_a_patch_to_OpenEmbed=
ded

git format-patch --subject-prefix=3D"PATCH" -1


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com




