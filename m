Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id ABAF97F345
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:56:01 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e8so6572876qtp.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DzEPr6u3aU8Jn+NaCmV4vb7tHzxL1X0JWuwS6Zd+3Kg=;
	b=ZZKia7HdiXTtztJPgESAdxN0NIAyzYmbwM8+Hk+lSsIvHf6zLCnIDoEyquzzLYkaGf
	yBCOLxq1AEP8DVSpfH+T/e4yf/mGGeC2rLi/I5uvK2miEYzlNnZNya53YdAVb7al+Agu
	Drl0WVi7nmldkVNDuGP9/q9ip1nkR4tyT4In3jIurCe1psXuUc08+mmz8GkJkM6lpZb2
	QxkkgzUNojk+E4RkIPqSJv4ihKR9MqvJzGAmtcCvRAG1qTYCV0uon1LoBJ5J6/hsPDa/
	fdZaYOvr1uxWOI5x9whr7LQJFu2HiOzGS7UxhG4xZ2MX9Y9yNPe1eCRbhdLO8016qOMJ
	Kpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DzEPr6u3aU8Jn+NaCmV4vb7tHzxL1X0JWuwS6Zd+3Kg=;
	b=apBD8YATIuTX+TbbdrsH2ClVdd6Iw1Fv6SAh75M+V2rcKyrci2gRFB+aPLdD4GTdIe
	Ln76kTWh13jo9mUsLmtkN4b0vG1k56QK/6YJxRqEg4vzwADi0cmtZ0wcd4Qf2LuE5KZV
	4YoojAhc562gjz2Jgs5c63INLbGhXNicZAB41V3ZEguAA/t1ifeIbBJ2v7tN7Funeq+B
	u2zObOck6y9RabjAP511VxMF1XlEsqqWOJoPdxsANwSEKwGzh8sP2VZKuoPjPoJy4UiR
	/48ywYbtVyUm7mx+kYcWddy1mvC4dQl7x5X4cJVHVJKlpM4Mg4M4xvAlvzuWteJch6M3
	El/w==
X-Gm-Message-State: APjAAAXb5dvqjIbDHw10tS4rVD96Qi0mQFiyOmg0QN3XCwEllziAkJmz
	lz6aOYWuES/XvPt5E81NU6ML3NECGPnZ0VXpj5Y=
X-Google-Smtp-Source: APXvYqzqPJ3/KGRXRGTmtgNNDx7v9MQxXbyunla4CPxYN+Fsv0K2hV5uIk54wBuv6Cr4XyhlAxEipAYwoLRF9tURx3Q=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr9031177qtr.194.1565970962379; 
	Fri, 16 Aug 2019 08:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <1561479240-36337-1-git-send-email-hongxu.jia@windriver.com>
	<1561479240-36337-2-git-send-email-hongxu.jia@windriver.com>
	<CAB2nKc8Eiqwy4HoVH9AhkdBLp1fGjPSFndtWrm+wjTq1Ma5JaQ@mail.gmail.com>
In-Reply-To: <CAB2nKc8Eiqwy4HoVH9AhkdBLp1fGjPSFndtWrm+wjTq1Ma5JaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 08:55:36 -0700
Message-ID: <CAMKF1soZYzUfS8KU0mGh+oWvwFwTFxqU7P_kSa5X2Y7sa9o4Ww@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/4] mongodb: add to PNBLACKLIST
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
X-List-Received-Date: Fri, 16 Aug 2019 15:56:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 8:19 AM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Hi all,
>
> In order to get mongodb back, I'm trying to bump version from current r4.=
0.6 to r4.2.0 which support python3.
>
> How do you guys refresh current OE patches over new releases?
> I'm thinking something like:
>  - apply patches on git r4.0.6 commit
>  - pull 4.2.0
>  - cherry-pick patch commits
>  - use format-patch to get refreshed patches
> Is there any easier way?
>

devtool workflow works well as well but yeah it needs to
be addressed at code level in the end to forward port
patches

> Some python3 recipes will need to be integrated as well ...
>
> Regards,
> Vincent
>
> Le mar. 25 juin 2019 =C3=A0 18:14, Hongxu Jia <hongxu.jia@windriver.com> =
a =C3=A9crit :
>>
>> Since commit [44f303b scons: inherit python3native] applied in oe-core,
>> but mongodb v4.0 requires python2 to build
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  meta-oe/recipes-dbs/mongodb/mongodb_git.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipe=
s-dbs/mongodb/mongodb_git.bb
>> index 0f90003..7634e5d 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> @@ -75,3 +75,5 @@ scons_do_install() {
>>          ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
>>          die "scons install execution failed."
>>  }
>> +
>> +PNBLACKLIST[mongodb] =3D "Since bbclass scons convert to python3, build=
 mongodb failed"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

