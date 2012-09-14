Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TCVle-0005aA-6Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 15:17:10 +0200
Received: by daks35 with SMTP id s35so2284813dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=DnzXdzLQQsjGcZmcyj3euxllPYjhm6c2Wp42uJeoM84=;
	b=bqpS4XSIdNAKSO7boI7JL9Yz9jGya9y1MsWObswVHgClmNn/bfwzTKhNXOSyRIUXdh
	YnqDCpBOGDHn4GB7aMDaJNtbC9VSphbtnhp5VY7pK9sfqUQigk/JJuTQAhJ7gHLdPqaN
	BiFDYeo+85xI9U55us+FZF8alsy0dVVrCSNP+G63skl5SXpNadsMxOmt24GAT3CBc5jr
	gMTbEYajcwfekig84tCySSaGxGBTQ02KbLhnIyk9w9MrQfZDQ1mrBx1B5q5MUzMG5Pbt
	CpslXlMUy3RxRS1J+R8yWxiKb760odve0nFxY5jaJMsX+7EzvCXvjzz7qrgh+HOiqMeF
	HlVA==
MIME-Version: 1.0
Received: by 10.68.197.70 with SMTP id is6mr5083975pbc.64.1347627874591; Fri,
	14 Sep 2012 06:04:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Fri, 14 Sep 2012 06:04:34 -0700 (PDT)
In-Reply-To: <20120914145457.2a3c9a76@eb-e6520>
References: <1347455128-14588-1-git-send-email-otavio@ossystems.com.br>
	<20120914145457.2a3c9a76@eb-e6520>
Date: Fri, 14 Sep 2012 10:04:34 -0300
X-Google-Sender-Auth: GdTWkAVbiBQY_wHP7aYB981rKpA
Message-ID: <CAP9ODKpDf8Thhmw4yuphXn2XzNaxNydiRVZ-izDfTWB-yoSmtQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][for-denzil][PATCH] libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
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
X-List-Received-Date: Fri, 14 Sep 2012 13:17:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2012 at 9:54 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Otavio,
>
> Le Wed, 12 Sep 2012 10:05:28 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>
>> The libxaw recipe generate a binary package for each soname of libxaw
>> (currently libxaw6-6 and libxaw-7-7) but no libxaw so libxaw-dev
>> cannot depends on it.
>>
>> Reported-by: Daiane Angolini <daiane.angolini@freescale.com>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> applied to denzil-next & denzil, please put me in cc of patches for
> meta-oe/denzil else I don't always see them.

Thanks a lot; will do next time.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


