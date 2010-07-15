Received: from web63407.mail.re1.yahoo.com ([69.147.97.47])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <fundu_1999@yahoo.com>) id 1OZGfM-0006KP-7Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 07:07:26 +0200
Received: (qmail 43333 invoked by uid 60001); 15 Jul 2010 05:00:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1279170038; bh=M0uQK1mX/ITHCaB5Q3hCzmPceBIUgzIG3fwIlt4lUYc=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type;
	b=eEWJk2Bi45YrWHeVYwLgBN5VvopxQH1yD6UyacVIPiw8jbI1WYy96pdWbSlNGe62teKysbfCfdA1I82kABLxfO1cAPMJYFzVo9yz60SnBpkW/OcD42fcl4BpIgaPie3jJRzoyX573X3uoWrAqdgQDGYmOMFDlYHX17IXlzhRy84=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type;
	b=D4vGv0TwarlkS4t9QltNBYiot+pDtEF1NrZ2NoocHKz/SDw3NWmJ5EFLG1i+6KtaCEXOcA1/4Gm+7759qc9BgL78WRxt5SxYkTYEL69qmkseBHwPHANjZbTrFASRn+VlraVqzsxHqM0mx0UhrXzF1XyhPnQqD8BXYKYXg+V0Xxs=;
Message-ID: <308340.43088.qm@web63407.mail.re1.yahoo.com>
X-YMail-OSG: MpuG_ssVM1lwYIOIT2139E2Ax.xvKDBjHW278xbWTw4n.Aq
	sNTyoAGiDEKKjjaHOskZCG7VKRkYtjwmeJQOCJ1.VLZL6gwNgMjqhIs9HHA9
	pKlgGJzsA6fpKULQgd_xBs6NKCa4.NIhJT_vt3MAefU8VkMaH0N2cGXTPzeZ
	V9u2pmg6bio4PjKoS1eij6Q5yFYgypw.dm14jX8PTbO3.gBprVCP_SfLrQCy
	IA.7IHdq1bZ4By8DuD.ITWlzpyyDgMF7jm_sSoqjuE7KIOA_7f_wrMPeDT6o
	ndd2P7IQbug8tlfCDKA7fPvwS0TupQjbvwauVcAFTuwNHjjPnqOAhyCTa3hR
	L6J7zNoSPhKFlLdPlWjlcbu.Y5Im5fhSB.LFK42ibTULYt8jMwlIDXCVgvO7
	o7RhD2Yh2YMaZ0XtGmEx7
Received: from [67.170.254.127] by web63407.mail.re1.yahoo.com via HTTP;
	Wed, 14 Jul 2010 22:00:37 PDT
X-Mailer: YahooMailRC/420.4 YahooMailWebService/0.8.104.276605
Date: Wed, 14 Jul 2010 22:00:37 -0700 (PDT)
From: Fundu <fundu_1999@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 69.147.97.47
X-SA-Exim-Mail-From: fundu_1999@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: gumstix-users@lists.sourceforge.net
Subject: QT openembedded build error gumstix
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
X-List-Received-Date: Thu, 15 Jul 2010 05:07:27 -0000
Content-Type: text/plain; charset=us-ascii

Hi,

I'm trying to build a very simple qt app.

here's the recipe 

http://svn.bec-systems.com/pub/qt-overo-palo-gpio/

but after running for hours here's the output.
 

NOTE: qt-overo-palo-gpio-1.0-r0: executing task do_configure
ERROR: function do_configure failed
ERROR: log data follows 
(/home/fundu/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt-overo-palo-gpio-1.0-r0/temp/log.do_configure.28863)

| NOTE: using qmake spec in 
/home/fundu/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/qtopia/mkspecs/linux-gnueabi-oe-g++,
 using profiles ''
| NOTE: qmake prevar substitution:   QT_LIBINFIX=E
| Failure to read QMAKESPEC conf file 
/home/fundu/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/qtopia/mkspecs/linux-gnueabi-oe-g++/qmake.conf.

| Error processing project file: qt-overo-palo-gpio.pro
| FATAL: Error calling 
/home/fundu/overo-oe/tmp/sysroots/i686-linux/usr/bin/qmake2 on 
qt-overo-palo-gpio.pro
NOTE: Task failed: 
/home/fundu/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt-overo-palo-gpio-1.0-r0/temp/log.do_configure.28863

ERROR: Error in executing: 
/home/fundu/overo-oe/org.openembedded.dev/recipes/qt-overo-palo-gpio/qt-overo-palo-gpio.bb

ERROR: Exception:<class 'bb.build.EventException'> Message:('Function failed in 
task: 
/home/fundu/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt-overo-palo-gpio-1.0-r0/temp/log.do_configure.28863',
 <bb.build.TaskFailed instance at 0x1604b6cc>)
ERROR: Printing the environment of the function
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/fundu/overo-oe/org.openembedded.dev/recipes/qt-overo-palo-gpio/qt-overo-palo-gpio.bb
 do_populate_sysroot failed
ERROR: Task 0 
(/home/fundu/overo-oe/org.openembedded.dev/recipes/qt-overo-palo-gpio/qt-overo-palo-gpio.bb,
 do_populate_sysroot) failed
NOTE: Tasks Summary: Attempted 2056 tasks of which 1983 didn't need to be rerun 
and 1 failed.
ERROR: 
'/home/fundu/overo-oe/org.openembedded.dev/recipes/qt-overo-palo-gpio/qt-overo-palo-gpio.bb'
 failed


any help would appreciated....


      


