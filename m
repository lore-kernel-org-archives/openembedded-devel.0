Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id B893760079
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 14:57:30 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p8so5152942plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Ir/c1YEGwYa/G7kJWNmFbIdYuAfGlMtmEk900gl5EGg=;
	b=XM0re68LgDK/+89oa4WVSaQvs7NRyqt0rJLzSURoFxAfsaekp2UdfNt+YvLlJkxkO1
	OxbhfBiJTLlDENY0+IbpJ5tFfGIwJexYirgJ8nDMEUeqYOMd4RWIT133FliwQWr/MHBI
	r2/ybY7jXASUtzLUmZhsgoSk/sneVfsjXsEVjuL93KLB+DNLSv9orO5GoJZJ33sZqC3M
	Kt0RunM22Tw2uj3fScuhlUrMqoCo8F2BITS+Hw3W38FAmDyrccOGSVi2ck1oVZhPGXcy
	O48A46HxFcOD9NmmV5OdXpHYIRAUNceQ3yXK88vajFsxNqWd7IoRrsb8vKaXrahLA2Yr
	UNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Ir/c1YEGwYa/G7kJWNmFbIdYuAfGlMtmEk900gl5EGg=;
	b=YZUKfWCJUXdJRGlqSp5IyFCm8BZK44F9tWUN0coAaU6tgFyrYSiiTue2SpeAGYlhVB
	sCM/UqJQnDMpJyE8EuOqasIU2I/NllllJxT8MCUDKii4uPdUTgn0JxLh/Zk3XvWS5Liv
	e8bbufzSGKfaa+YfJ0NtFCSXygs/SMNzvG3xO4+ffn8LLtX0MJxnpSq7Jda3XXrRTZXe
	xkc8j9vKMpiVAMgiDIu2s5FZDEehBZQOLs5wXvtnjXmzfhNCGPKYSY6UfaOK9BobcoGC
	DrxbzFlzWw6HZEgvpJW428T6OUqoDcNov4Smt2urABoZg8i3tSpgnzboPIjg3wl698Oo
	PX+A==
X-Gm-Message-State: AA+aEWZ+UUK88LRIV6hXvfuXPArTA/cos2FSDvleHgykLhhzP9eThpVe
	f7Q0DU+Yq95AyhK6KFl41vtAU09l
X-Google-Smtp-Source: AFSGD/X7l5GLlc6K+xx1DjUAWKKJw6B5QUy4YWor59lp390l8iHYVoy70fAJuQmjqdkxSxxL5K+RYw==
X-Received: by 2002:a17:902:5601:: with SMTP id
	h1mr12869459pli.160.1543762651465; 
	Sun, 02 Dec 2018 06:57:31 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:8459:23c4:569c:71eb?
	([2601:202:4180:c33:8459:23c4:569c:71eb])
	by smtp.gmail.com with ESMTPSA id
	n73sm16578520pfj.148.2018.12.02.06.57.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 06:57:30 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20181202102736.47401-1-alex.kanavin@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6d78c61b-d097-8677-8f7e-f6aa3d26f1f6@gmail.com>
Date: Sun, 2 Dec 2018 06:57:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181202102736.47401-1-alex.kanavin@gmail.com>
Subject: Re: [PATCH] packagegroup-meta-oe: drop ptest groups
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
X-List-Received-Date: Sun, 02 Dec 2018 14:57:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 12/2/18 2:27 AM, Alexander Kanavin wrote:
> packagegroup.bbclass adds ptest packages automatically, so there is no =
need to maintain manual lists
My understanding all ptests are included in the auto mode. I wanted to
isolate the ones for meta-oe to get a quicker test run.

Am I misunderstanding ptest?

- armin
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb      | 18 ------------------=

>  1 file changed, 18 deletions(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb=
 b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 2a23a6170..3a3e47897 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -21,7 +21,6 @@ PACKAGES =3D ' \
>      packagegroup-meta-oe-test \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-=
oe-gnome", "", d)} \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-=
oe-graphics", "", d)} \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-met=
a-oe-ptest", "", d)} \
>  '
> =20
>  RDEPENDS_packagegroup-meta-oe =3D "\
> @@ -41,7 +40,6 @@ RDEPENDS_packagegroup-meta-oe =3D "\
>      packagegroup-meta-oe-test \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-=
oe-gnome", "", d)} \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-=
oe-graphics", "", d)} \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-met=
a-oe-ptest", "", d)} \
>  "
> =20
>  RDEPENDS_packagegroup-meta-oe-benchmarks =3D "\
> @@ -231,19 +229,3 @@ RDEPENDS_packagegroup-meta-oe-test =3D"\
>      catch2 cppunit cunit cxxtest evtest fb-test \
>      fwts gtest pm-qa stress-ng testfloat \
>      "
> -
> -RDEPENDS_packagegroup-meta-oe-ptest =3D "\
> -    zeromq-ptest \
> -    leveldb-ptest \
> -    psqlodbc-ptest \
> -    lua-ptest \
> -    protobuf-ptest \
> -    rsyslog-ptest \
> -    oprofile-ptest \
> -    libteam-ptest \
> -    uthash-ptest \
> -    mcelog-ptest \
> -    libee-ptest \
> -    numactl-ptest \
> -    poco-ptest \
> -    "



