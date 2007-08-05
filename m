Received: from [212.47.7.226] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IHmda-0005Xx-S3
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 22:23:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 33A34309B4ED
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2007 22:21:22 +0200 (CEST)
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (penguin [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07840-02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Aug 2007 22:21:22 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id C6B0B309B3EA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2007 22:21:21 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B5FA73.5030107@klever.net>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
	<46B25E0A.7050103@klever.net>
	<1186128296.6116.5.camel@localhost.localdomain>
	<46B2F6B9.7050605@klever.net>
	<1186313341.5962.32.camel@localhost.localdomain>
	<46B5FA73.5030107@klever.net>
Date: Sun, 05 Aug 2007 22:21:19 +0200
Message-Id: <1186345280.10980.13.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at penguin.cz
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Sun, 05 Aug 2007 20:23:43 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Michael Krelin p=ED=B9e v Ne 05. 08. 2007 v 18:27 +0200:
> >> About getting 'sysroot' right... Doesn't the name imply using in sys=
root
> >> the same layout like you would otherwise?
> >=20
> > No, as I understand it sysroot makes assumptions about where the file=
s
> > live under it. It assumes "/lib" and "/usr/lib" and its those
> > assumptions which I dislike. I haven't seen a way to change them but =
I
> > could easily be missing something.
>=20
> I think it's not exactly what it assumes. It assumes that what would be
> /usr/lib/ without sysroot would be ${sysroot}/usr/lib/
>=20
> > If gcc does change them based on the values of prefix, libdir etc whe=
n
> > compiled, that would be a bit better but its still hardcoding things
> > into the compiler which I don't think should be hardcoded there. Does
> > anyone know if it adapts to changes in prefix. libdir and friends?
>=20
> I think if you compile it with /opt/gcc prefix it would look in
> ${sysroot}/opt/gcc for whatever he wants based on his prefix and if you
> -I/i-hate-fhs/ it would look into ${sysroot}/i-hate-fhs/

Yes, --sysroot prefixes all -I and -L and similar paths with sysroot
value. But it does not touch other paths, so -DUGLYPATH=3D"/i-hate-fhs" o=
r
-Wl,-rpath -Wl,/i-hate-fhs will remain untouched. It is what one should
expect - only compile-time paths are changes.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utxzaurus



