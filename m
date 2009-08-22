Received: from [212.247.155.193] (helo=swip.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1MeuFe-0007YT-HY
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 19:19:38 +0200
X-Cloudmark-Score: 0.000000 []
X-Cloudmark-Analysis: v=1.0 c=1 a=zQW8Q5c5pHoA:10
	a=m/URrrJNvkWYscLe+FKnaw==:17 a=OqRtbYkmAAAA:8 a=Q4-j1AaZAAAA:8
	a=22pK5S-mAAAA:8 a=0NyP_6CSM2c8dHSAvKcA:9
	a=ymVpC977UZ0SrUaULwkA:7 a=6jGBaZwuC8Gk2MCMjoBhFfw5RhcA:4
Received: from [83.188.242.120] ([83.188.242.120] verified)
	by mailfe15.swip.net (CommuniGate Pro SMTP 5.2.13)
	with ESMTP id 554187803 for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 19:02:03 +0200
Message-ID: <4A902489.3020806@zafena.se>
Date: Sat, 22 Aug 2009 19:02:01 +0200
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090513 Fedora/3.0-2.3.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8FF9A1.8050800@arcor.de>
In-Reply-To: <4A8FF9A1.8050800@arcor.de>
Subject: Re: bitbake error "The type package-info is already defined" :(
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
X-List-Received-Date: Sat, 22 Aug 2009 17:19:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi Martin

What you are experiencing are probably the Icedtea6 problem report 375
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=375

Your distribution (ångstrom) have upgraded the eclipse compiler to 
ecj-3.5.x in the org.openembedded.dev tree during the summer and this
causes your problems.

Only the next release and yet unreleased released icedtea6-1.6 supports
building with such a recent eclipse javac compiler.

possible solutions for you are:

1. help the jalimo project create a new icedtea6-native package using the icedtea 1.6
release branch.
2. use an older version of the org.openembedded.dev tree that still uses
ECJ 3.4 for ångstrom
3. backport the patch from icedtea6 1.6 to icedtea6 1.3.1

Cheers and have a great day!
Xerxes


Den 2009-08-22 15:58, Martin Wegner skrev:
> Hi,
>
> I try to cross compile jalimo/icedtea but I get an "The type
> package-info is already defined" error and google is not my friend :(
>
> Who can help me please? Here is the log:
>
> martin@martin-desktop:/stuff/sources$ bitbake openjdk-6
> /var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the
> sets module is deprecated
> import types, sets
> WARNING: No matches in filesystem for /stuff/jalimo-trunk/oe-overlay in
> COLLECTIONS
> /var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the
> sets module is deprecated
> import types, sets
> NOTE: Handling BitBake files: \ (7184/7184) [100 %]
> NOTE: Parsing finished. 6899 cached, 0 parsed, 285 skipped, 2 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/javac-native
> (/stuff/openembedded/recipes/ecj/ecj-bootstrap-native.bb
> /stuff/openembedded/recipes/openjdk-langtools/openjdk-javac-native_0.0+jdk7-b31.bb).
> This usually means one provides something the other doesn't and should.
> NOTE: Executing runqueue
> NOTE: Running task 1481 of 2097 (ID: 259,
> /stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb,
> do_compile)
> ERROR: function do_compile failed
> ERROR: log data follows
> (/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/temp/log.do_compile.28821)
> | 1/2 Building Hotspot
> | NOTE: make hotspot
> OE_PATH=/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/staging/i686-linux/usr/bin/i686-linux:/stuff/tmp/staging/i686-linux/usr/sbin:/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/cross/i686/bin:/stuff/tmp/staging/i686-linux/sbin:/stuff/tmp/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
> | rm -f stamps/bootstrap-directory-symlink-ecj.stamp
> | rm -f stamps/icedtea-ecj.stamp
> | rm -f stamps/icedtea-against-ecj.stamp
> | /usr/bin/make hotspot-helper
> | make[1]: Entering directory
> `/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1'
> | rm -f bootstrap/jdk1.6.0
> | ln -sf ecj bootstrap/jdk1.6.0
> | mkdir -p stamps
> | touch stamps/bootstrap-directory-symlink-ecj.stamp
> | if ! test -d
> /stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/bootstrap/jdk1.6.0
> ; \
> | then \
> | /stuff/tmp/staging/i686-linux/usr/bin/ecj-bootstrap -g -d
> lib/hotspot-tools \
> | -source 1.5 \
> | -sourcepath \
> |
> 'hotspot-tools:openjdk/jdk/src/share/classes:openjdk/jdk/src/solaris/classes:openjdk/langtools/src/share/classes:openjdk/jaxp/src/share/classes:openjdk/corba/src/share/classes:openjdk/jaxws/src/share/classes:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/generated:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/rt'
> \
> | -bootclasspath '' @hotspot-tools-source-files.txt ; \
> | else \
> |
> /stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/bootstrap/jdk1.6.0/bin/javac
>
> -g \
> | -d lib/hotspot-tools \
> | -source 1.5 \
> | -sourcepath \
> |
> 'hotspot-tools:openjdk/jdk/src/share/classes:openjdk/jdk/src/solaris/classes:openjdk/langtools/src/share/classes:openjdk/jaxp/src/share/classes:openjdk/corba/src/share/classes:openjdk/jaxws/src/share/classes:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/generated:/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1/rt'
> \
> | -bootclasspath '' @hotspot-tools-source-files.txt ; \
> | fi
> | incorrect classpath:
> hotspot-tools/com/sun/codemodel/internal/ClassType.java
> | ----------
> | 1. ERROR in hotspot-tools/com/sun/codemodel/internal/package-info.java
> (at line 1)
> | /*
> | ^
> | The type package-info is already defined
> | ----------
> | ----------
> | 2. ERROR in hotspot-tools/com/sun/source/tree/package-info.java (at
> line 1)
> | /*
> | ^
> | The type package-info is already defined
> | ----------
> | ----------
> | 3. ERROR in hotspot-tools/com/sun/source/util/package-info.java (at
> line 1)
> | /*
> | ^
> | The type package-info is already defined
> | ----------
> | ----------
> | 4. ERROR in
> hotspot-tools/com/sun/tools/internal/xjc/model/package-info.java (at line 1)
> | /*
> | ^
> | The type package-info is already defined
> | ----------
> | ----------
> | 5. ERROR in hotspot-tools/com/sun/tools/internal/xjc/package-info.java
> (at line 1)
> | /*
> | ^
> | The type package-info is already defined
> | ----------
> | ----------
> | 6. ERROR in
> hotspot-tools/com/sun/tools/internal/xjc/reader/xmlschema/bindinfo/package-info.java
> (at line 1)
> | /*
> | ^
> | The type package-info is already defined
> | ----------
> | 6 problems (6 errors)make[1]: ***
> [stamps/hotspot-tools-class-files.stamp] Error 255
> | make[1]: Leaving directory
> `/stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/icedtea6-1.3.1'
> | make: *** [hotspot] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /stuff/tmp/work/i686-linux/icedtea6-native-1.3.1-r2/temp/log.do_compile.28821
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb
> do_compile failed
> ERROR: Task 259
> (/stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb,
> do_compile) failed
> NOTE: Tasks Summary: Attempted 1480 tasks of which 1480 didn't need to
> be rerun and 1 failed.
> ERROR:
> '/stuff/jalimo/trunk/oe-overlay/packages/icedtea/icedtea6-native_1.3.1.bb'
> failed
> martin@martin-desktop:/stuff/sources$
>
> Thank you so much!
>
> Greetings!
>
> Martin
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



