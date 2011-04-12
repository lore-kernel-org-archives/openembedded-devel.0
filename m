Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q9jIO-0002Y4-9f
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 21:30:40 +0200
Received: by fxm19 with SMTP id 19so5277304fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 12:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=kcirct/sGfAs/JM2kIpK2svNicRBvw5G4Nxi04JSGts=;
	b=Cl21/XO7ARDuocPGSNVjUnu6wHauHx4DEdnP8QWWfaDZHtZ6JENMF6F6gYfb+Y9JmG
	YYKKa2yAdrFZGFtAFIb1dusOpWBUc/vHk5XW/jfjyf0y/+Ps4GD1y9YAkuC2Rsk165Tj
	9KYj9/6bmr71qkgU9VkSB6at8KRbsJNZJ4RoI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iz3Uop6wd+tKA4EOSl3LjuhoykdgWcpKE3xSG46BA1gADNhE7LMs74BZBlV9zTjIyc
	hTZDRvweGs+TpEY+1JbDvwF4lGSQTSHOZhRUpC1JO5oQbmQvNMsWtiIAZO+zegPSM90I
	oJI5ocZ/1Ib0UCaaKbAu0hXBY0+AjtKyKsb/k=
Received: by 10.223.54.219 with SMTP id r27mr158975fag.124.1302636505904;
	Tue, 12 Apr 2011 12:28:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c21sm2095656fac.46.2011.04.12.12.28.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Apr 2011 12:28:24 -0700 (PDT)
Date: Tue, 12 Apr 2011 21:28:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110412192818.GD21027@jama.jama.net>
References: <531B6536C9F737458807DF75064873C801CE0CD63514@mta-digimail.MTA.INT>
MIME-Version: 1.0
In-Reply-To: <531B6536C9F737458807DF75064873C801CE0CD63514@mta-digimail.MTA.INT>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: issue building the rule "gnome/gconf-dbus_svn.bb"
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
X-List-Received-Date: Tue, 12 Apr 2011 19:30:40 -0000
X-Groupsio-MsgNum: 31135
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Content-Disposition: inline

--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2011 at 04:05:28PM +0200, Bosi Daniele wrote:
> Hi Guys,
> I can't build the rule gcnf-dbus_svn.bb.
>=20
> the problem seems to be that the svn server
> svn://developer.imendio.com/svn/gconf-dbus
> is not working anymore.
>=20
> Does anyone know a mirror for this site? Or a fix for the not working rul=
e?

Depends on revision
trunk_developer.imendio.com_.svn.gconf-dbus_705_.tar.gz
is avaliable on yocto mirror
http://autobuilder.yoctoproject.org/downloads/yocto-1.0/sources/

>=20
> This is the output I see on the terminal when I build
>=20
> NOTE: Handling BitBake files: \ (6705/6705) [100 %]
> NOTE: Parsing finished. 6405 cached, 0 parsed, 300 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 638 of 942 (ID: 1, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_setscene)
> NOTE: Running task 639 of 942 (ID: 2, /opt/OE/org.cnh_fred.dev/recipes/gn=
ome/gconf-dbus_svn.bb, do_fetch)
> NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=3Dtrunk;pro=
to=3Dhttp
> svn: Server sent unexpected return value (504 Gateway Time-out) in respon=
se to OPTIONS request for 'http://developer.imendio.com/svn/gconf-dbus/trun=
k'
> NOTE: Task failed: Fetch failed: Fetch command export SSH_AUTH_SOCK=3D/tm=
p/keyring-Clq4Sq/ssh; export PATH=3D/opt/OE/build_cnh_fred/tmp.1/staging/i6=
86-linux/usr/bin/ppce300c3-linux:/opt/OE/build_cnh_fred/tmp.1/staging/i686-=
linux/usr/bin/ppce300c3-linux:/opt/OE/build_cnh_fred/tmp.1/staging/i686-lin=
ux/usr/sbin:/opt/OE/build_cnh_fred/tmp.1/staging/i686-linux/usr/bin:/opt/OE=
/build_cnh_fred/tmp.1/cross/ppce300c3/bin:/opt/OE/build_cnh_fred/tmp.1/stag=
ing/i686-linux/sbin:/opt/OE/build_cnh_fred/tmp.1/staging/i686-linux/bin:/us=
r/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; /usr/=
bin/env svn co -r 641 http://developer.imendio.com/svn/gconf-dbus/trunk@641=
 trunk failed with signal 1, output:
> svn: Server sent unexpected return value (504 Gateway Time-out) in respon=
se to OPTIONS request for 'http://developer.imendio.com/svn/gconf-dbus/trun=
k'
>=20
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb =
do_fetch failed
> ERROR: Task 2 (/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb, =
do_fetch) failed
> NOTE: Tasks Summary: Attempted 638 tasks of which 637 didn't need to be r=
erun and 1 failed.
> ERROR: '/opt/OE/org.cnh_fred.dev/recipes/gnome/gconf-dbus_svn.bb' failed
>=20
>=20
> Thanks in advance
> Daniele
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2kp9IACgkQN1Ujt2V2gBzTfACffPYpIDKefXeNN36G9hgSVldw
ahUAn0+LLuQsz5Cq6tqKozBZp2FBa9hD
=GGJw
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
