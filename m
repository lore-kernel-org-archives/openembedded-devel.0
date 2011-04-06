Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7JEO-0004Ng-3s
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 05:16:32 +0200
Received: by qyk27 with SMTP id 27so824105qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 20:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=tunUP4CA+wc8+34OSfkIDsHjY63zCuQaI3hsAUDVV8s=;
	b=YjGYte7hBk8lOWvj8jj2ZM45NocW+kRs3OtFzV181pwctXJlHboZWHyI7sxP1qnZlk
	U2FcGuOYOQj13gyAaN5QkM1qsieLkCAGkTkhoMtp/WrsCbywHgIy+mD91BFnkfsZJDhR
	hG0UBecGkcPzfMFK98tDmV9G0PgKBGStfq8Tk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=awShKjP4h1wMz7NEX/dpnyFO9Gvt8zJ7RbwpeKNfwIJMJGzA/LlnTMlvVDAIdO4rlX
	PUyJkmnRedFKmFYhT6TaMSv2dVIiVapt55sp2PkHiwJiBmq0K3UMp+BaWXo/gZwAgltb
	gugHSyOUJmbPBhj5xf3xXLMHMI7nG/+PCqAws=
MIME-Version: 1.0
Received: by 10.224.197.197 with SMTP id el5mr313067qab.396.1302059665340;
	Tue, 05 Apr 2011 20:14:25 -0700 (PDT)
Received: by 10.224.133.195 with HTTP; Tue, 5 Apr 2011 20:14:25 -0700 (PDT)
In-Reply-To: <20110405164133.GF7168@denix.org>
References: <1302005404-21580-1-git-send-email-heroor@gmail.com>
	<1302005404-21580-4-git-send-email-heroor@gmail.com>
	<20110405164133.GF7168@denix.org>
Date: Wed, 6 Apr 2011 08:44:25 +0530
Message-ID: <BANLkTim2P_N_kCZQnPaDedqKO4VMauKyxA@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] ti-sysbios: Add version 6.31.04.27.
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
X-List-Received-Date: Wed, 06 Apr 2011 03:16:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2011 at 10:11 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Apr 05, 2011 at 05:40:04PM +0530, Siddharth Heroor wrote:
>> From: Siddharth Heroor <heroor@ti.com>
>
> Sid,
>
> Do you need to set a COMPATIBLE_MACHINE in the recipe, by any chance?

Sys/Bios supports a large variety of the platforms including OMAP2,
OMAP3, OMAP4
etc.. Therefore, I don't think we should restrict this version to only
TI816x or TI814x. Is
it ok?

>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> =A0recipes/ti/ti-sysbios_6.31.04.27.bb | =A0 =A06 ++++++
>> =A01 files changed, 6 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/ti/ti-sysbios_6.31.04.27.bb
>>
>> diff --git a/recipes/ti/ti-sysbios_6.31.04.27.bb b/recipes/ti/ti-sysbios=
_6.31.04.27.bb
>> new file mode 100644
>> index 0000000..619d6ff
>> --- /dev/null
>> +++ b/recipes/ti/ti-sysbios_6.31.04.27.bb
>> @@ -0,0 +1,6 @@
>> +require ti-sysbios.inc
>> +
>> +PV =3D "6_31_04_27"
>> +
>> +SRC_URI[sysbiosbin.md5sum] =3D "c82e1d3afc9e2d3e88b0e4137f152ed6"
>> +SRC_URI[sysbiosbin.sha256sum] =3D "92337cf3197d2b7ffe2316f311cd163be7b4=
70acbb032273894d7d39182f4227"
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


