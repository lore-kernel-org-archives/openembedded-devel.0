Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuUoh-0006mg-Oj
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 20:01:03 +0100
Received: by fxm8 with SMTP id 8so4915484fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 10:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=q3X4BEOd1uAWyBEP9PS0dq+W5pHiG0yqnLwnLgST9Ew=;
	b=LGIdNyrvFnL94qsadlZKb+VKHzhSbTv86KnVm8lrXA1FUHTGW0GLGwt30Xu7Qhp1/5
	GrGwxxmgFobFWCNBlhXRTCInc0G8U/+NBmnbfuduVs7rgeKYRrFx8B8k78hDfXjIpW2Q
	rqk1+w4As6QFsOMsfEX49gQMB/DnzIqzddwqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=gpw4F4gakzVcX2trWtO+0oBRV8owgOXhgyGY9jHBsaQeZ8ZP4xYf9mq3sLTjOvhpK4
	ypEebc86b3hCzLZBB8s5XZ1vNgNMh1l/OKD++Kve1EV4Z5vI7ccrn2SYSvnmAhrWHCl+
	+aSC2ma4vlw0cv8tloSe8oufQH5G/NMP4Pzyg=
Received: by 10.223.100.2 with SMTP id w2mr8479626fan.115.1299005971329; Tue,
	01 Mar 2011 10:59:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 1 Mar 2011 10:59:11 -0800 (PST)
In-Reply-To: <4D6CF9D5.3040208@eoimaging.com>
References: <4D6BAE92.1080409@eoimaging.com> <4D6BEEDA.3000203@mentor.com>
	<4D6C0A15.1040406@eoimaging.com>
	<AANLkTi=m78MJ2OLV-pQLyr7LiVTLSdHNrA4aKLXAVg6M@mail.gmail.com>
	<4D6CF9D5.3040208@eoimaging.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2011 10:59:11 -0800
Message-ID: <AANLkTimaBPnuvU9Wer1Fz2gBmS03_EOO4DqfSgvSM_9Y@mail.gmail.com>
To: Nathan Harris <nharris@eoimaging.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: QA issues with libvmime
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
X-List-Received-Date: Tue, 01 Mar 2011 19:01:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 5:51 AM, Nathan Harris <nharris@eoimaging.com> wrote=
:
> On 2/28/2011 5:24 PM, Khem Raj wrote:
>>
>> On Mon, Feb 28, 2011 at 12:48 PM, Nathan Harris<nharris@eoimaging.com>
>> =C2=A0wrote:
>>>
>>> Unfortunately, when I added pkgconfg to my inherit list, cleaned the
>>> package
>>> and then re-bitbaked, I still get the same error message. =C2=A0I verif=
ied
>>> that
>>> vmime.pc is removed during the clean process (along with the other temp
>>> files).
>>
>> Is it also removed from sysroot ?
>
> Yes it's removed from sysroot too. =C2=A0I tried to build again. =C2=A0Di=
d a updatedb
> and locate on vmime.pc. =C2=A0I can see it in a few places (including the=
 sysroot
> directory). =C2=A0I do the "bitbake -c clean libvmime", updatedb, and loc=
ate does
> not find anything. =C2=A0I searched manually and can not find vmime.pc. =
=C2=A0The
> recipe still fails. =C2=A0It's frustrating since it seems like the pkgcon=
fig
> should have fixed it. =C2=A0At one point, I was trying to build with auto=
tools
> and gave up that route. =C2=A0Maybe there is another file out there confu=
sing the
> issue? =C2=A0Here's the entire output of bitbake and my new recipe.
>
>
> The recipe:
>
> DESCRIPTION =3D "VMime is a free mail library for C++"
> HOMEPAGE =3D "http://www.vmime.org/"
> DEPENDS =3D "libgsasl gnutls"
> PR =3D "r1"
>
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/vmime/${PN}-${PV}.tar.bz2"
> SRC_URI[md5sum] =3D "d5b6de44f7f9ca0e4cefe597d1905605"
> SRC_URI[sha256sum] =3D
> "3b66cb76d9bc7da80ef1f271cc29d3a183b5ff8b560ef60e85ff006bffb4d1ae"
>
> SRC_URI +=3D "file://sendmail_disable.patch"
>
> inherit scons pkgconfig
>

I looked into the sources of this library and it uses autotools so you
need to inherit autotools as well.


