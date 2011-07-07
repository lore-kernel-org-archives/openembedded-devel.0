Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Qeq0D-0008VF-CD
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 16:56:29 +0200
Received: by bwf20 with SMTP id 20so1081748bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 07:52:38 -0700 (PDT)
Received: by 10.204.139.91 with SMTP id d27mr784656bku.139.1310050357099;
	Thu, 07 Jul 2011 07:52:37 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id l24sm8616795bkw.3.2011.07.07.07.52.35
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 07:52:35 -0700 (PDT)
Received: by bwf20 with SMTP id 20so1081685bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 07:52:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.83.159 with SMTP id f31mr764115bkl.211.1310050354665; Thu,
	07 Jul 2011 07:52:34 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Thu, 7 Jul 2011 07:52:34 -0700 (PDT)
In-Reply-To: <13872098A06B02418CF379A158C0F14601620D182B@dnce02.ent.ti.com>
References: <1309968919-23810-1-git-send-email-agnel.joel@gmail.com>
	<CA+T6QPmwg7mbU-+YRM1=DuXUUJqJR+zqkyz=wcRFQAxff4mmYA@mail.gmail.com>
	<13872098A06B02418CF379A158C0F14601620D182B@dnce02.ent.ti.com>
Date: Thu, 7 Jul 2011 10:52:34 -0400
Message-ID: <CA+T6QPkQzJYLy8mMr4pjk8p+9C2-9J4hyzJ17rt2GiejWjhHKw@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: "Kooi, Koen" <k-kooi@ti.com>
Cc: "Fernandes, Joel A" <joelagnel@ti.com>,
	"beagleboard@googlegroups.com" <beagleboard@googlegroups.com>,
	Joel A Fernandes <agnel.joel@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Kridner, Jason" <jdk@ti.com>
Subject: Re: [PATCH v2] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
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
X-List-Received-Date: Thu, 07 Jul 2011 14:56:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 10:37 AM, Kooi, Koen <k-kooi@ti.com> wrote:
> Since we're not in a ramdisk anymore, we could also dump a /etc/joel-was-=
here file to see if we already have flashed nand from this specific card or=
 not.

That would indeed make the card more useful, but it seems to be tied
to the wrong state--especially in a production environment where you
likely want to reuse the card on multiple boards.

It is critical that the public has a card image they can download to
restore the flash into its factory condition.  For C5 boards, it seems
to me that the USER button is a reasonable approach as it will cause
the on-card x-loader to be used that will give preference to the
on-card u-boot.  The remaining challenge is the lack of an isolated
command to read the environment from the NAND flash.  The current
u-boot will always have the default environment overridden by the
environment in NAND flash.

We discussed previously on this list the idea of adding a command to
read the environment from the NAND flash and then adjusting the
default environment to perform that read and use the on-NAND
environment (as priority above any other environment settings, such as
uenv.txt on the SD card) if the USER button was not pressed.  Then,
the reading of the environment from the NAND flash could be removed
and only read as part of the default environment settings.

A C5 image needs to go out, so I'm OK adding none of these changes for
this release, but I'd like it if Joel could make the above NAND/USER
button related changes to the mainline u-boot as part of the effort to
get all of the BeagleBoard u-boot patches into mainline.  At that
point, a new flashing image could be released.  In the meantime,
manual intervention of 'nand erase 260000 2000' may be required to
initiate flashing boards that have been modified.

>
>
> Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regi=
stered in England & Wales under company number 00574102
>
> -----Original Message-----
>
> From: Jason Kridner [mailto:jkridner@beagleboard.org]
> Sent: Thursday, July 07, 2011 4:35 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Fernandes, Joel A; beagleboard@googlegroups.com; Kooi, Koen; Joel A F=
ernandes; Kridner, Jason
> Subject: Re: [oe] [PATCH v2] beagleboard-test-scripts: Add a script flash=
-fs.sh for flashing NAND
>
> On Wed, Jul 6, 2011 at 12:15 PM, Joel A Fernandes <agnel.joel@gmail.com> =
wrote:
>> This script flashes the NAND of a BeagleBoard if it exists, and if there=
 is a valid image to flash
>>
>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>
> Acked-by: Jason Kridner <jkridner@beagleboard.org>
>
> I will eventually merge your changes into the mainline, but I believe
> it is helpful to get these updates in OE for BeagleBoard users who
> want to reproduce the shipping images.
>
> Can you update the process to only flash the boards if the USER button
> is held or some other similar strategy? =A0It seems that enabling this
> script would make the SD card image useless for non-flashing
> activities. =A0Of course, Gerald would need to sign-off on any flashing
> process changes.
>
>> ---
>> Changes since v1:
>> * Bumped PR
>> * Using commit revision number instead of AUTOREV
>> * Using update-rc.d class instead of copying init script to /etc/rc5.d/
>> * Removed full stops from the commit summary
>> * Made comment on the init script in do_install more clear
>>
>> =A0.../beagleboard/beagleboard-test-scripts_git.bb =A0 =A0| =A0 14 +++++=
++++++---
>> =A01 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recip=
es/beagleboard/beagleboard-test-scripts_git.bb
>> index be0d059..4e0f54f 100644
>> --- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
>> +++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
>> @@ -1,14 +1,18 @@
>> =A0## Reminder: =A0The correct spacing for a variable is FOO =3D "BAR" =
=A0in : PR=3D"r1"
>> =A0DESCRIPTION =3D "BeagleBoard test scripts"
>> =A0HOMEPAGE =3D "http://beagleboad.org/support"
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> -SRC_URI =3D "git://gitorious.org/beagleboard-validation/scripts.git;pro=
tocol=3Dgit \
>> +SRC_URI =3D "git://gitorious.org/~joelf/beagleboard-validation/validati=
on-scripts.git;protocol=3Dgit \
>> =A0"
>>
>> -SRCREV =3D "473dd2ab20d866be6168c9f992c2c9e74e485c9d"
>> +SRCREV =3D "c482b7cb6caaa986a86d360d39e9040c77667d6b"
>> =A0S =3D "${WORKDIR}/git"
>>
>> +inherit update-rc.d
>> +INITSCRIPT_NAME =3D "flash-fs.sh"
>> +INITSCRIPT_PARAMS =3D "start 99 2 3 4 5 ."
>> +
>> =A0do_install() {
>> =A0 TEST_FILES=3D" \
>> =A0 =A0 testaudio \
>> @@ -28,4 +32,8 @@ do_install() {
>> =A0 for i in ${TEST_FILES}; do
>> =A0 =A0 install -m 0755 ${S}/${i} ${D}/${bindir}
>> =A0 done
>> + =A0# A script to flash NAND if the board has it, and if there is valid=
 image to flash on the SD Card.
>> + =A0# We also register it as an init script so that the SD Card auto-fl=
ashes to NAND during boot.
>> + =A0install -d ${D}/${sysconfdir}/init.d/
>> + =A0install -m 0755 ${S}/flashing/flash-fs.sh ${D}/${sysconfdir}/init.d=
/flash-fs.sh
>> =A0}
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>


