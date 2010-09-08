Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtPWu-0004ye-GY
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 20:37:57 +0200
Received: by gxk2 with SMTP id 2so216946gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 11:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=TPFnVZxPzsYIQzideklJbfDtbM3tPQxCFlvFnmWvuhE=;
	b=kmby/oGqMqPp0+Md9lmPPoRqtQYPA4k7jWdp/QAGFmRglZI0Cw9VKosGi99Kz/Ye9H
	OIcvmeWJasO7yxa8LYNdjWgF3qFT984VLRz0e3CUbSKUjli0y3Cl7Sd9Zbr3tGa0FWtt
	LDIFp+M0MR20BqGg5G4gLkp59BjmDuK4opYC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=isnLtDp88bsjouk7oyok4DOLBF4KHX4tueOs62YlKrqJlzjhLDHz06tJ8zmbq4ruGH
	3tQpMi30oQwTMxCEaAw1Pbpc2qiTawvKOtRCSAiEzhBzNteljIjWjB6jD1gHOV1XRcPQ
	LJHfl6r/+R5vnwHfGSOstTCeJ66QFAo0Whu1o=
Received: by 10.150.92.9 with SMTP id p9mr32031ybb.198.1283971033349; Wed, 08
	Sep 2010 11:37:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 11:36:53 -0700 (PDT)
In-Reply-To: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
References: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 11:36:53 -0700
Message-ID: <AANLkTi=+8Aq14dN9TrbyY851cr43neEKAbU58MqXrq6f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRC_URI_arch override. error?
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
X-List-Received-Date: Wed, 08 Sep 2010 18:37:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 8, 2010 at 7:52 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi,
>
> I have an issue with the linux-libc-headers recipe for nios2.
> Maybe I am trying to do something what is not possible.
>
> The recipe contains:
> SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz=
2 \
> =A0 =A0 =A0 =A0 =A0"
>
> SRC_URI_nios2 =3D
> "ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a=
32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=3Dnios2tarball
> \
> =A0 =A0 =A0 =A0 =A0"
>
> I was under the assumption that when building with TARGET_ARCH set to
> "nios2" (e.g. for machine neek) I would get the 2nd uri.


I still get this correct. I am using bitbake master


