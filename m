Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1R8E3o-0000zL-UG
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 18:29:40 +0200
Received: by eya25 with SMTP id 25so4369697eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 09:24:16 -0700 (PDT)
Received: by 10.213.8.8 with SMTP id f8mr2200966ebf.18.1317054256328;
	Mon, 26 Sep 2011 09:24:16 -0700 (PDT)
Received: from mail-ey0-f175.google.com (mail-ey0-f175.google.com
	[209.85.215.175])
	by mx.google.com with ESMTPS id v60sm61696479eev.12.2011.09.26.09.24.12
	(version=SSLv3 cipher=OTHER); Mon, 26 Sep 2011 09:24:12 -0700 (PDT)
Received: by eya25 with SMTP id 25so4369630eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 09:24:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.105.73 with SMTP id s9mr294500ebo.25.1317054251493; Mon,
	26 Sep 2011 09:24:11 -0700 (PDT)
Received: by 10.213.10.129 with HTTP; Mon, 26 Sep 2011 09:24:11 -0700 (PDT)
In-Reply-To: <1316849170.4893.6.camel@mattotaupa>
References: <1316848094-30368-1-git-send-email-jdk@ti.com>
	<1316849170.4893.6.camel@mattotaupa>
Date: Mon, 26 Sep 2011 12:24:11 -0400
Message-ID: <CA+T6QPn7hEB+7z6MSZooXZBUEiJXS+ktfPKq569GcfugSF8eSw@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] WIP: cloud9: created
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
X-List-Received-Date: Mon, 26 Sep 2011 16:29:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 24, 2011 at 3:25 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Jason,
>
> Am Samstag, den 24.09.2011, 03:08 -0400 schrieb Jason Kridner:
>> Cloud9 is a web-browser based IDE. =A0This application should support
>> multiple architectures as long as they have node.js and a build of
>> node-o3-xml that is dropped into this system. =A0Ideally, that library
>> would be added separately as a system-dependent portion, because
>> everything else should be ISA independent.
>>
>> Advice on cleaning up this recipe is welcome.
>
> what problems to do you see?

My main concern was the use of rsync and the process I was using to
extract git submodules.  They both work fine.  Hopefully the fetcher
will be improved in the future to solve the git submodules challenge,
but I sure think there must be an easier way to simply copy all of the
non-hidden files in a directory.

>
>> I will continue to improve it as I understand how. =A0It is rather
>> useful as-is.
>> ---
>> =A0meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb | =A0 28 ++++++++++++=
+++++++++++
>> =A01 files changed, 28 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
>>
>> diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/r=
ecipes-devtools/cloud9/cloud9_0.5.1.bb
>> new file mode 100644
>> index 0000000..626332f
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
>> @@ -0,0 +1,28 @@
>> +DESCRIPTION =3D "Meet Cloud9, development-as-a-service for Javascripter=
s and other developers"
>> +HOMEPAGE =3D "http://c9.io"
>> +RDEPENDS =3D "nodejs"
>
> This belongs further down too.

oe-stylize places RDEPENDS above SRC_URI.

>
>> +
>> +SRC_URI =3D "git://github.com/jadonk/cloud9.git;protocol=3Dgit \
>> +"
>
> Please put that below the license stuff [1].
>
>> +
>> +LICENSE =3D "GPLv3"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4784c3bcff601fd8f9515f52a11e=
7018"

oe-stylize only moves LICENSE up higher, but doesn't understand
LIC_FILES_CHKSUM.  I'll fix manually.

>> +
>> +SRCREV =3D "08bae1d1cc2ba9f7f883a25afd07f0339a82fa8b"
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_configure_prepend () {
>> + git submodule update --init --recursive
>> +}
>> +
>> +do_compile () {
>> +}
>
> Maybe add comments why the above overrides are needed.

Will do.  Note that oe-sytlize removes the line breaks between the do_
functions.  Is that really desired?

>
>> +
>> +do_install () {
>> + install -m 0755 -d ${D}/usr/share/cloud9 ${D}${bindir}
>> + rsync -r --exclude=3D".*" ${S}/* ${D}/usr/share/cloud9
>
> Should `rsync` be put in `DEPENDS`?

I'll put it there.

>
>> + touch ${D}${bindir}/cloud9
>> + echo "#!/bin/sh" > ${D}${bindir}/cloud9
>> + echo "node /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /home/root -p=
 3000" >> ${D}${bindir}/cloud9
>> + chmod 0755 ${D}${bindir}/cloud9
>> +}
>
>
> Thanks,
>
> Paul
>
>
> [1] http://openembedded.org/index.php?title=3DStyleguide

I believe that is only for classic OE.  I'm looking to submit to
meta-oe.  I submitted to this list per [2].

[2] http://git.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/REA=
DME

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


