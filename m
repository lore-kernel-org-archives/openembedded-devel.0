Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QFMhd-0006HS-Dt
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Apr 2011 10:36:01 +0200
Received: by pvc30 with SMTP id 30so1752065pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2011 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=5d0gXoLwnLaeCN8RJSSp3paBJNwhHljBOng9IduTFxQ=;
	b=la9Qy3PyvqCfT+h8QgkuzlPeNswMAr9WFI6OIViDB2EDRQygTHDVJn7YiibOBn+aeE
	dDom1JNx2qxQExOVjoi/dWYIR5GoHrsxm/wSLdAl3gALLrqXSKd5lpOdvO62Jzh8mKQN
	ib0f7jh/ZT36z/tKARE6DYLKUF7pHn8IJtsEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nM/BECE2FJ79LzUkNFxAiPmYN1e31zkN1MsHdxNp65/vJ3AIboNK9+x3sOmcAAyGDM
	CAtdLH7sD50IzfIce+64rLSSNYIZR7fFL1ZtQZvVJyFcrK9y9jNWqR00Eseva8TpvMyf
	bt8gtlV8sv9GfCM58PBQlaXmjZ8u/tZlbfKo8=
MIME-Version: 1.0
Received: by 10.142.242.18 with SMTP id p18mr998389wfh.98.1303979212907; Thu,
	28 Apr 2011 01:26:52 -0700 (PDT)
Received: by 10.142.223.2 with HTTP; Thu, 28 Apr 2011 01:26:52 -0700 (PDT)
In-Reply-To: <E1QFCsw-00061a-Qk@melo.openembedded.org>
References: <E1QFCsw-00061a-Qk@melo.openembedded.org>
Date: Thu, 28 Apr 2011 10:26:52 +0200
Message-ID: <BANLkTik_aF=6MBf4Ws5edfNar3hHA9y3Kg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andrea Adami : linux: move stale patches to /obsolete/linux
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
X-List-Received-Date: Thu, 28 Apr 2011 08:36:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 12:07 AM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 71eb55a998a150f3dc828d2478b7875f807b3536
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D71eb55a998a150f3dc828d2478b7875f807b3536
>
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date: =A0 Thu Apr 28 00:05:40 2011 +0200
>
> linux: move stale patches to /obsolete/linux
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>
> ---
>
> =A0recipes/{ =3D> obsolete}/linux/files/configs/.empty =A0| =A0 =A00
> =A0recipes/{ =3D> obsolete}/linux/files/ipaq-hal.init =A0 | =A0 =A00
> =A0.../linux/files/linux-2.6-limits.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A00
> =A0.../linux/files/usb-gadget-ether-compat.patch =A0 =A0 =A0| =A0 =A00
> =A04 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/linux/files/configs/.empty b/recipes/obsolete/linux/=
files/configs/.empty
> similarity index 100%
> rename from recipes/linux/files/configs/.empty
> rename to recipes/obsolete/linux/files/configs/.empty
> diff --git a/recipes/linux/files/ipaq-hal.init b/recipes/obsolete/linux/f=
iles/ipaq-hal.init
> similarity index 100%
> rename from recipes/linux/files/ipaq-hal.init
> rename to recipes/obsolete/linux/files/ipaq-hal.init
> diff --git a/recipes/linux/files/linux-2.6-limits.patch b/recipes/obsolet=
e/linux/files/linux-2.6-limits.patch
> similarity index 100%
> rename from recipes/linux/files/linux-2.6-limits.patch
> rename to recipes/obsolete/linux/files/linux-2.6-limits.patch
> diff --git a/recipes/linux/files/usb-gadget-ether-compat.patch b/recipes/=
obsolete/linux/files/usb-gadget-ether-compat.patch
> similarity index 100%
> rename from recipes/linux/files/usb-gadget-ether-compat.patch
> rename to recipes/obsolete/linux/files/usb-gadget-ether-compat.patch
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>

This patch broke multikernel builds (grepping too strict...).

This part needs to be reverted:
> rename from recipes/linux/files/configs/.empty
> rename to recipes/obsolete/linux/files/configs/.empty


I'll do it this evening if nobody does it before.
Sorry.


Andrea


