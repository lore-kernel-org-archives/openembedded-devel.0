Return-Path: <richard.pannek@pelagicore.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id A1CB775C51
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 13:58:02 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id x130so22516830ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=RnD3/uLcvzOtJkbZQ4idKbOjBBpl5ovfwzueXkUcXY8=;
	b=Uq/f2nsNDtBoZ0IVj0Ils0TxUgurD7cN+Y1Wn2Q8Rbjh7ETGDkYIB5Yrhnbj1LR6lM
	UI/bkYnw57gIngnCW1x2FpymIYsWhVIgq7t4hKlKNm30YC6AyYgTgpf9GVH7Vwzw9wS3
	qxMlbZGF+b/aqkG9eicr9tDziRbCUdLhcpHQOKV/BptNi9lbuxGIXo6hjSgT5WE7GAkd
	sa72T9YBORTqlSFPgu0Bg2POFixJJ+j6ZJwIKjFLwhalSs8u9hMdLOMryVKXPbXCr/RR
	zhoqq2G8+eIrXOEZ41rvQO4RZmMmyYN4kpjNXsVy39QemhZjTZHF9QNHLXGWl/454Hpn
	FS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=RnD3/uLcvzOtJkbZQ4idKbOjBBpl5ovfwzueXkUcXY8=;
	b=k+jNfsMwTPK68TWa4Pxjsn+Lex7HZ4vdYBCbtH2mjyo0VjizSHkPXIhLrFrSX2fWmn
	wYhm2YQiGsaYDHMCmFmr9cJy/FwP7HiaFa/vnI4yYBosvwJb1i57W4l5whnBAS29HiMM
	NlUfeM/Q1tTxhNtCXFfJtrT0RuIAlVpGAI8DCrAyrxuEdIVBOQMnTusUwGiTQILDrKyY
	85alxkoRjlkj3kDCe7UfHt9+mcie/8J7J4SC2yabmVDaUWsEFeGeat37yZ3vIZV4KRph
	fNGtVnb3rYsnFmid1y9gepQJsbWw2kbBL40kLX5UEWMhxMVOQXNUUj6+nnggM2wCcgku
	N/dw==
X-Gm-Message-State: AEkooutrVwGu8rfkiCPII4MjeoFMjv0BZ598lhl8xHKu0oAZGs6VU42nFaMN1UExcFEpr9l9zn+z/2MFsxQpVPcp
X-Received: by 10.36.34.145 with SMTP id o139mr4648356ito.11.1470405482884;
	Fri, 05 Aug 2016 06:58:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.17.213 with HTTP; Fri, 5 Aug 2016 06:58:02 -0700 (PDT)
From: Richard Pannek <richard.pannek@pelagicore.com>
Date: Fri, 5 Aug 2016 15:58:02 +0200
Message-ID: <CAN5TPoWbt-zACtcw244xLrfpv_xqPSxpsC5bi66LzuZL9sStKw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Igor Socec <igor.socec@pelagicore.com>
Subject: [meta-qt5] commit breaks all other qtbase branches but dev
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
X-List-Received-Date: Fri, 05 Aug 2016 13:58:04 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

We are using the 5.6 branch of qtbase and are following the krogoth
branch of meta-qt5. Today our biulds stopped working, I checked what
happened and it told me that the md5sums for the license files didn't
match anymore. I checked the commits in meta-qt5 krogoth branch and
found this commit
https://github.com/meta-qt5/meta-qt5/commit/c110de233f0fd56e60b2be996dece64147c332e0
which changes all the md5sums for many recipies. In the commit message
it points to the commit 4343c4e731c3268614fc79c9c42b4e5e4d59d7e6 of
qtbase, which changes those license files.

I checked in which branches this commit exists, and it does only in
the dev branch, but not in the 5.6 branch which we are using. I pinned
my build to the commit before so wi could build again for now.

But I have a question, is this expected behavior or is it a bug? How
do other people handle this, who don't use the dev branch?

/Richard



Richard Pannek
tel:+46723948758

