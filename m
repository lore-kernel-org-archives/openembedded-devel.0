Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id AFEDB6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:23:14 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id c128-v6so345813oig.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2018 16:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=xQ3t4vKlMhqFNDqgpMFmljaKk+PKx2dRzLriSaGpi7I=;
	b=lgP/Z4Y64fLAXSBa22a+VDCxLPSz4pLFk62vJRFAvGL8EIqfJepTc+CqTXoXo16DrQ
	DsN3xRihQG7FKc+TNml7mcGHN7oI5uzeLHnAzUdgoPXSQr60wXZ99xIdPKmYo2hm/4fR
	dp/m710Ln+ISYvZ6GEgC2z7K76idLbTIB93f93KfvDkXxqjPIw8AobBagzswSW/l9q0d
	WXdjwRx7Qj2VwxKI4AB3EJHTjWLY0WWW4nbkmUmwC+Z8R8eHXonQeFTCnIBVUd7SpCSj
	AlDnJUtEsjbdwkGgCX4XLVscm0BhrPHPSPl7yW9iOuANhZNzVAG4s9tK7ZY+nYQ3Ucto
	98mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=xQ3t4vKlMhqFNDqgpMFmljaKk+PKx2dRzLriSaGpi7I=;
	b=lgSZbQHsbZs3z9Mq/crOFjODh7UU/JGLXhSR+qrgkL2U713Nkv54WxE7c6nqzkgn5j
	R829WnV1JPBO/OQ9vcUMZ0RhJh1CnAhSaBpVo7NEADiRuBBQDQs8i1yr2ouqdZgqGLPP
	H/F6pKEPThLqOsXnG/Jaz3bs4tC7xYKOx5L1wAVstVvWbtjIyaKqPfFLbi1RKAnRmZ90
	A0F9s3m+WnJYai3Kv+Il3x5kvrYoOS/4WGG0KrfFfvHZCtJAkMRp1wPmHE1/+IQr/m+c
	faRcb2m9STIswpSPH0caTCrPzVFUr8Swl8RrDLTMB6Ard5rbf3CHyWSdLDR5qiKpzSmB
	ULwA==
X-Gm-Message-State: APt69E36k2T6Z5WLb62U9xf9m9bLC9SSffYJarfBm/QmYJbTcehs456U
	quF1WptiEtG/JDOYks5IXTFbH8GHPEnm/dnuCo4=
X-Google-Smtp-Source: ADUXVKImutSPxdf7aXICrg0ZoBg2nHsJwWCGA09qEZceJzC/yKC4bqk0UQ+l87kf2Agw9PrLNpfYZkoxLhJCfX5qvIM=
X-Received: by 2002:aca:b01:: with SMTP id 1-v6mr5159076oil.285.1528154595337; 
	Mon, 04 Jun 2018 16:23:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 16:23:14 -0700 (PDT)
In-Reply-To: <20180604223911.14561-1-schnitzeltony@gmail.com>
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 5 Jun 2018 01:23:14 +0200
Message-ID: <CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Mon, 04 Jun 2018 23:23:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 5, 2018 at 12:39 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> log.do_configure says:
>
> | The WebKit build was disabled for the following reasons:
> |     * cross-compilation of QtWebKit with qmake is not supported yet
> |    * Missing cmake from PATH
> |    * Using cmake version , but at least cmake 2.8.12 is required to bui=
ld QtWebKit.
>
> and build was finished without errors (but surprisingly fast). Looking in=
to
> qtwebkit, it seems they have changed to cmake build system and Webkit.pro=
 is
> just a wrapper for preparing and running cmake.
>
> For the transition the packageconfigs were translated as close as possibl=
e.
> 'libxcomposite' and 'libxrender' were merged to 'x11' - there is only one
> option 'ENABLE_X11_TARGET' available for both.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../0001-Do-not-skip-build-for-cross-compile.patch | 31 +++++++++++++
>  recipes-qt/qt5/qtwebkit_git.bb                     | 51 ++++++++++------=
------
>  2 files changed, 54 insertions(+), 28 deletions(-)
>  create mode 100644 recipes-qt/qt5/qtwebkit/0001-Do-not-skip-build-for-cr=
oss-compile.patch
>
Cannot see (yet) what's wrong with this patch but now qtquick1 fails with:

| error: QGraphicsWebView: No such file or directory

Andreas

