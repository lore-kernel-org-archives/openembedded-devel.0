Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 15AF47ECAD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 16:25:32 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id z67so8699634qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d6nsGlgaP8M87lEV7zH3L+0n3bvB1UhurYlbzh62uCI=;
	b=uGEDiaEvyZEMmEmP/L92NL56wwuYChfeO08i42tkJuopYvE/AYUgP5+bqc/zETIM5y
	lf9ygp5DnanJQ/94bAG6dQkwPUTs85q6gRE3tg05ZfCmXFAKZdwSs388pRi3nCpnEY+G
	g/3RkeXI2q+2nUNI31GUhxl+W7y8kyjvY4gs85RUSLpHDZxpWtbpxRe+Gk+kM+VI/RCs
	dYRpwFdfmm8FmEKqzGtCQ49WdTIi1Svn4sQxyzKcwqRRccAKX7YihQOdzGNUNVbv4+VF
	NP7EVoXC/ZAw1Z7k08LX0VnhmcyVQ0RaKkJalgNytiTdnR1Jca766awlYisw9va9xS9O
	g8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d6nsGlgaP8M87lEV7zH3L+0n3bvB1UhurYlbzh62uCI=;
	b=BfAkrCT5iBPLS5oxr2pwGes7XRcLlhgE8BQJUK2rkQfZ/zun3UQsBeOKdSZMd9y8Tl
	Vleg+9eY4+8Jk9W7eF4zqz9DaMZCw0j4ntrV9ny7bwK7t/b0L9TDzwc8+UPIQcFbNwxD
	WvRaglQt21D6dwxuhXeUTNqBO5HHtD/zT8z3lxEYqZco0ewrR07fH1CoH61Ax5mGUo3z
	H7HDOxgvkYTOEljYskhihESMAEvS1onIBkyus0B/txV5WKEdNBLS8w9D/qCW2gRFGG1P
	6u5pUlSNkWR2ZqxhWKfI16HgUbvhlpHLAExGcXjKI5nrgBO5Q1FWqcJsWiFKrYDhbbEY
	ZAZA==
X-Gm-Message-State: APjAAAUq4Di36w1ULD/Vd4BIMDk2HaaZh0Kt27kZ1Hc3bbJGZYMtS5NF
	HLZrf60PXgPz5lEYWTJVBb+RRZ2kJa1SyawVOj8=
X-Google-Smtp-Source: APXvYqxOtXB2yNf0vXuLYcWuBx5k7RQ0Ap6OF2y97zma8ysMjYiirStsu9WxKT0lUa1ar30598QuFwWk09146/NOOkI=
X-Received: by 2002:a37:c403:: with SMTP id d3mr14853372qki.212.1567873533588; 
	Sat, 07 Sep 2019 09:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190906163242.4770-1-raj.khem@gmail.com>
	<20190906163242.4770-2-raj.khem@gmail.com>
	<CAHMutraN95VB7aMUsTi53sxOQ-hcMrdnw0Ji1uee6RTA=TDFpw@mail.gmail.com>
In-Reply-To: <CAHMutraN95VB7aMUsTi53sxOQ-hcMrdnw0Ji1uee6RTA=TDFpw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Sep 2019 09:25:21 -0700
Message-ID: <CAMKF1srrukts0Esh_6QCKZyMo7-_xuKiowD7wMXiN_bVjjHy9w@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] remmina: Link with libexecinfo explicitly on musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Sep 2019 16:25:33 -0000
Content-Type: text/plain; charset="UTF-8"

another issue on arm

ERROR: Nothing PROVIDES 'spice' (but
/mnt/b/yoe/sources/meta-openembedded/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
DEPENDS on
or otherwise requires it)
spice was skipped: incompatible with host arm-yoe-linux-gnueabi (not
in COMPATIBLE_HOST)

I think you need to mold arch support for it as per deps

On Fri, Sep 6, 2019 at 9:35 AM Alejandro Enedino Hernandez Samaniego
<aehs29@gmail.com> wrote:
>
> Hey Khem,
>
> Thanks for this, I hadn't fixed it because I have no access to my laptop for now, looks good to me though.
>
> Alejandro
>
> On Fri, Sep 6, 2019, 9:32 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
>> ---
>>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>> index a14a2592cd..a86deccc8f 100644
>> --- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>> @@ -5,6 +5,9 @@ LICENSE = "GPLv2 & openssl"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
>>  DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver spice spice-protocol libsecret"
>>
>> +DEPENDS_append_libc-musl = "libexecinfo"
>> +LDFLAGS_append_libc-musl = " -lexecinfo"
>> +
>>  SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
>>  "
>>  SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
>> --
>> 2.23.0
>>

