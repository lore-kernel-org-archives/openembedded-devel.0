Received: from vs148181.vserver.de ([62.75.148.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NMptA-00085V-Ik for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 22:34:03 +0100
Received: from [62.224.96.49] (helo=[192.168.100.22])
	by vs148181.vserver.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NMprO-00021e-9O for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 21:32:10 +0000
Message-ID: <4B2FE953.30301@mayer-electronics.de>
Date: Mon, 21 Dec 2009 22:32:03 +0100
From: "Florian Mayer (Mayer Electronics)" <Florian.Mayer@mayer-electronics.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 62.75.148.181
X-SA-Exim-Mail-From: Florian.Mayer@mayer-electronics.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Cannot build gpe-mini browser
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
X-List-Received-Date: Mon, 21 Dec 2009 21:34:03 -0000
X-Groupsio-MsgNum: 15162
Content-Type: multipart/mixed; boundary="------------000509030106020806020306"

--------------000509030106020806020306
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

if I try to bitbake gpe-mini-browser, I get the following output:

| arm-angstrom-linux-gcc -march=armv4 -mtune=strongarm 
-DPACKAGE_NAME=\"gpe-mini-browser\" 
-DPACKAGE_TARNAME=\"gpe-mini-browser\" -DPACKAGE_VERSION=\"0.21\" 
-DPACKAGE_STRING=\"gpe-mini-browser\ 0.21\" 
-DPACKAGE_BUGREPORT=\"philippedeswert@scarlet.be\" 
-DPACKAGE=\"gpe-mini-browser\" -DVERSION=\"0.21\" -DSTDC_HEADERS=1 
-DGETTEXT_PACKAGE=\"gpe-mini-browser\" -DHAVE_SYS_TYPES_H=1 
-DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 
-DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 
-DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_LOCALE_H=1 
-DHAVE_LC_MESSAGES=1 -DHAVE_BIND_TEXTDOMAIN_CODESET=1 -DHAVE_GETTEXT=1 
-DHAVE_DCGETTEXT=1 -DENABLE_NLS=1 -I. 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/gtk-2.0 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/lib/gtk-2.0/include 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/atk-1.0 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/cairo 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/pango-1.0 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/glib-2.0 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/lib/glib-2.0/include 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/pixman-1 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/freetype2 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/libpng12 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/gtk-webcore/webi 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/gtk-webcore 
-I/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include/gtk-webcore/   
-DPREFIX=\"/usr\" -Wall  
-isystem/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/include  
-Os -Wall -g -pedantic -std=c99   -MT db-backend.o -MD -MP -MF 
.deps/db-backend.Tpo -c -o db-backend.o db-backend.c
| db-backend.c:224: warning: C99 inline functions are not supported; 
using GNU89
| db-backend.c:224: warning: to disable this warning use -fgnu89-inline 
or the gnu_inline function attribute
| mv -f .deps/db-backend.Tpo .deps/db-backend.Po
| arm-angstrom-linux-gcc -march=armv4 -mtune=strongarm  -Os -Wall -g 
-pedantic -std=c99    
-L/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/lib 
-Wl,-rpath-link,/home/gonzo/ARM-devel/oe/build/tmp/staging/arm-oabi-angstrom-linux/usr/lib 
-Wl,-O1 -Wl,--hash-style=gnu -o gpe-mini-browser interface-calls.o 
loading-calls.o misc-calls.o settings.o  gpe-mini-browser.o 
db-backend.o  -lgpewidget -lgtk_webcore_nrcit -lgthread-2.0 
-lgtk_webcore_nrcore -lcurl -lgtk_webcore_jscore -lXft -lgtk-x11-2.0 
-lXrender -lX11 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 
-lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype 
-lfontconfig -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -lsqlite
| 
/home/gonzo/ARM-devel/oe/build/tmp/cross/arm-oabi/lib/gcc/arm-angstrom-linux/4.2.4/../../../../arm-angstrom-linux/bin/ld: 
gpe-mini-browser: hidden symbol `__ltdf2' in 
/home/gonzo/ARM-devel/oe/build/tmp/cross/arm-oabi/lib/gcc/arm-angstrom-linux/4.2.4/libgcc.a(_cmpdf2.o) 
is referenced by DSO
| 
/home/gonzo/ARM-devel/oe/build/tmp/cross/arm-oabi/lib/gcc/arm-angstrom-linux/4.2.4/../../../../arm-angstrom-linux/bin/ld: 
final link failed: Nonrepresentable section on output
| collect2: ld returned 1 exit status
| make[1]: *** [gpe-mini-browser] Error 1
| make[1]: Leaving directory 
`/home/gonzo/ARM-devel/oe/build/tmp/work/arm-oabi-angstrom-linux/gpe-mini-browser-0.21-r1/gpe-mini-browser-0.21'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: 
/home/gonzo/ARM-devel/oe/build/tmp/work/arm-oabi-angstrom-linux/gpe-mini-browser-0.21-r1/temp/log.do_compile.18419
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/gonzo/ARM-devel/oe/openembedded/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb 
do_compile failed
ERROR: Task 7 
(/home/gonzo/ARM-devel/oe/openembedded/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb, 
do_compile) failed
NOTE: Tasks Summary: Attempted 1233 tasks of which 1168 didn't need to 
be rerun and 1 failed.
ERROR: 
'/home/gonzo/ARM-devel/oe/openembedded/recipes/gpe-mini-browser/gpe-mini-browser_0.21.bb' 
failed

My build system is Ubuntu 9.04, I am using the stable2009 branch. The 
machine is a simpad.

The x11-image has been built well and is already running on the target.

Regards
Florian Mayer
Mayer Electronics

--------------000509030106020806020306
Content-Type: text/x-vcard; charset=utf-8;
 name="Florian_Mayer.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Florian_Mayer.vcf"

begin:vcard
fn:Florian Mayer (Mayer Electronics)
n:Mayer;Florian
adr:;;Hohenzollernstr. 20;Messkirch;;88605;Deutschland
email;internet:Florian.Mayer@mayer-electronics.de
title:Dipl. Ing. (BA)
tel;work:++49 (0) 7575/924940
tel;cell:++49 (0) 176/22209624
version:2.1
end:vcard


--------------000509030106020806020306--
