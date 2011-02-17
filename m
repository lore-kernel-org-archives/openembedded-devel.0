Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PpsjH-00074H-9A
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 02:32:23 +0100
Received: (qmail invoked by alias); 17 Feb 2011 01:31:09 -0000
Received: from p4FE0FC47.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.252.71]
	by mail.gmx.net (mp024) with SMTP; 17 Feb 2011 02:31:09 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+rAmVpoPergpvPx81VNqeWVMXDg8SZKV7U8iK59/
	CaiCcgoKyy1gro
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Feb 2011 02:26:53 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201102170226.53460.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: QA RPATH error for c++ packages?
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
X-List-Received-Date: Thu, 17 Feb 2011 01:32:23 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Good evening OE folks,

have started to investigate QA RPATH error for clutter-box2d. More or less 
accidental I fell over the following lines in 'clutter-box2d-0.10.0-
r2.0+git4e72b9c135a9439b82d801c62422531db611f98b/git/clutter-
box2d/.libs/libclutter-box2d-0.10.lai':

| # Libraries that this one depends upon.
| dependency_libs=' /usr/lib/libclutter-eglx-1.0.la -lGLESv2 -lEGL
|  /usr/lib/libatk-1.0.la /usr/lib/libpangocairo-1.0.la
|  /usr/lib/libpangoft2-1.0.la /usr/lib/libgdk_pixbuf-2.0.la
|  /usr/lib/libgio-2.0.la -lresolv /usr/lib/libXext.la /usr/lib/libXdamage.la
|  /usr/lib/libXcomposite.la /usr/lib/libjson-glib-1.0.la
|  /usr/lib/libpango-1.0.la /usr/lib/libcairo.la /usr/lib/libpixman-1.la
|  /usr/lib/libfontconfig.la /usr/lib/libexpat.la /usr/lib/libfreetype.la
|  /usr/lib/libpng12.la /usr/lib/libXrender.la /usr/lib/libz.la
|  /usr/lib/libgmodule-2.0.la /usr/lib/libXfixes.la /usr/lib/libX11.la
|  /usr/lib/libxcb.la /usr/lib/libpthread-stubs.la /usr/lib/libXau.la
|  /usr/lib/libXdmcp.la -ldl /usr/lib/libgobject-2.0.la
|  /usr/lib/libgthread-2.0.la -lpthread -lrt /usr/lib/libglib-2.0.la
|  /home/Superandi/tmp/sysroots/armv7a-angstrom-linux-
gnueabi/usr/lib/libstdc++.la'

All except libstdc++.la come with target folder. 

Hm. clutter-box2d is the only lib of clutter-'suite' which has c++ sources (I 
have checked) and the only one with RPATH QA error...

OK let's see if there are other *.lai files containing host link to 
'libstdc++.la':

| [Superandi@localhost work]$ grep '/home/Superandi/tmp/sysroots/armv7a-
angstrom-linux-gnueabi/usr/lib/libstdc++.la' `find -name "*.lai"`
| ./armv7a-angstrom-linux-gnueabi/db-5.0.21-
r3/db-5.0.21/build_unix/.libs/libdb-5.0.lai: ...
| ./armv7a-angstrom-linux-gnueabi/gnutls-2.10.4-r10.0/gnutls-2.10.4  ...
| ./armv7a-angstrom-linux-gnueabi/libcdio-0.82-r3.0 ...
| ./armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r0 ...
| ./armv7a-angstrom-linux-gnueabi/aspell-0.60.6-r0 ...
| ./armv7a-angstrom-linux-gnueabi/enchant-1.6.0-r2 ...
| ...
| ./overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-
r2.0+git4e72b9c135a9439b82d801c62422531db611f98b ...

These I have seen when creating/using 'contrib/qa/collect-qa-errors.sh' !!

Have modified 'contrib/qa/collect-qa-errors.sh' to get only RPATH errors and get:

| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/acl-2.2.49-r3
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/aspell-0.60.6-r0
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/curl-7.21.2-r4.0
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/db-5.0.21-r3
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/enchant-1.6.0-r2
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/gettext-0.18-r4
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/gnome-vfs-2.24.1-r3
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/gnutls-2.10.4-r10.0
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/libcdio-0.82-r3.0
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/libimobiledevice-1.0.0-
r0
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/libsoup-2.2.100-r1
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/libsoup-2.4-2.32.2-r0
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/neon-0.25.5-r4
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/python-2.6.5-ml12.3
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r0
| /home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/tiff-3.9.4+4.0.0beta6-r0
| /home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-box2d-0.10.0-
r2.0+git4e72b9c135a9439b82d801c62422531db611f98b

OK this is nothing but a hint and the full path in *.lai is surely a symptom not 
part of the solution.

Here I loose the track and ask if there is anybody who has an idea where to look 
further (or telling me that I am on the wrong track)?

time to get some sleep...

Andreas


