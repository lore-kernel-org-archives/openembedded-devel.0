Received: from [151.189.21.46] (helo=mail-in-06.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martinator.de@arcor.de>) id 1MerOc-0001Cl-49
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 16:16:42 +0200
Received: from mail-in-12-z2.arcor-online.net (mail-in-12-z2.arcor-online.net
	[151.189.8.29]) by mx.arcor.de (Postfix) with ESMTP id 28DF539A5CB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 15:59:09 +0200 (CEST)
Received: from mail-in-17.arcor-online.net (mail-in-17.arcor-online.net
	[151.189.21.57])
	by mail-in-12-z2.arcor-online.net (Postfix) with ESMTP id 0F371279455
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 15:59:09 +0200 (CEST)
Received: from [192.168.178.27] (e179143172.adsl.alicedsl.de [85.179.143.172])
	(Authenticated sender: martinator.de@arcor.de)
	by mail-in-17.arcor-online.net (Postfix) with ESMTPSA id ADB673B24C8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 15:59:08 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-17.arcor-online.net ADB673B24C8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcor.de; s=mail-in;
	t=1250949548; bh=PWAlzNFfMEi75m/2Kiubl3UnmQ3XxYH2iTqBYLGSB8Q=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	Content-Transfer-Encoding;
	b=V/0TkqDR0sGFunCOawD6XrBUYL7Vm8jYCPiwY7M9Fjydq6tf0WvdpNN6zXjImVLgq
	I+H/mvBUx9Z+wnmqwb3L7zGx4Hk9w8+D6zh9A3DxgBrR7U/yDnXcK8BgwwNslm1ph5
	nGOmAWZLPDAjjJyZQwo29KNZFiDkPQDj6nNx10Zk=
Message-ID: <4A8FF9A1.8050800@arcor.de>
Date: Sat, 22 Aug 2009 15:58:57 +0200
From: Martin Wegner <martinator.de@arcor.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
Subject: bitbake error "The type package-info is already defined" :(
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
X-List-Received-Date: Sat, 22 Aug 2009 14:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

I try to cross compile jalimo/icedtea but I get an "The type
package-info is already defined" error and google is not my friend :(

Who can help me please? Here is the log:

martin@martin-desktop:/stuff/sources$ bitbake openjdk-6
/var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the
sets module is deprecated
import types, sets
WARNING: No matches in filesystem for /stuff/jalimo-trunk/oe-overlay in
COLLECTIONS
/var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the
sets module is deprecated
import types, sets
NOTE: Handling BitBake files: \ (7184/7184) [100 %]
NOTE: Parsing finished. 6899 cached, 0 parsed, 285 skipped, 2 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
virtual/javac-native
(/stuff/openembedded/recipes/ecj/ecj-bootstrap-native.bb
/stuff/openembedded/recipes/openjdk-langtools/openjdk-javac-native_0.0+jdk7-b31.bb).
This usually means one provides something the other doesn't and should.
NOTE: Executing runqueue
NOTE: Running task 1481 of 2097 (ID: 259,
/stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/temp/log.do_compile.28821)
| 1/2 Building Hotspot
| NOTE: make hotspot
OE_PATH=/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/staging/i686-linux/usr/bin/i686-linux:/stuff/tmp/staging/i686-linux/usr/sbin:/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/cross/i686/bin:/stuff/tmp/staging/i686-linux/sbin:/stuff/tmp/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
| rm -f stamps/bootstrap-directory-symlink-ecj.stamp
| rm -f stamps/icedtea-ecj.stamp
| rm -f stamps/icedtea-against-ecj.stamp
| /usr/bin/make hotspot-helper
| make[1]: Entering directory
`/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1'
| rm -f bootstrap/jdk1.6.0
| ln -sf ecj bootstrap/jdk1.6.0
| mkdir -p stamps
| touch stamps/bootstrap-directory-symlink-ecj.stamp
| if ! test -d
/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/bootstrap/jdk1.6.0
; \
| then \
| /stuff/tmp/staging/i686-linux/usr/bin/ecj-bootstrap -g -d
lib/hotspot-tools \
| -source 1.5 \
| -sourcepath \
|
'hotspot-tools:openjdk/jdk/src/share/classes:openjdk/jdk/src/solaris/classes:openjdk/langtools/src/share/classes:openjdk/jaxp/src/share/classes:openjdk/corba/src/share/classes:openjdk/jaxws/src/share/classes:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/generated:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/rt'
\
| -bootclasspath '' @hotspot-tools-source-files.txt ; \
| else \
|
/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/bootstrap/jdk1.6.0/bin/javac

-g \
| -d lib/hotspot-tools \
| -source 1.5 \
| -sourcepath \
|
'hotspot-tools:openjdk/jdk/src/share/classes:openjdk/jdk/src/solaris/classes:openjdk/langtools/src/share/classes:openjdk/jaxp/src/share/classes:openjdk/corba/src/share/classes:openjdk/jaxws/src/share/classes:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/generated:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/rt'
\
| -bootclasspath '' @hotspot-tools-source-files.txt ; \
| fi
| incorrect classpath:
hotspot-tools/com/sun/codemodel/internal/ClassType.java
| ----------
| 1. ERROR in hotspot-tools/com/sun/codemodel/internal/package-info.java
(at line 1)
| /*
| ^
| The type package-info is already defined
| ----------
| ----------
| 2. ERROR in hotspot-tools/com/sun/source/tree/package-info.java (at
line 1)
| /*
| ^
| The type package-info is already defined
| ----------
| ----------
| 3. ERROR in hotspot-tools/com/sun/source/util/package-info.java (at
line 1)
| /*
| ^
| The type package-info is already defined
| ----------
| ----------
| 4. ERROR in
hotspot-tools/com/sun/tools/internal/xjc/model/package-info.java (at line 1)
| /*
| ^
| The type package-info is already defined
| ----------
| ----------
| 5. ERROR in hotspot-tools/com/sun/tools/internal/xjc/package-info.java
(at line 1)
| /*
| ^
| The type package-info is already defined
| ----------
| ----------
| 6. ERROR in
hotspot-tools/com/sun/tools/internal/xjc/reader/xmlschema/bindinfo/package-info.java
(at line 1)
| /*
| ^
| The type package-info is already defined
| ----------
| 6 problems (6 errors)make[1]: ***
[stamps/hotspot-tools-class-files.stamp] Error 255
| make[1]: Leaving directory
`/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1'
| make: *** [hotspot] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/temp/log.do_compile.28821
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb
do_compile failed
ERROR: Task 259
(/stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 1480 tasks of which 1480 didn't need to
be rerun and 1 failed.
ERROR:
'/stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb'
failed
martin@martin-desktop:/stuff/sources$

Thank you so much!

Greetings!

Martin


