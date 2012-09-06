Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9ZvL-0000AN-V1 for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:07:04 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9ZjM-0002kW-Ai for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 12:54:40 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 12:54:40 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 12:54:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 06 Sep 2012 12:54:32 +0200
Message-ID: <k29vct$ma5$1@ger.gmane.org>
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
	<50486464.7050704@communistcode.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <50486464.7050704@communistcode.co.uk>
X-Enigmail-Version: 1.4.4
Subject: Re: [PATCHv4 1/3] libplist: add upstream patch to fix parallel make issue
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
X-List-Received-Date: Thu, 06 Sep 2012 11:07:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-09-12 10:52, Jack Mitchell schreef:
> On 05/09/12 16:21, ml@communistcode.co.uk wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> 
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk> --- 
>> .../libimobiledevice/files/fix-parallel-make.patch  | 21 
>> +++++++++++++++++++++ .../libimobiledevice/libplist_1.8.bb
>> |  5 ++++- 2 files changed, 25 insertions(+), 1 deletion(-) create mode
>> 100644 
>> meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
>>
>>
>> 
diff --git
>> a/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
>>
>> 
b/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
>> new file mode 100644 index 0000000..f6ef6f4 --- /dev/null +++
>> b/meta-oe/recipes-extended/libimobiledevice/files/fix-parallel-make.patch
>>
>> 
@@ -0,0 +1,21 @@
>> +From 335b25febd4c864ad0ac08479f5cd43fc21b7d73 Mon Sep 17 00:00:00
>> 2001 +From: Nikias Bassen +Date: Mon, 09 Jul 2012 21:17:15 +0000 
>> +Subject: Fix building with parallel build makeopts + +--- +diff --git
>> a/CMakeLists.txt b/CMakeLists.txt +index 0bad840..155994e 100644 +---
>> a/CMakeLists.txt ++++ b/CMakeLists.txt +@@ -57,6 +57,8 @@
>> ADD_SUBDIRECTORY( plutil ) + ADD_SUBDIRECTORY( include ) +
>> ADD_SUBDIRECTORY( test ) + ++ADD_DEPENDENCIES( plist libcnary ) ++ + IF
>> ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND ) +
>> ADD_SUBDIRECTORY( swig ) + ENDIF ( SWIG_FOUND AND PYTHONLIBS_FOUND AND
>> PYTHONINTERP_FOUND ) +-- +cgit v0.9.0.2 diff --git
>> a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb 
>> b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb index
>> 9c218fb..2da8058 100644 ---
>> a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb +++
>> b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb @@ -8,7
>> +8,10 @@ DEPENDS = "libxml2 glib-2.0 swig python" inherit cmake
>> pkgconfig -SRC_URI =
>> "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2" 
>> +SRC_URI =
>> "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \ +
>> file://fix-parallel-make.patch \ +" + SRC_URI[md5sum] =
>> "2a9e0258847d50f9760dc3ece25f4dc6" SRC_URI[sha256sum] = 
>> "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
>> 
> 
> With all the chatter this has got a bit lost. I believe everyone is now
> happy so this patch set is ready to merge.

I'll take a look at merging these (and the imobiledevice ones) later today.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQSIDoMkyGM64RGpERAuc3AJ0ZHjqckjDHQv5NXjpCadb6NmJgTgCfVmjP
tL/6M3kCecfg1fCdqNtKu88=
=/z2q
-----END PGP SIGNATURE-----



