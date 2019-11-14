Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2BFD7FA28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:45:07 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y10so8706353qto.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VVb5DAKrDpRmpXtmU0oBSdOEEHjfOF9eOsAWD78dr3c=;
	b=F8mNcYHFXOkGNg4B3gaRCnnfB+5S5rvPLVEJeNDGisqgNutmKKnXUTs5mIFhsjqgUz
	FnjamUWnhffgLg1U8NBz6Q0p4oNmPOVCyfwzEj6qrryX+opSVyV0ZDE4qTNuvARKmFhP
	NDzqhsQT10hhuYYNxdtE8z+nNMNZoDVjtav0aHAxz9xDsb2oi2VK3sd3Ek9+WfrL6fSr
	cwYZsrK/txO8vs93EnPGw1ANTIqGvlsol6py/G2l224qcLH3kvctGQdKeXHEScpI14bV
	hrbkVPxh7M45BW2/0Qhxwsqr9goj6O1L85+xR4/gUVj7aFOE7uiFqXeDm2ESRqn2gpeA
	EE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VVb5DAKrDpRmpXtmU0oBSdOEEHjfOF9eOsAWD78dr3c=;
	b=bnapf6916uoQG5j/ZrkmW+atxI9AMyMJi4AzX+RnfLIR2tllfmCFpQkHUkZZCJ4BGo
	aLzCIUBaH/fPR7QcH6iP3HSOEl1ONNJ04/B4dWETQ+hO/AxRPlR9YeH+r8Gscr1SOSfx
	0kpk2ObRkHgS0DhwhS0jaLEzhmE9fBv2pgnVy6M6rs+hB7npvWHuFbsqGWTV7kglNOev
	xuSMpnHZiL5r4nA5AywSi1OkbP2gyCWtEfe7Zr/TWqRWro+1sacnfX7g25tOw03TNM62
	fv2OLpdbsG45U21Os8+vV681/qF7zec8XPxuH1uiH1+OpjVQewNZC/P0mv6zXobTV/XG
	CYBA==
X-Gm-Message-State: APjAAAUkJXElnXY+mmT0vD2wDZZ91uxtbCiyYyil7c3eVyPoKFMSXoWg
	ULLu60/yy/7NywK6f3FQJUr5p7tcUFGllJJrFxI=
X-Google-Smtp-Source: APXvYqyLPj73TkZcRFBAXtBClXaPiRkOOLVQ2EtzyVBIjaSsorv2XERZ1GKRHNnaCK+cB3lac0L2OhkZd5sX1Lb4gFw=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr4960960qtr.378.1573771508209; 
	Thu, 14 Nov 2019 14:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-5-schnitzeltony@gmail.com>
	<CAMKF1sqekHs4t7b6pa=uN6_kCvS0eOJCaDupYXz5SjrnZvACbg@mail.gmail.com>
	<CALbNGRR7UPfkK1mO-Pz1W=bX0b0Bqs+XAb1f0hDwizE9MM1dDw@mail.gmail.com>
In-Reply-To: <CALbNGRR7UPfkK1mO-Pz1W=bX0b0Bqs+XAb1f0hDwizE9MM1dDw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:44:41 -0800
Message-ID: <CAMKF1sqsxg2Jy8eu7ibR9rPhXeYDeDGJ5g2k6v4auCk50Pdxeg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 04/16] evolution-data-server: upgrade 3.26.6 -> 3.34.1 and rework
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
X-List-Received-Date: Thu, 14 Nov 2019 22:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 2:38 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Thu, Nov 14, 2019 at 11:10 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > this patch was needed for musl build, and it was marked not upstream
> > worthy, so I wonder
> > if we drop it then will it fail musl build.
> Thanks for review
>
> Honestly: I don't remember exactly -  base of this patch was May this yea=
r...
>
> But I think musl-patch did not apply any more and at that time I was a
> good boy and tested musl (and in case I am still :)...
>
> Whatever - could you give autobuilder a try because the story is
> simple: A 'it works for me' is not enough. In case of fallout: I'll
> take care - remember gnome related dances we had recently...
>

No problems, I am patient, and thanks for GNOME 3 recipe
contributions, I can then use gnome3 images instead of xfce for my
tests.

> Andreas

