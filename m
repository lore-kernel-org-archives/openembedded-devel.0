Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NRTQq-00040s-LH
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 17:35:59 +0100
Received: by ywh8 with SMTP id 8so14425087ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2010 08:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=pm96vLumYgC/IIqePcTCV/koB8HWmPG7t8CFIW1k/lY=;
	b=Iuk0Ztm87/XtRr2mDSs6aJptPZDAezN0KByrR0JYFjWipKcg++qvCVSaG9mKO8Uvt+
	jQOrPk8wLR+w6ixt0NNp3URNQK2NBS77sAWHBEkPodcmHNu+3JlmVGKrBsBy8DxRHWc2
	UQbnXOMucDiBUtJbi9IyZ6TKaiS+GBJ0Oxyo0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=K1X+OLcocvf/tPewB+Ox9bXSR8W86pYDzepHurw2Ov25OJkzVzpPHWXisn6SUPu5bU
	1F7fnVwKdoPh0VHXZnCNHhmMJlssf0wt0AxBTaBrso9+lPkrtp3nyYuPnFjNuTyHU6VH
	u7eyID+KDeUGsxE3LKm+wjOEKIA9j8SqKs8qk=
MIME-Version: 1.0
Received: by 10.101.2.7 with SMTP id e7mr15719932ani.89.1262536431477; Sun, 03 
	Jan 2010 08:33:51 -0800 (PST)
Date: Sun, 3 Jan 2010 17:33:51 +0100
Message-ID: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: qmake issue
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
X-List-Received-Date: Sun, 03 Jan 2010 16:36:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I noticed the following issue when building mythtv.
Mythtv uses qmake. Several of the .pro files contain additional
libraries with -L

However if e.g. I look at the generated Makefile for mythfrontend I see:

LIBS          = $(SUBLIBS)  -L$(OE_QMAKE_LIBDIR_QT)
-Wl,-rpath-link,/home/frans/oe/tmp_angstrom/work/armv7a-angstrom-linux-gnueabi/qt4-x11-free-4.6.0-r13.1/qt-everywhere-opensource-src-4.6.0/lib
-L../../libs/libmyth -L../../libs/libmythtv -L../../libs/libavutil
-L../../libs/libavcodec -L../../libs/libavformat
-L../../libs/libswscale -L../../libs/libmythdb -L../../libs/libmythui
-L../../libs/libmythupnp -lmythtv-0.22 -lmythavformat-0.22
-lmythavutil-0.22 -lmythavcodec-0.22 -lmythswscale-0.22
-lmythupnp-0.22 -lmyth-0.22 -lmythui-0.22 -lmythdb-0.22
-L../../libs/libmythlivemedia -lmythlivemedia-0.22
-L../../libs/libmythfreemheg -lmythfreemheg-0.22
-L../../libs/libmythhdhomerun -lmythhdhomerun-0.22
-L/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-lfreetype -lXinerama -lX11 -lXext -lXxf86vm -lXv -lXrandr -lQtWebKit
-Wl,-rpath-link,/usr/lib -lphonon -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -lQtDBus -Wl,-rpath-link,/usr/lib -lQtSql
-Wl,-rpath-link,/usr/lib -lQtXml -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -lQtGui -Wl,-rpath-link,/usr/lib -lQtNetwork
-Wl,-rpath-link,/usr/lib -lQtCore -Wl,-rpath-link,/usr/lib -lglib-2.0
-lpthread

and eventually the executed link command is:

ccache arm-angstrom-linux-gnueabi-g++
-L/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-Wl,-rpath-link,/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -o mythfrontend version.o main.o
playbackbox.o viewscheduled.o globalsettings.o manualschedule.o
programrecpriority.o channelrecpriority.o statusbox.o networkcontrol.o
mediarenderer.o mythfexml.o playbackboxlistitem.o custompriority.o
mythappearance.o exitprompt.o proglist.o action.o actionset.o
mythcontrols.o keybindings.o keygrabber.o mythosdmenueditor.o
progfind.o guidegrid.o customedit.o schedulecommon.o progdetails.o
scheduleeditor.o moc_main.o moc_playbackbox.o moc_viewscheduled.o
moc_globalsettings.o moc_manualschedule.o moc_programrecpriority.o
moc_channelrecpriority.o moc_statusbox.o moc_networkcontrol.o
moc_custompriority.o moc_mythappearance.o moc_exitprompt.o
moc_proglist.o moc_mythcontrols.o moc_keygrabber.o
moc_mythosdmenueditor.o moc_progfind.o moc_guidegrid.o
moc_customedit.o moc_progdetails.o moc_scheduleeditor.o
-L/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-Wl,-rpath-link,/home/frans/oe/tmp_angstrom/work/armv7a-angstrom-linux-gnueabi/qt4-x11-free-4.6.0-r13.1/qt-everywhere-opensource-src-4.6.0/lib
-L../../libs/libmyth -L../../libs/libmythtv -L../../libs/libavutil
-L../../libs/libavcodec -L../../libs/libavformat
-L../../libs/libswscale -L../../libs/libmythdb -L../../libs/libmythui
-L../../libs/libmythupnp -lmythtv-0.22 -lmythavformat-0.22
-lmythavutil-0.22 -lmythavcodec-0.22 -lmythswscale-0.22
-lmythupnp-0.22 -lmyth-0.22 -lmythui-0.22 -lmythdb-0.22
-L../../libs/libmythlivemedia -lmythlivemedia-0.22
-L../../libs/libmythfreemheg -lmythfreemheg-0.22
-L../../libs/libmythhdhomerun -lmythhdhomerun-0.22
-L/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/lib
-lfreetype -lXinerama -lX11 -lXext -lXxf86vm -lXv -lXrandr -lQtWebKit
-Wl,-rpath-link,/usr/lib -lphonon -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib -lQtDBus
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -lQtSql -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib -lQtXml
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -lQtGui -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib -lQtNetwork
-Wl,-rpath-link,/usr/lib -Wl,-rpath-link,/usr/lib
-Wl,-rpath-link,/usr/lib -lQtCore -Wl,-rpath-link,/usr/lib -lglib-2.0
-lpthread

In this I see two issues.

The obvious one is of course the explosion of  -Wl,-rpath-link,/usr/lib
Somewhat annoying but not really harmful.

What is more harmful though is that somewhere in the build process the
linking is done by invoking: arm-angstrom-linux-gnueabi-g++
-L/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/lib
...
-L dirs are searched for in the order they appear on the command line,
so the version in staging has preference above the local version
(which is only moved to staging after the compilation is completed).

I can imagine a few solutions, but no idea which one is the best and
how to implement them.
First option is to hack the generated makefile in a configure_append
step. While this would solve the issue for me it is not really a
generic solution.
Second option is to force removing a package from staging when a new
version is build
Third option is to change the class which generates the above command
to put the -L near the end (after any -L's from the makefile itself.

No idea on the way to solve this. Anyone an idea (and perhaps the
knowledge to fix this)?

Frans.


