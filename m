Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCD37038D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 06:57:56 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id at20so947886iec.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=K8dEgPZnbXUwFWLysjfHM/lc4zAJk+m1PPeVh2d/u10=;
	b=n41VBC0Z+OrlKxprcWSPHxI6zgdamnqXfkbEex/BeA0mGAjAcADvDwyzd9M5DruI7Z
	dFmPMi8R/bGBV1ogjrVC05qf6pA5EUDpPECq3bnLwrhu/9Lw5SjFSGfDt8+BGac4gf+y
	ugjUxzbMR14Koc8QMr1lgWoXUF8/reywxwY1nqDhMdLvWuqUZcfHgML/gsMYAPVz8zWw
	ysV6KqY17MLmZFreEJ6HYITdWD6qGiWBcwnrmJV+PlivpUYsNpERmn0DooAqbE6QY/ov
	SRvPQIPCoexr2OvMS6cN0unHfTEbyN0xisYUWgmkHPg4xXiY2nnltDHTk+l0j8y7B068
	rQlg==
X-Received: by 10.42.168.199 with SMTP id x7mr2728786icy.70.1406703478174;
	Tue, 29 Jul 2014 23:57:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 29 Jul 2014 23:57:28 -0700 (PDT)
In-Reply-To: <CAHURY+30Z_tK7SMRs_vM55vB6gS+zmJiEP66DMegzhvVx3pn8Q@mail.gmail.com>
References: <CAHURY+30Z_tK7SMRs_vM55vB6gS+zmJiEP66DMegzhvVx3pn8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 23:57:28 -0700
Message-ID: <CAMKF1srWJ0uG397vOmpAXHr56bSY-oe2Y2=z7k_tyjUeVaNtUA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: bitbale meta-toolchain-qt5
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
X-List-Received-Date: Wed, 30 Jul 2014 06:57:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 11:16 PM, Nilesh Kokane
<nilesh.kokane@mindastoneridge.com> wrote:
> /bin/fsl-community-bsp/build$ bitbake meta-toolchain-qt5
> Loading cache: 100%
> |#################################################################################################|
> ETA:  00:00:00
> Loaded 1873 entries from dependency cache.
> ERROR: Nothing PROVIDES 'meta-toolchain-qt5'. Close matches:
>   meta-toolchain-qt
>   meta-toolchain-qte
>   meta-toolchain
>

well you are missing meta-qt5 in your layermix. and I guess
meta-fsl-community layer mailing lists would be appropriate to ask
if you should expect meta-qt5 to be a default layer in the setup or not.

