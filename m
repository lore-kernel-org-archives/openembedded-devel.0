Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MfCXb-0001lK-Fd
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 14:51:23 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78002C16E3 for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 14:33:45 +0200
Message-ID: <4A913728.9000609@atmel.com>
Date: Sun, 23 Aug 2009 14:33:44 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8FBCA1.9050601@atmel.com>
	<200908231235.39555.marcin@juszkiewicz.com.pl>
In-Reply-To: <200908231235.39555.marcin@juszkiewicz.com.pl>
Subject: Re: Cleaning up the "linux" directory
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
X-List-Received-Date: Sun, 23 Aug 2009 12:51:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

Marcin Juszkiewicz skrev:
> Dnia sobota, 22 sierpnia 2009 o 11:38:41 Ulf Samuelsson napisa=C5=82(a)=
:
>> As everyone knows, the kernel directory is a mess:
>> I have been thinking about what to do about this,
>> and with the ability to include files in subdirectories,
>> I think I have found a nice solution.
>=20
> I had a look at this and for me it adds lot of things to care when kern=
el=20
> needs to be updated/changed.
>=20
> With current linux_X.Y.Z(.A).bb recipes it is easy to add new device - =
just=20
> one file needs to be edited and thats all. If new patch has to be added=
 then=20
> still one file to edit. New board to be added - same amount of work. If=
=20
> patches common for few targets needs to be added then you can create ne=
w=20
> variable for them:
>=20

The SRC_URI_appends should only contain automatically
generated things and there is warning against editing inserted.

When you say you only  have to edit one file to add a patch,
I think that is wrong. You have to enter the directory
and place the patch there.
It is defintely faster to select all the patches, and
run the script than to edit the toplevel file.

You also do not have to know the variable names.

If you want to add a board, you create the directory,
and possibly add a defconfig.
Rerun the script and again no editing of any files.

If you want to create a new CPU family, you probably are going
to create a file in conf/machine, and  you have to add the cpu  family
directory.
Easiest way to do this, is to copy another directory
and clean out the files.
Then you fill them with new board patches and defconfigs.

Personally, I see very little reasons for doing any editing
but if you want to do something for the at91, it is basically
the linux-2.6.3/at91/at91.inc that will the single file to edit.

It is different, but I think you should give it a try.



> AT91_PATCHES =3D "\
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-001-
> andrew-victor.patch;patch=3D1 \
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-002-
> experimental.patch;patch=3D1 \
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-003-
> ac97-0001-sam9g45-r1.patch;patch=3D1 \
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-003-
> ac97-0002-ac97-sam9rlek-r1.patch;patch=3D1 \
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-004-
> NAND-001-configurable-partition-size.patch;patch=3D1 \
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-005-
> touchscreen-001-sam9g45ek.patch;patch=3D1 \
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-006-
> EHCI-001.sam9g45ek.patch;patch=3D1 \
>         file://linux-2.6.30/at91/2.6.30.2/patch-sets/linux-2.6.30.2-at9=
1-007-
> CLK-001-debug-clocks.patch;patch=3D1 \
>         "
>=20
> And use it in SRC_URI for all boards. If patches do not touch files use=
d by=20
> other devices then adding them directly to default SRC_URI should also =
be=20
> possible (thats how at91 patch was added in linux_2.6.30.bb recipe).
>=20
> With your solution I have to check about 10 files in many directories o=
r=20
> regenerate all of them by some script (what about caring of manual chan=
ges in=20
> those files?).


Running the scripts manually will be bad, you need to run them
=66rom gnome (as of today).
What would be good to have is a bitbake command.

append	linux-${KERNEL_MAJOR}/${CPU_FAMILY}/${KERNEL_VERSION}/patch-sets/*
which would add all the *.patch files in the selected directories
in order.

Then there would be no need to run a script and no files to edit.
If you add a patch to the right directory,
then it will be added to the build.


> Maybe Buildroot uses such way (I do not know because last time I used i=
t=20
> before OE) but for me as long time OE developer it just adds lot of pos=
sible=20
> errors to do.

No, this is brand new and it also >reduces< the number of errors.
Spelling errors in file names in particular.
I believe the whole systen will have less errors,
and the top level can be cleaned out.

The only real error is if you forget to run the script,
but once you are in the patch directory, it takes less than
5 seconds to select the patches, and run the script.
Much faster and less error prone than editing.


> Regards,=20


--=20
Best Regards
Ulf Samuelsson



