Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id A2F27719B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:13:56 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id s15so2521828uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=m2qrTh3q1z3OPFJmOClx90gE5xrT34fggnQ5XHBrZfI=;
	b=jpypHUKcr+hijCbaF1y+DTKuCqNM/qb07TRrvtdJDqnjYxRWRjSew6aKKCva/3PMKQ
	JmDnPJnORyVaNlcVA20msQiVO07JDVStfa4fxwG8RxVQoh20SfCIGUUSLlul+MaEUlXk
	FRFqqygJ2lasMV1kGrPBgRKJa/3mun6SxO4LFNe/dfrGg0rhFr2Sdash4SqBzrY1EYBJ
	6k6NNeKyhgIbhwx9Y0RDpCMWgo6htktLdn4/OxouqPAlH2o6G7pc8T+w/Bejhe2DHMZm
	MaYqAv05aotsKLCRGueFnh1nz5cieHXdwGoHxFdssG9AA7HENvziu/ieCQnjpWbCyZCp
	LK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m2qrTh3q1z3OPFJmOClx90gE5xrT34fggnQ5XHBrZfI=;
	b=RopXROtBy69sACvKAI7mCvjavLkZckwl1Y6fG4o+WavyBX+gsVJc6OVtjqQ5jgzhOl
	LRgaxVsfcx7YDFHyrsOuc8Z7S5ZzxbzYgeXkMhWU2CEFuuMvfCijVAr89G6Snt3kPzJM
	IREQwOnxx1jnACRtuoGaZEok0Zc4//e7dt4Yq3RfpSPKgfF6ypnZFTiBfat/70BhzPl1
	ZZeSo1cyEL6huXe4YZxIcC8HDo89A7T3rqWZ5ZrGk/6huBcSTOQ/hOdbvu6Sr3yw8gYC
	bkzhXG43IMxppOPVIMmQ3b4bhRJtB0Dx8R7Q2A+lFyqBuc8BtmzZ2yW7RvOFvs8Ll1Wv
	cxFg==
X-Gm-Message-State: AHPjjUhYzr6Ibt9jvWl6bcfuOR/3No6P+DLJv1IZx72FDHrs/2utSs/p
	V6+27fjgv3dqm/DeXZAOkv6/WJK5wQ==
X-Google-Smtp-Source: ADKCNb66TczC+KupoPQX3qC6sQkFkSvyma+6VwYX81T0YlRZEbBgnEMSRrHulsrEAKgjK7FmRiNOttc7q0cZmUasqIU=
X-Received: by 10.176.2.5 with SMTP id 5mr254575uas.160.1504728837721; Wed, 06
	Sep 2017 13:13:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Wed, 6 Sep 2017 13:13:57 -0700 (PDT)
In-Reply-To: <9fab8446-0159-e7c8-b81f-a4e7fa3a5882@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
	<CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
	<9fab8446-0159-e7c8-b81f-a4e7fa3a5882@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 6 Sep 2017 22:13:57 +0200
Message-ID: <CALbNGRRQAKUNR-X1U=vdc4dEzpobc5k+b_F8cS=u2VOi04s7MA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
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
X-List-Received-Date: Wed, 06 Sep 2017 20:13:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2017 at 10:02 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 9/6/17 2:58 PM, Andreas M=C3=BCller wrote:
>> On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
>>> There is no upstream revision to the mixer to make it work w/o gstreame=
r-0.10
>>>
>>> also remove from packagegroup-xfce-extended
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>>  meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb   | 14 ------=
--------
>>>  .../packagegroups/packagegroup-xfce-extended.bb            |  1 -
>>>  2 files changed, 15 deletions(-)
>>>  delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11=
.0.bb
>>>
>>> diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b=
/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
>>> deleted file mode 100644
>>> index bdbec45..0000000
>>> --- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
>>> +++ /dev/null
>>> @@ -1,14 +0,0 @@
>>> -SUMMARY =3D "A volume control application based on GStreamer"
>>> -LICENSE =3D "GPLv2"
>>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9=
f6552"
>>> -
>>> -inherit xfce-panel-plugin
>>> -
>>> -DEPENDS +=3D "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
>>> -
>>> -SRC_URI =3D "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("$=
{PV}")}/${BPN}-${PV}.tar.bz2"
>>> -
>>> -SRC_URI[md5sum] =3D "1b3753b91224867a3a2dfddda239c28d"
>>> -SRC_URI[sha256sum] =3D "fb0c1df201ed1130f54f15b914cbe5a59286e994a137ac=
da5609570c57112de2"
>>> -
>>> -RDEPENDS_${PN} =3D "gst-meta-audio"
>>> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-ext=
ended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.=
bb
>>> index c07188f..ff024b3 100644
>>> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.b=
b
>>> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.b=
b
>>> @@ -61,7 +61,6 @@ RRECOMMENDS_${PN} =3D " \
>>>      xfce4-appfinder \
>>>      xfce4-screenshooter \
>>>      xfce4-power-manager \
>>> -    xfce4-mixer \
>>>      ristretto \
>>>      xfce4-taskmanager \
>>>      gigolo \
>>> --
>>> 1.8.3.1
>>>
>> NAK - I use it daily and there is no proper replacement (not using pulsa=
udio)
>
> That is exactly why I removed it.. there is no proper replacement for it.
> Between gstreamer-0.10 not being supported and the existence of it in
> meta-openembedded causing preferred provider problems.  It really needs t=
o be
> replaced with something else.  I have no idea 'what else', but I was look=
ing and
> most other distributions have dumped it.
>
> I saw some references to security issues in gstreamer-0.10 (not being res=
olved)
> due to it no longer being supported as well, but no specifics.
>
> --Mark
>
You are about to remove a recipe I need very very very often. As you
can see in meta-qt5-extra I use my build for making music. You end up
in calling this other peoples problem (e.g mine) and don't really care
of any replacement. Thank you - I will send out a removing me as
maintainer for meta-xfce - fun times are definetely over.

And please don't even think about running your magic script for
meta-qt5-extra or send patches.

Over and out

Andreas

