Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 90A2A6BEEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:49:00 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so822307pdi.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=llqAFfvZUB39LuqgNe9FpqMimcX4mmnxJNatVe8K7Vw=;
	b=S2u3WzLToU0CUCi5YQPObW2K2+sM5KYCqg7xXPrgJ+9FyrrKpSR1dsHooK986OcxP+
	1dTi3ochzMvdPu8Z7GBxqjTW52XvErhS1M4sxchUjv65ir5Xt1SzvWHLxnD9tQcpbFIc
	kkQItZZfJbg+yhk1UZZX3l5kQcWUSdZRPnglmtq7FRRQKSXgVouc0PBteZOlZy5ojdvW
	n5og/ViT77/0JzNdQr0XH8BunSXM2uyhawNWirUwHdjjyml9u6FHMS+R/7Hz7BfIcF4O
	JEn2TKu0Eiu34nMJI/pjvZJtPHMTQuUVrGYC7b4c7dAK+ZQuSwLNKlXU1l5UK8PaOcWx
	GZEg==
X-Received: by 10.68.130.131 with SMTP id oe3mr4554973pbb.186.1377802141627;
	Thu, 29 Aug 2013 11:49:01 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	dg3sm39463788pbc.24.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:49:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521F963F.3070801@windriver.com>
Date: Thu, 29 Aug 2013 22:48:52 +0400
Message-Id: <6A9B657B-F7CD-490C-BC66-6E49D048D292@gmail.com>
References: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
	<1377801358-3942-4-git-send-email-elvis.dowson@gmail.com>
	<521F963F.3070801@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core 4/5] linux-yocto: Add support for qemuarmv7 and qemuarma9.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 18:49:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

On Aug 29, 2013, at 10:43 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> On 13-08-29 02:35 PM, Elvis Dowson wrote:
>> This commit
>> - adds qemuarmv7 and qemuarma9 to the list of compatible machines.
>>=20
>> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto_3.8.bb |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb =
b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> index 790e3e3..0bd9913 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> @@ -21,7 +21,7 @@ PV =3D "${LINUX_VERSION}+git${SRCPV}"
>>=20
>>  KMETA =3D "meta"
>>=20
>> -COMPATIBLE_MACHINE =3D =
"qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>> +COMPATIBLE_MACHINE =3D =
"qemuarm|qemuarmv7|qemuarma9|qemux86|qemuppc|qemumips|qemumips64|qemux86-6=
4"
>=20
> We can add compatibility, but the same question needs to be asked
> to Richard when we added qemumips64: does the project have the =
capacity
> to build and QA the machines by default.
>=20
> We can always get everything working in layers for the time being and
> then move them into the core, once everything is working well, and
> everyone agrees to add the extra support load.

I recommend that we create a new meta-qemu layer, to support development =
of
qemu machine configurations for
qemuarmv7 (useful for emulating TI OMAP 3 based platforms)
qemuarma9 (useful for emulating TI OMAP 4 and Freescale i.MX6 platforms)
qemuarmv8 (for AArch64 platforms)
qemumips64=20
etc

That should just about cover current ARM A8, A9, A15 and MIPS64.

Best regards,

Elvis Dowson


