Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Q8u46-0002Hc-9k
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 14:48:30 +0200
Received: by bwz5 with SMTP id 5so4005713bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 05:46:15 -0700 (PDT)
Received: by 10.204.136.210 with SMTP id s18mr3624484bkt.56.1302439575190;
	Sun, 10 Apr 2011 05:46:15 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.204.102.139 with HTTP; Sun, 10 Apr 2011 05:45:55 -0700 (PDT)
X-Originating-IP: [95.29.102.251]
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Sun, 10 Apr 2011 16:45:55 +0400
X-Google-Sender-Auth: 08qPtmnRIS94MxtKI6eZrUdAgUQ
Message-ID: <BANLkTimWfdubzwi_mXRGatSR_HEauMi77Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Angstrom-2008.1 rudiments are still in master
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
X-List-Received-Date: Sun, 10 Apr 2011 12:48:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello!

Please consider following grep results.

[jay@mozart master]$ grep -r angstrom-2008.1 *
conf/distro/amsdelta-oe.conf:require conf/distro/angstrom-2008.1.conf
conf/distro/foonas.conf:require conf/distro/angstrom-2008.1.conf
conf/distro/iphone-compat.conf:require conf/distro/angstrom-2008.1.conf
conf/distro/nylon.conf:require conf/distro/angstrom-2008.1.conf
conf/distro/angstrom-2010.x.conf:# If you want something stable *right
now*, use angstrom-2008.1
conf/distro/angstrom-2010.x.conf:# Again, in doubt, use DISTRO="angstrom-2008.1"
conf/local.conf.sample:# DISTRO = "angstrom-2008.1"
contrib/buildbot/scripts/full-oe-autobuild:     echo 'DISTRO =
"angstrom-2008.1"' >> "$CONFFILE"
contrib/angstrom/local.conf:DISTRO = "angstrom-2008.1"
docs/usermanual/chapters/getting_oe.xml:DISTRO = "angstrom-2008.1"
recipes/linux/linux-2.6.29/cm-x270/0004-add-build-script.patch:+CROSS_COMPILER_PATH=`cd
/build/oe/oe-stable/build/angstrom-2008.1/tmp/cross/armv5te/bin; pwd`
recipes/xbmc/xbmc/0013-xbmc-RenderSystemGLES.cpp-use-abs-from-standard-libr.patch:Using
`angstrom-2010.x` (GCC 4.5.x) for `MACHINE = "beagleboard"` task
compile fails with the following error. This error does not occur with
`angstrom-2008.1` which uses GCC 4.3.3.

IMHO, at least local.conf.sample entry is critical.

-- 
Yury Bushmelev


