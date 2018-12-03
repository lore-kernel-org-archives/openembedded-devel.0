Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 386BB6C548
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 10:47:59 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id y23so10479184oia.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 02:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NpLERKbhK1BbQRmnn4sPx6lBtxwI5pp2xc2RLjXTl6E=;
	b=DG4khlP6LSdz2EeNzkMvQ+nWzAQOLxMkntiAY6lrdkz50U8mj4boVnaBz3scckdkXN
	LNKV2ARMT18intsmwB7F7yQGMqS2KwM5kl38063bw+QVlbmh3tJ4vT7mchu5THnySnrp
	iRXnO4EOf2HevlARVfoBVRDpEvBtN+X26gFZ91Wvv8p0BhNxBT7l7NX9hvNKAmakMhVl
	XigJj16K/m/L+Caixqr+tSqDW5tZ0JEkr1YLXwaeaZ544QISIy/HQS3cW7jRLJm+6u4u
	+rSgrwk6ACvlYmm8zEMs2iZWvp4/oLKfr8yeQEiWQjJOdUBrD/INVMnhGS73e7+Hef9J
	kUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NpLERKbhK1BbQRmnn4sPx6lBtxwI5pp2xc2RLjXTl6E=;
	b=O8QFTMjrT9Nv1U2ckmAvI7dR2HdYMc3S1xoKQCypQuSiFkLtheFYT2TwNcHF1eagx+
	/rEBcuIY5eM+2heaut5qtByn2KrEl/Es1Ww/OTCwOepr3qX2ISeGTUhq+t+kQ/DMv8n6
	J914oi3a8Rv9U02dJXgUWeDb7GCUGXzHvhrE6NxYoJykm8K/qQ/w3EsSG1rng6/akqK0
	ekDVK9k6sX/wQYiEZhk5B8SPBaaVrQW1WL+IMqL3ECnXsNYT/A+AaJzwSmBRD7G0xNNo
	ga+wG8z9mp2YDu5Rgq0zohDJTZrhOVRUue16tFtkfeGdiLccH9M4F+zDwq1pemktV0ep
	0GsQ==
X-Gm-Message-State: AA+aEWYBTGmLdlSnjT5lyjitzCwAwPYyXECRUVKPsmW3JzHL99UEax97
	CgOXlNPdVWdSNZlOqoJO20t0+gwVfS0lpkv/HSo=
X-Google-Smtp-Source: AFSGD/Vb/QAeyepyb7BWs4DvKNDYgr+MfQqHPTox5T+SMRCOZQqEvEy+TUjiYQvqB0KwcRXerZ7WCPXh4zsniz+To9s=
X-Received: by 2002:aca:544:: with SMTP id 65mr9116681oif.302.1543834080447;
	Mon, 03 Dec 2018 02:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20181202102736.47401-1-alex.kanavin@gmail.com>
	<6d78c61b-d097-8677-8f7e-f6aa3d26f1f6@gmail.com>
	<CANNYZj8V34J0ZKWAjWtRyYV_vJVJ4YCBK2PF4dmJenF2NkgtSQ@mail.gmail.com>
	<CANNYZj_3o662t1+4+1Xk7pSU2nnK16ZadDZkwr=aSeE974w3=w@mail.gmail.com>
	<CAMKF1sq+iGKKHvHnNOeeM001+ATb2stsrwLwJoRdzo1o1Ed7tQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq+iGKKHvHnNOeeM001+ATb2stsrwLwJoRdzo1o1Ed7tQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Dec 2018 11:47:49 +0100
Message-ID: <CANNYZj8YGUxi6-UzdkcNVY+3xFga+QhmqR5YrcSTfoVi_gvUpA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-meta-oe: drop ptest groups
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
X-List-Received-Date: Mon, 03 Dec 2018 10:48:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Dec 2018 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:

> > However, maybe renaming the ptest group will work. Let me try that.
> >
>
> while you are at it, send all the four patches in a single series,
> current version seems to have conflicts.

Sorry for the confusion - drop the first two patches, and take the
last two only.

Alex

