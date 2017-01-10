Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id EAC2160125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 10:57:53 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id i68so379972565uad.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 02:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=GdhWi0U8lEOO3dKYcRS1rIVWI/pO5mNxNOp3UbexKuc=;
	b=TniWqctU8BQ2qbQ0nVfwawLZ1zkc7ctQ9GX4iBRH7vOGKNgTriQlLKnepXyuRjZhE6
	V4QSD7HtFpMbmVya0IoDcYVEgf2G1N0+1gwrYe5Oi4GRRBy0r4hJhmxXo/W8Io5E82vS
	O2rK4/oMfA7ApM4e2y+4sq8cWOuXZDG9+mGfON5dASkuzut4UrKfwULCmWPCPN2ISqs1
	nXFzNzXVSLMQU6k6CyXS7M5I2w03lqROo7803eOfweP2fazbaZ5e+sLQGtDjwsZDXUT4
	jTlwq8MsJ+82LhjliRYEK375wQxGVbXWB9x7BGw1JurLzHzEFaskcxTBkkoi0GJOVXVD
	A/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=GdhWi0U8lEOO3dKYcRS1rIVWI/pO5mNxNOp3UbexKuc=;
	b=HUdxhl+83Q2tLpDrQK4/73sPjpF7zYFx5dWiyvkGr/tryJ4VLQh6635WWuylf9oDAr
	khPMRQwLZP2oiZnLABLNv0uyZTQxCLIvBf0MSomvtlBmJ9q7/p/x0sQzsYigoWvRZciB
	MCl45NQGcKtuzE/orydMbYSJuzHbreU/hDGiHPzUPdHts4MCQk2274Vu7dBnbSQNhnqT
	l7OA/tTNIp3g75Il7eMFdeThK7TJ3qw2Pb7J3E7HfHTp6xqUm9IxR4c9zBt5SOLRJ33z
	oB3vJxOtmRx+SCW9/CwyjEaU1hC93AoPdT8AAqbXDIVcDETWoz2Ki8Mh3ovWInK00p5g
	xEog==
X-Gm-Message-State: AIkVDXKiC7JPAsmHznK1dRPoUOVUJvvwH74fWyESbcDnUJAqtQaC3jljl68uQfuE78W0euQhLPZS6x6ycEq5HA==
X-Received: by 10.176.69.71 with SMTP id r65mr968577uar.77.1484045872342; Tue,
	10 Jan 2017 02:57:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Tue, 10 Jan 2017 02:57:51 -0800 (PST)
In-Reply-To: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481824331-347-1-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 10 Jan 2017 11:57:51 +0100
Message-ID: <CALbNGRSLsKm2hbeMLCt7eng9MfgaovQmpHoT8w-S3VxOO6__WA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH V2 0/3] firefox fix build on oe-core master
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
X-List-Received-Date: Tue, 10 Jan 2017 10:57:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2016 at 6:52 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * recent 'use system's nss/nspr' broke firefox
> * to build properly patch sent to oe-core is necessary [1]
>
> V1 -> V2: 0003-.. added to really fix build
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2016-Decemb=
er/130211.html
>
> Andreas M=C3=BCller (3):
>   firefox: fix configure with oe-core master - there is no nss-config
>   firefox: use pkg-config to find nspr
>   firefox: do not link against crmf library it is not there
>
>  .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47 ++++++++++++++++=
++++++
>  .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 ++++++++++++++++=
+
>  ...link-against-crmf-library-it-is-not-there.patch | 47 ++++++++++++++++=
++++++
>  recipes-mozilla/firefox/firefox_45.5.1esr.bb       |  3 ++
>  4 files changed, 134 insertions(+)
>  create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-t=
o-find-nss.patch
>  create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-t=
o-find-nspr.patch
>  create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-agai=
nst-crmf-library-it-is-not-there.patch
>
> --
> 2.7.4
>
ping?

