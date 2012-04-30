Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOyrT-0007nc-ME
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 00:14:27 +0200
Received: by yenm3 with SMTP id m3so1682126yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nG4/ssMlvsNpmzO/utETx6CdQX4F84SZtfqbxkvElg4=;
	b=gidFHSOeByaFlE6Ebtt8RZo9y3BIcIo0PIQqAVgXoqVG/7+TLRGqGJpe1lFwGOy9ms
	MAl3C/VcfYkHkpTBaC8aGqWUvjBmxldt1DFQ6U68C/L8iQYKCuM77RVkjd0TD3xs0znN
	XA4DXQ7CvBaktG3GiOEy7jEB5140+UOBD+GEd9B3ITVpGusf9Z1ijbdWGPafofK4SQV9
	Qq5kG8446y+Bz49Co698lABUI+a1VN2cbyEhoJP9v10TjBuDlymkOOV/FSz3aBzj0yKA
	odxMsZQDbVh07c+fxsIuIaNBAJV5aq3rATSVQ02svYe6QfKKdwgT94qGW1eJyhrl4ai5
	8dew==
MIME-Version: 1.0
Received: by 10.236.103.99 with SMTP id e63mr23596878yhg.116.1335823481959;
	Mon, 30 Apr 2012 15:04:41 -0700 (PDT)
Received: by 10.236.61.4 with HTTP; Mon, 30 Apr 2012 15:04:41 -0700 (PDT)
In-Reply-To: <20120314141551.GH3919@jama.jama.net>
References: <20120313114820.9572210335@opal>
	<20120314070803.GB3919@jama.jama.net>
	<20120314084016.GD3919@jama.jama.net>
	<4F60A1A6.4090204@opendreambox.org>
	<20120314141551.GH3919@jama.jama.net>
Date: Tue, 1 May 2012 00:04:41 +0200
Message-ID: <CA+chaQfPi8oHBekZb-C0SPNze5JmT9yFEy3m8SpeREPvB4JBeA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
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
X-List-Received-Date: Mon, 30 Apr 2012 22:14:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 3:15 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Mar 14, 2012 at 02:48:22PM +0100, Andreas Oberritter wrote:
>> On 14.03.2012 09:40, Martin Jansa wrote:
>> > On Wed, Mar 14, 2012 at 08:08:03AM +0100, Martin Jansa wrote:
>> >> On Tue, Mar 13, 2012 at 11:48:20AM +0000, git@git.openembedded.org wr=
ote:
>> >>> Module: openembedded-core.git
>> >>> Branch: master
>> >>> Commit: 4c41a3204ef72f53813ddc86fe525fa9c6714daa
>> >>> URL: =C2=A0 =C2=A0http://git.openembedded.org/?p=3Dopenembedded-core=
.git&a=3Dcommit;h=3D4c41a3204ef72f53813ddc86fe525fa9c6714daa
>> >>>
>> >>> Author: Andreas Oberritter <obi@opendreambox.org>
>> >>> Date: =C2=A0 Wed Mar =C2=A07 21:36:28 2012 +0100
>> >>>
>> >>> qt4: fix deps in libQtWebkit.la and QtWebKit.pc
>> >>>
>> >>> * Both files contain -L../../WebCore/release -L../../JavaScriptCore/=
release -lwebcore -ljscore
>> >>> * These paths and libs don't get installed.
>> >>> * When building a shared lib with libtool, that links
>> >>> =C2=A0 with libQtWebKit, libtool adds these unneeded parameters
>> >>> =C2=A0 to the linker command-line, thus linking fails.
>> >>
>> >> BTW: here with bitbake having R/W to rootfs every qt4-x11-free build
>> >> creates /include/WebCore/libdummy.prl (yes really in root)
>> >> anynone seen this?
>> >> -rw-r--r-- 1 bitbake bitbake 680 Mar 14 01:13 /include/WebCore/libdum=
my.prl
>>
>> I'm only using qt4-embedded, with which I haven't noticed this file.
>
> I guess it fails on most builders as user running bitbake doesn't have
> right to create it (my is special because it's minimal chroot
> environment owned by same user as who is running bitbake process).
>
>> >> Maybe it's sign of another small issue in qt4 build.
>> >
>> > It's created during do_configure and probably caused by
>> > ./qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit=
2/Makefile:all: Makefile /include/WebCore/libdummy.prl =C2=A0/include/WebCo=
re/$(TARGET)
>> > ./qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit=
2/Makefile:/include/WebCore/libdummy.prl:
>> >
>> > But in unpacked sources closest thing to libdummy.prl is
>> > ./Source/WebKit2/DerivedSources.pro:TARGET =3D dummy
>>
>> I thought that Qt 4.8 didn't use WebKit2 by default. Did you enable it
>> manually?
>
> No everything default oe-core+meta-oe.
>
> Cheers,

with chmod 500 / I can clearly see in log.do_configure

  for /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free/qt4=
-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webki=
t/Source/WebKit2/DerivedSources.pro
(linux-gnueabi-oe-g++)
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free/qt4-x11-f=
ree-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/bin/qmake
-spec /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free/qt4=
-x11-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/mkspecs/linux-gnue=
abi-oe-g++
-o /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free/qt4-x1=
1-free-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/./src/3rdparty/webkit=
/Source/WebKit2
/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/qt4-x11-free/qt4-x11-f=
ree-4.8.1-r42.1/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Sour=
ce/WebKit2/DerivedSources.pro
WARNING: DESTDIR: Cannot access directory '/include/WebCore'

And in DerivedSources.pro there is
DESTDIR =3D $$OUTPUT_DIR/include/"WebCore"

So am I the only one seeing this or everybody just ingores this
because it's just WARNING in log (when you don't have / writeable by
user running bitbake?)

Cheers,


