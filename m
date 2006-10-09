Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GWpId-00035H-50 for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 09:11:43 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id A647F40654F; Sun,  8 Oct 2006 23:39:29 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061009063929.A647F40654F@tinman.treke.net>
Date: Sun,  8 Oct 2006 23:39:29 -0700 (PDT)
Subject: [Bug 1463] New: libqte.a not stanged!
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2006 07:11:43 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1463

           Summary: libqte.a not stanged!
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: michael.illing@tietoenator.com
         QAContact: tinderbox-oe@gmx.net


I tried to build mplayer when package "libqpe-opie-1.2.2+cvs-20061009-r0"
failed to compile:

------------------------------------

...
ERROR: log data follows
(/data/embedded2.1/oetmp/work/libqpe-opie-1.2.2+cvs-20061009-r0/temp/log.do_compile.6365)
| NOTE: make -j3 MAKEFLAGS=
MOC=/data/embedded2.1/oetmp/staging/i686-linux/bin/moc
UIC=/data/embedded2.1/oetmp/staging/i686-linux/bin/uic
| rm -f libqpe.so.1.5.0 libqpe.so libqpe.so.1 libqpe.so.1.5
| ccache i486-linux-gcc -L/data/embedded2.1/oetmp/staging/i486-linux/lib
-Wl,-rpath-link,/data/embedded2.1/oetmp/staging/i486-linux/lib -Wl,-O1  
-Wl,-rpath-link,/data/embedded2.1/oetmp/staging/i486-linux/qt2/lib -shared
-Wl,-soname,libqpe.so.1 -o libqpe.so.1.5.0 calendar.o global.o xmlreader.o
mimetype.o menubutton.o network.o networkinterface.o filemanager.o
fontmanager.o qdawg.o datebookmonth.o fileselector.o imageedit.o resource.o
qpedecoration_qws.o qcopenvelope_qws.o qpeapplication.o qpestyle.o qpedialog.o
lightstyle.o config.o applnk.o sound.o tzselect.o qmath.o datebookdb.o
alarmserver.o password.o process.o process_unix.o timestring.o fontdatabase.o
power.o storage.o qpemessagebox.o timeconversion.o qpedebug.o qpemenubar.o
qpetoolbar.o categories.o stringutil.o palmtoprecord.o task.o event.o contact.o
categorymenu.o categoryedit_p.o categoryselect.o categorywidget.o ir.o
vcc_yacc.o vobject.o findwidget_p.o finddialog.o lnkproperties.o
locationcombo.o widget_showing.o quuid.o qlibrary.o qlibrary_unix.o
rohfeedback.o passwordbase_p.o categoryeditbase_p.o findwidgetbase_p.o
lnkpropertiesbase_p.o moc_menubutton.o moc_datebookmonth.o moc_fileselector.o
moc_fileselector_p.o moc_imageedit.o moc_qpedecoration_qws.o
moc_qpeapplication.o moc_qpedialog.o moc_tzselect.o moc_process.o moc_storage.o
moc_qpemenubar.o moc_qpetoolbar.o moc_categories.o moc_categorymenu.o
moc_categoryedit_p.o moc_categoryselect.o moc_ir.o moc_findwidget_p.o
moc_finddialog.o moc_lnkproperties.o moc_locationcombo.o moc_qlibrary_p.o
moc_rohfeedback.o moc_passwordbase_p.o moc_categoryeditbase_p.o
moc_findwidgetbase_p.o moc_lnkpropertiesbase_p.o 
-L/data/embedded2.1/oetmp/staging/i486-linux/qt2/lib  -ldl -lcrypt -lm -lsupc++
-lqte
|
/data/embedded2.1/oetmp/cross/lib/gcc/i486-linux/4.1.1/../../../../i486-linux/bin/ld:
cannot find -lqte
| collect2: ld returned 1 exit status
| make: *** [libqpe.so.1.5.0] Fehler 1
| FATAL: oe_runmake failed

-------------------------------------

The file "libqte.a" is missing in "staging/i486-linux/qt2/lib" but it's present
in 

work/qmake-native-1.07a-r3/qt-embedded-free-3.3.5/lib/libqte.la
work/uicmoc-native-2.3.10-r2/qt-2.3.10/lib/libqte.a
work/qte-mt-static-2.3.12-r3/qt-2.3.10-snapshot-20060120/lib/libqte.a

Manually copying it into "staging/i486-linux/qt2/lib" solves the problem.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


