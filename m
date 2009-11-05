Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1N67sz-0007lY-Fr
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 20:20:48 +0100
Received: by bwz9 with SMTP id 9so334557bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 11:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=C2w7ON1g40Iev3+YOoxajmC8uKlCztjZtIMiOlD81CU=;
	b=waPEyXlE/+cX5pnSPZKTYmpzGZ4qL3qQftpjzQVnHUiidyBKCBX0tQEaSgPY44kfBI
	jgR76JJ60Zp3WRyV66ZjXtOqJe4tT4DU1bZ8m12/GUGSHYEvuI5jYHDJJ72OB9GJmmrN
	CdsC4oIqsdKStG7c0VZy3CjGyYdkdycLAVR2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=e13bXIzeywGqrO+GJisc4LX7NDPHkovezMVroOVxI7wtT3jmPrQunF6yRkJddNl6G3
	7SF11Wj7P/4OLhpChA0pnw4gwEDakzqxmfebI5CFMzbKsxGeKxdzuyXsP7ChSEk8HBrb
	jQUNIoKQwGruL5Gk8vMzUo7soBZCASihLHqvk=
MIME-Version: 1.0
Sender: pixdamix@gmail.com
Received: by 10.103.125.23 with SMTP id c23mr1153215mun.41.1257427290095; Thu, 
	05 Nov 2009 05:21:30 -0800 (PST)
In-Reply-To: <4AF2B936.4020105@dresearch.de>
References: <4AF2B936.4020105@dresearch.de>
From: Camille Moncelier <moncelier@devlife.org>
Date: Thu, 5 Nov 2009 14:21:10 +0100
X-Google-Sender-Auth: 0954accd7087cdba
Message-ID: <baaef4710911050521m19cdb480k3460a4715d939563@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg memory problem?
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
X-List-Received-Date: Thu, 05 Nov 2009 19:20:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Is the problem reproducible ? If it's the case can you try using
a more recent version of opkg ?

Graham Gower is working on opkg memory consumption and you *should*
see some improvements...


On Thu, Nov 5, 2009 at 12:38 PM, Steffen Sledz <sledz@dresearch.de> wrote:
> While building a (bigger) image for hipox (arm926ejs) machine: :(
>
> NOTE: Running task 3603 of 3604 (ID: 10,
> /home/DRESEARCH/sledz/work/HydraIP/OE/hipox/recipes/images/hydraip-hipox-=
devimage.bb,
> =A0do_rootfs)
> *** glibc detected *** opkg-cl: realloc(): invalid next size:
> 0x08068908 ***
> =3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
> /lib/libc.so.6[0xb7367654]
> /lib/libc.so.6[0xb736b161]
> /lib/libc.so.6(realloc+0x110)[0xb736bdb0]
> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/li=
bopkg.so.0[0xb76e6d4a]
> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/li=
bopkg.so.0[0xb76db6eb]
> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/li=
bopkg.so.0(opkg_cmd_exec+0x3a)[0xb76d93ca]
> /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.4/staging/i686-linux/usr/lib/li=
bopkg.so.0(opkg_op+0x19e)[0xb76d6ece]


--=20
Camille Moncelier
http://devlife.org/


