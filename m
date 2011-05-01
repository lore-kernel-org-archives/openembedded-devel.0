Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QGYXs-0004cb-NE
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 17:26:52 +0200
Received: by qwh5 with SMTP id 5so2498857qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2011 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=hUY7XAjci3vHJQ18nHfqnwK3g2i1xVmDo3RaD8XcT7g=;
	b=xVOOzlOELAgor4xi/R1Y4cvp0eOKDNr/AXLbRwXe7aIik/Jd4nffQkXgaSsGiU8mI4
	kmgI/4xwARm5qbWbPwkFBp4lCJ1XHGuiEUlampGgwrmCkqr+8L6pNm9GT+YZOjZVntmC
	l5mMvdzYFwo7ZQQyUvoIaFr2BdQA36OuOesrY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=X8TmZS425k23yZB9lKoHlYHAv1IBEu/ypeOau4nSJqF4fyxslBT6VgViw71xxmIzAx
	GryrUP3j1h9aUN1UUZ727P7vdAy7gs5Sebg9xE/BuOMOPVGaKbN4B8SgDi7XO4zNohTV
	anRZRJZFM8xXM9gdaGBUiI7ZMoNa5VcLPLh3c=
MIME-Version: 1.0
Received: by 10.224.205.132 with SMTP id fq4mr5054985qab.242.1304263456921;
	Sun, 01 May 2011 08:24:16 -0700 (PDT)
Received: by 10.224.2.209 with HTTP; Sun, 1 May 2011 08:24:16 -0700 (PDT)
In-Reply-To: <1304244524.23614.7.camel@mattotaupa>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<1304244524.23614.7.camel@mattotaupa>
Date: Sun, 1 May 2011 20:54:16 +0530
Message-ID: <BANLkTiktr==wa_JndOz2n+9Pio9WXhENDA@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Sun, 01 May 2011 15:26:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 1, 2011 at 3:38 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 01.05.2011, 15:20 +0530 schrieb Siddharth Heroor:
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>
> The email differs again from the From line. If you want the TI address
> be shown, please add a from line to the beginning of the message with
> the patch. I guess `git send-email` can also be configured this way.

I was using gmail to send out the email. I'll change the signoff line.
Its not strictly from TI.
Is it ok if I sign off my gmail account from non-TI stuff?

>
>> ---
>> =A0recipes/zeromq/zeromq.inc | =A0 10 ++++++++++
>> =A01 files changed, 10 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/zeromq/zeromq.inc
>>
>> diff --git a/recipes/zeromq/zeromq.inc b/recipes/zeromq/zeromq.inc
>> new file mode 100644
>> index 0000000..b631d98
>> --- /dev/null
>> +++ b/recipes/zeromq/zeromq.inc
>> @@ -0,0 +1,10 @@
>> +DESCRIPTION =3D "Socket Library that acts as a concurrency framework"
>> +HOMEPAGE =3D "http://www.zeromq.org"
>> +SECTION =3D "libs"
>> +LICENSE =3D "LGPLv3"
>> +
>> +PR =3D "r1"
>
> In an `*.inc` file `INC_PR` is used [1]. Please also start with `r0`.
>
>> +
>> +SRC_URI =3D "http://download.zeromq.org/zeromq-${PV}.tar.gz"
>> +
>> +inherit autotools
>
>
> Thanks,
>
> Paul
>
>
> [1] http://openembedded.org/index.php/Styleguide#PR_variables_with_recipe=
s_that_use_INC_files
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
Sid


