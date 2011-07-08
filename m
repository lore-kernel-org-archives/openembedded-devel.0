Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Qez3c-0003iZ-V9
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 02:36:37 +0200
Received: by bwf20 with SMTP id 20so1642943bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 17:32:44 -0700 (PDT)
Received: by 10.204.23.6 with SMTP id p6mr92888bkb.368.1310085164583;
	Thu, 07 Jul 2011 17:32:44 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id k5sm8945498bka.5.2011.07.07.17.32.42
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 17:32:43 -0700 (PDT)
Received: by bwf20 with SMTP id 20so1642927bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 17:32:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.205.81.208 with SMTP id zz16mr74292bkb.372.1310085162179; Thu,
	07 Jul 2011 17:32:42 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Thu, 7 Jul 2011 17:32:42 -0700 (PDT)
In-Reply-To: <1310073836-11556-1-git-send-email-agnel.joel@gmail.com>
References: <1310073836-11556-1-git-send-email-agnel.joel@gmail.com>
Date: Thu, 7 Jul 2011 20:32:42 -0400
Message-ID: <CA+T6QP=c0eij6buvs-7MFCDVmwWheAsz8dL4K1n2+V=TQ_vyxw@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: beagleboard@googlegroups.com
Cc: joelagnel@ti.com, k-kooi@ti.com, Joel A Fernandes <agnel.joel@gmail.com>,
	openembedded-devel@lists.openembedded.org, jdk@ti.com
Subject: Re: [beagleboard] [PATCH v3] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
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
X-List-Received-Date: Fri, 08 Jul 2011 00:36:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 5:23 PM, Joel A Fernandes <agnel.joel@gmail.com> wro=
te:
> This script flashes the NAND of a BeagleBoard if:
> =A0* The user-button is pressed
> =A0* There is a valid image on the SD Card to flash
> =A0* The board has NAND
>
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>

Acked-by: Jason Kridner <jkridner@beagleboard.org>

> ---
> Changes since v2:
> =A0User button is checked before flashing of the board
>
> This is based on Jason's review:
> http://groups.google.com/group/beagleboard/msg/835de9a37c3a340a
>
> =A0.../beagleboard/beagleboard-test-scripts_git.bb =A0 =A0| =A0 14 ++++++=
+++++---
> =A01 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipe=
s/beagleboard/beagleboard-test-scripts_git.bb
> index be0d059..3f3cc56 100644
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
> +SRCREV =3D "513bfa2e99822150ea5845f3a33c349029cb7c13"

Thanks!

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


