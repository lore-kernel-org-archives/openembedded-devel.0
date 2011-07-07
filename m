Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QepjV-0007jG-M1
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 16:39:13 +0200
Received: by bwf20 with SMTP id 20so1064618bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 07:35:22 -0700 (PDT)
Received: by 10.204.84.6 with SMTP id h6mr772132bkl.188.1310049321749;
	Thu, 07 Jul 2011 07:35:21 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id e6sm8597026bka.23.2011.07.07.07.35.19
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 07:35:20 -0700 (PDT)
Received: by bwf20 with SMTP id 20so1064562bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 07:35:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.47.7 with SMTP id l7mr791474bkf.184.1310049319019; Thu, 07
	Jul 2011 07:35:19 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Thu, 7 Jul 2011 07:35:18 -0700 (PDT)
In-Reply-To: <1309968919-23810-1-git-send-email-agnel.joel@gmail.com>
References: <1309968919-23810-1-git-send-email-agnel.joel@gmail.com>
Date: Thu, 7 Jul 2011 10:35:18 -0400
Message-ID: <CA+T6QPmwg7mbU-+YRM1=DuXUUJqJR+zqkyz=wcRFQAxff4mmYA@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Cc: joelagnel@ti.com, beagleboard@googlegroups.com,
	Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, k-kooi@ti.com
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
X-List-Received-Date: Thu, 07 Jul 2011 14:39:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 6, 2011 at 12:15 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> This script flashes the NAND of a BeagleBoard if it exists, and if there =
is a valid image to flash
>
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>

Acked-by: Jason Kridner <jkridner@beagleboard.org>

I will eventually merge your changes into the mainline, but I believe
it is helpful to get these updates in OE for BeagleBoard users who
want to reproduce the shipping images.

Can you update the process to only flash the boards if the USER button
is held or some other similar strategy?  It seems that enabling this
script would make the SD card image useless for non-flashing
activities.  Of course, Gerald would need to sign-off on any flashing
process changes.

> ---
> Changes since v1:
> * Bumped PR
> * Using commit revision number instead of AUTOREV
> * Using update-rc.d class instead of copying init script to /etc/rc5.d/
> * Removed full stops from the commit summary
> * Made comment on the init script in do_install more clear
>
> =A0.../beagleboard/beagleboard-test-scripts_git.bb =A0 =A0| =A0 14 ++++++=
+++++---
> =A01 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipe=
s/beagleboard/beagleboard-test-scripts_git.bb
> index be0d059..4e0f54f 100644
> --- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
> +++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
> @@ -1,14 +1,18 @@
> =A0## Reminder: =A0The correct spacing for a variable is FOO =3D "BAR" =
=A0in : PR=3D"r1"
> =A0DESCRIPTION =3D "BeagleBoard test scripts"
> =A0HOMEPAGE =3D "http://beagleboad.org/support"
> -PR =3D "r2"
> +PR =3D "r3"
>
> -SRC_URI =3D "git://gitorious.org/beagleboard-validation/scripts.git;prot=
ocol=3Dgit \
> +SRC_URI =3D "git://gitorious.org/~joelf/beagleboard-validation/validatio=
n-scripts.git;protocol=3Dgit \
> =A0"
>
> -SRCREV =3D "473dd2ab20d866be6168c9f992c2c9e74e485c9d"
> +SRCREV =3D "c482b7cb6caaa986a86d360d39e9040c77667d6b"
> =A0S =3D "${WORKDIR}/git"
>
> +inherit update-rc.d
> +INITSCRIPT_NAME =3D "flash-fs.sh"
> +INITSCRIPT_PARAMS =3D "start 99 2 3 4 5 ."
> +
> =A0do_install() {
> =A0 TEST_FILES=3D" \
> =A0 =A0 testaudio \
> @@ -28,4 +32,8 @@ do_install() {
> =A0 for i in ${TEST_FILES}; do
> =A0 =A0 install -m 0755 ${S}/${i} ${D}/${bindir}
> =A0 done
> + =A0# A script to flash NAND if the board has it, and if there is valid =
image to flash on the SD Card.
> + =A0# We also register it as an init script so that the SD Card auto-fla=
shes to NAND during boot.
> + =A0install -d ${D}/${sysconfdir}/init.d/
> + =A0install -m 0755 ${S}/flashing/flash-fs.sh ${D}/${sysconfdir}/init.d/=
flash-fs.sh
> =A0}
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


