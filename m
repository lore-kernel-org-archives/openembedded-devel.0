Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PuNbk-0000Uq-DL
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 12:19:12 +0100
Received: by bwz10 with SMTP id 10so4451216bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 03:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4sxTbVw3PkktItE8MGMVffYT3X4/4WKXVJ/Cj6tzQOo=;
	b=bO3ZHambowlPI+iWUyH+OcnE0CtxvAgmcz33JTBbBcmVWHfdQSyH6CuaDnCcBuS7N3
	IdCQtKcMoWYMCU1RajlwczdZ2vFOTmqZeBd9MYtzS2sfxwV9mhF35fAArBa2IZDNQchm
	tO8qwEPoA6BozS4TCeRRocBNRRaON7aELioB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=V9sft8Vo2itT99LEl9PV5TWq6ypH/GE1fLjLLnEUk8ar2gHvY4S+Vn21hYNFz3yh4B
	uUnzhkFgov9qU+yIUKaLMYSBB1Uk9LgrBVp/YKstv0xQcLyy5uCrq6HlNyCePPD0ZgM+
	o9uDcC23WdDWeJvjkhBG4EG48Dggf5bPbdzLA=
MIME-Version: 1.0
Received: by 10.204.64.139 with SMTP id e11mr5897089bki.97.1298978266453; Tue,
	01 Mar 2011 03:17:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 1 Mar 2011 03:17:46 -0800 (PST)
In-Reply-To: <1298978495.23547.64.camel@phil-desktop>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298468511.2178.430.camel@phil-desktop>
	<AANLkTim1EdeGgyy3siyL99ugY-v=uqW_v4MRHJV0evq6@mail.gmail.com>
	<1298978495.23547.64.camel@phil-desktop>
Date: Tue, 1 Mar 2011 11:17:46 +0000
X-Google-Sender-Auth: u58XmSbwS0MGGvDhEuooBsDq0Vw
Message-ID: <AANLkTi=ORv_+qu5tY0WZRPqL4NA6ER=aHK_GNB4WbhBU@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 05/14] cmake.bbclass: use 2.8 modules
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
X-List-Received-Date: Tue, 01 Mar 2011 11:19:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2011 at 11:21, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-02-23 at 13:47 +0000, Otavio Salvador wrote:
>> In any case cmake will know the "internal" modules directory by itself
>> so it works even if this value doesn't match. This is where it is
>> going to look as fallback and I was using 2.8 without 2.6 for long
>> time without noticing any issue.
>>
>> This seems safe. We could drop the CMAKE_MODULE_PATH if preferred. I
>> just fixed it to 2.8 to reflect the current default one.
>
> If I understand right, you're saying that the CMAKE_MODULE_PATH doesn't
> serve any useful purpose since cmake works just fine without it. =A0If
> that's the case then yes, let's just drop it altogether.

I'll make this change locally and see if it works fine for a build
from scratch. In this case, I post the patch.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


