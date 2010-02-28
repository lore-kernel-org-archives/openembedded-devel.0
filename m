Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nlp1j-0003TY-Gp
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 20:42:17 +0100
Received: by gwj22 with SMTP id 22so820771gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 11:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=N+QUiPZHl/torRrE3KdtoxE6VlcTfFGbRQ5VoJ5IAjw=;
	b=trspina3f08uTuLW1zCKp2aAz2f1LSHtlHBxJUvDXRGzJje6KNehZRXrAYCx5hPJmO
	gR7RYjvyGAtfqqjj/L9UIg2YSxT0BS1LXajEh4Zdu85fGhznHCUTYMEmfIU7suO07YaK
	jFoAhy71uNmxD5pUedwWIoVEDN8Zo5qG6ixY0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=B83uSR9aBHXRZrKpkRZnaTF5cANvSzm9GEODb7yAdTTQsjdUhe8WYeJzZqPGAN0cMR
	t/D7p5fPP9efVKBcIRPFj5mHRBrlMiOPxLBJ5n+RtDNABwB+94evTplrTP2FW+dzJms2
	xX7uCkRyssM7+fdbFP+eAmxk1UCkLxWDvqFnU=
MIME-Version: 1.0
Received: by 10.101.212.30 with SMTP id o30mr2204466anq.182.1267385957948; 
	Sun, 28 Feb 2010 11:39:17 -0800 (PST)
Date: Sun, 28 Feb 2010 20:39:17 +0100
Message-ID: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Sun, 28 Feb 2010 19:42:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
Only a few versions are used (see also the grep below)

for glib-2.0:
"2.12.12"
"2.16.4"
"2.18.3"
"2.20.3"
"2.22.1"
"2.22.4"
"2.6.4"
"2.8.6"

for glib-2.0-native:
"2.16.1"
"2.18.0"
"2.22.1"
"2.22.4"

Both include the last two versions
Proposal is to remove all versions that are not used.

How do people feel about this?

Frans


 frans@linux-suse:~/oe/openembedded/recipes/glib-2.0> ls
bug-556515.patch  glib-2.0-2.16.3         glib-2.0-native_2.12.4.bb
glib-2.0_2.12.13.bb  glib-2.0_2.18.1.bb
files             glib-2.0-2.16.4         glib-2.0-native_2.16.1.bb
glib-2.0_2.12.6.bb   glib-2.0_2.18.3.bb
glib-2.0-2.12.10  glib-2.0-2.16.5         glib-2.0-native_2.18.0.bb
glib-2.0_2.12.9.bb   glib-2.0_2.2.3.bb
glib-2.0-2.12.11  glib-2.0-2.18.0         glib-2.0-native_2.2.3.bb
glib-2.0_2.14.0.bb   glib-2.0_2.20.3.bb
glib-2.0-2.12.12  glib-2.0-2.18.1         glib-2.0-native_2.22.1.bb
glib-2.0_2.14.1.bb   glib-2.0_2.20.4.bb
glib-2.0-2.12.13  glib-2.0-2.18.3         glib-2.0-native_2.4.6.bb
glib-2.0_2.14.4.bb   glib-2.0_2.22.1.bb
glib-2.0-2.12.9   glib-2.0-2.2.3          glib-2.0-native_2.6.5.bb
glib-2.0_2.15.6.bb   glib-2.0_2.22.4.bb
glib-2.0-2.14.0   glib-2.0-2.20.3         glib-2.0-native_2.6.6.bb
glib-2.0_2.16.1.bb   glib-2.0_2.4.6.bb
glib-2.0-2.14.1   glib-2.0-2.20.4         glib-2.0.inc
glib-2.0_2.16.3.bb   glib-2.0_2.6.4.bb
glib-2.0-2.14.4   glib-2.0-2.22.1         glib-2.0_2.12.10.bb
glib-2.0_2.16.4.bb   glib-2.0_2.6.6.bb
glib-2.0-2.15.6   glib-2.0-2.22.4         glib-2.0_2.12.11.bb
glib-2.0_2.16.5.bb   glib-2.0_2.8.6.bb
glib-2.0-2.16.1   glib-2.0-native-2.12.4  glib-2.0_2.12.12.bb
glib-2.0_2.18.0.bb   glib.inc
frans@linux-suse:~/oe/openembedded/recipes/glib-2.0> grep PREFERENCE *
glib-2.0_2.16.3.bb:DEFAULT_PREFERENCE = "-1"
glib-2.0_2.16.4.bb:DEFAULT_PREFERENCE = "-1"
glib-2.0_2.16.5.bb:DEFAULT_PREFERENCE = "-1"
frans@linux-suse:~/oe/openembedded/recipes/glib-2.0> grep -r glib-2.0 ../../conf
../../conf/distro/micro.conf:USE_NLS_glib-2.0 = "yes"
../../conf/distro/micro.conf:USE_NLS_glib-2.0-native = "yes"
../../conf/distro/chinook-compat.conf:PREFERRED_VERSION_glib-2.0
  = "2.12.12"
../../conf/distro/chinook-compat.conf:PKG_glib-2.0 = "libglib2.0-0"
../../conf/distro/maemo5-compat.conf:PREFERRED_VERSION_glib-2.0
 = "2.20.3"
../../conf/distro/maemo5-compat.conf:PKG_glib-2.0 = "libglib2.0-0"
../../conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_VERSION_glib-2.0
	= "2.22.4"
../../conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_VERSION_glib-2.0-native
= "2.22.4"
../../conf/distro/include/kaeilos-2009-preferred-versions.inc:PREFERRED_VERSION_glib-2.0
	= "2.22.4"
../../conf/distro/include/kaeilos-2009-preferred-versions.inc:PREFERRED_VERSION_glib-2.0-native
= "2.22.4"
../../conf/distro/include/preferred-gpe-versions-2.7.inc:PREFERRED_VERSION_glib-2.0
?= "2.6.4"
../../conf/distro/include/angstrom-uclibc.inc:USE_NLS_glib-2.0 = "yes"
../../conf/distro/include/angstrom-uclibc.inc:USE_NLS_glib-2.0-native = "yes"
../../conf/distro/include/sane-toolchain-uclinux-uclibc.inc:USE_NLS_glib-2.0
= "yes"
../../conf/distro/include/sane-toolchain-uclinux-uclibc.inc:USE_NLS_glib-2.0-native
= "yes"
../../conf/distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_glib-2.0
?= "2.16.4"
../../conf/distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_glib-2.0-native
?= "2.16.1"
../../conf/distro/include/slugos.inc:# glib-2.0 builds require USE_NLS
to be overridden
../../conf/distro/include/slugos.inc:USE_NLS_glib-2.0 = "yes"
../../conf/distro/include/slugos.inc:USE_NLS_glib-2.0-native = "yes"
../../conf/distro/include/preferred-shr-versions.inc:PREFERRED_VERSION_glib-2.0
     = "2.22.4"
../../conf/distro/include/preferred-shr-versions.inc:PREFERRED_VERSION_glib-2.0-native
= "2.22.4"
../../conf/distro/include/preferred-slugos-versions.inc:PREFERRED_VERSION_glib-2.0			?=
"2.22.1"
../../conf/distro/include/preferred-slugos-versions.inc:PREFERRED_VERSION_glib-2.0-native		?=
"2.22.1"
../../conf/distro/include/preferred-om-2009-versions.inc:PREFERRED_VERSION_glib-2.0
     = "2.18.3"
../../conf/distro/include/preferred-om-2009-versions.inc:PREFERRED_VERSION_glib-2.0-native
= "2.18.0"
../../conf/distro/include/angstrom-uclinux-uclibc.inc:USE_NLS_glib-2.0 = "yes"
../../conf/distro/include/angstrom-uclinux-uclibc.inc:USE_NLS_glib-2.0-native
= "yes"
../../conf/distro/include/maemo-preferred.inc:PREFERRED_VERSION_glib-2.0
= "2.6.4"
../../conf/distro/include/preferred-gpe-versions-2.8.inc:PREFERRED_VERSION_glib-2.0
?= "2.8.6"
../../conf/distro/include/sane-toolchain-uclibc.inc:USE_NLS_glib-2.0 = "yes"
../../conf/distro/include/sane-toolchain-uclibc.inc:USE_NLS_glib-2.0-native
= "yes"


