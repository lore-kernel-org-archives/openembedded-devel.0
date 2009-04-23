Received: from [209.85.217.177] (helo=mail-gx0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LwzJi-0004e4-8V
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 15:50:18 +0200
Received: by gxk25 with SMTP id 25so106789gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MafVwkdhUfhT2qMd2veldHkZ3NA9TcFo3RUWiih9AMw=;
	b=uhKwagAlt9fF/qO8LcMHriqkOGmdUZn0spdL7ffMUdHNa/FQf3qwmR1xoG9QRgTTi0
	F5Dxd7ojqqNl5oMqZf94WsBrtRsmg2ckhcufTCbKjvNzIj39zxpnzUH60AJOO99ni/Cw
	p1pf4ODe0VfXqEI3sUTX8q9qR8rSK0u0k++XA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Xo0hP34vTLuJv/rkV+xPgnoIWL2XoTacneazCX2/9e1AkNLeAwZ1+Zd0oCYX49zx+V
	wRNe6LaUYZS+O9NC/6I4is/0rbnT0l0YojHPi5emkZmSKHV+EG7L+GvO2cmK+D6IL/dp
	pL4CELT+NPrNkNs0+khap8cbKkKOehoBGPZRI=
MIME-Version: 1.0
Received: by 10.90.93.17 with SMTP id q17mr1274254agb.4.1240494338397; Thu, 23 
	Apr 2009 06:45:38 -0700 (PDT)
In-Reply-To: <200904231447.35932.khimov@altell.ru>
References: <1238404723-8814-1-git-send-email-khimov@altell.ru>
	<200904220859.23657.khimov@altell.ru>
	<c384c5ea0904230326v3742658ah5c8afd8d156a1c08@mail.gmail.com>
	<200904231447.35932.khimov@altell.ru>
Date: Thu, 23 Apr 2009 15:45:38 +0200
Message-ID: <c384c5ea0904230645q53a06467tc82496e101f2909b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: use ROOTFS_SIZE for gzip'd images
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
X-List-Received-Date: Thu, 23 Apr 2009 13:50:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Roman,

On Thu, Apr 23, 2009 at 12:47 PM, Roman I Khimov <khimov@altell.ru> wrote:
> On Thursday 23 April 2009 14:26:55 Leon Woestenberg wrote:
>> On Wed, Apr 22, 2009 at 6:59 AM, Roman I Khimov <khimov@altell.ru> wrote=
:
>
> Well, my 'du' manual says
>
> =A0 =A0 =A0 =A0-k =A0 =A0 like --block-size=3D1K
>
> So it's just kilobytes or at least should be so. And in genext2fs there i=
s
>
> =A0 =A0 =A0 =A0#define BLOCKSIZE =A0 =A0 =A0 =A0 1024
>
Yup, thanks.

I assumed "du" estimates for a particular (the current?) filesystem,
but I could not find anything on this.

Regards,
--=20
Leon


