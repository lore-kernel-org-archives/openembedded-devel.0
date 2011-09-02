Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wckong@gmail.com>) id 1QzO5p-0001Cd-7v
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 09:23:13 +0200
Received: by iagz35 with SMTP id z35so2846788iag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Sep 2011 00:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=z7b4fbLP1BVDO4kW+nOOeRpnh/XHnRlVdBYyRbyKDN0=;
	b=OvpAIe+cKn2kic+zpH6aSx65SsjQQDCxRby1Zl00t1C3LTT2DUe9raa9v0l6WaslZ5
	dmFRkj6ufrJMHsErJLzQuqu4+zBfzefwtITKoz1HK+QxKSxhowFRALYxB2d3gm22tWhK
	PpyGMOyYAnSSbAN0Ec/Qxnx8FaHE1q39irEWs=
Received: by 10.231.57.90 with SMTP id b26mr1476814ibh.6.1314947896074; Fri,
	02 Sep 2011 00:18:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.9.197 with HTTP; Fri, 2 Sep 2011 00:17:56 -0700 (PDT)
From: Wei Kong <wckong@gmail.com>
Date: Fri, 2 Sep 2011 17:17:56 +1000
Message-ID: <CAJR9bDJehg1CPqTBDyn12nFa048Vb1JwfPF7W96pj6ZfA-aHQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: package trying to link to /usr/lib/.lib instead of /usr/lib during staging
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
X-List-Received-Date: Fri, 02 Sep 2011 07:23:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

During compilation, for some reason, the linker attempts to look for
libraries in the wrong directory.

In this log output, I was attempting to compile the ace library:

| i486-angstrom-linux-g++:
~/oe/angstrom/setup-scripts/build/tmp-angstrom_2008_1/sysroots/486sx-angstrom-linux/usr/lib/.libs/libstdc++.so:
No such file or directory
| make[3]: *** [libACE.la] Error 1
| make[3]: Leaving directory
`~/oe/angstrom/setup-scripts/build/tmp-angstrom_2008_1/work/486sx-angstrom-linux/ace-5.6.8-r0/build.i486-angstrom-linux/ace'

I have verified that the libstdc++.so library does exist
at  ~/oe/angstrom/setup-scripts/build/tmp-angstrom_2008_1/sysroots/486sx-angstrom-linux/usr/lib,
and that the .lib subdirectory does not exist at all.

I had to alter the default recipe as autoconf was generating an unusable
configure file. Below is my recipe:

------------- ace.inc ----------------
DESCRIPTION = "C++ network programming framework"
SECTION = "net"
LICENSE = "http://www.cs.wustl.edu/~schmidt/ACE-copying.html"

DEPENDS += "openssl gperf-native"

SRC_URI = "
ftp://download.dre.vanderbilt.edu/previous_versions/ACE-${PV}.tar.bz2"
S = "${WORKDIR}/ACE_wrappers"
B = "${WORKDIR}/build.${TARGET_SYS}"

EXTRA_OECONF += "--disable-ace-tests --disable-gperf"
LEAD_SONAME = "libACE-[0-9.]*.so"



do_configure() {
${S}/configure --libdir=${STAGING_LIBDIR}
}

do_compile() {
make
}

do_install() {
DESTDIR=${D} oe_runmake install
}

--------------------------------------------

Thanks in advance for any assistance.

Wei

