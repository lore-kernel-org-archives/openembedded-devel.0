Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id CF01F71D97
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 19:42:07 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id o65so143673115oif.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r9wPXuuEw9sfus8E6TOxwxqzMJ8ZPVFKjX+HoZyiXXY=;
	b=P2nAKiJP0VxOKWEzt3Sr/QiUsR1J6WUnU5Qqtu+2ulTKZzS6p/QN8/PGilDE5NPjWk
	iMA8Ip4TREywH8HpfAqjmJssi4f7i2/WPTYvp9RsIX0VwocxCIdsrwmfsw2sgM/hVxmP
	x8Q9nSKaCYfP+YXwbOG2sd1wIN6wPKHQCsgetWDE6TGCpFG72uU8SRmk5gGeMIfQTw6e
	5iJ3RV/aCocsnR8h4aR3qKUZnlTlUtVp/GOomvs/Oj28TrOXzd+mxQRrRx9bLKmE43zI
	2gpFmjtLOn69wAtN+eZD4mK77VwtkpNUrjlzbTtSHybPOLHuWn+AuVgr8LLmw9qPDqQs
	oe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r9wPXuuEw9sfus8E6TOxwxqzMJ8ZPVFKjX+HoZyiXXY=;
	b=pOvrRiaRodzlwavaGanTLwv2UlKAExN6Y6ja3Gb25S0bbZ3yH4NPcd+FvqPSs0foMg
	GymcRFpkblsPFssxEe9HKivKBSH3YQT7yy1mU9U7RCLZdbQ8pNRTNOZgof1uYKp8tX69
	rjmKplGi4JKfoYCyns4G3RtWuNXEmTKIsAYEFGA0vCERdYmjjJHIgHDU5+bX9gy9h+30
	Ps7SE8mG4PauKuz90RjBCgAmVYmguM1LMkbc/TDysl3A50Buhx8T8oXT0+ZWaZjlD7Q4
	h6xcdD/IC2Th6hXMI3VvMLG+slTjNgmwI8e+AYD2d3x6l2dM8T88/zGRwcJ3cVc34ReL
	eYlA==
X-Gm-Message-State: AODbwcCDmcyWDixNP/slaxgGylt7Ulm8BvSgqHukzd19wo4u7XpuDWSx
	Q5oysVTJzj6790dfzRIVSvPeMS1H+Q==
X-Received: by 10.202.205.132 with SMTP id d126mr4011295oig.138.1496691729089; 
	Mon, 05 Jun 2017 12:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.30.230 with HTTP; Mon, 5 Jun 2017 12:41:48 -0700 (PDT)
In-Reply-To: <1496655970-1826-1-git-send-email-ross.burton@intel.com>
References: <1496655970-1826-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 5 Jun 2017 12:41:48 -0700
Message-ID: <CABcZAN=FhaM122AR_mM+aHuP79CWZPbTyS5ON8uBTkeX-_Q7zg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] meson: don't pass localedir
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
X-List-Received-Date: Mon, 05 Jun 2017 19:42:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 5, 2017 at 2:46 AM, Ross Burton <ross.burton@intel.com> wrote:

> For historic reasons the localedir directory is where binary locales are
> stored
> (/usr/lib/locale) , not where application translations belong (typically,
> /usr/share/locale).  Don't pass localedir explicitly, and let Meson use the
> default of $datadir/locale to match the behaviour of autotools.bbclass
> and the
> expectations of the system.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Maybe we should think about renaming that variable for clarity.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

