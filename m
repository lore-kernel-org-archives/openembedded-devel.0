Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RG4Zv-0007T9-TY for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 09:59:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RG4UK-0000v9-0D for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 09:53:28 +0200
Received: from 130.138.227.54 ([130.138.227.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:53:27 +0200
Received: from kaijun61 by 130.138.227.54 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:53:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Kai <kaijun61@yahoo.com>
Date: Tue, 18 Oct 2011 07:53:14 +0000 (UTC)
Message-ID: <loom.20111018T095219-202@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 130.138.227.54 (Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;
	Trident/4.0; GTB7.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727;
	.NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E;
	InfoPath.2; MS-RTC LM 8))
Subject: bitbake build failed at bison
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
X-List-Received-Date: Tue, 18 Oct 2011 07:59:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I got the following issue when I rebuilt console-image from scratch
today. Someone has reported this issue 4 months ago, I just wonder if
it has been resolved.

/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/
bison-2.4.3/m4/
glib.m4:8: warning: underquoted definition of AM_PATH_GLIB
configure.ac:128: warning: gl_GLIBC21 is m4_require'd but not
m4_defun'd
/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/
bison-2.4.3/m4/
localcharset.m4:7: gl_LOCALCHARSET is expanded from...
/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/
bison-2.4.3/m4/
gnulib-comp.m4:153: gl_INIT is expanded from...
configure.ac:128: the top level
autoreconf: configure.ac: tracing
configure.ac:128: warning: gl_GLIBC21 is m4_require'd but not
m4_defun'd
aclocal.m4:6788: gl_LOCALCHARSET is expanded from...
aclocal.m4:3203: gl_INIT is expanded from...
configure.ac:128: the top level
configure.ac:128: warning: AC_RUN_IFELSE called without default to
allow cross c
ompiling
../../lib/autoconf/general.m4:2716: AC_RUN_IFELSE is expanded from...
../../lib/m4sugar/m4sh.m4:598: AS_IF is expanded from...
../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
aclocal.m4:8839: gl_POSIX_SPAWN_WORKS is expanded from...
aclocal.m4:8768: gl_POSIX_SPAWN_BODY is expanded from...
aclocal.m4:8763: gl_POSIX_SPAWN is expanded from...
autoreconf: configure.ac: not using Libtool
autoreconf: running: /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/
bin/autoconf
--include=/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-
r9.0/bison-2.4.3/data/
--include=/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-
r9.0/bison-2.4.3/m4/
--include=/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-
r9.0/bison-2.4.3/tests/
--include=/usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/
aclocal-1.11
--include=/usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/share/
aclocal --force --warnings=cross
configure.ac:128: warning: gl_GLIBC21 is m4_require'd but not
m4_defun'd
aclocal.m4:6788: gl_LOCALCHARSET is expanded from...
aclocal.m4:3203: gl_INIT is expanded from...
configure.ac:128: the top level
configure.ac:128: warning: AC_RUN_IFELSE called without default to
allow cross compiling
../../lib/autoconf/general.m4:2716: AC_RUN_IFELSE is expanded from...
../../lib/m4sugar/m4sh.m4:598: AS_IF is expanded from...
../../lib/autoconf/general.m4:1999: AC_CACHE_VAL is expanded from...
../../lib/autoconf/general.m4:2020: AC_CACHE_CHECK is expanded from...
aclocal.m4:8839: gl_POSIX_SPAWN_WORKS is expanded from...
aclocal.m4:8768: gl_POSIX_SPAWN_BODY is expanded from...
aclocal.m4:8763: gl_POSIERROR: Function 'do_configure' failed (see
/usr/src/oe/tmp-zaurus/work/x86_64-linux/bison-native-2.4.3-r9.0/temp/
log.do_configure.8271
for further information)
X_SPAWN is expanded from...
configure:9788: error: possibly undefined macro: gl_GLIBC21
      If this token and others are legitimate, please use
m4_pattern_allow.
      See the Autoconf documentation.
autoreconf: /usr/src/oe/tmp-zaurus/sysroots/x86_64-linux/usr/bin/
autoconf failed with exit
status: 1
+ oefatal 'autoreconf execution failed.'

Thanks,

Kai





