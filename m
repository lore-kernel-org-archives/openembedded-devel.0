Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E649774E1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 21:58:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z96-v6so8415930wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=l/MoooN7VuVae+OYJRTlCddAmEV4ueN0EfwD7hM05SU=;
	b=bRu5SWUV4RcNklnLGtRmLOYb9ybZ+3oVocuOytYSRa97LxcCa20BI36qerohvq+K0i
	9aJC8gfW52ZZqiIYQwiUrBmdDQvKt0z0R7ymrgnJo18xNKsbS/5hAGWzpnDijeqEzLFr
	WsVxKx6H2a+TdCd+R/uxSTi8Xd95XrWXCNxO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=l/MoooN7VuVae+OYJRTlCddAmEV4ueN0EfwD7hM05SU=;
	b=PHvTNL5AJdwlC2ymlQPOIDfUTwzvZxrEdLKUszvCa2Wu1UimwznumCl/VI+iF8Vo6r
	TdX8orh/AUQt7H5EdQeAk2h2YNUpgLscU1TUJSQhPoNuuiWLPfJT906AnmItgj86TX4T
	X900AZR4yiWR60QOjEO/kJFFPpMQ5wqJQTMwrtAEIoPwYmXUQ5+JwgAC2woVbzAyH1li
	MOaFau3WELM3sjCLM5JTPUl4li/VvsI6IbYoJPAFjDh5QPQE/7uaC2vPTv0SfbIt5aSX
	X8weTFKEH9/fxiFbFLNBkDWlE0gScMyn1KbzvdRAdjUVctbFRjxkGw1dbIG00i+tmB61
	9VMA==
X-Gm-Message-State: AOUpUlHus/NrhVdn5pIwphL3ViYK+p5LWb+5cG1PJIf0J9GcjHQMVlpG
	Tzg7h3jAL0SaAU6D7FUZywOqkQ==
X-Google-Smtp-Source: AA+uWPyEmodqFT8T5JNNn8w8ed+QqB9qu5ZbU0UA80LHOvVbSUFh+bYtML6vIYi5eWozBiMcWXxfEA==
X-Received: by 2002:a5d:6908:: with SMTP id
	t8-v6mr16984281wru.170.1534888728738; 
	Tue, 21 Aug 2018 14:58:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o3-v6sm8871996wrn.58.2018.08.21.14.58.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 14:58:47 -0700 (PDT)
Message-ID: <a6e6fea9d8763611b2df805006639187f9c95326.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Date: Tue, 21 Aug 2018 22:58:46 +0100
In-Reply-To: <664116f8b9fb427aaa911962e77f1a3d@de.bosch.com>
References: <664116f8b9fb427aaa911962e77f1a3d@de.bosch.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: "GUAN Ben \(BT-FIR/ENG1-Zhu\)" <Ben.Guan@cn.bosch.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] directfb: fix tslib version check in configure.in
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
X-List-Received-Date: Tue, 21 Aug 2018 21:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-21 at 08:36 +0000, Jonas Mark (BT-FIR/ENG1) wrote:
> Hi Richard,
> 
> This is my third attempt getting my reply onto the mailing list. I
> suspect the first two attempts were filtered due to the link to the
> v2
> patch I added. I removed the link this time.
> 	
> I already sent an updated version of the patch to the
> openembedded-devel@lists.openembedded.org mailing list because an
> automatic system informed me that I hit the wrong mailing list. I
> propose to switch to openembedded-devel for further discussions.
> 
> [meta-oe,v2] directfb: fix tslib version check in configure.in
> 
> Sadly, there hasn't been any reaction yet.

FWIW your messages do appear to be making it to the mailing list(s) and
you can see them in the archives, e.g.:

http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120115.html

I look after OE-Core, not meta-oe where this patch needs to go so I
can't help with that but the patch is on the right list for them to see
it.

Cheers,

Richard

