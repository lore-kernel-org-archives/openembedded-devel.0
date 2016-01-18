Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBCE608B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:46:12 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 65so160892111pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=nYiCnbCFkSFDkrZUFAb76xkbi3OwKkBWaiF746jen8g=;
	b=mjJqQ8h1ywXc/eQlcdR1mgrgq1pDcGrz9Zw23PdG44c5lCedC76D3wan72QRrvBjOA
	QZmi+qS/x2BR2p0cpY4mWSVMqDINz0IyU63Z7jtNcFZlzlGElxna/Fe2sxEgFm/ZenrG
	wMtTk6PfCNPt0jZKtQuUl3JgSCyp11E7lIZ5S7S+9/lyukFt3EJ7nRFXpAoqIiLB6/ki
	DZ47cIyahj1kfp5NaHnar1xOtba3XqQ7RKKgFs0PXxasziVw0GZNc3WekpzfEEQRcfte
	xLmGiZoe1tcZVPfbYRomjH+YjvzSeGuVxioRfoaBNcl1MlsOOUCaZhHBbmc8xiZuTh8A
	1U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=nYiCnbCFkSFDkrZUFAb76xkbi3OwKkBWaiF746jen8g=;
	b=bto31Bmw0/t/fAXAQ097mP5OwNW6LuGctzEoGFD4TqwzxTxA+9gRbt6TuklFDO91DB
	cxj+fOx96s4RHUP9+nFUra8MCn836B1KQv/gcCZdp5szeDqrlJPfWkhHNvgEg7F/KyLJ
	5yKxnbsuKdtgnzUs/u/bnuiJtBHUuc3+4VW2gIycxDUeENci3iFXhqlcYnX15ytsHR+N
	lxyAJSZWyOzJP8LTq5pfi45eu0bmDf7gATx3yPEqLutJfuBgE4m0TyM3TqOpw9i4yOfF
	P5xHoDMLADSuoi4V0OPuW+Y4CuFgI9Rle2yNcEwuUk9SAnBCgDUvGQB0LsoNxd/CwlWn
	QWmA==
X-Gm-Message-State: ALoCoQkQLYxM59wtyf4hVizZG/xwpupIu/Gap9b74/ktN73ONEM8D7R/sglqwO4QwA+P20ORrwwvHmAFBLThFln1a1I+jtYAmA==
X-Received: by 10.98.71.197 with SMTP id p66mr38899190pfi.166.1453139173667;
	Mon, 18 Jan 2016 09:46:13 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:e9a2:fb2f:ec3d:1ed8?
	([2601:202:4000:1239:e9a2:fb2f:ec3d:1ed8])
	by smtp.googlemail.com with ESMTPSA id
	oj9sm35638137pab.8.2016.01.18.09.46.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 09:46:12 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20160118171933.GA28347@mail.spox.systems>
From: akuster808 <akuster808@gmail.com>
Message-ID: <569D24E2.1060209@gmail.com>
Date: Mon, 18 Jan 2016 09:46:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160118171933.GA28347@mail.spox.systems>
Subject: Re: Require backport of patch to jethro branch
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
X-List-Received-Date: Mon, 18 Jan 2016 17:46:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Stephano,


On 01/18/2016 09:19 AM, Stephano Cetola wrote:
> I'd like to backport this patch to jethro:

Getting there.

> 
> http://cgit.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb?id=9546714d2464b950e91d0eaf330865e482450113
> 

This commit is in jethro-next.

http://cgit.openembedded.org/meta-openembedded/commit/?h=jethro-next&id=e4c37719db7bcab08b0bce63c268b604252a43e3

- armin

> Without this samba does not install init scripts correctly when using
> sysvinit.
> 
> Does anyone see any problems with this?
> 

