Return-Path: <henry@kittyhawk.aero>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id D0CF065CBB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 18:42:25 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id g20so163702962ywb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 11:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kittyhawk-aero.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Glrs1epeRv5z5Fn3OPNNSL93Tndu27pyT4KSbCbN/0E=;
	b=rZ5yghs7TKOWRAMJeL5J6rPWZOdqc9nd3JOUrGmgxY5KQ5fC5iHsVivHRQPB75lMYF
	n6y4D3IX6QEs5MQfk8krP0NSEK+EshjQt17I548R0vDZzgxTPJej1539YFwLy/UNmed2
	Lm/j3pgSbmtHevMvZRUF49R6gHyHU/xtBdKBqavqLxH/zRNGasPDUFYvE0YQOJHgquaJ
	2ZMIm3VeAgtSHNYFj7FSrMPYcoWtI0ZhFlCCPa/830TppreU3Fi+a57O5Hd+LZPY2PZb
	p9YZuhzfF4dvofg5LBhr23Xfy2tI8DV15FhzKU7r8a08uAXtN5W23TI5Ns/v57ztXB0t
	zYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Glrs1epeRv5z5Fn3OPNNSL93Tndu27pyT4KSbCbN/0E=;
	b=bN0bewGh8yLhEUXjVyePwad01xLr13dHuBN5X9uw3zHQUU+TnGQXiL+UH1Foc0OMI8
	IqJvl0BOPZAUVsKVHh/0RuKRkARqNj3Xs0UFjSyxMMqSjBBd3HASkHjE16vRz9QovJHh
	3vYExU7gcebBrgbmp56gZhC6+uw3O3kM3D2/T4hEjlqh3febSDhzyOUudcEdxuaifIRm
	dEfT15GuCd7FvivkYYr8iWANyFgXfuFe/tblB8vrfn0MYnUx4WEoBe1yffxP44Agt4oX
	WEFsQemq2Zu9+ux5nWC07C0/iVDf6Xj4Yf9byZAuUXmHgjH71OVtoYS0VPRkHrGSxyT9
	BHmw==
X-Gm-Message-State: ALyK8tJGF4Py/lY2+foaFfDlG0PrW7JnXuY9/MkffVokqylVjI7NFm0390PnEfOfHaxveS34BEcaxB6Uhjrj78ep
X-Received: by 10.129.85.78 with SMTP id j75mr2772642ywb.177.1465929745568;
	Tue, 14 Jun 2016 11:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.236.18 with HTTP; Tue, 14 Jun 2016 11:42:25 -0700 (PDT)
In-Reply-To: <20160614173311.GB21667@jama>
References: <1465499198-340-1-git-send-email-henry@pericynthion.org>
	<20160614173311.GB21667@jama>
From: Henry Hallam <henry@kittyhawk.aero>
Date: Tue, 14 Jun 2016 11:42:25 -0700
Message-ID: <CABvT5oW9akWn-X2nTUm+gsZKCX0yoADJ7K1RgLgU=ZXuRRdYng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Tue, 14 Jun 2016 18:42:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 14, 2016 at 10:33 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Autodetects some dependencies:
>
> WARNING: chrony-2.4-r0 do_package_qa: QA Issue: chrony rdepends on nss,
> but it isn't a build dependency, missing nss in DEPENDS or
> PACKAGECONFIG? [build-deps]
> WARNING: chrony-2.4-r0 do_package_qa: QA Issue: chrony rdepends on
> libedit, but it isn't a build dependency, missing libedit in DEPENDS or
> PACKAGECONFIG? [build-deps]
>

Thanks Martin. It looks like those didn't show up for me because nss
and libedit are both optional dependencies which weren't present on my
system.  They are detected and used by chrony's `configure` script if
available and unused if not (e.g. chronyc can use either editline or
readline or neither, and if NSS is unavailable then chronyd gets built
without secure hash support).  What's the best practice here - should
I simply specify `configure` options to disable all these features for
minimal dependencies, or make them all optionally available via
PACKAGECONFIG?

Henry

