Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0D860088
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2015 08:53:09 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1aDq1i-0007yZ-Gn for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2015 09:53:06 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2015 09:53:06 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2015 09:53:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 29 Dec 2015 09:52:50 +0100
Message-ID: <n5thl2$r1f$1@ger.gmane.org>
References: <cover.1451029460.git.jackie.huang@windriver.com>
	<n5rfsr$342$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
In-Reply-To: <n5rfsr$342$1@ger.gmane.org>
Subject: Re: [meta-java][PATCH 00/15] meta-java: fixes for some issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Dec 2015 08:53:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-12-15 om 15:10 schreef Koen Kooi:
> Op 25-12-15 om 08:56 schreef jackie.huang@windriver.com:
>> From: Jackie Huang <jackie.huang@windriver.com>
> 
>> These patches had been in our local branch for some times, I think
>> they are needed here as well, I rebased and did basic build/runtime
>> tests on x86-64 and ppc, please review and see if they are fine to be
>> merged.
> 
> After merging this I'm finally able to build openjdk-7 for core2-64
> again.

As well as armv6, armv6 and armv7

> 
> 
> 
>> -- The following changes since commit 
>> c88d019434b5ba0eb7ee1a3b0e27a74587ad9d49:
> 
>> openjdk-8-native: fix improper do_install and PROVIDES (2015-12-22 
>> 23:48:09 -0800)
> 
>> are available in the git repository at:
> 
>> git://git.pokylinux.org/poky-contrib.git jhuang0/d_java-fixes_151225_0
>>  
>> http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_java-fixes_151225_0
>
>>  Amy Fong (15): java.bbclass: java missing classes during compile
>> inetlib: fix inetlib dependency during compilation openjdk: autools not
>> to override B var jamvm.inc: jamvm recipe cleanup base-files: Define 
>> JAVA_HOME by default Missing inheritance and dependencies in some java 
>> packages openjdk-7: added java tools to the jdk package openjdk: add 
>> keytool link openjdk: postinst cleanup icedtea7-native compile failure 
>> undefined reference to `main' openjdk: fix CVE-2014-1876 jamvm-git
>> uprev to 2.0.0 openjdk-7: add depends on attr
>> icedtea7-native/openjdk-7: fails on hosts with no unzip openjdk hotspot
>> build system std.h fix
> 
>> classes/java.bbclass                               |   9 +- 
>> recipes-core/base-files/base-files_3.0.14.bbappend |  13 ++ 
>> recipes-core/classpath/classpath-native_0.99.bb    |   2 +- 
>> ...etlib-missing-dependency-for-util_classes.patch |  31 ++++ 
>> recipes-core/classpathx/inetlib_1.1.1.bb           |   1 + 
>> recipes-core/icedtea/icedtea7-native.inc           |   4 +- 
>> .../icedtea-CVE-2014-1876-unpack.patch             |  44 ++++++ 
>> .../openjdk-7-03b147/icedtea-jdk-unzip.patch       | 130
>> +++++++++++++++ .../openjdk-7-03b147/icedtea-makefile-unzip.patch  |
>> 167 +++++++++++++++++++ .../icedtea-x11_extension_cleanup.patch
>> | 42 +++++ recipes-core/icedtea/openjdk-7-release-03b147.inc  |   7 + 
>> recipes-core/jamvm/jamvm.inc                       |   7 +- 
>> recipes-core/jamvm/jamvm_git.bb                    |   4 +- 
>> recipes-core/openjdk/openjdk-7-common.inc          |   4 + 
>> recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb      |   5 + 
>> recipes-core/openjdk/openjdk-common.inc            |   3 +- 
>> recipes-core/openjdk/openjdk-postinst.inc          |  24 ++- 
>> .../patches-openjdk-7/icedtea-dtrace-std_h.patch   |  40 +++++ 
>> .../patches-openjdk-7/icedtea-jdk-unzip.patch      | 130
>> +++++++++++++++ .../patches-openjdk-7/icedtea-makefile-unzip.patch |
>> 176 +++++++++++++++++++++ 20 files changed, 825 insertions(+), 18 
>> deletions(-) create mode 100644 
>> recipes-core/base-files/base-files_3.0.14.bbappend create mode 100644 
>> recipes-core/classpathx/inetlib-1.1.1/inetlib-missing-dependency-for-util_c
l
>
>> 
asses.patch
> 
> 
> create mode 100644 
> recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch
>> create mode 100644 
>> recipes-core/icedtea/openjdk-7-03b147/icedtea-jdk-unzip.patch create
>> mode 100644 
>> recipes-core/icedtea/openjdk-7-03b147/icedtea-makefile-unzip.patch
>> create mode 100644 
>> recipes-core/icedtea/openjdk-7-03b147/icedtea-x11_extension_cleanup.patch
>
>> 
> 
> create mode 100644 
> recipes-core/openjdk/patches-openjdk-7/icedtea-dtrace-std_h.patch
>> create mode 100644 
>> recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-unzip.patch create 
>> mode 100644 
>> recipes-core/openjdk/patches-openjdk-7/icedtea-makefile-unzip.patch
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFWgkniMkyGM64RGpERAtQIAKCVj4XvRea3TCUIW+pRrCMh6OZo7wCfVTww
a/7l1f/5g383Zb+aWPI6CvU=
=PuaP
-----END PGP SIGNATURE-----


