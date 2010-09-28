Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1P0jW9-0001YJ-Kf
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 01:23:34 +0200
Received: by qwb7 with SMTP id 7so123074qwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 16:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YSmq1puYCijMsbIqbSJgG8dfjjCDraUITElm2SRvp/g=;
	b=ND3PEQGnPNxERT22vIEPVOUtBq81VFBW3V3fG5BVSvaV8+MzwNYWB7C4qPP/OcGgla
	Tpi/lr1wpXUGZY88QZNz3/I99BnuIs0h9srzcpMW6NJPZx6NNiJP+grC/PagPIbhgGuL
	rTcsEEtysI8ysPTMZAW7BOHNU9+Ua3U2xQWKM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cIs1xrD/22yUZVBYz86SLB2wopyaH1V5kAx6TaaVljtSHPNuJ4aDIU7YP+wjXbqKx4
	rPOFsoRxp8YDBR1mjiH4qXIWlVMhCr99tyvu/SyKfvRAKFCBleqqOqYN3BCJHBby6vpc
	QZFxFWzUpzo7rCq0UplhiKsQXLudjXO5zm5mo=
MIME-Version: 1.0
Received: by 10.224.78.8 with SMTP id i8mr435530qak.239.1285716192741; Tue, 28
	Sep 2010 16:23:12 -0700 (PDT)
Received: by 10.229.36.65 with HTTP; Tue, 28 Sep 2010 16:23:12 -0700 (PDT)
In-Reply-To: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
Date: Wed, 29 Sep 2010 01:23:12 +0200
Message-ID: <AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
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
X-List-Received-Date: Tue, 28 Sep 2010 23:23:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2010 at 6:54 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi,
>
> As I needed to generate two different kernels for the same machine I
> had some kind of problem (as emailed yesterday).
> For now I've solved it as follows:
>
> I created a 2nd recipe (in an overlay):
> linux-small_2.6.34.bb
> this one essentially only requires linux_2.6.34.bb and sets S to the linu=
x_${PN}
> Then I can just add a dir linux-small and add the small defconfig in it.
>
> That way bitbake linux-small should give me the 2nd kernel.
> And actually it builds the kernel but this one is also packaged in a
> kernel-*.ipk.
> I could have made two different machines, but that seemed somewhat
> overkill, so in the end I decided to modify do_install_append in
> linux.inc.
>

We solved same issues with linux-kexecboot.inc including linux.inc and
redefining vars/tasks.
In particular
...
PACKAGES =3D ""
PROVIDES =3D ""
...
KERNEL_IMAGE_BASE_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${MAC=
HINE}"
KERNEL_IMAGE_SYMLINK_NAME =3D "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
...

do_populate_sysroot() {
}

do_install() {
}

python do_package() {
}

So we end having in e.g.
/oe/build/tmp/deploy/glibc/images/c7x0
zImage-2.6.26-r13-c7x0.bin                        1351824=E2=94=82Sep 25 04=
:37
@zImage-c7x0.bin                                             26=E2=94=82Sep=
 25 04:38
zImage-kexecboot-2.6.26-r20.0-c7x0.bin      1113112=E2=94=82Sep 25 04:40
@zImage-kexecboot-c7x0.bin                             38=E2=94=82Sep 25 04=
:40



> This function currently reads:
>
> do_install_append() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake headers_install
> INSTALL_HDR_PATH=3D${D}${exec_prefix}/src/linux-${KERNEL_VERSION}
> ARCH=3D$ARCH
> }
>
> And I just added a line:
> =C2=A0 =C2=A0cp ${D}/boot/uImage ${DEPLOY_DIR_IMAGE}/uImage-${PN}

I don't think patch is necessari, though you should use
${KERNEL_IMAGETYPE} and not uImage


>
> That way both kernels end up with different names in the deploy dir.
> In the image recipe I can then just copy them in a post process
> command to the proper location.
> (btw that is also why I went for uImage-${PN} and not for
> uImage-${PN}-${KERNEL_VERSION}, the kernel version is not known in the
> image recipe so it is much harder to copy the right/latest uImage to
> the kernel.
>
> Rationale for typing this message is threefold:
> - first of all I wanted to record and share what I have done, so
> others can use it
> - secondly I would appreciate feedback on my solutions (and maybe
> someone sees a way to improve it)
> - and lastly I would like to inquire if people feel the above line
> would be a nice addition to the stock linux.inc. If so I'l happily
> prepare a patch.

Remember that most work is done in kernel.bbclass
Copy of kernel is done in do_deploy()

...
install -m 0644 ${KERNEL_OUTPUT}
${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
...

>
> Your feedback is appreciated.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Regards

Andrea


