Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id C5F897754E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:37:53 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id g30so20520043uac.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=E3AzKvPsLtXY+YnGqB66PjbJxKf3qdmmCYj6cIbf1q4=;
	b=Gbb2YoHPnz6CNqKgXQtYqeGm7hOQGtpnRMHpZ2UxA22/1UIztYNyjnmu+EYfdYTgrI
	uasArZ3EDbf8ujxVVwGycR2Ft2Ah4cnAEqppVeKUdoN1LOpdDib4GQN+QfXixlv4dq/W
	QdZ+2w79zmIxv7Jta5byWVYXrIEpPOjIWkexhdQU3/bdmKJLOHjx1/b19HaFQobzRURz
	TujaKzCBecLmPWGJbQ3+oEn0vVi6qWmN8t4SDY5Ik+m3C/Z9Mc5MPPvNQxCilEpBdoAF
	UNLx+yZ1TxT/p9W22K8IqUvJ/4fO/yXc+dBH/BIVQ3YIeCRi8u2htd5jqzWRNHh1fGj6
	B+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=E3AzKvPsLtXY+YnGqB66PjbJxKf3qdmmCYj6cIbf1q4=;
	b=P66nVXObs0PcBN4ZFXGqXVUbDJCEcX8jXHJ15ety7qaPnYPmRmlhz5QVp3Yrvs1hoM
	TIFGiLbDxzNwZYXwQ4Il8xrJQHcb3KvYLQCTJkfqyv4+6Yycv6/zcDUdhxk6YChljVv7
	h1Ugo5CXn0oHalolqxq7hMn5c8h5/c9NZmw404ubCrsS34+lDE7t6dbrF6nX6OQDcks0
	cvTtnUSjH3I2OtEBCPOTrM3lvytOo0E5y/D0nYeCSstZBncWFNTCpNopX8kRZAqbjELy
	2WTT1ZohXDWpKO8ydoACs8duxet6qMCL3wE0iHHoLsiDyJIl/hVVP1UujHo3oHh8yxqV
	8o2g==
X-Gm-Message-State: AMke39kA1/IQ/bHsa3HboyohgyWLBZANXA9rN+7cwyRjgFJWKtDCXtgMnm+3Th0RLvudOY7lhc2mxncOvqXixA==
X-Received: by 10.176.1.180 with SMTP id 49mr2186504ual.44.1487972274568; Fri,
	24 Feb 2017 13:37:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Fri, 24 Feb 2017 13:37:54 -0800 (PST)
In-Reply-To: <AvSi0A.u5mfvzOvRT55.zGleTngOVAwASoCrPaYd@freemail.hu>
References: <20170211141745.3380-1-gyurco@freemail.hu>
	<CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
	<20170220121752.GB3266@jama>
	<CALbNGRRTvzyGpT4O0YCSmz-WvSjxVOEZCXxRE_grdV2MmvW4jQ@mail.gmail.com>
	<AvSi0A.u5mfvzOvRT55.zGleTngOVAwASoCrPaYd@freemail.hu>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 24 Feb 2017 22:37:54 +0100
Message-ID: <CALbNGRSvWsmkDnxVPb5PFe1tCgJB+0vpK8pPYB9a+h8EnpTipw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Fri, 24 Feb 2017 21:37:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 5:08 PM, Szombathelyi Gy=C3=B6rgy <gyurco@freemail.=
hu> wrote:
> Hi,
>
> If there&#39;s no solution to resolve the conflict between the internal t=
event and the external one, then maybe putting the libtevent-internal.h fro=
m the external lib to the samba tree would be a way to go.
>
> Br,
> Gy=C3=B6rgy
> -------- Eredeti lev=C3=A9l --------
> Felad=C3=B3: Andreas M=C3=BCller &lt;schnitzeltony&#64;googlemail.com&gt;
> D=C3=A1tum: 2017 febru=C3=A1r 20 12:52:18
> T=C3=A1rgy: Re: [oe] [meta-networking][PATCH v2] Samba: use built-in libt=
event
> C=C3=ADmzett: openembedded-devel&#64;lists.openembedded.org &lt;openembed=
ded-devel&#64;lists.openembedded.org&gt;
>
> &gt; In last build I&#39;ve noticed only this new issue related to samba:
> &gt;
> &gt; ctdb-2.5.6: ctdb rdepends on samba, but it isn&#39;t a build depende=
ncy, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
> &gt;
> &gt; Maybe this dependency was created from samba being libldb provider i=
n
> &gt; this build.
> &gt;
> &gt; gvfs and whole meta-gnome layers is still included in my world, mayb=
e it
> &gt; didn&#39;t fail because some gvfs dependency was already failing or =
one of
> &gt; samba related changes in master-next is fixing this one.
> &gt;
> Some background: During last weekend I prepared a series based on
> master-next unblacklisting. First target is to build a xfce-image
> again [1]. Last step yesterday evening should be rebasing against
> latest master-next and run a test build. That failed for gvfs - so I
> stopped sending stuff. Now I know why gvfs fails...
>
> How do we proceed with this patch?
>
> [1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2017-02
>
Just notices that this patch made it into master breaking at least gvfs. Re=
vert?

Andreas

