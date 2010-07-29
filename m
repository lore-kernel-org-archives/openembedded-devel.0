Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eblima@gmail.com>) id 1OeX6t-0001VM-4B
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 19:42:01 +0200
Received: by yxi11 with SMTP id 11so233183yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=rb3epbR1X2sW9rthH60v07o/FFUd0pFxqeXTnpX53T8=;
	b=ILoKM/YWFoi4KN61gTCUjPKg8R0YpAt5rM6objA0MVaWR0wrBuI5+WLkec9liJJeO+
	gVK4+Oou8gtXu5x9OfJbySr2BM9pOzqY40QyXEjm0sg5oyD/w34nBNNQ3xpVsWEgFGJO
	JagZZGRqsllKjmsEGQxImd7CrLr7pTlhuouKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=tqxMqtl/2ueI50QSieJiwPZUYm+Tr4vLg3Ze8VKae3o/T92WaeRantt4XRgSzyZ82t
	uVJJbpiEYQH1toSGB1NLJYTdoOXpuKGW2rjUXrpMUQuAhS7FGFOFdQQOVSSWqiTcmGDJ
	SK+1eoyOrnXJleaAXaKv9EW8E9j8j14K1f1b4=
Received: by 10.100.42.5 with SMTP id p5mr538741anp.15.1280425266472; Thu, 29 
	Jul 2010 10:41:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.176.77 with HTTP; Thu, 29 Jul 2010 10:40:46 -0700 (PDT)
In-Reply-To: <20100727010733.27CB746777@linux.fjfi.cvut.cz>
References: <20100727010733.27CB746777@linux.fjfi.cvut.cz>
From: "Eduardo Lima (Etrunko)" <eblima@gmail.com>
Date: Thu, 29 Jul 2010 14:40:46 -0300
Message-ID: <AANLkTimxdLKFKd0ecBHP=D+QVKijxv1Yr57UebcYLzqM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: eblima@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] cmake.bbclass: add CMAKE_SYSTEM_PROCESSOR into generated toolchain file
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
X-List-Received-Date: Thu, 29 Jul 2010 17:42:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2010 at 9:25 PM, David Kozub <zub@linux.fjfi.cvut.cz> wrote=
:
> Needed for packages that check this value, e.g. recent webkit.
>
> Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
> ---
> =C2=A0classes/cmake.bbclass | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
> index 2376012..32ada35 100644
> --- a/classes/cmake.bbclass
> +++ b/classes/cmake.bbclass
> @@ -28,6 +28,7 @@ cmake_do_generate_toolchain_file() {
> =C2=A0# CMake system name must be something like "Linux".
> =C2=A0# This is important for cross-compiling.
> =C2=A0 echo "set( CMAKE_SYSTEM_NAME" `echo ${SDK_OS} | sed 's/^./\u&/'` "=
)" > ${WORKDIR}/toolchain.cmake
> + =C2=A0echo "set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )" >> ${WORKDIR}=
/toolchain.cmake
> =C2=A0 echo "set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )" >> ${WORKDIR}=
/toolchain.cmake
> =C2=A0 echo "set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )" >> ${WORK=
DIR}/toolchain.cmake
> =C2=A0 echo "set( CMAKE_C_FLAGS \"${OECMAKE_C_FLAGS}\" CACHE STRING \"Ope=
nEmbedded CFLAGS\" )" >> ${WORKDIR}/toolchain.cmake

This is really necessary, check the last comment on CMake bug #9065
(http://public.kitware.com/Bug/view.php?id=3D9065).

IMHO It could go together with the CMake 2.8.2 patches.

Best regards, Etrunko.

> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Eduardo de Barros Lima
eblima@gmail.com


