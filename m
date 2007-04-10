Received: from [64.233.184.226] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zhangwenbin@gmail.com>) id 1HbIvU-00044T-NH
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 18:10:37 +0200
Received: by wr-out-0506.google.com with SMTP id 69so1167488wri
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 09:10:34 -0700 (PDT)
Received: by 10.78.171.13 with SMTP id t13mr1120044hue.1176221432744;
	Tue, 10 Apr 2007 09:10:32 -0700 (PDT)
Received: by 10.78.186.5 with HTTP; Tue, 10 Apr 2007 09:10:32 -0700 (PDT)
Message-ID: <78671ac40704100910n4da6d006icd80bf2449ed547b@mail.gmail.com>
Date: Tue, 10 Apr 2007 12:10:32 -0400
From: "Wenbin Zhang" <zhangwenbin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@openembedded.org
Subject: errors while "bitbake opie-image" build
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
X-List-Received-Date: Tue, 10 Apr 2007 16:10:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, Guys,

I am using "bitbake opie-image" do OE compiling. But got lots of errors like
below. Someone suggested me add package "libqt4-dev", I added it, and in the
local.conf, my ASSUME_PROVIDED is set as ASSUME_PROVIDED += "libqt4-dev
qt4-native moc-native". But I still have these errors. Anyone has ideas?
Thanks!

The errors are:

| qbuttongroup.cpp:(.text+0x2b3): undefined reference to `vtable for
QButtonGroup'
| qbuttongroup.cpp:(.text+0x2ba): undefined reference to `vtable for
QButtonGroup'
| qbuttongroup.cpp: (.text+0x30b): undefined reference to `vtable for
QGroupBox'
| qbuttongroup.cpp:(.text+0x312): undefined reference to `vtable for
QGroupBox'
| qbuttongroup.cpp:(.text+0x346): undefined reference to `vtable for QFrame'

| qbuttongroup.cpp:(.text+0x34d): undefined reference to `vtable for QFrame'
| /stuff/tmp/work/i686-linux/uicmoc-native-2.3.10-r2/qt-2.3.10/lib/libqte.a(
qbuttongroup.o): In function `QButtonGroup::QButtonGroup(int,
Qt::Orientation, QString const&, QWidget*, char const*)':
| qbuttongroup.cpp:(.text+0x427): undefined reference to `vtable for
QButtonGroup'
| qbuttongroup.cpp:(.text+0x42e): undefined reference to `vtable for
QButtonGroup'
| /stuff/tmp/work/i686-linux/uicmoc-native-2.3.10-r2 /qt-2.3.10
/lib/libqte.a(qbuttongroup.o): In function `QButtonGroup::QButtonGroup(int,
Qt::Orientation, QString const&, QWidget*, char const*)':
| qbuttongroup.cpp:(.text+0x477): undefined reference to `vtable for
QButtonGroup'
| qbuttongroup.cpp:(.text+0x47e): undefined reference to `vtable for
QButtonGroup'
| /stuff/tmp/work/i686-linux/uicmoc-native-2.3.10-r2/qt-2.3.10/lib/libqte.a(
qbuttongroup.o): In function `QButtonGroup::QButtonGroup(int,
Qt::Orientation, QWidget*, char const*)':
| qbuttongroup.cpp:(.text+0x4c0): undefined reference to `vtable for
QButtonGroup'
| /stuff/tmp/work/i686-linux/uicmoc-native-2.3.10-r2/qt-2.3.10/lib/libqte.a(
qbuttongroup.o):qbuttongroup.cpp:(.text+0x4c7): more undefined references to
`vtable for QButtonGroup' follow
| /stuff/tmp/work/i686-linux/uicmoc-native-2.3.10-r2/qt-2.3.10/lib/libqte.a(
qbuttongroup.o): In function `QButtonGroup::buttonClicked()':
| qbuttongroup.cpp:(.text+0x6ac): undefined reference to
`QButtonGroup::clicked(int)'
| /stuff/tmp/work/i686-linux/uicmoc-native-2.3.10-r2/qt-2.3.10/lib/libqte.a(
qbuttongroup.o): In function `QButtonGroup::buttonReleased()':
| qbuttongroup.cpp:(.text+0x72a): undefined reference to
`QButtonGroup::released(int)'
| /stuff/tmp/work/i686-linux/uicmoc-native-2.3.10-r2/qt-2.3.10/lib/libqte.a(
qbuttongroup.o): In function `QButtonGroup::~QButtonGroup()':
| qbuttongroup.cpp:(.text+0xf43): undefined reference to `vtable for
QButtonGroup'
| qbuttongroup.cpp:(.text+0xf4a): undefined reference to `vtable for
QButtonGroup'
| qbuttongroup.cpp:(.text+0xf9b): undefined reference to `vtable for
QGroupBox'
| qbuttongroup.cpp:(.text+0xfa2): undefined reference to `vtable for
QGroupBox'


Thanks,
Wenbin

