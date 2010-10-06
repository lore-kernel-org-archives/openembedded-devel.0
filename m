Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3WT3-0000wP-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 18:03:47 +0200
Received: by iwn38 with SMTP id 38so438996iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RJ8xGfcWfpBd7cRePyo/XF6MqB0NTgrmzi4lV8TsqZc=;
	b=Wwi0+oiBtQcQ3ry+6qemCH15su2HHyLOuayQAld0zOotMV5mD+1lw/BUY0b2wkTIxP
	zKgPFQvDtS+ncPfMuXal3Ersab8rW+ntsQOJSptSS3bk2z4l+ODaS+HK2JqIZY8wNFtK
	ViqvIxiBGaQa5MYbLlzoxfYOlnu2zICZl6qK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=oZ/+AZjb9ymuobz7Zxl9GCwo4AEL/NIElxV6Us5/Dez7jdtX3bSwVisZv8xWC8Zm2M
	9NAWxP0JKVmjl5AZOMIxZKVMGiTSX0+GyS2YhmDCfLoiWi8kYBNg1Dn174lYt38vvapV
	I7+EjaISdj8zS4av6N3jo2OY2qELodIng3qIo=
Received: by 10.231.174.206 with SMTP id u14mr14158630ibz.103.1286380997718;
	Wed, 06 Oct 2010 09:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Wed, 6 Oct 2010 09:02:57 -0700 (PDT)
In-Reply-To: <20101005182041.23910@gmx.net>
References: <20101005182041.23910@gmx.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Oct 2010 09:02:57 -0700
Message-ID: <AANLkTimm0KRKq12HvSRW=NEk6Rv1BCm7oqJQVSSw-bg2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchutils 0.2.31 - not that compatible with state of the art automake
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
X-List-Received-Date: Wed, 06 Oct 2010 16:03:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2010 at 11:20 AM, Alexander Stohr <Alexander.Stohr@gmx.de> w=
rote:
> oe uses version 0.2.31 of patchutils. i consider this a developers packag=
es.
>
> thats what is at the download location right now:
>
> [ ] =C2=A0 =C2=A0 patchutils-0.2.31.tar.bz2 =C2=A0 =C2=A0 =C2=A0 13-Jun-2=
005 17:46 =C2=A0 =C2=A0 =C2=A0 143K
> [ ] =C2=A0 =C2=A0 patchutils-0.3.0.tar.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A002-=
Jul-2008 12:07 =C2=A0 =C2=A0 =C2=A0 146K
> [ ] =C2=A0 =C2=A0 patchutils-0.3.1.tar.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A023-=
Jan-2009 18:06 =C2=A0 =C2=A0 =C2=A0 155K
>
> i was having noticeable trouble with those 5 years old version
> since i am fiddling around with a relatively recent automake.
> all the build behavior of patchutils was quite erratic.
>
> staring and dealing the source package internals i reasoned
> that those old version is probably not that automake compliant.
> so i once took the probably most simple choice to solve it:
>
> =C2=A0cp patchutils_0.2.31.bb patchutils_0.3.1.bb

care to submit a patch. ?

Thx

-Khem


