Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.oe@pilsoft.com>) id 1SW0ze-0007DF-Ti
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2012 09:55:58 +0200
Received: by wgbdr1 with SMTP id dr1so3506805wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2012 00:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=VCWCPl5tLJkZKO8ggb8ZzrVv9Y8Vp8sjw9R04aAlH6A=;
	b=QyR3p/cKE0eQxZG0h54jqvB73MILo+jk02LhTSlpWaYBQz9wT5zsGOGm/DJ9uUJMl0
	j18LJlFFxaTE25S0oCAZ0rEXXbaIRNC3ECvaHHPnzsr0/BOw3hpZL5/jjrE2Y9KcFMHG
	438gh3LXObeyD69MIceIImIhgoYGjWSBm6g0kygmDMKGEfnhZMauvMaizZ9ULT1n04rR
	io4U9fE71//l+G6x6FCNWYxxGgVDKYq96M855+dz45PlOLdqdVpRGJw6WgYVl8D0cfMx
	Im8wkifUrDXwdmxi0uGHwdY8+5M6n/qC6d8rqEedAJy9sI4tHpwB6hh1NwVOk61UwxZE
	xobw==
Received: by 10.180.95.137 with SMTP id dk9mr5914494wib.1.1337499952762;
	Sun, 20 May 2012 00:45:52 -0700 (PDT)
Received: from [192.168.33.16] (mna75-2-82-67-197-228.fbx.proxad.net.
	[82.67.197.228])
	by mx.google.com with ESMTPS id fn2sm24534842wib.0.2012.05.20.00.45.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 00:45:51 -0700 (PDT)
From: David Hemmo <david.oe@pilsoft.com>
Date: Sun, 20 May 2012 09:45:49 +0200
Message-Id: <5BBA8501-FFFB-4A1D-A111-BC4F1665FC9E@pilsoft.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQneJ/VvuFWk4v3nWLMWZUmdw1BNKgUdmUuNNrMBG6DgGwV0axU2xcTX80G0eVHdV0xUy1MY
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
X-List-Received-Date: Sun, 20 May 2012 07:55:59 -0000
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

PS: I am sorry my previous post appeared as an answer to an unrelated =
topic. I guess I did something wrong :-(=


