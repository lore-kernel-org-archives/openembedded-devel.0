Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SB3YJ-00016x-Q5
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 13:25:07 +0100
Received: by ggcy3 with SMTP id y3so2642649ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=BvENmGVCkmE/CORgSkcwguhUQ6xE+ReZcmhoiqj3XxE=;
	b=CMDbwCafyLoVpY0QvhTWrUDzfX7bujbSgw/h0/2KyqYHo0pbeoji+24ahPKsdOpmZr
	0oD8DI9pyhV0WupAEKG3F5xo7Q8YTDqHnBgTx7vh66bBH6+SHskfN2ZmgsiNn2DRnSeL
	a1/QNUdpyZU/IBjWDjmOyW9Gts+7z8HprzctVufddNk1TKjX/xH+EaiIPwi3MpHmJZUu
	D/RYAHIcJDV4S5x7JLg00iJo4J0aKMn29wzPo97q/N8cmeZtk8vJTDz0rYxTKuvDN3P5
	HE5srpDXvfEqN0/HHycAPFIbg53jw5smdt1i6371UkNRdMGZ/4grYd+BWnfIoSc3nyls
	uBDA==
MIME-Version: 1.0
Received: by 10.68.134.136 with SMTP id pk8mr28878749pbb.120.1332504968036;
	Fri, 23 Mar 2012 05:16:08 -0700 (PDT)
Received: by 10.143.165.10 with HTTP; Fri, 23 Mar 2012 05:16:07 -0700 (PDT)
In-Reply-To: <cover.1332485253.git.Martin.Jansa@gmail.com>
References: <cover.1332485253.git.Martin.Jansa@gmail.com>
Date: Fri, 23 Mar 2012 13:16:07 +0100
Message-ID: <CAAQYJAu2DTKS=RTXJNjQHiUwn+JUiTT-+EsxF+P2Kro8hXt3eg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] kernel.bbclass update
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
X-List-Received-Date: Fri, 23 Mar 2012 12:25:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 7:48 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> The following changes since commit 986de01251408605161e0f8343866a0e7ffe79=
10:
>
> =A0qmake2: remove (2012-03-21 13:50:44 +0100)
>
> are available in the git repository at:
> =A0git://git.openembedded.org/meta-openembedded-contrib jansa/kernel
> =A0http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/kernel
>
> Martin Jansa (3):
> =A0kernel.bbclass: import s/1/True/ changes from oe-core version
> =A0kernel.bbclass: import QA warning fix for unpackaged files from
> =A0 =A0oe-core
> =A0kernel.bbclass: populate /etc/modules-load.d/ with module_autoload
> =A0 =A0entries too
>
> =A0meta-oe/classes/kernel.bbclass | =A0 64 +++++++++++++++++++++++++-----=
----------
> =A01 files changed, 40 insertions(+), 24 deletions(-)
>
> --
> 1.7.8.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Can we hope this copy of kernel.bbclass will be removed from meta-oe one da=
y?
Is it still here because the  machine_kernel_pr  ?

I ask, because the differences between the two copies are not too many
but are increasing with the time, i.e. do_compile_kernelmodules,
do_uboot_mkimage, kernel_do_deploy.

IMHO it is very bad keeping two copies of a basic class like this one.

Regards

Andrea


