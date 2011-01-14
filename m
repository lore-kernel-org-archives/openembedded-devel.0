Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdpzK-0003rL-Aj
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 21:11:10 +0100
Received: by ywi6 with SMTP id 6so1038642ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 12:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=e03UHk8f4b3yXP1LZKwQLWsMYyJHJOlxcKIp8MAeuxU=;
	b=T3CY95P8C8UeD6sSdCGJgK/95TaPNg7bbF+keP2erdP+WKy6M0qGJDqsgu3hwkNkF0
	eYYvab0YRAwdxOZDbaK2vNMDiUwrWm4xdpaD6zCKYSLVi8Bis7sUxjjfdX5bHEnCBkiT
	zPRToIjz+avfcfE+yPSXDRtC0GAj6fAdcWtsw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gbPFXrWQaeZuI7b3rDfvoGwI+HHLUKyuQx7ZPfCjsdvasBJINaJ8MbSGYyvqTjudaL
	Yq58C+ZVl0neOKgJrjXo9JO1EaFZUU/d3SlgsymrefTwYXFiTkmplAsL/136aBccd0Xr
	c5SQ6WowIRl6lfjLK9r4sUN3+c/kIb1plzCrY=
Received: by 10.90.10.21 with SMTP id 21mr1667601agj.112.1295035835275; Fri,
	14 Jan 2011 12:10:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Fri, 14 Jan 2011 12:10:15 -0800 (PST)
In-Reply-To: <ly4o9b95dx.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1294928952-25833-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<4D2FC1F3.20504@gmail.com>
	<ly4o9b95dx.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jan 2011 12:10:15 -0800
Message-ID: <AANLkTimdFOMRWGD-Gec9ueOEX_yx-BMswqB_OxQYDx=B@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] zlib: substitute sharedlibdir
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
X-List-Received-Date: Fri, 14 Jan 2011 20:11:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2011 at 1:55 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Khem Raj <raj.khem@gmail.com> writes:
>
>>> @sharedlibdir@ is not substituted so that linkerflags in zlib.pc expand=
 to
>>> "... -L@sharedlibdir@" which breaks e.g. glib builds.
>>
>> I think zlib has --sharedlibdir configure option since 1.2.4.4+
>> so you could try to use it instead of patching
>
> afais, the ./configure will be completely replaced due to the
> 0001-autotools.patch (added by a2393dbf941554098). =C2=A0So there exists =
no
> such option anymore.

now that I look into OE we have autoconf'ed it ourselves. Originally
it has a configure
but not all configure scripts are generated via autoconf so We kind of
swerved away
from zlib's build system has anyone proposed it to zlib upstream that
they autconf
their build system ? otherwise I think it would be better to use the
configure script as is

>
>
>>> --- a/recipes/zlib/zlib-1.2.5/0001-autotools.patch
>>> +++ b/recipes/zlib/zlib-1.2.5/0001-autotools.patch
>>> @@ -33,7 +33,7 @@ new file mode 100644
>>> =C2=A0 index 0000000..177c89a
>>> =C2=A0 --- /dev/null
>>> =C2=A0 +++ b/configure.ac
>
>
> Enrico
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


