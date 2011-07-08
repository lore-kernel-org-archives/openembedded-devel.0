Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QezHA-0003yQ-5Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 02:50:36 +0200
Received: by vws2 with SMTP id 2so1281747vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 17:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=Y2XXnbTwOShra4iBzKKREXq45hTzFOA8nFq4seFpND0=;
	b=GlrzClDXafhgXPFNtCQNfE8dbTXl1T97i6/aBRmyiCHCUdGf3s8zpA7KqcR88wV7vO
	XXbK7lFdSCIGPmz0nwKYNvNNYUnoZNwFxujYFt2Lsxo+HxBITJuEhZyoi+n8+RO9m6p9
	5yPYRgqwrYSvGZ02WOnwjsiLWl07KL+tW7ytU=
Received: by 10.52.94.50 with SMTP id cz18mr1873536vdb.299.1310086003524;
	Thu, 07 Jul 2011 17:46:43 -0700 (PDT)
Received: from [192.168.30.25] (ns-visitor-nsrp.juniper.net [208.223.208.242])
	by mx.google.com with ESMTPS id i8sm2976650vby.23.2011.07.07.17.46.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 17:46:42 -0700 (PDT)
References: <1310073836-11556-1-git-send-email-agnel.joel@gmail.com>
	<CA+T6QP=c0eij6buvs-7MFCDVmwWheAsz8dL4K1n2+V=TQ_vyxw@mail.gmail.com>
In-Reply-To: <CA+T6QP=c0eij6buvs-7MFCDVmwWheAsz8dL4K1n2+V=TQ_vyxw@mail.gmail.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <848EB838-ABE4-4EAA-9282-B9AA7522B020@gmail.com>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2011 17:47:10 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: "joelagnel@ti.com" <joelagnel@ti.com>,
	"beagleboard@googlegroups.com" <beagleboard@googlegroups.com>,
	"k-kooi@ti.com" <k-kooi@ti.com>, Joel A Fernandes <agnel.joel@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "jdk@ti.com" <jdk@ti.com>
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
X-List-Received-Date: Fri, 08 Jul 2011 00:50:36 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 7, 2011, at 5:32 PM, Jason Kridner <jkridner@beagleboard.org> wrote:

> On Thu, Jul 7, 2011 at 5:23 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
>> This script flashes the NAND of a BeagleBoard if:
>>  * The user-button is pressed
>>  * There is a valid image on the SD Card to flash
>>  * The board has NAND
>>=20
>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>=20
> Acked-by: Jason Kridner <jkridner@beagleboard.org>
>=20
>> ---
>> Changes since v2:
>>  User button is checked before flashing of the board
>>=20
>> This is based on Jason's review:
>> http://groups.google.com/group/beagleboard/msg/835de9a37c3a340a
>>=20
>>  .../beagleboard/beagleboard-test-scripts_git.bb    |   14 +++++++++++---=

>>  1 files changed, 11 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipe=
s/beagleboard/beagleboard-test-scripts_git.bb
>> index be0d059..3f3cc56 100644
>> --- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
>> +++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
>> @@ -1,14 +1,18 @@
>>  ## Reminder:  The correct spacing for a variable is FOO =3D "BAR"  in : P=
R=3D"r1"
>>  DESCRIPTION =3D "BeagleBoard test scripts"
>>  HOMEPAGE =3D "http://beagleboad.org/support"
>> -PR =3D "r2"
>> +PR =3D "r3"
>>=20
>> -SRC_URI =3D "git://gitorious.org/beagleboard-validation/scripts.git;prot=
ocol=3Dgit \
>> +SRC_URI =3D "git://gitorious.org/~joelf/beagleboard-validation/validatio=
n-scripts.git;protocol=3Dgit \
>>  "
>>=20
>> -SRCREV =3D "473dd2ab20d866be6168c9f992c2c9e74e485c9d"
>> +SRCREV =3D "513bfa2e99822150ea5845f3a33c349029cb7c13"
>=20
> Thanks!
>=20
>>  S =3D "${WORKDIR}/git"
>>=20
>> +inherit update-rc.d
>> +INITSCRIPT_NAME =3D "flash-fs.sh"
>> +INITSCRIPT_PARAMS =3D "start 99 2 3 4 5 ."
>> +
>>  do_install() {
>>   TEST_FILES=3D" \
>>     testaudio \
>> @@ -28,4 +32,8 @@ do_install() {
>>   for i in ${TEST_FILES}; do
>>     install -m 0755 ${S}/${i} ${D}/${bindir}
>>   done
>> +  # A script to flash NAND if the board has it, and if there is valid im=
age to flash on the SD Card.
>> +  # We also register it as an init script so that the SD Card auto-flash=
es to NAND during boot.
>> +  install -d ${D}/${sysconfdir}/init.d/
>> +  install -m 0755 ${S}/flashing/flash-fs.sh ${D}/${sysconfdir}/init.d/fl=
ash-fs.sh

Would it be better to call it flash-nand-fs.sh ? Or have NAND somewhere in i=
t's name
>>  }
>> --
>> 1.7.0.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


