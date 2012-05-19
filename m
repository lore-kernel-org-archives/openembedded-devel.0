Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.oe@pilsoft.com>) id 1SVp7r-0002ym-Ij
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 May 2012 21:15:40 +0200
Received: by wibhm14 with SMTP id hm14so1011552wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2012 12:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=1aNDDDkHne1lNHpJOkokzcRcWjRqxUQ4Ld3OQ2aLf8o=;
	b=CHfJrfJ2uut5QBgPTQozgygHjNARV2HEHT0YSqhK+S1RNjHsTwobcult/ARq6wj7MX
	9BPkTp0Oxqqkq9iWITjsp+pG0uzf0U9gIEl9W4o/8LqAfrxukfh6IDxjlrmUnPt534IE
	a3HYh5B4NCuhPQTJ9OCRuh4L/0hYOYfilxhYfwcqpe+o5DNJBUQxvDGeiQuRfyzmxN6u
	xv05iFhFRSsaTRhbEIwkWdft0N+oXsz6XoDYLgAAar2biODQVs8YxWMpE0/AcUjd0KRI
	zemdxphWyeOMyn4/Nj0AC49H6CbK+34CZ/96JRzZayWmYtp9tXoX8QOc0NavGQHTxUZu
	Qzrg==
Received: by 10.216.144.145 with SMTP id n17mr9734219wej.101.1337454334161;
	Sat, 19 May 2012 12:05:34 -0700 (PDT)
Received: from [192.168.33.16] (mna75-2-82-67-197-228.fbx.proxad.net.
	[82.67.197.228])
	by mx.google.com with ESMTPS id q6sm3453354wiy.0.2012.05.19.12.05.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 May 2012 12:05:33 -0700 (PDT)
From: David Hemmo <david.oe@pilsoft.com>
Date: Sat, 19 May 2012 21:05:30 +0200
Message-Id: <99A56572-FA13-4165-A425-D055A777569C@pilsoft.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnxpzWz1/u/ujXqGGUMtWcLNYO5khb1JSEDt0uK5RIjl32W2cOY+Lwm6SyEGR2ZK0kYEQfs
Subject: Debian packages and angstrom
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
X-List-Received-Date: Sat, 19 May 2012 19:15:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello,

When I set ANGSTROM_PKG_FORMAT =3D "deb"in my local.conf file, I get the =
error:

These are usually caused by circular dependencies and any circular =
dependency chains found will be printed below. Increase the debug level =
to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:=20
Dependency loop #1 found:
  Task 56 =
(virtual:native:/home/owner/dvt/OE/angstrom/sources/openembedded-core/meta=
/recipes-devtools/dpkg/dpkg_1.15.8.7.bb, do_install) (dependent Tasks =
['dpkg, do_compile'])
  Task 57 =
(virtual:native:/home/owner/dvt/OE/angstrom/sources/openembedded-core/meta=
/recipes-devtools/dpkg/dpkg_1.15.8.7.bb, do_populate_sysroot) (dependent =
Tasks ['dpkg, do_install'])
  Task 60 =
(virtual:native:/home/owner/dvt/OE/angstrom/sources/openembedded-core/meta=
/recipes-devtools/dpkg/dpkg_1.15.8.7.bb, do_configure) (dependent Tasks =
['autoconf, do_populate_sysroot', 'gnu-config, do_populate_sysroot', =
'gettext, do_populate_sysroot', 'automake, do_populate_sysroot', =
'gettext-minimal-native, do_populate_sysroot', 'dpkg, do_patch', 'dpkg, =
do_populate_sysroot', 'libtool-native, do_populate_sysroot', 'zlib, =
do_populate_sysroot'])
  Task 61 =
(virtual:native:/home/owner/dvt/OE/angstrom/sources/openembedded-core/meta=
/recipes-devtools/dpkg/dpkg_1.15.8.7.bb, do_compile) (dependent Tasks =
['dpkg, do_configure'])

Can someone help me fix this issue ?

I tried PACKAGE_CLASSES =3D "package_deb" but angstrom overrides it=20

The main reason I try to compile with debian packages is because I want =
to be able to use apt-get to add packages to my distribution (mainly =
apt-get install ubuntu-omap4-extras). Do you know another way of doing =
that without forcing angstrom to use debian packages ?

Thanks

David



