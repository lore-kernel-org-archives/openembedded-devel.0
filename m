Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1Qf7z6-0008Dv-UC
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 12:08:32 +0200
Received: by fxh10 with SMTP id 10so2144774fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=0n6kEVPtkFhFolmEYGG7JitHL8N3gs350qr6oE3N78k=;
	b=vv5xeMQ/s3qBllwiX/HFkSKdBoEwgwBN51fZq86OD3uZdhfcVrlvYQdxAszmgpWgJ2
	dQCkcG9su5KvCTtQzYN+XW4QsNnrQoJyxXm7zcTo7/4UHWbtDvnd8FJCIRA0Gri6LfLU
	TlbNaB3U6u0v/jhTeew6NJAEiXr7kj1hLWXQw=
Received: by 10.223.86.76 with SMTP id r12mr2849213fal.80.1310119480089; Fri,
	08 Jul 2011 03:04:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.94.68 with HTTP; Fri, 8 Jul 2011 03:04:20 -0700 (PDT)
In-Reply-To: <1310060679.4153.6.camel@mattotaupa>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
	<52d3dbb81758055099740c437667671b45974a2d.1310045515.git.michael.lippautz@gmail.com>
	<1310060679.4153.6.camel@mattotaupa>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Fri, 8 Jul 2011 12:04:20 +0200
Message-ID: <CACVrrMkgaZZq6E5_EyqYOeRnJ+6+SN6i+V8EF9QDBzjvfbd4Eg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2 4/4] start-stop-daemon: Add version 1.16.0.2 (initial recipe)
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
X-List-Received-Date: Fri, 08 Jul 2011 10:08:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/7/7 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Donnerstag, den 07.07.2011, 15:36 +0200 schrieb Michael Lippautz:
>> Provides a stand-lone s-s-d that is extracted from dpkg of the correspon=
ding
>> version.
>>
>> * dpkg_1.16.0.2 is hostedd on sources.oe.org, since debian wipes old ver=
sions
>> =A0 from their mirrors
>> * Installing only s-s-d (binary) would be covered by automake rules.
>> =A0 Documentation would be missing. Thus install all and purge non s-s-d=
 files.
>>
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>> ---
>> =A0.../start-stop-daemon_1.16.0.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 31 ++++++++++++++++++++
>> =A01 files changed, 31 insertions(+), 0 deletions(-)
>> =A0create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-st=
op-daemon_1.16.0.2.bb
>>
>> diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon=
_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_=
1.16.0.2.bb
>> new file mode 100644
>> index 0000000..9b1084a
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0=
.2.bb
>> @@ -0,0 +1,31 @@
>> +DESCRIPTION =3D "Debian's start-stop-daemon utility extracted from the =
dpkg \
>> +package"
>> +LICENSE =3D "PD"
>> +LIC_FILES_CHKSUM =3D "file://utils/start-stop-daemon.c;md5=3Da963623e45=
88f70122865aaa7a370ce4"
>> +# start-stop-daemon is usually shipped by dpkg
>> +RCONFLICS_${PN} =3D "dpkg"
>
> Trailing whitespace again.
>
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
>> +SRC_URI[md5sum] =3D "d211a84f38987771a49ad1c0f144334a"
>> +SRC_URI[sha256sum] =3D "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d=
0a31bbcc2b54c0ea5"
>> +
>> +inherit autotools gettext
>> +
>> +S =3D "${WORKDIR}/dpkg-${PV}"
>> +
>> +EXTRA_OECONF =3D " \
>> + =A0--with-start-stop-daemon \
>> + =A0--without-bz2 \
>> + =A0--without-deselect \
>> + =A0--without-install-info \
>> + =A0--without-selinux \
>> + =A0--without-update-alternatives \
>> +"
>> +
>> +do_install_append () {
>> + =A0# remove everything that is not related to start-stop-daemon, since=
 there
>> + =A0# is no explicit rule for only installing ssd
>> + =A0find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
>> + =A0find ${D} -depth -type d -empty -exec rmdir {} \;
>> +}
>
> Just looking at the recipe, the recipe in oe-dev [1] seems to do this
> differently and calls `update-alternatives` too. Is that not needed
> anymore and is copying the C file to the repository not working anymore?
>

Well, I (personally) rather take the files from a quite up-to-date
package from a mature distribution, instead of using a C file that has
been comitted 2010-03-30. It also saves (not much but atleast) some
space in the tree.

I can't think of why one would use update-alternatives here, because I
know only one s-s-d and thats the one from Debian's dpkg. Am I wrong
here?

>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/start=
-stop-daemon/start-stop-daemon_1.9.18.bb?id=3D529b445f1122e3d0de7acff980fa0=
af114368157
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


