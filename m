Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id CC5E273D2F;
	Mon, 22 Jun 2015 14:27:29 +0000 (UTC)
Received: by pacyo7 with SMTP id yo7so31997605pac.2;
	Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=/GvLysZPpNtbh/8HS6pYc3e3Mw9gQTlGeORRO6/C9cU=;
	b=a8NHH586RWtCAJVCQ+t8FfomEZSxSXFvCLNCaa+QkoZ7kRDtkzJP7OmZ/3k/9FieEm
	IY/EqHqin4m0fHkE2j4woJduZ14Gc6RPirhUrtGrL8jpa87yR68WdzMv9BnpceUP1jgH
	onl6obqK+TIGUi6Rj5/fI/qa6VTmZVB3a0F3U/OTUY+eH9RkntdF81YFavH8RdZ9VMz9
	UNdvi2lN1O0DQoK70SCLnbLR2Lj4kn93jzMhSPuDIw5T9bMyhVsdj+ZaUVvrslcfJiPM
	la0llqPi/KaKGSpyQLHbGjIrzWY0/CmVkgws0dHiXM+v0+9tEZTXr8nHWP6cnmULvZnv
	pIcg==
MIME-Version: 1.0
X-Received: by 10.66.62.231 with SMTP id b7mr53078827pas.80.1434983250745;
	Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
Received: by 10.70.34.109 with HTTP; Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
In-Reply-To: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
References: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
Date: Mon, 22 Jun 2015 11:27:30 -0300
X-Google-Sender-Auth: 5e3vSjFXbrkN5k2-1YXTG9VxKoY
Message-ID: <CAP9ODKq5Gg5-fv=ibhmeh_peXyL_z81q3RQd29Uh8iKrtOiw2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Future of Qt4 recipes
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
X-List-Received-Date: Mon, 22 Jun 2015 14:27:32 -0000
Content-Type: text/plain; charset=UTF-8

I vote for 2 as well.
Em 22/06/2015 07:44, "Burton, Ross" <ross.burton@intel.com> escreveu:

> Hi,
>
> So, Qt 4.8.7 was released last month[1].  Support for Qt4 stops at the end
> of 2015, and 4.8.7 is planned to be the last ever release of Qt4. It's
> still mandated by the long-awaited LSB 5 but I think it's fair to say that
> the majority of developers have moved to Qt5. So, what should we do with
> Qt4 moving forward?[2]  I see several options:
>
> 1) There's still lots of people using Qt4 in production, please keep it in
> oe-core!  (and revisit in six months time)
> 2) Move Qt4 recipes and classes to a meta-qt4 layer now so that oe-core
> 1.9 ships without Qt4, and anyone wanting full LSB compliance or Qt4 will
> need to add that layer to their distro.
>
> Personally, I vote for (2).  Any other comments?
>
> Ross
>
> [1] https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7812
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

