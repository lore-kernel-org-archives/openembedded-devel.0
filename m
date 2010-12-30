Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYMQ6-0005uk-8V
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 18:36:10 +0100
Received: by iyj18 with SMTP id 18so10401071iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ip3mcp1jSX78FhhD7WkmWAwTfhs7mGMttIxKxEe082c=;
	b=DY9KOAS4kxFsEzRAOR3ZKoI72TRMhyy4072V4BLeh0Cp7ZxWuZiDLDxcYClcHtC9d/
	htDz57wyAvQL9CkWiHZrMiNHfb4kdRAq7DTviZg11oI10bDvC04xl2MI15LqIKFthmAH
	b7hWHoxeHKmKkSeeAoepDFP+nTKG4h/EouZw8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cuT8cTjfM03fav0AA8vE22e/dq4U3jljKPpQXhuz/uSjwrtTCFAZCPwzf65tOQHKhN
	119XP/cmZcOieQbfqbWwSi4FfQrgXhRJ4XYzDocA6ViTs5E1AE1PO56wbRdlR2CniEKG
	0EIW2AFKxHWXHGhiwN9tHXlei8UIYaF3APX/Q=
MIME-Version: 1.0
Received: by 10.231.39.71 with SMTP id f7mr296760ibe.182.1293730552712; Thu,
	30 Dec 2010 09:35:52 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Thu, 30 Dec 2010 09:35:52 -0800 (PST)
In-Reply-To: <201012301023.43492.roman@khimov.ru>
References: <201012292340.40618.roman@khimov.ru>
	<1293660478-3080-1-git-send-email-khimov@altell.ru>
	<1293660478-3080-2-git-send-email-khimov@altell.ru>
	<201012301023.43492.roman@khimov.ru>
Date: Thu, 30 Dec 2010 18:35:52 +0100
Message-ID: <AANLkTinpra3e_F8Qw1CG5f5yB8zXz1rJSATtVj9o6Z5C@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] classes/cpan: fix bin/script/man1/man3 installation dirs
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
X-List-Received-Date: Thu, 30 Dec 2010 17:36:10 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/12/30 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =FE=C5=D4=D7=C5=D2=C7 30 =C4=C5=CB=
=C1=C2=D2=D1 2010 01:07:58 =C1=D7=D4=CF=D2 Roman I Khimov =CE=C1=D0=C9=D3=
=C1=CC:
>> + =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A -e "s:\(INSTALLVENDORMAN1DIR =
=3D \).*:\1${D}${man1dir}:" \
>> + =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A -e "s:\(INSTALLVENDORMAN3DIR =
=3D \).*:\1${D}${man1dir}:" \
>
> The latter should be man3dir, obviously.
>
With this patch:

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


