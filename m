Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 73FB379491
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 20:54:07 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c126-v6so12252704qkd.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/HQ7vmwny1mfeJibqOnY4k3EoNH3MSQhYlmtYK6UJRw=;
	b=sJM48FZ3RTnyr+AUWRno1Yzvx9M9TWrPFDUjf9LNwoaZWRWMV90PH9qHhI57NrE8HC
	pR/JQWk1AKlCZ+s4icdr81/h7NQO1JVsFIbQXU+smza/wi1bpodcHUwmV1ppzmnjWb2b
	ItKfbIbc6StYicI+8FlU02Eu4qHzD4vYR6zsjFijNtAskr7EIJNaOk7FR6nLbETRoohn
	CxzL/m3sEAmHoE2fs432JP9Y1bNbrR08Mi/BGT1hXASy6J5e1+AE81HENRHWiPUkz5ur
	qGTFyUlmV99VMmPICxKd6yftQGSuufld4UP5E0gcMEjgXh9YYmatGhcLgKOKrCrrhY8m
	HiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/HQ7vmwny1mfeJibqOnY4k3EoNH3MSQhYlmtYK6UJRw=;
	b=hEmiHDxy5WN/t6qOFia9gxFSvwDYCvozyLU5e0jI3/MqnqBL7A3v4j1MBV+Cvi5R7e
	DCeRs/EBV81Yfh7Ergo6UzDtr1OB6MYhIXIpslQt+PasvBd/sJP4QoA/q2ZLYbxKolQn
	7RVlwZF603Sv78LM5bMtyP/BYM8+XuwOj7+tiaV9Eang8TlzyQt/hw8I7xC1DoZAWSbN
	+mBGdw1OnASAea9W/GRo+/x9f8TJ3qHRsvBd/OuwYJClITOG2a5rego68CBe3INuXAKW
	bARdRx9LNTrtw7jifPboBK9nb5wWiWU/zkwyRBUFL9srwmgk4QDbFCPrV04rRC2J/AoT
	Lb6g==
X-Gm-Message-State: ABuFfogY+l7DpqvHZMOYjirpsb/PsD7IAziy//p+yNXp8tIQZwDBSU2g
	eBO/oxNOnQ30IGj1vgEFf5fTyg7OIZHde4zsK5aKCg==
X-Google-Smtp-Source: ACcGV61sNdT6jy5CfWUAe97iDS0aI8AN63lQF8QXH3kfqb7uCff4+y5qcnnRBoiuvu2HdtYWjnRgC6U+Vicd+KXX+XY=
X-Received: by 2002:a37:2e03:: with SMTP id u3-v6mr431742qkh.223.1537822448143;
	Mon, 24 Sep 2018 13:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180924201705.30209-1-nicolas.dechesne@linaro.org>
	<CAMKF1sqg6-DnQE7MGuxe4RnScu_uoXW6iker022pW6Q7FRS5dg@mail.gmail.com>
	<CAP71Wjw78UsD9opN1bEUCo3B_FZL0YY3HpvabQufdUhNT0JNzw@mail.gmail.com>
In-Reply-To: <CAP71Wjw78UsD9opN1bEUCo3B_FZL0YY3HpvabQufdUhNT0JNzw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2018 13:53:41 -0700
Message-ID: <CAMKF1sqhabbZdhZb4zhJAGFS+4RiQ0MYdd71JSHPqzwFZiDTSw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-multimedia: fixup LAYERDEPENDS
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
X-List-Received-Date: Mon, 24 Sep 2018 20:54:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 1:45 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Mon, Sep 24, 2018 at 10:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Dos2unix is in oe-core now please try with master
>
> ouch. sorry, i missed that. I noticed the issue while running the YP
> 2.0 compliance script against sumo branch... how do we get that fixed
> in sumo then? can we apply something like the below patch on sumo
> directly?
>

I think that will be fine as long as Armin is fine
with it. Please retag the subject appropriately and resend.

> >
> > On Mon, Sep 24, 2018 at 1:19 PM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> >>
> >> libebml depends on dos2unix classe since 26dafa0f3542 (libebml: inherit
> >> dos2unix), so LAYERDEPENDS needs to be updated accordingly, otherwise we are
> >> getting a ParseError:
> >>
> >> ERROR: ParseError at
> >> /srv/work/oe/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
> >> Could not inherit file classes/dos2unix.bbclass
> >>
> >> It was initially found with yocto-check-layer script.
> >>
> >> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> >> ---
> >>  meta-multimedia/conf/layer.conf | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
> >> index cfedf2f6b..a1dfed4e9 100644
> >> --- a/meta-multimedia/conf/layer.conf
> >> +++ b/meta-multimedia/conf/layer.conf
> >> @@ -27,6 +27,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
> >>  # cause compatibility issues with other layers
> >>  LAYERVERSION_multimedia-layer = "1"
> >>
> >> -LAYERDEPENDS_multimedia-layer = "core"
> >> +LAYERDEPENDS_multimedia-layer = "core openembedded-layer"
> >>
> >>  LAYERSERIES_COMPAT_multimedia-layer = "sumo"
> >> --
> >> 2.18.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

