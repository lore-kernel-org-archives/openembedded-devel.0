Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2E24F79C92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 08:12:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47kfgV5XBgz4b;
	Fri, 27 Dec 2019 09:12:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577434327;
	bh=RFy8vGU607FpYjjMV1D11XTCQhs8VdQHeRgNKwY0P4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbD/1FvmZkmmdXBiRLNmB/gHmhPH3B18E0/iQZwPU2C95zAEZK9qgUlEqiUyvK4hD
	6ove8/KDS7vzIUu0waZBtLp+d0Zf7W8U37ikf/m86gsXKfw16B+Dnsq8f88Lw7qkR5
	gB19j9WO4dG5m2DgUKi2CIlznMWb3wXYMuP2jyUQLhE0/v1a/noiLuOOD5MJJZNFi4
	ra427ybYSCv21pBP6pRz/z1qUR3b84/f+oJWjWxkiLykopQ/sTimfhrIWlB/c0Tq++
	ZfUNXa6g4Gk+kS0y1b66karYfq0tqlXXrfDSWD2MqHggap2dJopbKE6EZBELBPSpqK
	kl2ovh/h6WGoOnZ9yN+xpfdPFmUTaq7G3zoSt5PQWqa+PdUm6/MIUEb5kBpRO/+Xfn
	NliCyhVF9tlQJ7Rpju4OhbvE9/FAj/pPZB5MqXo8KQhb6wMXo2mV0JaKBokYHRBZQp
	gULPIsGk4ya2QUARBungFTMc039NtvlID8VxUkPZds6iZPcwVsjWuNOerY0wrdJO9I
	WefpjDRxrQvCnxj+fMIsaKR9UJs5QZAenGUSSZC5or2VOSMKODmkSdLQ/5kljLawPJ
	jtOv2lxMdq8MWL2C2Dw9U9Uf4tb1882JfVm9cXw+HmXg1vZtwCNehQ2eLZc8ZUJFId
	3jak/jX7K6NNgnGSlNMgTaYw=
Date: Fri, 27 Dec 2019 10:12:04 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191227081204.GF19235@localhost>
References: <20191227035639.303716-1-raj.khem@gmail.com>
	<20191227035639.303716-5-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191227035639.303716-5-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 5/5] ippool: Fix strncpy -Wformat-truncation warning
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
X-List-Received-Date: Fri, 27 Dec 2019 08:12:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Dec 26, 2019 at 07:56:39PM -0800, Khem Raj wrote:
>...
> +--- a/cli/cli_readline.c
> ++++ b/cli/cli_readline.c
> +@@ -261,6 +261,11 @@ static void cli_rl_display_wrapped_text(
> + 	if (left_margin == 0) {
> + 		left_margin = 3;
> + 	}
> ++
> ++	if (left_margin >= strlen(text_buf)) {
> ++		left_margin = strlen(text_buf);
> ++	}
>...

This doesn't make sense, text_buf is an uninitialized variable.

cu
Adrian

