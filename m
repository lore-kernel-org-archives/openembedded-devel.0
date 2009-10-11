Received: from [209.85.216.184] (helo=mail-px0-f184.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1MwzYs-0000yZ-0T
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Oct 2009 16:38:17 +0200
Received: by pxi14 with SMTP id 14so9093149pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 07:37:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.60.5 with SMTP id i5mr410810wfa.285.1255271839284; Sun, 11 
	Oct 2009 07:37:19 -0700 (PDT)
Date: Sun, 11 Oct 2009 22:37:19 +0800
Message-ID: <fd72b8f50910110737u5cf0c64dv2e352feaa2c46e1@mail.gmail.com>
From: mail mail <mail@april1985.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.184
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: imagemagick-native-6.3.5 compile problems
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
X-List-Received-Date: Sun, 11 Oct 2009 14:38:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all
I'm compiling x11-sato-image. I chose mini2440 as my machine and angstrom as
distro. My OE git version is:
4089b4dd14270a884101cc7b8c240998c4354cd0<http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4089b4dd14270a884101cc7b8c240998c4354cd0>.
imagemagick-native-6.3.5 compiled failed. I'm new to OE and didn't know what
to do. I just bitbake imagemagick-native again and have the screen:

derek@derek-desktop:~/mini2440$ bitbake imagemagick-native
/home/derek/mini2440/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets
module is deprecated
  import types, sets
NOTE: Handling BitBake files: - (7316/7316) [100 %]
NOTE: Parsing finished. 7023 cached, 0 parsed, 293 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 100 of 160 (ID: 7,
/home/derek/mini2440/openembedded/recipes/imagemagick/
imagemagick-native_6.3.5-10.bb, do_compile)
NOTE: Running task 151 of 160 (ID: 13,
/home/derek/mini2440/openembedded/recipes/imagemagick/
imagemagick-native_6.3.5-10.bb, do_distribute_sources)
ERROR: function do_compile failed
ERROR: log data follows
(/home/derek/mini2440/build/tmp/work/i686-linux/imagemagick-native-6.3.5-10-r4/temp/log.do_compile.10247)
| NOTE: make -j 4
| /bin/bash ./libtool --silent --tag=CC   --mode=compile ccache gcc
-DHAVE_CONFIG_H -I. -I./magick -I./wand  -I./ltdl -I./ltdl
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include -O2 -g
-Wall -W -pthread -MT magick/magick_libMagick_la-delegate.lo -MD -MP -MF
magick/.deps/magick_libMagick_la-delegate.Tpo -c -o
magick/magick_libMagick_la-delegate.lo `test -f 'magick/delegate.c' || echo
'./'`magick/delegate.c
| /bin/bash ./libtool --silent --tag=CC   --mode=compile ccache gcc
-DHAVE_CONFIG_H -I. -I./magick -I./wand  -I./ltdl -I./ltdl
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include -O2 -g
-Wall -W -pthread -MT magick/magick_libMagick_la-enhance.lo -MD -MP -MF
magick/.deps/magick_libMagick_la-enhance.Tpo -c -o
magick/magick_libMagick_la-enhance.lo `test -f 'magick/enhance.c' || echo
'./'`magick/enhance.c
| /bin/bash ./libtool --silent --tag=CC   --mode=compile ccache gcc
-DHAVE_CONFIG_H -I. -I./magick -I./wand  -I./ltdl -I./ltdl
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include -O2 -g
-Wall -W -pthread -MT magick/magick_libMagick_la-exception.lo -MD -MP -MF
magick/.deps/magick_libMagick_la-exception.Tpo -c -o
magick/magick_libMagick_la-exception.lo `test -f 'magick/exception.c' ||
echo './'`magick/exception.c
| /bin/bash ./libtool --silent --tag=CC   --mode=compile ccache gcc
-DHAVE_CONFIG_H -I. -I./magick -I./wand  -I./ltdl -I./ltdl
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include
-isystem/home/derek/mini2440/build/tmp/staging/i686-linux/usr/include -O2 -g
-Wall -W -pthread -MT magick/magick_libMagick_la-fx.lo -MD -MP -MF
magick/.deps/magick_libMagick_la-fx.Tpo -c -o
magick/magick_libMagick_la-fx.lo `test -f 'magick/fx.c' || echo
'./'`magick/fx.c
| In function 'open',
|     inlined from 'CopyDelegateFile' at magick/delegate.c:772,
|     inlined from 'InvokeDelegate' at magick/delegate.c:998:
| /usr/include/bits/fcntl2.h:51: error: call to '__open_missing_mode'
declared with attribute error: open with O_CREAT in second argument needs 3
arguments
| make: *** [magick/magick_libMagick_la-delegate.lo] Error 1
| make: *** Waiting for unfinished jobs....
| mv -f magick/.deps/magick_libMagick_la-exception.Tpo
magick/.deps/magick_libMagick_la-exception.Plo
| magick/fx.c: In function 'ConvolveImageChannel':
| magick/fx.c:529: warning: ignoring #pragma omp parallel
| mv -f magick/.deps/magick_libMagick_la-enhance.Tpo
magick/.deps/magick_libMagick_la-enhance.Plo
| mv -f magick/.deps/magick_libMagick_la-fx.Tpo
magick/.deps/magick_libMagick_la-fx.Plo
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/derek/mini2440/build/tmp/work/i686-linux/imagemagick-native-6.3.5-10-r4/temp/log.do_compile.10247
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/derek/mini2440/openembedded/recipes/imagemagick/
imagemagick-native_6.3.5-10.bb do_compile failed
ERROR: Task 7 (/home/derek/mini2440/openembedded/recipes/imagemagick/
imagemagick-native_6.3.5-10.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 150 tasks of which 149 didn't need to be
rerun and 1 failed.
ERROR: '/home/derek/mini2440/openembedded/recipes/imagemagick/
imagemagick-native_6.3.5-10.bb' failed


Could anyone give me some ideas about this or how can I fix it?
Thanks!


Derek
2009/10/11
www.april1985.com

