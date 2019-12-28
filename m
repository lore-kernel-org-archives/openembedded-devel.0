Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE97A6BD08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 03:22:45 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e12so25895005qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 19:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oRsLr+BiSqBwKc0SzUw1jEYBE3q4P1lktNfIz9aDg6s=;
	b=GR50VyC4uZlacY6jrSx4+1j5zQxqu1dSuYgpCSyjO3R2uIaYc/xdykqw1bMTaErEZg
	pgqs2QGldJn/jhuEKcU8ekkg6ep7uRI4aagLrV1e5avkS9fE8X/L76TCRtFlj1PSBq6w
	Cp/OziYrFqJrafdyy5jwYJ/wH9fK2zAWJETYqzuKEfBzT4p891rp2795hkDeaqvGSh4z
	pL62N65ko/sBbr0UpFAP2Vv608vVwwyUJ3tC8/bS6KrQMTqrv5w6KXx0vS5E3OqrhH9T
	rsLALlsYOEhdbSwa5Ye5fcpSDKR6m5XR/MNM8GZrewLS9vSITQPhDAZ65MhV4AZ8JODi
	Q48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oRsLr+BiSqBwKc0SzUw1jEYBE3q4P1lktNfIz9aDg6s=;
	b=aEIl5j8GOAVxJPSkQbdw3iQ4PittcdhpndIAQygyKq2qi0YoPCn+gtwc++d5zX8PaE
	SQWqNTGNT9I8EsBFVTY/FkRYrFPQMX9gEBXv0DJEkBJ6hKtAwFauWhCBhGaBN3gdgz91
	0ZXAOcf2nsdHHqJpGvxnbpY2c6iRrzUNCL9636vDH5yMjS1DlRGuvL72WpmOtxA9c5PT
	FCxpeHgbdYMLwGZWwC0gvIJ5E01SGRAQcMd4HuAY5Pm4VQg+IhaiL6/I7mE3rdJx3N7k
	VOdZ9ZcPtRu2DAhvUUMbog5PC2Ya89bcAjsQxmipT9z/wvcjJHfsORfLRwOwGU9Dgaat
	QaAw==
X-Gm-Message-State: APjAAAX1BDuXmDb89RjuL36EkIL2sAC5Nja9ko+vbwlpFMJKQR09gZAB
	enMHVUNy7J25L08QEKLahxxMYZBSgFBLMpSgQL0=
X-Google-Smtp-Source: APXvYqxLUm8vwVdtg2PM4XBunSkjxt6FQvrGKnKyPvfk17ISRrqzT2Mt9PHkIbhMpP2rJ5HxAIVX6EX38EzyS4u7efk=
X-Received: by 2002:ac8:7592:: with SMTP id s18mr30816963qtq.378.1577503366273;
	Fri, 27 Dec 2019 19:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
	<20191227213120.3930-9-schnitzeltony@gmail.com>
	<CAMKF1srAOXoEzu=0i0yyM8dZn3rLt4B1d-_9FRPTTEfexDZDqw@mail.gmail.com>
	<CALbNGRTeSi6X-osFwzjm1y8fj46Bmsmayemdscn8-f=+=-srqQ@mail.gmail.com>
In-Reply-To: <CALbNGRTeSi6X-osFwzjm1y8fj46Bmsmayemdscn8-f=+=-srqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Dec 2019 19:22:20 -0800
Message-ID: <CAMKF1srcYxzH3J960mj8ggfQoZOyj=aO=ky9QjSTpNrEW5Asiw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 09/23] evolution-data-server: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Sat, 28 Dec 2019 03:22:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 3:48 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Dec 28, 2019 at 12:19 AM Khem Raj <raj.khem@gmail.com> wrote:
> > I think version specific information should be in bb file not inc
> we have a native build and it just builds some tools required. Both
> native/target share same version which is set in
> evolution-data-server.inc. So maybe I missed something but what kind
> of change do you suggest?
>

hmm if it shares with native/nativesdk that might be fine
why dont we use bbclassextend for the native version ?

> Andreas

