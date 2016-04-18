Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD1660088
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 14:11:46 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n1so81406918pfn.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=s31fzM2EmCncfUpd1+uwkFp4SYHcSSNO3vVW0j/YzWw=;
	b=mYpQqsbsq6MLaTUA8J2Fj0ISAiqu13vGGp7fPnoYeKMuXJnQz37W5csoXLFKoDAGBu
	f//aL6o113fYo25Tk9zTF0DIvhmySO7hDwIv7DZWRGzpyOYiLhmyf3FI6JuYxpxm1yuM
	+CoOTgGkNDGRNyy8InRQh/mfMXr6MYRisgsLWDYQnFRL/U4GefdF4kXL9H9Lr6/dhZxI
	CVE42sjDMlIgaoyqs+Gvam2Nix5ME1mzCFVJCruypLqlDVB8Nl3Og/Hb8j1UmUk2u7qI
	LVdcMyebx/01PFRyF57kHY8CrFtJnFKSekoTE+1W0mRy9qsr3tdaKCAlXO6H5PgC73iM
	Yojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=s31fzM2EmCncfUpd1+uwkFp4SYHcSSNO3vVW0j/YzWw=;
	b=gTFxSsaZyOX4YhfSDKUX1OhNpas5Ebt2n4BGQpXdhAGBsMb34At7GEoyUbpIZ97ayr
	unQQRwcAq7ATTjpkYRs+cgj5Oo6XNJ4Rut8t8DbQFtwcP5A/MuPAqacbOaN2X0XpgOb/
	dLA069Pv3hw5weqcL+XM6XpEvei70pSPr+nWBP/UDMx0YMU8AAQ4dmbdslW1dJ/SKNo5
	BcXCMHxPhYp2AoiIuIqqeDqphioe81BkLZdU46ZEffsg64iwbaMftJi8/LUNmI/D8ZDk
	klsGfJhvSz4IIi5pD9tGA8Og8Fh72Z3sUQzp/v7xQG3coi5yWE6vjwRdSQaENoSB4njM
	9UTA==
X-Gm-Message-State: AOPr4FWpKSMgQXs/Dkc1IwkxLW8A6opaMNvSwJZ7nWjte/3NmcDWbXa1vU0Eswvn4AM+8w==
X-Received: by 10.98.10.136 with SMTP id 8mr50539950pfk.67.1460988706877;
	Mon, 18 Apr 2016 07:11:46 -0700 (PDT)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	i7sm40097448pfc.47.2016.04.18.07.11.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Apr 2016 07:11:45 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id er2so50846373pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 07:11:45 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.65.169 with SMTP id y9mr50151829pas.102.1460988704766;
	Mon, 18 Apr 2016 07:11:44 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 18 Apr 2016 07:11:44 -0700 (PDT)
In-Reply-To: <1460553790.9308.89.camel@linuxfoundation.org>
References: <1460553790.9308.89.camel@linuxfoundation.org>
Date: Mon, 18 Apr 2016 11:11:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKodsRi75eqk0oh_8=-JLR7UDdpBuJ50=i7unNMedg0QAg@mail.gmail.com>
Message-ID: <CAP9ODKodsRi75eqk0oh_8=-JLR7UDdpBuJ50=i7unNMedg0QAg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] cyrus-sasl: Drop unneeded group addition
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
X-List-Received-Date: Mon, 18 Apr 2016 14:11:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 13, 2016 at 10:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The mail group is provided by base-passwd so would always be present. Therefore
> drop the uneeded group addition from this recipe.
>
> This works around the recent user cleanup code improvements which meant
> this started causing failures for people.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

