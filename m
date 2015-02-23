Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFAC706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 16:44:48 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so19542450igd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 08:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=sUNl6brhAzKXQ2z+V2pZarBYjj6EHf9Nq1e0ZiiQHdU=;
	b=v2gFZ8+WY5uFfEQFKvygeL2V+smN9JiZ2vUu2lCRjW/hvpD4Jub8/41hqeeXjSyfPB
	n69DJI26l8a4qjwHGGlQ5CtMIgTFJbMNw3r0qAFbt4Ih0T+WKRDmwxYN5BjG3EcRAsUZ
	VHTTFHJM1gTTvQIHvtJFTuG01PpGVlm2pibKndDH0Zpl68XpBGDGHjCwcUBBklljKabf
	lZUq7PDHseKZTVidYzHaoKqqgPA3IKdhsFJsvN7ELYljWukyGmR8IHJAzU9OmTC7YGJR
	4niHyB3QadrHtGO+FxfnrlEVd3UL5o+OQG+oc3rb/w2hydG779dIe60QEJiOez6nUx44
	JSyA==
X-Received: by 10.43.88.8 with SMTP id ay8mr12434534icc.52.1424709889285; Mon,
	23 Feb 2015 08:44:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.18.92 with HTTP; Mon, 23 Feb 2015 08:44:19 -0800 (PST)
In-Reply-To: <CALbNGRTLC3TRDDOkce6VTGaiwKmKtO=PCuXJOZ7EyDMzq=X=Og@mail.gmail.com>
References: <1424621742-17713-1-git-send-email-ashcharles@gmail.com>
	<CALbNGRR1Q_JOMPPWR21-Y0WmQGTA=r8TRDuSfRwUUsV-yh11Xw@mail.gmail.com>
	<CAK8F28nFL+h-YSRo+ydn1+_OsytChTco7UPD9aHMNSjaO36Z-g@mail.gmail.com>
	<CALbNGRTLC3TRDDOkce6VTGaiwKmKtO=PCuXJOZ7EyDMzq=X=Og@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 23 Feb 2015 08:44:19 -0800
Message-ID: <CAK8F28nX4QY8_Z+_MpiaRN-3yE9J+wA6W+RS=d++o3zgQY7yCQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xfce4-session: Make package MACHINE specific
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
X-List-Received-Date: Mon, 23 Feb 2015 16:44:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2015 at 1:20 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
>
> It is a runtime error: When you start XFCE a error/warning pops up
> telling something <MachineName> missing. I can't remember exactly. I
> even don't know if this error comes up once on first start or on every
> start. Could you give that a try? Maybe this quirk is no more
> required.
I tested it out this morning on an Overo but didn't see the error
message even without the pkg_postinst.  As such, I sent a new patch
"xfce4-session: Remove unneeded pkg_postinst" (sorry, forgot to thread
it here) instead---the patch on this thread should be dropped.

--Ash

