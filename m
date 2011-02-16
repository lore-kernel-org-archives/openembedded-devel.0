Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpqlA-0004uf-Jq
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:26:13 +0100
Received: by bwz10 with SMTP id 10so2011842bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=NSqUdCfoWYcIgxilvHTTzU0WETLK6e1ni7cPKj8fLUQ=;
	b=N0vz3A+WBVRvpmlvu0zL8RzKAFmakLc8h5Z3kyrAuFVZ32BGBiN7lI1MMB24zhDzuW
	O1MiBzQ8JWLMUIF8ZEeSoCZvjk+andKWMttVpIYksnbPeoSDvZwS9cbk2hq2V+euEQve
	Xv0JdqAJ6KLC342e9VlntFnCiFWpYaMIIuG80=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=bTKO9vHzCu6Tll81b8OtX5NqQAlA2GGEMwFNK/wPP0yKf3S9v1MPhVOY7QO5o6vp5B
	LqdpT5+AeskLVwjicNkTC5z0iTR6k5PLhdldLtSAXFT3enpUe5gUOmU49ZOjKo6gY2ka
	8N4KdhzGJGsUq2dQcwfj6FGXtiMSYRQnL9OAI=
MIME-Version: 1.0
Received: by 10.204.122.198 with SMTP id m6mr978325bkr.186.1297898699680; Wed,
	16 Feb 2011 15:24:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 15:24:59 -0800 (PST)
In-Reply-To: <20110216231949.GY14525@sakrah.homelinux.org>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-9-git-send-email-otavio@ossystems.com.br>
	<20110216230953.GT14525@sakrah.homelinux.org>
	<AANLkTikZ1DpDSnj0gPwZVA4uZHTB1uR3B5dM+haW_VWh@mail.gmail.com>
	<20110216231949.GY14525@sakrah.homelinux.org>
Date: Wed, 16 Feb 2011 23:24:59 +0000
X-Google-Sender-Auth: bhLsKXFVGf5Mpe_DFfA8zd91xnM
Message-ID: <AANLkTikbG2APGZh53J3fv9sGZYx_C7M0kuRWNmKCfO1D@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/13] sdk.bbclass: cache ${libdir} as ${target_libdir}
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
X-List-Received-Date: Wed, 16 Feb 2011 23:26:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 23:19, Khem Raj <raj.khem@gmail.com> wrote:
> On (16/02/11 23:15), Otavio Salvador wrote:
>> On Wed, Feb 16, 2011 at 23:09, Khem Raj <raj.khem@gmail.com> wrote:
>> ...
>> >> +target_libdir :=3D "${libdir}"
>> >
>> > could you explain more why this is needed
>>
>> Used on the qt-native-sdk change.
>
> Could you revert this and see if it fixes your i586 gcc-cross-sdk issue
> ?

It doesn't since Jay has tested it and it failed to him for
i586-generic and qemux86.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


