Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MHKAt-0007tk-C0
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 18:09:15 +0200
Received: by fxm20 with SMTP id 20so1186765fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2009 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=I8aWWlTm/E6x+pUSZny8s8Yf1yEJbJK4XJ1m+yBMDL8=;
	b=ftCvtXpMKMCJmFVE7pgtjQhqbZMdozCCkccbN8EZsZAL9WUuyuZ/exJuTb/wWTk6Yt
	5WnFi8yWups3CoFWCgzx1dmbjl7PdFmKyv6MIDqifuI3wSsT8NG//RBHn9hTrFVl471M
	Y7UN17Qwr4RBHW7V1M1Uv+EMerbuLZ3eAVXEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hHGBJy8hL8zp+LaZgUbQYOJNqFjVXLVksl/Stlbeei2fxjQq2AAOwdqc+g3bjgLrBf
	ZDw4nX8ZovXSkm7WV6upFQ16tfQpJ8yZzugImjuFATize34nTRawMcdyRDdetTn5/UEV
	2fmHoxCQCWlDZV3t2ywwGo6l1swyTHz2Acfb8=
MIME-Version: 1.0
Received: by 10.103.197.17 with SMTP id z17mr1143453mup.19.1245340720490; Thu, 
	18 Jun 2009 08:58:40 -0700 (PDT)
In-Reply-To: <4A3A60D2.506@epfl.ch>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-10-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-11-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-12-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-13-git-send-email-ihar.hrachyshka@gmail.com>
	<4A3A60D2.506@epfl.ch>
Date: Thu, 18 Jun 2009 18:58:40 +0300
Message-ID: <fce2a370906180858v276f4978j64a2e2d54a964d78@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 12/12] task-qte-toolchain: added mkspecs and new qt4-tools-sdk recipe
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
X-List-Received-Date: Thu, 18 Jun 2009 16:09:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2009 at 6:44 PM, Valentin
Longchamp<valentin.longchamp@epfl.ch> wrote:
> Ihar Hrachyshka wrote:
>>
>> Added mkspecs, qt4-tools to toolchain tasks (now meta-toolchain-qte
>> works ok).
>>
>> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
>> ---
>> =C2=A0recipes/qt4/qt4-tools-sdk_4.5.1.bb =C2=A0 =C2=A0 =C2=A0 | =C2=A0 7=
2
>> ++++++++++++++++++++++++++++++
>> =C2=A0recipes/tasks/task-qte-toolchain-host.bb | =C2=A0 =C2=A02 +
>> =C2=A02 files changed, 74 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 recipes/qt4/qt4-tools-sdk_4.5.1.bb
>>
>> diff --git a/recipes/qt4/qt4-tools-sdk_4.5.1.bb
>> b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
>> new file mode 100644
>> index 0000000..db919fd
>> --- /dev/null
>> +++ b/recipes/qt4/qt4-tools-sdk_4.5.1.bb
>> @@ -0,0 +1,72 @@
>> +DESCRIPTION =3D "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
>> +DEPENDS =3D "zlib-native dbus-native"
>> +SECTION =3D "libs"
>> +HOMEPAGE =3D "http://www.trolltech.com"
>> +PRIORITY =3D "optional"
>> +LICENSE =3D "GPL"
>> +
>> +inherit sdk
>> +
>> +SRC_URI =3D
>> "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV=
}.tar.bz2
>> \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure-lflags.patch;patch=
=3D1 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://qt-config.patch;patch=3D1 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://g++.conf \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linux.conf"
>> +S =3D "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
>> +
>> +# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflag=
s
>> dbus-1"
>> +EXTRA_OECONF =3D "-prefix ${prefix} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-qt-libjpeg -qt=
-gif -system-zlib \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-no-libjpeg -no=
-libpng \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-no-accessibili=
ty \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-no-cups \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-no-exceptions =
=C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-no-nas-sound \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-no-nis \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-verbose -relea=
se -fast -static \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-qt3support \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I${STAGING_DIR=
_NATIVE}/usr/include \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I${STAGING_DIR=
_NATIVE}/usr/include/dbus-1.0 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I${STAGING_DIR=
_NATIVE}/usr/lib/dbus-1.0/include"
>> +
>> +# yank default -e, otherwise we get the following error:
>> +# moc_qbuffer.cpp: No such file or directory
>> +EXTRA_OEMAKE =3D " "
>> +
>> +do_configure() {
>> + =C2=A0 (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Config=
uring
>> qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
>> +}
>> +
>> +TOBUILD =3D "\
>> + =C2=A0src/tools/bootstrap \
>> + =C2=A0src/tools/moc \
>> + =C2=A0src/corelib \
>> + =C2=A0src/sql \
>> + =C2=A0src/dbus \
>> + =C2=A0src/qt3support \
>> + =C2=A0src/xml \
>> + =C2=A0src/tools/uic \
>> + =C2=A0src/tools/rcc \
>> + =C2=A0src/network \
>> + =C2=A0src/gui \
>> + =C2=A0src/tools/uic3 \
>> + =C2=A0tools/linguist/lrelease \
>> + =C2=A0tools/linguist/lupdate \
>> + =C2=A0tools/qdbus \
>> +"
>> +
>> +do_compile() {
>> + =C2=A0 =C2=A0for i in ${TOBUILD}; do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/$i && oe_runmake CC=3D"${CC}" CXX=
=3D"${CXX}"
>> + =C2=A0 =C2=A0done
>> +}
>> +
>> +do_stage() {
>> + =C2=A0 =C2=A0install -d ${STAGING_BINDIR_NATIVE}/
>> + =C2=A0 =C2=A0install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
>
> Why it qmake renamed to qmake2 ? I know it's its version (current is 2.0a=
),
> but this makes the fail the FindQt4 module in cmake (which heavily relies=
 on
> qmake !). See below:
>
> FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 PATHS
>
> Having it named qmake4, just like the other qt tools below should allow t=
his
> cmake module to find it.

I don't know. I just copy-pasted it from qt4-tools-native. I think it
really should be fixed as you stated but for all packages (native
too).

>
>> + =C2=A0 =C2=A0for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml q=
dbusxml2cpp;
>> do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 bin/${i} ${STAGING_BINDIR_N=
ATIVE}/${i}4
>> + =C2=A0 =C2=A0done
>> +}
>> +
>> +
>> diff --git a/recipes/tasks/task-qte-toolchain-host.bb
>> b/recipes/tasks/task-qte-toolchain-host.bb
>> index 2a9b652..02c95a3 100644
>> --- a/recipes/tasks/task-qte-toolchain-host.bb
>> +++ b/recipes/tasks/task-qte-toolchain-host.bb
>> @@ -3,3 +3,5 @@ require task-sdk-host.bb
>> =C2=A0DESCRIPTION =3D "Host packages for Qt Embedded SDK"
>> =C2=A0LICENSE =3D "MIT"
>> =C2=A0ALLOW_EMPTY =3D "1"
>> +
>> +RDEPENDS_${PN} +=3D "qt4-tools-sdk"
>
>
> --
> Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
> valentin.longchamp@epfl.ch, Phone: +41216937827
> http://people.epfl.ch/valentin.longchamp
> MEA3485, Station 9, CH-1015 Lausanne
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


