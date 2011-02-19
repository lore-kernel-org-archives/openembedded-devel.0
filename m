Received: from mail-bw0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pqmqm-0002LG-3w
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 14:27:52 +0100
Received: by bwz10 with SMTP id 10so630106bwz.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 05:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=pGMUenv8XutKr0zTEbU0f4Lwf6d7mU2DCktFgqBxkls=;
	b=YXW7r6v0D10MKn9poPBNKrShH0YHl4Awku74132BxsMig8ZAdRQuFsjLZyRQ05GWWX
	4XD/1fhWfjQyQWaTTlHbt1AlPdiNUOxl/22bIc3ZCixczBgoJWVqS063lrNonxY8BsK2
	gdO+9jIfaYgG8RIxQaoA3zJ0tJkvyZfZEtF4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=DHWueugBZaKzj733maQaciVOfzjvI+MQvGkepiXU5lFPgdeRlvf9G+CUZBZunRvVmJ
	Btc7aAZByYpj8MxZKihzpbQNFYfYrwFjLN4+Y/Lzb6NuYjsc8jmwP7iZXanHF3Yzu+G0
	u/4nXuNF3JyDhLXcKC9Obd9qEU66jZnyYcOTE=
MIME-Version: 1.0
Received: by 10.204.122.198 with SMTP id m6mr1639561bkr.186.1298121992064;
	Sat, 19 Feb 2011 05:26:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Sat, 19 Feb 2011 05:26:32 -0800 (PST)
In-Reply-To: <201102191252.05388.schnitzeltony@gmx.de>
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5ED835.7040800@eukrea.com>
	<AANLkTimfZ4vp-8RPHxTWPfo5m_0zfTwM611Q+d+jWuK8@mail.gmail.com>
	<201102191252.05388.schnitzeltony@gmx.de>
Date: Sat, 19 Feb 2011 13:26:32 +0000
X-Google-Sender-Auth: e6L_MLmTWcBd5jj2sN4LV-FIqfs
Message-ID: <AANLkTinfrqy3eSJajojfDiAJcPcMM9MbTZo94YVGz+ba@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sat, 19 Feb 2011 13:27:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 19, 2011 at 11:52, Andreas Mueller <schnitzeltony@gmx.de> wrote=
:
> On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
>> I am fine with the patch, but perhaps a better solution would be to
>> introduce a var to decide whether it is a fatal or not.
>> That way people distro's that use libtool 2.4 can decide to make it a
>> fatal. (or individual users in their local.conf)
>>
>> Frans
> How comes that I sometimes feel handled as spammer ;-) ?
>
> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
> February/029534.html
>
> anyway - treating RPATH errors as fatal has lead to many QA fixes and fur=
ther
> will follow...
>
> my opinion now: keep RPATH errors fatal as developer's =A0whip :-)

I agree about keeping it configurable.

Besides I think that we ought to keep it fatal until quite near of
release since we'll be "forced" to fix most of many of them.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


