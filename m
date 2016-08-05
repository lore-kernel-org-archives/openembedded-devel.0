Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF7E770A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 14:06:08 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id l69so204456885lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 07:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c9MOQzqCfq10xLVA6WWuIMXrGel3AnxJoreiHGSVkB4=;
	b=YMrddjJOkQTUlguws42MVuCI8aX805ZdGVP/Q+RDFeDxo6TpeP7gwLD1Wrk3L4Obse
	8rfrmY2XaIBQBg4ZLCqlQ0AEWnRl9PreWNLwkwpbAgBf8i3cx75b++cdZSfqvuD1/Ct9
	yxAKn/YlQvRBNRk9v7L1JB7YYL0hTK911D3btvTIQiKSXMIQHW0OVh6bIEDl3cYHlggt
	rxtDcfRkRROaI10KWp9THS6ZPraFmwAnG+JMs5AMZXdf4ZdqqTexaNubNNW1W5mGtLmi
	6oSyuDrte/55uK0O2O2lV2txPeUpPklNl8zWkwl0RHwrJ/1hkkjAultVqnXdwvSIzY/b
	mgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c9MOQzqCfq10xLVA6WWuIMXrGel3AnxJoreiHGSVkB4=;
	b=GoPHTed3ZQImDCyVtM7bZWO9/6jsp1aj1QIPmaYEp9vUbU6tzAdW2enKtlwszsS5Nu
	Auc+OdSpTXeLhtos4O6lkaa4rA/bIMefCloUeZJnd3HrcB4jQZnOaQu+gtzvUNbINhDJ
	YTcPvo2D+cnzrDrjTzGr3lZmUtuC4nbnPWtXyskDDSlXcjZ20kORHLvNloRiGb2BZTv8
	283cNJgnFTTY6V/1Mr3L93hisKyo3KzmhHJodqwAHkbBbBLgN+Y7Mcea1lhkciSqC0DM
	E9hTOUX4rBsb/vw4QLUy7l1w/ej/d421/AYCQFtzKLIe7oIynRrgRDE94NFc6l44VwPj
	NHRw==
X-Gm-Message-State: AEkoousS6ZLEoG+ezoq4puwswUuyupL0a0Nk1Usw71Ia7TEnQgNuL7g1Yz0JhhYK+HJkBakUilcxxVvf6KAXPw==
X-Received: by 10.25.21.16 with SMTP id l16mr21377654lfi.229.1470405968493;
	Fri, 05 Aug 2016 07:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Fri, 5 Aug 2016 07:06:07 -0700 (PDT)
In-Reply-To: <CAN5TPoWbt-zACtcw244xLrfpv_xqPSxpsC5bi66LzuZL9sStKw@mail.gmail.com>
References: <CAN5TPoWbt-zACtcw244xLrfpv_xqPSxpsC5bi66LzuZL9sStKw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 Aug 2016 16:06:07 +0200
Message-ID: <CA+chaQeO1Y2mcFEDwKB5jiuOdvezw8VSCFmRhzzJwhy1B1nxfg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Igor Socec <igor.socec@pelagicore.com>
Subject: Re: [meta-qt5] commit breaks all other qtbase branches but dev
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
X-List-Received-Date: Fri, 05 Aug 2016 14:06:09 -0000
Content-Type: text/plain; charset=UTF-8

Are you setting qtbase SRCREV somewhere? The LIC_FILES_CHKSUM should be
matching with SRCREVs set in meta-qt5 recipes (e.g.
7bf002c3b3f8009138fca217c7fa0c234aed21bd
for qtbase).

If you're using different SRCREVs set in your DISTRO config or bbappend,
then you'll need to adjust LIC_FILES_CHKSUMs to match with them.

On Fri, Aug 5, 2016 at 3:58 PM, Richard Pannek <
richard.pannek@pelagicore.com> wrote:

> Hi,
>
> We are using the 5.6 branch of qtbase and are following the krogoth
> branch of meta-qt5. Today our biulds stopped working, I checked what
> happened and it told me that the md5sums for the license files didn't
> match anymore. I checked the commits in meta-qt5 krogoth branch and
> found this commit
> https://github.com/meta-qt5/meta-qt5/commit/c110de233f0fd56e60b2be996dece6
> 4147c332e0
> which changes all the md5sums for many recipies. In the commit message
> it points to the commit 4343c4e731c3268614fc79c9c42b4e5e4d59d7e6 of
> qtbase, which changes those license files.
>
> I checked in which branches this commit exists, and it does only in
> the dev branch, but not in the 5.6 branch which we are using. I pinned
> my build to the commit before so wi could build again for now.
>
> But I have a question, is this expected behavior or is it a bug? How
> do other people handle this, who don't use the dev branch?
>
> /Richard
>
>
>
> Richard Pannek
> tel:+46723948758
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

