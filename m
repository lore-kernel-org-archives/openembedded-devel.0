Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PGm0C-000619-62
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 06:16:51 +0100
Received: by wyi11 with SMTP id 11so2020505wyi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 21:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qTIMn+w+fDWszBfDO5/yQjffRMMMJcMGetSIc9UJYFE=;
	b=Wk3cedXoqtOe455+9abIBId0DiYF6QaIvz4RBkfF2N5KJu6+yEerGc9A1GgZmnWDUk
	+DOlWDdNJUuN9LBe+M+eiqNPx7vrGTl2BankgUlcEAi89kA4rupc2Qf+SE6xNmB38G0x
	edQysvDpnlccXTavZ1uUEaS7UVDxYJ1fJAR6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ua4huoo9Oy41oszXdufpkpAfx+K49Be3ZOLKyClMxOE1cn9iLIQMECTFI19Xdi6J3v
	oVIKD9OZW1tzs+A9IR3m8vyBEna0PonFnjg+gDRT+UTVIx7so8T/m2iiG8USepjU0k+X
	Az3EjRiWpAQukZLuVtXhflAjZgd+FIpLow6Tc=
MIME-Version: 1.0
Received: by 10.216.162.70 with SMTP id x48mr3218345wek.4.1289538943044; Thu,
	11 Nov 2010 21:15:43 -0800 (PST)
Received: by 10.216.235.214 with HTTP; Thu, 11 Nov 2010 21:15:43 -0800 (PST)
In-Reply-To: <4CD803E8.8080805@lambsys.com>
References: <4CD803E8.8080805@lambsys.com>
Date: Fri, 12 Nov 2010 00:15:43 -0500
Message-ID: <AANLkTik_7o3inJSsA279HkdkJj+y9Wk7dq3p72ffTVak@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Stable branch/tag?
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
X-List-Received-Date: Fri, 12 Nov 2010 05:16:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Probably the easiest thing to do is browse the tags at:
http://cgit.openembedded.org/cgit.cgi/openembedded/

and find a tag that has a tested combination closest to what you want
to do.  Our testing process is described here:

http://wiki.openembedded.net/index.php/Testing

I'll try to get the Getting Started documentation updated at some point.

Thanks,
Cliff

On Mon, Nov 8, 2010 at 9:06 AM, David Lambert <dave@lambsys.com> wrote:
> I am new to git and openembedded so please excuse another couple of naive
> questions.
>
>
> 1) What is a recommended stable branch/tag, and what command(s) are neede=
d
> to obtain this?
> 2) Is there a document somwhere that explains the relevance of the use of
> branches and tags in this project?
>
> Thanks in advance for help,
>
> Dave.
>
> Listing git tags shows:
>
> git tag -l
>
> SlugOS5.3-beta
> mv-packages-to-recipes-post
> mv-packages-to-recipes-pre
> pre-nov2009-core-updates
> shr/testing2009-1rc1
> tested_2010-10-14
> tested_2010-10-25
> tested_2010-10-29
> testing_2010-08-23
> testing_2010-08-30
> testing_2010-09-07
> testing_2010-09-13
> testing_2010-09-20
> testing_2010-09-27
> testing_2010-10-08
>
>
> and git branch -a
> * master
> =A0remotes/origin/HEAD -> origin/master
> =A0remotes/origin/bluelightning/opie-git
> =A0remotes/origin/cbrake/qt-4.7.0
> =A0remotes/origin/darwin
> =A0remotes/origin/fso/milestone5
> =A0remotes/origin/fso/milestone5.5
> =A0remotes/origin/holger/hash-style
> =A0remotes/origin/holger/openmoko-merges
> =A0remotes/origin/holger/qt4-4.7
> =A0remotes/origin/holger/qt4-sdk
> =A0remotes/origin/holger/random-fixes
> =A0remotes/origin/holger/staging-branch
> =A0remotes/origin/ieee80215
> =A0remotes/origin/jan/master
> =A0remotes/origin/john_lee/fastboot-devel
> =A0remotes/origin/john_lee/openmoko-toolchain
> =A0remotes/origin/kergoth/alternatives
> =A0remotes/origin/kergoth/autotools
> =A0remotes/origin/kergoth/bluez
> =A0remotes/origin/kergoth/hostap-madwifi
> =A0remotes/origin/kergoth/master
> =A0remotes/origin/khem/import-linaro-gcc-4.5
> =A0remotes/origin/koen/darwin-host-fixes
> =A0remotes/origin/koen/static-libs-rework
> =A0remotes/origin/laibsch/scim
> =A0remotes/origin/laibsch/wip
> =A0remotes/origin/likewise/nios2
> =A0remotes/origin/master
> =A0remotes/origin/morphis/for-upstream
> =A0remotes/origin/nios2
> =A0remotes/origin/org.openembedded.angstrom-2007.12-stable
> =A0remotes/origin/org.openembedded.dev
> =A0remotes/origin/org.openembedded.documentation
> =A0remotes/origin/org.openembedded.dreambox
> =A0remotes/origin/org.openembedded.dreambox.release_25
> =A0remotes/origin/org.openembedded.oetest
> =A0remotes/origin/org.openembedded.oz354fam083
> =A0remotes/origin/org.openembedded.oz354x
> =A0remotes/origin/org.openembedded.packaged-staging
> =A0remotes/origin/org.openembedded.slugos.5.3-beta
> =A0remotes/origin/org.openembedded.stable
> =A0remotes/origin/pb/toolchain-desuck
> =A0remotes/origin/push/oe
> =A0remotes/origin/raster
> =A0remotes/origin/rik/amd64
> =A0remotes/origin/rik/qemu-0.12
> =A0remotes/origin/robertschuster/amd64-target
> =A0remotes/origin/rpurdie/for-testing
> =A0remotes/origin/rpurdie/work-in-progress
> =A0remotes/origin/shared/blackfin
> =A0remotes/origin/shared/xorg-7.4-update
> =A0remotes/origin/shr/import
> =A0remotes/origin/shr/merge
> =A0remotes/origin/shr/stable2009
> =A0remotes/origin/shr/testing2009
> =A0remotes/origin/shr/testing2010
> =A0remotes/origin/shr/unstable
> =A0remotes/origin/stable/2009
> =A0remotes/origin/stefan/eten-support
> =A0remotes/origin/testing
> =A0remotes/origin/testing-next
> =A0remotes/origin/thesing/arm4-eabi-angstrom
> =A0remotes/origin/ulf/linux-2.6.30
> =A0remotes/origin/ulf/linux-2.6.30-2010-10-16
> =A0remotes/origin/ulf/linux-2.6.30-20100317
> =A0remotes/origin/ulf/linux-2.6.30-20100930
> =A0remotes/origin/ulf/linux-2.6.30-at91sam9g45_m10
> =A0remotes/origin/ulf/linux-2.6.30.2
> =A0remotes/origin/woglinde/gettext
> =A0remotes/origin/xora/angstrom-sqeeezy
> =A0remotes/origin/xora/angstrom-srcpv
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


