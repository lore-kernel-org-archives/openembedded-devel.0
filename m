Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1Pkuyr-0000gB-La
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 09:55:58 +0100
Received: by qyk36 with SMTP id 36so784515qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 00:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=mygrxAuNRxQ4Swdx4gifXuWPaQOovH6hvnJmqFYMWT0=;
	b=Ct9SlV1PMB5TxGa359GNAXb5aZ4htXBeJeepsc9yxhyqWvaZjwFCj0qrQ70qiTDiXl
	VrN1Ptuntkmkt0QJJQK8oe8Al1b5W1X1WzAF4DUlXOmza+pqTuyRF7uPCng73QqfJDrN
	MxX1mTNakcQCBwXU9+9dBsZ0eKsEcccELsMiw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IZUCVTwPbl+qWBI+R2dRISbH12e+B/kplaJRgzyW+i1BEuskxqXYD/BaNIhD60pXXz
	JPqGKt8FwlN/p7VZMubwf4qUNDO0Tnq7x0avxFZKLjshtKcSKVXLy34d/xFOgTbcwSri
	s66xSb0egf29pqscGnGe9weSTCYSMskTvxDK0=
MIME-Version: 1.0
Received: by 10.229.217.133 with SMTP id hm5mr9033736qcb.40.1296723300082;
	Thu, 03 Feb 2011 00:55:00 -0800 (PST)
Received: by 10.229.242.69 with HTTP; Thu, 3 Feb 2011 00:54:59 -0800 (PST)
In-Reply-To: <4D4A6796.1070006@dresearch.de>
References: <4D4929CB.6040009@dresearch.de> <4D49552D.3010705@dresearch.de>
	<4D4A6796.1070006@dresearch.de>
Date: Thu, 3 Feb 2011 09:54:59 +0100
Message-ID: <AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 08:55:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

In the config.log from the build directory you should find the
original error on which the linker failed.
The check in the configure step can fail because of multiple reasons.

Regards,

Jan

On Thu, Feb 3, 2011 at 9:30 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 02.02.2011 13:59, schrieb Steffen Sledz:
>> Am 02.02.2011 10:54, schrieb Steffen Sledz:
>>> Has anybody some instructions/hints how to enable profiling
>>> support for selected libs and/or binaries in OE?
>>
>> The local.conf.sample does contain this section:
>>
>> # Uncomment these to build a package such that you can use gprof to prof=
ile it.
>> # NOTE: This will only work with 'linux' targets, not
>> # 'linux-uclibc', as uClibc doesn't provide the necessary
>> # object files. =A0Also, don't build glibc itself with these
>> # flags, or it'll fail to build.
>> #
>> # PROFILE_OPTIMIZATION =3D "-pg"
>> # SELECTED_OPTIMIZATION =3D "${PROFILE_OPTIMIZATION}"
>> # LDFLAGS =3D+ "-pg"
>>
>> This seems to do the work for the complete image.
>
> Hmmmm? Unfortunately not in all cases. Enabling the options mentioned abo=
ve and making a clean build results in
>
> =A0| ...
> =A0| checking for .preinit_array/.init_array/.fini_array support... no
> =A0| configure: error: Need linker with .init_array/.fini_array support.
> =A0| ERROR: Function do_configure failed
> =A0NOTE: package glibc-2.9-r36.3: task do_configure: Failed
> =A0ERROR: TaskFailed event exception, aborting
> =A0ERROR: Build of /home/sledz/work/openembedded/recipes/glibc/glibc_2.9.=
bb do_configure failed
> =A0ERROR: Task 127 (/home/sledz/work/openembedded/recipes/glibc/glibc_2.9=
.bb, do_configure) failed with 256
>
> Any ideas?
>
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@DResearch.de
> Fax: +49 30 515932-299
> Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


