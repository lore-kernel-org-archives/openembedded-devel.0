Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9866E4CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 09:07:29 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 79so7280948ykr.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 02:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZZZuJTDMzs26C7uDfWs42KxbHhlQXujmezTBu79tdSo=;
	b=BlFkm8CTnWly4OVR4svjGe6GIF4fc/VLnXGcFRf5oK9Z970+6mNs8TvHsJwrgkyBtC
	XXxPnV0woEmFYR62sCdWRopTdf7V81Pvshr0Cn9zWHkliCZsPbz/8MgwvYiil3hLiRiS
	ae3KrLyPxBtICUkflwLku9X0fRX7mvqDFE8Om44YGFgnT9PYxCB+yV1MSBDsMOtpQIDZ
	+TtDNXjdKNdO+Wl5PcecukX0ndMNJBjMoeDLBSdqywo/uZmIKp8fTOALweG67HEn+X+K
	rbKkhOmQf/tZQiFlJmIC9sYEtdT+v2tN+tWAji6CKjwCkEY6dhkjHUhtdvejXNMdWsbu
	V5ZQ==
MIME-Version: 1.0
X-Received: by 10.236.137.8 with SMTP id x8mr42488632yhi.4.1396343250198; Tue,
	01 Apr 2014 02:07:30 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Tue, 1 Apr 2014 02:07:30 -0700 (PDT)
In-Reply-To: <3F0D5A70-AC82-4FBA-A613-48DBB4DC3227@gmail.com>
References: <CALYKT1hK8DF=kt9k_0bMjn4_nZGTMb=hakdTpUVObgdBJ1NhWQ@mail.gmail.com>
	<3F0D5A70-AC82-4FBA-A613-48DBB4DC3227@gmail.com>
Date: Tue, 1 Apr 2014 18:07:30 +0900
Message-ID: <CALYKT1iX6Bx12qmaOs_trYCrxuExuvdcicqcfwKwTcKRh=SzCA@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I make my own program start up when my system boots up?
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
X-List-Received-Date: Tue, 01 Apr 2014 09:07:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem Raj,

Thank you very much!
I understood!

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-01 15:18 GMT+09:00 Khem Raj <raj.khem@gmail.com>:

>
> On Mar 31, 2014, at 11:07 PM, Journeyer J. Joh <oosaprogrammer@gmail.com>
> wrote:
>
> > I tried to add the execution command in /etc/init.d/data-init - at the
> very
> > bottom. And it worked!
> >
> > But I am not sure if this method is correct or not.
>
> I think you are using standard sysvinit here so as long as you define an
> init script
> for your binary and enable it in rc scripts you should be ok.
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

