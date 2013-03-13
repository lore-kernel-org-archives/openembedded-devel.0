Received: from mail-yh0-f51.google.com ([209.85.213.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFode-0006on-JH
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:34:53 +0100
Received: by mail-yh0-f51.google.com with SMTP id q1so198056yhf.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=69MYdPwtiELFQevVOrdhRlxxily9PkyxrtoFON4nGg4=;
	b=apf3NEypwW4IRhFpVaMdbpxqGE43eHz/hkw7z6c8AO/sC8DBpQu68nN4DNQUYu1ndl
	LyiSQ49i8//QCFOicEs8OouUOGeCz6xUeUQ/iDLg9T4F0GSoQ7zmt98c8yG7BR051te0
	8zRfR2YxAfiiG+53Lbqpt7iCmL2ElRmyEjnKJUdVPjHYjbRSJ0L+MAAgmctIrk0bg8qv
	ZmMmpbERfIg0MgVJvY4Acw/EUs0lyaT1b7+mdi1M7qnkfSKfsg25izTtfhAIqybBE9xN
	dBErWczfY1aoLFUa40DltB/5I7hUe0S1r8975v2UMykUZhxLIcRsAZ5RXvGZRsbw9jOA
	aX6g==
X-Received: by 10.236.82.174 with SMTP id o34mr16186885yhe.107.1363191489325; 
	Wed, 13 Mar 2013 09:18:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g27sm36210666yhm.21.2013.03.13.09.18.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:18:08 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:18:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313161800.GK3260@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: minidlna missing some DEPENDS?
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
X-List-Received-Date: Wed, 13 Mar 2013 16:34:58 -0000
X-Groupsio-MsgNum: 43521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DozTQjXnjm3C9Xhk"
Content-Disposition: inline

--DozTQjXnjm3C9Xhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,=20

minidlna build for qemuarm fails with:

| Linking minidlna
| arm-oe-linux-gnueabi-gcc: error: getifaddr.o: No such file or directory
| arm-oe-linux-gnueabi-gcc: error: sql.o: No such file or directory
| arm-oe-linux-gnueabi-gcc: error: inotify.o: No such file or directory
| make: *** [minidlna] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/minidlna/1.0.25-r0/temp=
/log.do_compile.21922 for further information)
NOTE: recipe minidlna-1.0.25-r0: task do_compile: Failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DozTQjXnjm3C9Xhk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAprgACgkQN1Ujt2V2gBxheACeKZIPomvOiglZM++RGt4KXZz1
0QgAoJRJzzA2z01LF29g+SbGDQzVTRDB
=KKVu
-----END PGP SIGNATURE-----

--DozTQjXnjm3C9Xhk--
