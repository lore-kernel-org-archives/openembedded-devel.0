Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PA5Rq-0000cn-At
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 20:37:39 +0200
Received: by yxe42 with SMTP id 42so1725820yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 11:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YT01sztWgReSjNmOYjLDJm5XFl/TglndR6XVMkoYHEI=;
	b=CUXoZmxJNOVfqKMbKFMeDDiKVbOfXewmJLxALUR14nWrtMj7pHGn5iiVJ7yiXydYDU
	O+LqTvs2ljCyYz2DdO/UJPb01bUMeYLXj1MYefUhcBP98jAAgOV6TZ6WvSLMYLXxGQF1
	Mzz4diCV6dP+9mJs1d+GJmlbHOClau46hVMxE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=S/GGYgVR9dgUs36xgKJFtANv771Bff14EIrginchj/+WGnbV1LIBBcxTeF78uSnD1T
	yS+4c3isYUmrjFNgQDSe1rQGzagL585374p9O0MrQZnlXkcaUhKR9OfwrGks0zqCrgjw
	75JS8Hk6dSRicHu/AIp1dkcvmAxmuf13dk5rE=
Received: by 10.42.172.131 with SMTP id n3mr4168192icz.342.1287945417428; Sun,
	24 Oct 2010 11:36:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Sun, 24 Oct 2010 11:36:37 -0700 (PDT)
In-Reply-To: <lyfwvvaftm.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <4CC14738.9070309@nedap.com>
	<lyfwvvaftm.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 11:36:37 -0700
Message-ID: <AANLkTinMHO=XRv=EDuVVmLcfjJoLETgW8rv96jEus_YE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Sun, 24 Oct 2010 18:37:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 24, 2010 at 6:19 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Jaap de Jong <jaap.dejong@nedap.com> writes:
>
>> - =C2=A0 =C2=A0install -m 0755 src/cacaoh/.libs/cacaoh ${STAGING_BINDIR}=
/cacaoh-cldc-${PV}
>> + =C2=A0 =C2=A0install -m 0755 src/cacaoh/cacaoh ${STAGING_BINDIR}/cacao=
h-cldc-${PV}
>
> This is the wrong way to install libtool binaries/libraries. =C2=A0Please
> use 'libtool --mode=3Dinstall install -m ...' (or the platform prefixed
> 'libtool' program).
>

whats the difference ?

>
> Enrico
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


