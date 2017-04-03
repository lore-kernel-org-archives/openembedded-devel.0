Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3B277D04
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:01:49 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id d2so13623887oig.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/2g7fgrA43/pZ7+EMRdNfC7Ui/Rh0jN2rrfCzcnhQ4E=;
	b=ymlk2sWRDpalm92o+4NkhQwa3ZTAj27WOEvBk5nYxl8Ju9Soq71716radtRPtFv6UZ
	d3boIsDYVphPUOdymaWuq4UFg4MLQ0B1uDBnMsSKoV0GF1N2miCY8neBnPzutSdXdUAM
	vh3SKqisuHdNIQ7BSb/T/uaBJFmzYRDgXQ4bYsrmE90HXm2sik/Ltjmxmc7QoiIroiYm
	fvv6V1EAttgQaXMQwy3nzKnrAnPjdHYgokR9E8445a6XpfJFRtAAcyYPSM8n2Lzqy2zC
	mDxPqIeiTXaPrIY+XyuLmygKPnpCd5Ht0J1k/HoE2wGPVR1oboo2ZAgpnyyfs4Zub213
	49Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/2g7fgrA43/pZ7+EMRdNfC7Ui/Rh0jN2rrfCzcnhQ4E=;
	b=haA6obOziY9BGQFf/PgfQzJrlf4nKD/+lreue/pnFg1gzvBPq0KulzalgIJWfMk2nj
	gL0DMXicYlxZ/MDDEzgPQ3AKdvD5Xnzs6014dWGaCFcleUErmomx5L1uMhj8otPk+PUC
	yMS5xaR9e8Q/SWasvA26nnGAdoFG3wFXTXAOFfHJ+ax2Czr5oskpiA5raukOXLvv8ucP
	RCJxbDoiApyrlPdqanSCbfkcKrqORimF6nqqn6WpK5CQEtZ9lVIEEzDt57B+xebP+f0t
	xiAjfwSzYjxwytIV0734/DRUD8Y6okMz6GCDQKycr8vMUE7IR/tzh8M+7HpoOwR0zhXY
	4B4A==
X-Gm-Message-State: AFeK/H36nMaSuDlZaU2IoFp4Ydbksaa8ZOf9co7SfypUZz2xx49wJQi9ZZjh2Vi7GxTNwQ==
X-Received: by 10.202.104.130 with SMTP id o2mr8229890oik.93.1491242511020;
	Mon, 03 Apr 2017 11:01:51 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46])
	by smtp.gmail.com with ESMTPSA id t93sm7052997ota.4.2017.04.03.11.01.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 11:01:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id f193so135545529oib.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 11:01:49 -0700 (PDT)
X-Received: by 10.202.206.149 with SMTP id e143mr8555722oig.158.1491242509346; 
	Mon, 03 Apr 2017 11:01:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Mon, 3 Apr 2017 11:01:48 -0700 (PDT)
In-Reply-To: <20170403122736.29727-1-ismo.puustinen@intel.com>
References: <20170403122736.29727-1-ismo.puustinen@intel.com>
Date: Mon, 3 Apr 2017 15:01:48 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo6QTocCqF4tucWwXqh3S-7Mbsnx_LhyrJmZdD1vn2F5A@mail.gmail.com>
Message-ID: <CAP9ODKo6QTocCqF4tucWwXqh3S-7Mbsnx_LhyrJmZdD1vn2F5A@mail.gmail.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] v4l-utils: update to 1.12.3.
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
X-List-Received-Date: Mon, 03 Apr 2017 18:01:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 3, 2017 at 9:27 AM, Ismo Puustinen <ismo.puustinen@intel.com> wrote:
> Also add a patch which fixes building outside the source tree.
>
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

