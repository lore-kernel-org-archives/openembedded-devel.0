Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id D638F71A71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:52:57 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h65so810033lfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tFhX1wx7M91l7leumymQuAlcGM2oNzs5HDdm3q2IfvQ=;
	b=FpT7QyPruHQDA7N1LdzJ7Bf7N3yzEDuXwZT4tn2AZTkz4E6gtH4QfY8wcI43Goke06
	PPoTXj+O9DpgZsJ/WsIIQ18NWibJFlj5SJUVKwf3yjuu+ROxexFYTEJGr755Cx4gOgtq
	KgSajeG5q9acswBGE6ksEXAvMAa92EALexIXR+y/a63AuKoX3OQzTiJxou0BGQrtXcxX
	lpubLNp/2pFauUkILshLvEVJlPlk7G7Y28z7ed/GHn5YXCNA/g7sPqIlo3dEkVsWJLq2
	aBTNv7W3yVPiol4oL4VujNPDKXumfM8Ni5/hbU6PTPQkD0pUrN8DjvpDj32muL/LvC0I
	UjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tFhX1wx7M91l7leumymQuAlcGM2oNzs5HDdm3q2IfvQ=;
	b=OEKwyyT/BcavRcpFpYcCp3ZBd1aj8LnnytqowdXGov1+k6V0KNAmwDiWP54As6nfZF
	ykrwWlfZng0wMBdABL70cOxYbGvkFt81rHCV/PqvRtIgOHrfVNneTVobzfoQH1zVurKV
	HmMuIXhyyW7Qo+lbucwEhxd4MUU+XIPpiP452gNCO5XugiYNZ4d28WF9GTykec/warDv
	Xb7u4zpQc/87d1nFKIyO4weLy3nLjUDdLlfJVv1Vtf6f39+3oJZI3JZHlz9FCa1ov/DZ
	Er8YbreUb9hfYtQwbF/H4iivWFUnOSR/nQxYCbINAO/24LaX8Ngud2QA30/DoZE9rcBe
	b+7g==
X-Gm-Message-State: AIkVDXItVuWmumuxvf0nCXmD91kGiRat8JFt8dtFYJjyjOg49rT7awrbnswYFd4ys7F7E/kdH3se3ucR76EVig==
X-Received: by 10.25.44.66 with SMTP id s63mr3234657lfs.159.1484139177264;
	Wed, 11 Jan 2017 04:52:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Wed, 11 Jan 2017 04:52:26 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CALbNGRQDG-dcFtSfda3fUzTw3-2rYvJvKPcy09vdPsOoTaGDMA@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
	<CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
	<CALbNGRQ96mC8=tCLXpauUoDbz9zpD=cvztkaCiezta03V865Sw@mail.gmail.com>
	<949c3c51-85ac-75b8-9a13-61176d7a43c2@linux.intel.com>
	<CALbNGRT-f-yFag_OQhK9Ra_FqEL4PHBGgV7JGtrs5y_REqbETQ@mail.gmail.com>
	<CA+chaQebbXGgSc81--LcB0gif+wc_3JP3On_jWtDpvj40W1=VA@mail.gmail.com>
	<CALbNGRQDG-dcFtSfda3fUzTw3-2rYvJvKPcy09vdPsOoTaGDMA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 11 Jan 2017 10:52:26 -0200
Message-ID: <CAAPZna0-9xrmuzH42BVh3GH0cnNOK-yTRUAUnWb2x5MoM3N0Ng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:52:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ok. I'll test v3.

Thanks.

On Wed, Jan 11, 2017 at 10:50 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Jan 11, 2017 at 1:42 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > He could be using more strict PATCHTOOL or the patch got mangled by
> > patchwork/git-am.
> >
> > Can you upload your changes to some branch for Fabio to compare with wh=
at
> > he applied from patchwork?
> >
> I create the patches from scratch currently and saw minor changes.
> Will send V3 that should apply hopefully...
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

