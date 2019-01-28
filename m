Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 45B757C309
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 10:01:50 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 50B03214DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548669711;
	bh=AqAu1suG2DpbSxFDKy+FsdFQuDoq2EpixTSmZ8WFkDk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j2dpn+ctTI/xAVxHRkQK4KEznSpxosyWRR5ESC8PDzosN8PTUMRRXSlkaFa4G51f3
	dLVOEyBo61DziCXrlc0qMluh/ifjw+skFTXkz4NswNOrCb6MkdgeGUffTUb3lM86Ei
	gFbwlJ7OG4UDVSRKm+MrcZdbalroMYsYuV5tMeQ0=
Received: by mail-lf1-f43.google.com with SMTP id v5so11354650lfe.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 02:01:51 -0800 (PST)
X-Gm-Message-State: AJcUuke3jNdai7nkNA5C6qtu7mNO4Y7pcKuAb6o1aghqWNjhetdh3+9c
	jACKYd2YMEUc8dedtzPVytd+Bp9PvHvaPwLghWs=
X-Google-Smtp-Source: ALg8bN4zZo7NS4yUFjyVTgLtY+Vt/H7qSR7iQfiEXHnQ3std40w87I/JhxvvePdCZK8IuJV5kCZexLfEXAHtJ9kiPtE=
X-Received: by 2002:a19:4948:: with SMTP id l8mr5390905lfj.156.1548669709416; 
	Mon, 28 Jan 2019 02:01:49 -0800 (PST)
MIME-Version: 1.0
References: <1548421517-28338-1-git-send-email-krzk@kernel.org>
	<CAMKF1sp4PvP_U_DLYQitq-n_i__U9+ntKcPrg8Hin2Z3fq0StQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp4PvP_U_DLYQitq-n_i__U9+ntKcPrg8Hin2Z3fq0StQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 28 Jan 2019 11:01:38 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeNfLmapyJRYpWJzjq5p0CHYrAs2jkadmE5=2iCVMiu+A@mail.gmail.com>
Message-ID: <CAJKOXPeNfLmapyJRYpWJzjq5p0CHYrAs2jkadmE5=2iCVMiu+A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] libkcapi: Fix missing bash (for apps) and unneeded checksums (for testapp) when building
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
X-List-Received-Date: Mon, 28 Jan 2019 10:01:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Jan 2019 at 21:51, Khem Raj <raj.khem@gmail.com> wrote:
>
> Another approach could be remove bashism from the shell script which is demanding it and ask for simple bin/sh

I took a look at this approach and it would be not trivial work.
Bashism appears in multiple places, starting from trivial function
keyword up to [[ ]] operators. On the other hand, these scripts are
enabled only for testapps package config which are useful during
development, not production. Therefore I expect that final image will
not have testapps and bash.

Best regards,
Krzysztof

