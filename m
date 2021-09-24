Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web12.3381.1632453121167886888
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 20:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: matt@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10001)
	id 705AF214D8; Fri, 24 Sep 2021 11:11:58 +0800 (AWST)
From: matt@codeconstruct.com.au
To: openembedded-devel@lists.openembedded.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: openssh-dev package and populate_sdk conflicts
Message-ID: <94429904ec0c9d75919cda42339a2fafcbc35fe4.camel@codeconstruct.com.au>
MIME-Version: 1.0
User-Agent: Evolution 3.40.0-1
X-Evolution-Identity: 8a6ec185f527b44391a9f0f32804a8254f4c9ddc
X-Evolution-Fcc: folder://2baa14a77b3ebefe087d2f2494aefbe19827d12b/Sent
X-Evolution-Transport: c4f92ad980abab0dd29787dab282f66c412c2626
X-Mutt-Fcc: =.Sent
Date: Fri, 24 Sep 2021 11:08:04 +0800
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi OE list,

Recently OpenBMC merged a change to install openssh-sftp-server package
alongside dropbear sshd [1]. That caused a conflict in "populate_sdk" whi=
ch
installs all available -dev packages [2]. 'openssh-dev' pulls in an
'openssh' -> 'openssh-sshd' dependency which conflicts with 'dropbear' [3=
].

What would be the recommended way to handle that situation? For now OpenB=
MC
has merged a change to disable building openssh-dev (it's empty since
openssh doesn't have libraries) [4].

Should non-library packages handle -dev packages differently? The default=
=A0
-dev package comes from bitbake.conf .

Cheers,
Matt

[1]
https://github.com/openbmc/openbmc/commit/26dbcdbd917e4f22fb400153da0d3e7=
255c8e646
[2]
https://github.com/openbmc/openbmc/blob/49465582e16221caf74cbdea11c87600a=
02bf47b/poky/meta/classes/populate_sdk_base.bbclass#L5

[3] https://github.com/openbmc/openbmc/issues/3819
 *   - package openssh-8.7p1-r0.arm1176jzs conflicts with dropbear provid=
ed
by dropbear-2020.81-r0.arm1176jzs
 *   - package openssh-dev-8.7p1-r0.arm1176jzs requires openssh =3D 8.7p1=
-r0,
but none of the providers can be installed

[4] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/47089
