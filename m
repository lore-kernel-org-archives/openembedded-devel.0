Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PAvwM-0007qt-1x
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 04:40:39 +0200
Received: by wya21 with SMTP id 21so192497wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 19:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=EXQe7jTf7QWTcv+XkZp/BhXnUJjuxsRne229oJdV7AM=;
	b=H82hPwKrwGh4BwZEtlgJSzZ5n4dMC4gLJh1dqwdE7AuNca0un957WcE6Y/7h3WHfmz
	ifyLva3xh9EdzupQadYrxkbV0CpKOKHpEK+Xraoy43gtST+mBAzjbf0i9lzguN42UKA3
	gp8W5tRHRNchUI9lZGNax5qR1NdKBt9qxc2yQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=I4fCMtOc/RpeDtFrxt0v0okjMKzLOIl12UFfikHtQLvDXLRRpB9WXiCj+NzB8v0l1f
	Qf04PFKLPA8NJfPkWUiOue7oVq8nQxFbukqeE2HwYj0ONngCTozlNJ6MeV389cSIxBip
	+llTGu4jM4PBmxrKnBQmlR7ssD5EMn/wl8nkw=
MIME-Version: 1.0
Received: by 10.227.145.20 with SMTP id b20mr8884374wbv.28.1288147194902; Tue,
	26 Oct 2010 19:39:54 -0700 (PDT)
Received: by 10.227.37.205 with HTTP; Tue, 26 Oct 2010 19:39:54 -0700 (PDT)
In-Reply-To: <AANLkTikkXFLFr0iTWTmxzF6iUM9RMmfvQppxvptuNyLG@mail.gmail.com>
References: <4CC61633.3080808@gmail.com>
	<AANLkTikkXFLFr0iTWTmxzF6iUM9RMmfvQppxvptuNyLG@mail.gmail.com>
Date: Wed, 27 Oct 2010 13:09:54 +1030
Message-ID: <AANLkTikmh26KwZ5t3YTWP0HpW5Yk1TqZxSixCwg+f_oU@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] espgs_8.15.3.bb: Depend on cups as EXTRA_OECONF has --enable-cups.
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
X-List-Received-Date: Wed, 27 Oct 2010 02:40:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 26 October 2010 17:06, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/10/26 Graham Gower <graham.gower@gmail.com>:
>>
>> pstoraster/gdevcups.c:74:25: fatal error: cups/raster.h: No such file or=
 directory
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>> ---
>> =A0recipes/espgs/espgs_8.15.3.bb | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/espgs/espgs_8.15.3.bb b/recipes/espgs/espgs_8.15.3.=
bb
>> index ba03f00..c2349e0 100644
>> --- a/recipes/espgs/espgs_8.15.3.bb
>> +++ b/recipes/espgs/espgs_8.15.3.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ESP Ghostscript is an up-to-date GNU Gh=
ostscript distribution \
>> =A0including bug fixes, new drivers, and additional support for CUPS."
>> =A0HOMEPAGE =3D "http://www.cups.org/espgs/"
>> =A0SECTION =3D "libs"
>> -DEPENDS =3D "jpeg zlib libpng tiff fontconfig"
>> +DEPENDS =3D "jpeg zlib libpng tiff fontconfig cups"
>> =A0LICENSE =3D "GPL"
>> =A0PR =3D "r1"
>>
>>
>
> Three small remarks:
> - not sure if changes like this require a PR bump. I always choose the
> the safe way and bump when in doubt.
> - it would be nice if, when you are fixing a recipe you would also
> improve the LICENSE =3D "GPL" thing
> - and there is also a 7.07.1 recipe. Should this apply to this version
> as well (or alternately should we remove that recipe?)
>
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

I'll resubmit something when I get a chance.

-Graham


