Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8zHG-0005KC-RR
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 17:45:42 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADGf3GZ029175; Fri, 13 Nov 2009 16:41:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P+XtcNc9VdSz; Fri, 13 Nov 2009 16:41:02 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADGexIx029158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 13 Nov 2009 16:41:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911131129020.5980@localhost>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org>
	<1258129007.5799.73.camel@dax.rpnet.com>
	<alpine.LFD.2.00.0911131129020.5980@localhost>
Date: Fri, 13 Nov 2009 16:39:22 +0000
Message-Id: <1258130362.5799.80.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 16:45:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-13 at 11:29 -0500, Robert P. J. Day wrote:
> On Fri, 13 Nov 2009, Richard Purdie wrote:
> 
> > Can someone with this problem please run a python-native build with
> > http://tim.rpsys.net/python-debug.patch applied?
> >
> > There should be some debug at the end of the do_compile log afterwards.
> > I see:
> >
> > Looking in ncursesw for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
> > Looking in ncurses for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
> > Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libncurses.so
> >
> > and I'm guessing it finds ncursesw in /lib/lib64 for some people.
> >
> > I also see some other worrying entries on my system :(
> 
>   do you still want this tested given the earlier posting about how
> this was fixed with that readline tweak?

That readline tweak is a hack and there is a bigger problem here. I'd
like to solve it completely so yes, I'd like to confirm that was the
problem please. Once someone has done that I also have a proposed fix:

http://tim.rpsys.net/python-hostfix.patch

For completeness, I've included some before/after logs below for what
we're now potentially avoiding. I'm cc'ing the python maintainer to make
sure he sees it, its his call whether to include this patch. I'd also
argue it could be worth removing more "/usr" references from setup.py
but that is his call and my patch solves 90% of the problem (but not
sqlite3 notice). Also some modules now failed to build - DEPENDS would
need to be fixed to get them back if we want them.

Cheers,

Richard

BEFORE
------

Looking in readline for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libreadline.so
Looking in ncursesw for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in ncurses for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libncurses.so
Looking in crypt for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /usr/lib64/libcrypt.so
Looking in ssl for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib', '/usr/local/ssl/lib', '/usr/contrib/ssl/lib/']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libssl.so
Looking in db-4.3 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libdb-4.3.so
Looking in sqlite3 for ['/usr/include/../lib64', '/usr/include/../lib', '/usr/include/../../lib64', '/usr/include/../../lib', '/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /usr/include/../lib64/libsqlite3.so
Looking in gdbm for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libgdbm.so
Looking in gdbm for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libgdbm.so
Looking in nsl for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /usr/lib64/libnsl.so
Looking in ncursesw for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in ncurses for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libncurses.so
Looking in panel for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libpanel.so
Looking in z for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libz.so
Looking in bz2 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libbz2.so
Looking in tk8.5 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl8.5 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk85 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl85 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/u/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/_testcapimodule.c: In function 'test_u_code':
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/_testcapimodule.c:489: warning: unused variable 'x'
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c: In function 'Unpickler_noload':
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c:4317: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c:194: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c: In function 'load':
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c:4317: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false
In file included from /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/readline.h:38,
                 from /media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/readline.c:32:
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:35: warning: function declaration isn't a prototype
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:36: warning: function declaration isn't a prototype
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:37: warning: function declaration isn't a prototype
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:38: warning: function declaration isn't a prototype
In file included from /media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/readline.c:32:
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/readline.h:378: warning: function declaration isn't a prototype
gcc: unrecognized option '-R/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib'
gcc: unrecognized option '-R/usr/lib64'
gcc: unrecognized option '-R/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib'
In file included from /media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/gdbmmodule.c:13:
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/gdbm.h:85: warning: function declaration isn't a prototype
aclocal.m4:14: error: this file was generated for autoconf 2.61.
You have another version of autoconf.  If you want to use that,
you should regenerate the build system entirely.
aclocal.m4:14: the top level
autom4te: /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/bin/m4 failed with exit status: 63
sr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk8.4 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl8.4 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libtcl8.4.so
Looking in tk84 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl84 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk8.3 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl8.3 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk83 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl83 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk8.2 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl8.2 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk82 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl82 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk8.1 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl8.1 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk81 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl81 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk8.0 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl8.0 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tk80 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Looking in tcl80 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
Failed to configure _ctypes module (res=16128) or missing conffile=build/temp.linux-x86_64-2.6/libffi/fficonfig.py

Failed to find the necessary bits to build these modules:
_tkinter           bsddb185           dl              
imageop            sunaudiodev                        
To find the necessary bits, look in setup.py in detect_modules() for the module's name.


AFTER
-----

Looking in readline for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libreadline.so
Looking in ncursesw for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in ncurses for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libncurses.so
Looking in crypt for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in ssl for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.', '/usr/local/ssl/lib', '/usr/contrib/ssl/lib/']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libssl.so
Looking in db-4.3 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libdb-4.3.so
Looking in sqlite3 for ['/usr/include/../lib64', '/usr/include/../lib', '/usr/include/../../lib64', '/usr/include/../../lib', '/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /usr/include/../lib64/libsqlite3.so
Looking in gdbm for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libgdbm.so
Looking in gdbm for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libgdbm.so
Looking in nsl for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in ncursesw for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in ncurses for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libncurses.so
Looking in panel for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libpanel.so
Looking in z for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libz.so
Looking in bz2 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libbz2.so
Looking in tk8.5 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl8.5 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk85 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl85 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk8.4 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl8.4 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libtcl8.4.so
Looking in tk84 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl84 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk8.3 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl8.3 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk83 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl83 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk8.2 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl8.2 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk82 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl82 for ['/media/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/_testcapimodule.c: In function 'test_u_code':
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/_testcapimodule.c:489: warning: unused variable 'x'
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c: In function 'Unpickler_noload':
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c:4317: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c:194: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c: In function 'load':
/media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/cPickle.c:4317: warning: assuming signed overflow does not occur when assuming that (X - c) > X is always false
In file included from /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/readline.h:38,
                 from /media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/readline.c:32:
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:35: warning: function declaration isn't a prototype
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:36: warning: function declaration isn't a prototype
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:37: warning: function declaration isn't a prototype
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/rltypedefs.h:38: warning: function declaration isn't a prototype
In file included from /media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/readline.c:32:
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/readline/readline.h:378: warning: function declaration isn't a prototype
/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk8.1 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl8.1 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk81 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl81 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk8.0 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl8.0 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tk80 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
Looking in tcl80 for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '.']
*** WARNING: renaming "crypt" since importing it failed: build/lib.linux-x86_64-2.6/crypt.so: undefined symbol: crypt
gcc: unrecognized option '-R/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib'
gcc: unrecognized option '-R/usr/lib64'
gcc: unrecognized option '-R/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib'
In file included from /media/build1/builds/oe/angstrom/tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/gdbmmodule.c:13:
/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/include/gdbm.h:85: warning: function declaration isn't a prototype
*** WARNING: renaming "nis" since importing it failed: build/lib.linux-x86_64-2.6/nis.so: undefined symbol: yp_get_default_domain
aclocal.m4:14: error: this file was generated for autoconf 2.61.
You have another version of autoconf.  If you want to use that,
you should regenerate the build system entirely.
aclocal.m4:14: the top level
autom4te: /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/bin/m4 failed with exit status: 63
Failed to configure _ctypes module (res=16128) or missing conffile=build/temp.linux-x86_64-2.6/libffi/fficonfig.py

Failed to find the necessary bits to build these modules:
_tkinter           bsddb185           dl              
imageop            sunaudiodev                        
To find the necessary bits, look in setup.py in detect_modules() for the module's name.


Failed to build these modules:
crypt              nis                                










