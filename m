Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RwMoG-0007OY-2A for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 00:56:52 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RwMgN-0003Oa-H9 for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 00:48:43 +0100
Received: from 108.60.121.130 ([108.60.121.130])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 00:48:43 +0100
Received: from koen by 108.60.121.130 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 00:48:43 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 12 Feb 2012 00:48:35 +0100
Message-ID: <jh6uoh$nnj$1@dough.gmane.org>
References: <Pine.LNX.4.64.1202111600300.3065@www.vctlabs.com>
	<CAHQecY5ARQUHqUScJqReFO_mD3t_U-ViMYQrS=Rox-xoGR3k-A@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 108.60.121.130
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <CAHQecY5ARQUHqUScJqReFO_mD3t_U-ViMYQrS=Rox-xoGR3k-A@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: OE scons cross-compile patch
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
X-List-Received-Date: Sat, 11 Feb 2012 23:56:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Shouldn't these go to the oe-core list?

Op 12-02-12 00:24, Tom King schreef:
> ---------- Forwarded message ---------- From: S. Lockwood-Childs
> <sjl@vctlabs.com> Date: Sat, Feb 11, 2012 at 4:03 PM Subject: OE scons
> cross-compile patch To: ka6sox@gmail.com
> 
> 
> commit 9f66f474614696154d50156ada5f4c**1629b1b28c Author: S
> Lockwood-Childs <sjl@vctlabs.com> Date:   Sat Feb 11 15:07:17 2012 -0800
> 
> cross-compile support for SCons
> 
> scons build system searches paths for hard-coded tool names like "gcc", 
> so this patch teaches it to check first for a tool with cross-compile 
> prefix if the CROSS_COMPILE variable has been set. If not found, it falls
> back to searching for the un-prefixed tool name.
> 
> For example, if CROSS_COMPILE=arm-angstrom-**linux-gnueabi- 
> SCons.Evironment.Detect('gcc') should find
> arm-angstrom-linux-gnueabi-gcc SCons.Evironment.Detect('zip') should find
> plain zip
> 
> diff --git
> a/meta/recipes-devtools/**python/python-scons-native/**scons-cross-toolchain.patch
>
> 
b/meta/recipes-devtools/**python/python-scons-native/**
> scons-cross-toolchain.patch new file mode 100644 index 0000000..041279e 
> --- /dev/null +++
> b/meta/recipes-devtools/**python/python-scons-native/** 
> scons-cross-toolchain.patch @@ -0,0 +1,17 @@ +---
> scons-2.1.0/engine/SCons/**Environment.py.orig       2012-02-10 
> 16:59:10.000000000 -0800 ++++ scons-2.1.0/engine/SCons/**Environment.py
> 2012-02-11 13:29:15.000000000 -0800 +@@ -1483,6 +1483,14 @@ +         if
> not SCons.Util.is_List(progs): +             progs = [ progs ] +
> for prog in progs: ++            # prefer cross version of program, if it
> exists ++            if 'CROSS_COMPILE' in self._dict: ++
> cross_prog = self['CROSS_COMPILE'] + prog ++                #print
> "Looking for %s" % cross_prog ++                path =
> self.WhereIs(cross_prog) ++                if path: return cross_prog ++ 
> ++            #print "Looking for %s" % prog +             path =
> self.WhereIs(prog) +             if path: return prog +         return
> None diff --git
> a/meta/recipes-devtools/**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>b/meta/recipes-devtools/
>
> 
**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>
> index ff94cf6..c653237 100644 ---
> a/meta/recipes-devtools/**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>
>
> 
+++
b/meta/recipes-devtools/**python/python-scons-native_2.**1.0.bb<http://python-scons-native_2.1.0.bb>
> @@ -2,4 +2,6 @@ require python-scons_${PV}.bb inherit native DEPENDS =
> "python-native" RDEPENDS_${PN} = "" -PR = "r1" +PR = "r2" + +SRC_URI +=
> "file://scons-cross-toolchain.**patch"
> 
> 
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk82/lEACgkQMkyGM64RGpG8OQCfcZk0EZs2iyyTwnJsAxpFOZvm
z+EAoJlGm6KD41LyaFpN3hgMQC3LDitY
=Lp55
-----END PGP SIGNATURE-----



