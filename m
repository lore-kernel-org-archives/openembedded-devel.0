Received: from mail.cs.uni-potsdam.de ([141.89.48.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1PjwoV-0006s2-6r
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 17:41:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id A54171009F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 17:40:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id n8gthdFCyoc3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 17:40:17 +0100 (CET)
Received: from mail.cs.uni-potsdam.de (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id C946510085
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 17:40:17 +0100 (CET)
Received: from g231216135.adsl.alicedsl.de (g231216135.adsl.alicedsl.de
	[92.231.216.135]) by mail.cs.uni-potsdam.de (Horde MIME library) with
	HTTP; Mon, 31 Jan 2011 17:40:17 +0100
Message-ID: <20110131174017.kz6olhl4mc848www@mail.cs.uni-potsdam.de>
Date: Mon, 31 Jan 2011 17:40:17 +0100
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
References: <20110127130815.h92lw4hoa9kwow0g@mail.cs.uni-potsdam.de>
	<AANLkTi=Ny0WfaQwiU6ANd=YyOF++YHJ40VNHcs0ufEm5@mail.gmail.com>
In-Reply-To: <AANLkTi=Ny0WfaQwiU6ANd=YyOF++YHJ40VNHcs0ufEm5@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.4)
Subject: Re: Error in building OE for MicroBlaze!
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
X-List-Received-Date: Mon, 31 Jan 2011 16:41:15 -0000
Content-Type: text/plain;
	charset=UTF-8;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Again,

Since last week I changed my way to use the existing MicroBlaze =20
toolchain provided by Xilinx (http://xilinx.wikidot.com/mb-gnu-tools) =20
as an external toolchain in OE. Therefore, I modified my local.conf =20
like this:

TARGET_VENDOR =3D "-none"
TOOLCHAIN_TYPE =3D "external"
TOOLCHAIN_BRAND =3D "csl"

MACHINE =3D "xilinx-ml605"
TARGET_ARCH =3D "microblaze"
TARGET_CPU =3D "microblaze"
TARGET_TUNE =3D "microblaze"
# Hardware project options
XILINX_BSP_PATH =3D =20
"/home/akzare/Projects/PICSY/Hardware/SoC/EDK/virtex6/Segmentation/microblaz=
e_0/libsrc/device-tree_v0_00_x"
XILINX_BOARD =3D "ml605"

I copied the Xilinx toolchain in this location:

/opt/local/LinuxKernel_mb/Tools_MB_BE/microblaze-unknown-linux-gnu/bin

and then:

export =20
PATH=3D$PATH:/opt/local/LinuxKernel_mb/Tools_MB_BE/microblaze-unknown-linux-=
gnu/bin

And for distribution I use the minimal.conf + these lines:

#Machine specific tweaks, will move to its own include soon
PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx-ml605"
PREFERRED_VERSION_linux-xilinx-ml605 =3D "2.6.37"

I try to simply do: bitbake helloworld-image

This mechanism is successful up to 266'th task.

Now, I stop by this error:

...
NOTE: Running task 277 of 523 (ID: 101, =20
/opt/local/oe_mb/openembedded/recipes/meta/external-toolchain-csl.bb, =20
do_package)
NOTE: package external-toolchain-csl-1.0-r7: task do_package: Started
...
NOTE: Multiple libraries (libnss_hesiod.so.2, libnss_nis.so.2, =20
libnss_nisplus.so.2) found, but LEAD_SONAME 'libc.so.6' doesn't match =20
any of them
----------------------------------------------------------------
NOTE: Multiple libraries (libnss_hesiod.so.2, libnss_nis.so.2, =20
libnss_nisplus.so.2) found, but LEAD_SONAME 'libc.so.6' doesn't match =20
any of them
ERROR: PKGV not defined
ERROR: Error in executing python function in: =20
/opt/local/oe_mb/openembedded/recipes/meta/external-toolchain-csl.bb
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux-gnu'
ERROR: Printing the environment of the function
ERROR: =090004:    packages =3D bb.data.getVar('PACKAGES',d, True)
ERROR: =090005:
ERROR: =090006:    # no packages should be scanned
ERROR: =090007:    if not packages:
ERROR: =090008:        return
ERROR: =090009:
ERROR: =090010:    checks =3D [package_qa_check_rpath, package_qa_check_dev,
ERROR: =090011:              package_qa_check_perm, package_qa_check_arch,
ERROR: =090012:              package_qa_check_desktop, package_qa_hash_style=
,
ERROR: Function do_package_qa failed
NOTE: Task failed: ('function do_package_qa failed', =20
'/opt/local/oe_mb/tmp/work/microblaze-none-linux-gnu/external-toolchain-csl-=
1.0-r7/temp/log.do_package_qa.3960')
ERROR: Logfile of failure stored in: =20
/opt/local/oe_mb/tmp/work/microblaze-none-linux-gnu/external-toolchain-csl-1=
.0-r7/temp/log.do_package_qa.3960
Log data follows:
| ERROR: Error in executing python function in: =20
/opt/local/oe_mb/openembedded/recipes/meta/external-toolchain-csl.bb
| ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux-gnu'
| ERROR: Printing the environment of the function
| ERROR: =090004:    packages =3D bb.data.getVar('PACKAGES',d, True)
| ERROR: =090005:
| ERROR: =090006:    # no packages should be scanned
| ERROR: =090007:    if not packages:
| ERROR: =090008:        return
| ERROR: =090009:
| ERROR: =090010:    checks =3D [package_qa_check_rpath, package_qa_check_de=
v,
| ERROR: =090011:              package_qa_check_perm, package_qa_check_arch,
| ERROR: =090012:              package_qa_check_desktop, package_qa_hash_sty=
le,
| ERROR: Function do_package_qa failed
NOTE: package external-toolchain-csl-1.0-r7: task do_package: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of =20
/opt/local/oe_mb/openembedded/recipes/meta/external-toolchain-csl.bb =20
do_package failed
ERROR: Task 101 =20
(/opt/local/oe_mb/openembedded/recipes/meta/external-toolchain-csl.bb, =20
do_package) failed with 256
ERROR: =20
'/opt/local/oe_mb/openembedded/recipes/meta/external-toolchain-csl.bb' =20
failed
ERROR: =20
'/opt/local/oe_mb/openembedded/recipes/meta/external-toolchain-csl.bb' =20
failed
----------------------------------------------------------------

Is there any suggestion?

Ali

Quoting Khem Raj <raj.khem@gmail.com>:

>> ----------------------------------------------------------------
>>
>> gcc-4.5.inc ->
>> ----------------------------------------------------------------
>> # BRANCH =3D "gcc-4_5-branch"
>> BRANCH =3D "microblaze"
>> PR_append =3D "+svnr${SRCPV}"
>> ...
>
>
> This is the problem for your gcc issue above. OE gcc tracks the
> gcc-4_5-branch and all patches are based on that
> if you change the branch to something else then obviously patches wont
> apply. You have two options here
> if microblaze branch has distinct patches then apply them to 4_5
> branch otherwise write new recipes for gcc which
> use the microblaze branch.
>
> Hope that helps.
>


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.




