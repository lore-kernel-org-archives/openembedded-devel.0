Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <axel.lin@gmail.com>) id 1Gke59-0004od-GR
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Nov 2006 11:02:57 +0100
Received: by py-out-1112.google.com with SMTP id n39so299176pyh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2006 02:00:39 -0800 (PST)
Received: by 10.35.57.5 with SMTP id j5mr433692pyk.1163671239701;
	Thu, 16 Nov 2006 02:00:39 -0800 (PST)
Received: by 10.35.15.3 with HTTP; Thu, 16 Nov 2006 02:00:38 -0800 (PST)
Message-ID: <427d64720611160200n179c885cme530417c46cd492e@mail.gmail.com>
Date: Thu, 16 Nov 2006 18:00:38 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: minimo Segmentation fault on pxa270 board
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2006 10:02:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
    Is anyone sucessfuly run minimo on pxa270 board? ( I'm using
angstrom disrto)
    I always got "Segmentation fault" when start minimo.

    BTW,  the path of minimo files are not correct.

root@mainstone:/usr/lib$ ipkg files minimo
Package minimo (0.016+cvs20060720-r0) is installed on root and has the
following files:
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-audio.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/entityTables/transliterate.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/.debug/libssl3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/greprefs/all.js
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/greprefs/security-prefs.js
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/arrow.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/entityTables/html40Latin1.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-image.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/unixcharset.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/toolkit.jar
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-movie.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/minimo
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libnspr4.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/langGroups.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libnss3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libssl3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/classic.jar
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libnssckbi.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/.debug/libsoftokn3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/.debug/libsmime3.so
/usr/bin/minimo
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libsmime3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/fonts/pangoFontEncoding.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libplds4.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/dtd/xhtml11.dtd
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/.debug/libnss3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/components/all.xpt
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/ua.css
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/forms.css
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-sound.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/language.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/fonts/fontEncoding.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-binary.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/minimo-skin.jar
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/entityTables/html40Symbols.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libplc4.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-telnet.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/.debug/libfreebl3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/entityTables/html40Special.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/.debug/libnssckbi.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/charsetData.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/broken-image.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/charsetalias.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/arrowd.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libfreebl3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/libsoftokn3.so
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/minimo-skin.manifest
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/quirk.css
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/en-US.jar
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/toolkit.manifest
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/entityTables/htmlEntityVersions.properties
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/minimo-skin-vga.manifest
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/minimo.jar
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-text.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/components/nsHelperAppDlg.js
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-menu.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/pippki.manifest
/usr/share/pixmaps/minimo.png
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-unknown.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/components/nsProgressDialog.js
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/loading-image.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/en-US.manifest
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/classic.manifest
/usr/share/applications/minimo.desktop
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html.css
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/res/html/gopher-find.gif
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/pippki.jar
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/minimo.manifest
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/image/usr/lib/mozilla-minimo/chrome/minimo-skin-vga.jar

Regards,
Axel


