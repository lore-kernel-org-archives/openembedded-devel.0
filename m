Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5FD77290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:11:51 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so23765898wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=NCQ9KzwQlXSjJSwNyCaZeRr6xF8WOlUg6A31dTXdc8I=;
	b=AiUoI8qDPBf8WekZnjLOgYru+meVV5Ez60h6i/7b2gYTs5EHwEVYr8n1MygIallV1n
	IUdFynJRnrKHZ15SUxcMO5X0vJoRvaZDOcqxoDlK/tQJ/z33B2zBMQ3Ff3tHzEUsZ05P
	6Y0dV7R2KOQMlBd1ax3MZ4G5WJAze7nTkuGQldZTvkvS8SUC25ts8dBEl9Fb5F2dSS/R
	X6JRtfi0IG5i0pLrmThHcladByMNjiwO5hu5Flsy+UepjOdllskYRu9fAvNizC+zj3sV
	0SbPRybCfrAE+MdsE3k+UdlsaMwv9K5sJ+rkYGXT69T0N5j2VplFNmg4Uv5pY8OKPJaa
	q07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=NCQ9KzwQlXSjJSwNyCaZeRr6xF8WOlUg6A31dTXdc8I=;
	b=JhM/7q0yA7ZUu0RAEhQFfJ9paDZ2t5cAz3vX0oNet9LYe6P9ha7D7/15kVuQh+u7dL
	Sl8aeKO5hMQrMjY0V/I+OoRolNn6zF5HfGDfWbHoPNAIvP4oS6lel8DuV/kgM1zKxO2u
	RxS8jnPTT1auSvp9AfmtK1HjGyolNaQsPa35pNnuTA5PNzg+W+R6FvfjwQ/WdkQ2dJcB
	aDUMupbLXUKQ3WI4JBlQCgQY7JKRvrIfx+q9u/uU8MP2t0c4wB2q4a7/lap/kV5uyytL
	6R4wiKGPqQ7pBCmqBwK+SEi9OgwFkuW/4P+nh5UpzVVdPFhDDhJTUzPbfyvGGqd6q387
	xXsg==
X-Gm-Message-State: AIkVDXI9QDnn9UL3k0m659zUFv3DKfeaPsXUOLmIMWxx78McY4QvzfSwj0rnIqUu3MORkePARx/nJTJacoPgsA==
X-Received: by 10.195.30.165 with SMTP id kf5mr13921715wjd.41.1482156712420;
	Mon, 19 Dec 2016 06:11:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 06:11:51 -0800 (PST)
In-Reply-To: <CALbNGRT1MSt=O90M6g9GHMmqm8nYSk4mdcSm59EK2u=f4i-qKw@mail.gmail.com>
References: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
	<CALbNGRT1MSt=O90M6g9GHMmqm8nYSk4mdcSm59EK2u=f4i-qKw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 06:11:51 -0800
Message-ID: <CAJ86T=Xq4AnvmvZ5ciNjvymN+VPMWe_f0xm95HepLq-B0ypXDA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libconfig: add support for libconfig-native
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
X-List-Received-Date: Mon, 19 Dec 2016 14:11:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 5:27 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Dec 19, 2016 at 2:09 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-=
oe/recipes-extended/libconfig/libconfig_1.5.bb
>> index fb6e50e..94daa88 100644
>> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>> @@ -12,3 +12,5 @@ inherit autotools-brokensep pkgconfig
>>
>>  SRC_URI[md5sum] =3D "a939c4990d74e6fc1ee62be05716f633"
>>  SRC_URI[sha256sum] =3D "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a0=
2429eec61e68703f6"
>> +
>> +BBCLASSEXTEND =3D "native"
>> --
>> 1.9.1
>>
> Please tell us why libconfig needs native biuld in commit message.

A private recipe in a private meta layer - the names of which are
probably not very useful or interesting in a meta-oe commit message.

> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

