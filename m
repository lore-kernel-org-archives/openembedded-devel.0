Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LyUBO-0001YC-RM
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 18:59:54 +0200
Received: by yx-out-1718.google.com with SMTP id 36so15280yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3sX1WSmJbfoEHBlVAESH2TCkQS69SqOix5eZX9vB1xg=;
	b=PspbFtFze5vN4kiAViYPOZKcS8i4UX7KJDeUqnaeP4zUJep61O9Wa4+TZsqCrIfm7I
	2eEXrQRv+FPquXY/UZWKWUvY0BtmuILAEeYaX//dF8PBai7/LBoUtasAC7QzjCuZh2TI
	4wh68JxVXizVuRO8dnUcw/1SNpLyrkYgC3KX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WCx2nbDVbrN2WG/hUsTV65VreNVZ0eXdcqN3qGAtejmySl5/Vaq9JW2Kvnkm9ZOIDZ
	LX4UiY1DA2j2ekJD7cEcit5rwl7/LqF+hyc6LGKorvqibGtem21scrYslzeXp8QYv3Ea
	ZQbHa0qMF2EgiKNIp4Uf8rs1X4z+IN3sBgiMk=
MIME-Version: 1.0
Received: by 10.90.106.4 with SMTP id e4mr7223412agc.84.1240851290902; Mon, 27 
	Apr 2009 09:54:50 -0700 (PDT)
In-Reply-To: <20090427015004.GB18788@smtp.west.cox.net>
References: <49f4efa8.1818d00a.3e97.4971@mx.google.com>
	<20090427015004.GB18788@smtp.west.cox.net>
Date: Mon, 27 Apr 2009 18:54:50 +0200
Message-ID: <c384c5ea0904270954r723e0493u5dcb6aef078ed527@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] madwifi-ng_r3837: Fix for LDFLAGS / GNU_HASH QA
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
X-List-Received-Date: Mon, 27 Apr 2009 16:59:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

thanks for your review, and conditional ack, let me try to make it
unconditional:

On Mon, Apr 27, 2009 at 3:50 AM, Tom Rini <trini@embeddedalley.com> wrote:
> On Sun, Apr 26, 2009 at 04:35:04PM -0700, leon.woestenberg@gmail.com wrot=
e:
>
>> Submit LDFLAGS variable to make.
>> Remove the cleaning of LDFLAGS in the binary Makefiles.
>> Unset LDFLAGS for the kernel modules compile.
>>
>> Compile tested on powerpc (mpc8313e-rdb).
>
> It's not explicit in the patch, but I assume that what happens now is
> that LDFLAGS is used for userland utils (good) and the kernel already
> makes sure this won't leak in as it doesn't pay attention to LDFLAGS at
> all. =A0Right? =A0Or some similar explanation? =A0If so:
>
> Acked-by: Tom Rini <trini@embeddedalley.com>
>

Yes, that's what I did. Let me explain the diff in English:

First we had the recipe clearing the LDFLAGS altogether, I reverted that:

do_compile() {
-       unset LDFLAGS
       oe_runmake all
 }

I then made sure the LDFLAGS are indeed cleared for the kernel case
(i.e. this is old behaviour):

+-      $(MAKE) -C $(KERNELPATH) SUBDIRS=3D$(shell pwd) modules
++      $(MAKE) -C $(KERNELPATH) LDFLAGS=3D SUBDIRS=3D$(shell pwd) modules

I then made sure the user tools do get the LDFLAGS in the Makefiles:

+-LDFLAGS =3D
++#LDFLAGS =3D

Then rebuild recipe for powerpc. Looked good. Don't have Wifi h/w to
test madwifi at this point.


Regards,
--=20
Leon


