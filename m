Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QhUju-00083K-1i
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 00:50:38 +0200
Received: by pvf24 with SMTP id 24so654674pvf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=T9JDGZODkm3vLkcTYVdRBUHggorrqVvw/gGldqAXZZg=;
	b=hBGu0MMpTENCAmEvbRe/Ka4QsirQVkVL8hfKQ9iPxsyq5UOMsnQnTC182EDj/mWwMd
	IOCuL6raGdwbnDlfa9D0Arc7KHGDkDeadCrARU2QdUOtIvQ6IzVV/lUUPr1KWtIuCCTY
	4OK4a4IZzkGFJIdth9q3wPdUSCq1XB4fuxpik=
MIME-Version: 1.0
Received: by 10.142.226.15 with SMTP id y15mr1184512wfg.232.1310683596483;
	Thu, 14 Jul 2011 15:46:36 -0700 (PDT)
Received: by 10.142.239.3 with HTTP; Thu, 14 Jul 2011 15:46:36 -0700 (PDT)
In-Reply-To: <E1QhN6O-00071x-W4@melo.openembedded.org>
References: <E1QhN6O-00071x-W4@melo.openembedded.org>
Date: Fri, 15 Jul 2011 00:46:36 +0200
Message-ID: <CAAQYJAtNSxi_-e4iyN7h7Z7oW7-kfmnezOszN507Gz8OWq=6nA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andrea Adami : kernel.bbclass: remove unintended change of INITRAMFS_TASK
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
X-List-Received-Date: Thu, 14 Jul 2011 22:50:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2011 at 4:41 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: df31400ef89c14b45860feb906d4355d5f7de0c7
> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3Ddf31400ef89c14b45860feb906d4355d5f7de0c7
>
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date: =A0 Thu Jul 14 00:50:26 2011 +0200
>
> kernel.bbclass: remove unintended change of INITRAMFS_TASK
>
> * during an unfortunate round of tests right before commiting the patch
> * do_configure[depends] became =A0kernel_do_configure[depends]
> * Nonsense!
> * As documented in commit 4dfef62dfe54a3b2c557a6df81d155adc1e03ccb
> * of OpenEmbedded git server, this must be in do_configure[depends]
> * to do the magic.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
> =A0meta/classes/kernel.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b71a650..d1f6480 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -195,7 +195,7 @@ kernel_do_configure() {
> =A0 =A0 =A0 =A0fi
> =A0}
>
> -kernel_do_configure[depends] +=3D "${INITRAMFS_TASK}"
> +do_configure[depends] +=3D "${INITRAMFS_TASK}"
>
> =A0do_menuconfig() {
> =A0 =A0 =A0 =A0 export DISPLAY=3D'${DISPLAY}'
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits


Hello,

just FYI I was confused by the kernel.bbclass in meta-openembedded.
This one has the kernel_do_configure[depends].

I'd suggest to remove this kernel.bbclass asap, merging eventual
missing bits in oe-core.
(At least apply this same fix as in oe-core)

Regards

Andrea


