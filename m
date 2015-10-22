Return-Path: <stephanoc@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id D51C560124
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 20:47:27 +0000 (UTC)
Received: by ykdr3 with SMTP id r3so95763207ykd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=8LWqVZowHG+8mnN1uFSuQnxZ2kHK2JiUOrTL8P4Rsms=;
	b=O7CqMTs/WrRd24yI8xwWpnaWn3on9mgxvDFaJdDTYq6MuOdG7PJggeJXN9Vl7TCqgq
	wdx9LhAyRK9Ikio9/zKmYTYon4UogQMdENgwC5PdL8Nus0ChWyA7wPj0R0t62oBFw+LA
	bl10RaifTzRS0KbQUdtdC5aa4ATZt3+157LeJt5Hlk1YUQro89m4bqyvz10SnoZ+hPN6
	ITSu3GAH3woNgah31Yy/L2KPJ6/c/KfT2NEwkq3eb9c2g1GWbTlIVZ6WbcXDt/o2+u0C
	YfntG/7q9bAQBqM1XohA+fwHM9sudZnii+qrsKy687wdgND2KWoalUhyGltFhXomDcmu
	cLzg==
MIME-Version: 1.0
X-Received: by 10.13.255.4 with SMTP id p4mr12651416ywf.88.1445546847781; Thu,
	22 Oct 2015 13:47:27 -0700 (PDT)
Received: by 10.13.211.2 with HTTP; Thu, 22 Oct 2015 13:47:27 -0700 (PDT)
In-Reply-To: <CAKpvFF1Us5xk3EFTUE1oo5xF14CNZOkJmHN5_uR9o8_CRxSmVQ@mail.gmail.com>
References: <CAKpvFF1Us5xk3EFTUE1oo5xF14CNZOkJmHN5_uR9o8_CRxSmVQ@mail.gmail.com>
Date: Thu, 22 Oct 2015 13:47:27 -0700
Message-ID: <CAB25Ju4q9v8_WPXbmpj_dAy7oasaiyRM2fhN5Gyrr7ZexgSmxQ@mail.gmail.com>
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: qtmultimedia + qt5.3.2 + yocto dizzy
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
X-List-Received-Date: Thu, 22 Oct 2015 20:47:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ciao Stefano,

Take a look at this thread:

https://community.freescale.com/message/391750#391750

You are missing libgstmediaplayer.so. That link should help get you
the right packages installed.



On Thu, Oct 22, 2015 at 7:23 AM, Stefano Gurrieri
<gurrieristefano@gmail.com> wrote:
> Goodmorning,
> I tried to compile Qt5.3.2 in my Yocto dizzy successfully etc=E2=80=A6
> =E2=80=A6 but when I try to run (on my target based on iMX6) a videowidge=
t
> application or player application=E2=80=A6 I always have the same error:
> defaultServiceProvider::requestService(): no service found for -
> "org.qt-project.qt.mediaplayer"
> and I can=E2=80=99t to see a video. In /usr/lib/qt5/plugins/mediaservice =
I=E2=80=99ve only
> libqtmedia_audioengine.so library. Missing gstreamer multimedia service
> plugins?
>
> Could you please help me?
>
> Thanks a lot.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

