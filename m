Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0q9t-0001dX-58
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 08:28:54 +0200
Received: by iwn2 with SMTP id 2so642104iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 23:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=u2f80TLLU9sCl3n/4cR8ayG3ZFp2Qc3h7U6ry9VpEFk=;
	b=DHN03qqTHGRlzIIb801n0VQ6SdKgnBxzLTT41xWhAR6nOe2AsurN0HPGhfGW3PgfIq
	GIcz9QC1/d6lbiBtCNMWn1N3ASCnRn5ZKH85omzC8Kc7AZEnwTtGlxL2hiBO+gSy21Rz
	teP4WzrsyXA38u712cg9/DaFHwO/z9LjbyFGY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fGK0YsNUk+vq7MIGx3xQw18gjCH6drmhlIINm/We70oas483teorqD1XpJy2DaI0Yh
	IyAsjKxoVJVHb1WH1YW0YOnFjFjqkqTTse2T4L+5VPGWfIap3+ctDp97QL2ggPS2wFKF
	cGsbm1tPQXZi1c/C9mEXbaRcsfDAXuuDsLz1c=
MIME-Version: 1.0
Received: by 10.231.36.77 with SMTP id s13mr1191795ibd.190.1285741717127; Tue,
	28 Sep 2010 23:28:37 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 28 Sep 2010 23:28:37 -0700 (PDT)
In-Reply-To: <AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
Date: Wed, 29 Sep 2010 08:28:37 +0200
Message-ID: <AANLkTikFQaRG3S8tJDGCFvWpad51Ac9X8f4DgHS-Rrvv@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Wed, 29 Sep 2010 06:28:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
> On Tue, Sep 28, 2010 at 6:54 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Hi,
>>
>> As I needed to generate two different kernels for the same machine I
>> had some kind of problem (as emailed yesterday).
>> For now I've solved it as follows:
>>
>> I created a 2nd recipe (in an overlay):
>> linux-small_2.6.34.bb
>> this one essentially only requires linux_2.6.34.bb and sets S to the lin=
ux_${PN}
>> Then I can just add a dir linux-small and add the small defconfig in it.
>>
>> That way bitbake linux-small should give me the 2nd kernel.
>> And actually it builds the kernel but this one is also packaged in a
>> kernel-*.ipk.
>> I could have made two different machines, but that seemed somewhat
>> overkill, so in the end I decided to modify do_install_append in
>> linux.inc.
>>
>
> We solved same issues with linux-kexecboot.inc including linux.inc and
> redefining vars/tasks.
> In particular
> ...
> PACKAGES =3D ""
> PROVIDES =3D ""
> ...
> KERNEL_IMAGE_BASE_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${M=
ACHINE}"
> KERNEL_IMAGE_SYMLINK_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
> ...
>
> do_populate_sysroot() {
> }
>
> do_install() {
> }
>
> python do_package() {
> }
>
> So we end having in e.g.
> /oe/build/tmp/deploy/glibc/images/c7x0
> zImage-2.6.26-r13-c7x0.bin =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01351824=E2=94=82Sep 25 04:37
> @zImage-c7x0.bin =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 26=E2=94=82Sep 25 04:38
> zImage-kexecboot-2.6.26-r20.0-c7x0.bin =C2=A0 =C2=A0 =C2=A01113112=E2=94=
=82Sep 25 04:40
> @zImage-kexecboot-c7x0.bin =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 38=E2=94=82Sep 25 04:4=
0
>
>
>
>> This function currently reads:
>>
>> do_install_append() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake headers_install
>> INSTALL_HDR_PATH=3D${D}${exec_prefix}/src/linux-${KERNEL_VERSION}
>> ARCH=3D$ARCH
>> }
>>
>> And I just added a line:
>> =C2=A0 =C2=A0cp ${D}/boot/uImage ${DEPLOY_DIR_IMAGE}/uImage-${PN}
>
> I don't think patch is necessari, though you should use
> ${KERNEL_IMAGETYPE} and not uImage
>
>

Andrea,

Thanks for the info.
I was unaware of  ${KERNEL_IMAGETYPE}.
That definitely makes things more generic
And indeed the code could go into do_deploy instead of do_install.
Both work, but it is more appropriate in do_deploy than in do_install

Wrt  KERNEL_IMAGE_BASE_NAME and  KERNEL_IMAGE_SYMLINK_NAME: didn't
know about these either. They are not in the OE manual; searching for
it gave me an angstrom doc on it though. Guess the OE manual could use
a list of all vars and their purpose.
With them I can avoid the copy line, so this is a nice improvement.

Frans

PS: referring to Denys' message about multi-linux.inc: still haven't
tested it, but what isslightly nasty about it is that it does not
package, so I cannot easily include modules in an image
(as my kernels are from the same recipe the modules are compatible,
and it helps to be able to say in an image recipe that you want to add
kernel-module-xyz)


