Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id EEBCF73180
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:38:08 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id q63so87879301pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=b7scWve5wZNJ1lellCddsLweafOky2QhPAONslohdD0=;
	b=DuMGeUXEYx7KvlGrx/102fYX6McLBYq0X2fKd4mhdWdLRQjLfoiDZNJoI810xAHg48
	ShlY0dsTYcAgfj5LtrtikCnjv1uXo47/EGqci6bn4kcClZX8uJEPAEtvLCx6s8SZ1XUa
	tGisQtsid1aiUPKkfK9/HqGsIVQQhTfykp8f4tciuZaMfux543c5NrdNlVCgK+oTL5vW
	cBBrGgenhMDwmdR0AuCcso7SFIKmp0FEdvfELPImQo9YZVhOSr39fdlrQyDBiVarfhkL
	6uAlDtOxCqhf6pxZ9lLEcAetcLqVlZuqxeOd3jfSiBHkuj3nkuOTF8i/7AKXGTdz0T98
	LEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=b7scWve5wZNJ1lellCddsLweafOky2QhPAONslohdD0=;
	b=fQrLYjTYuShb9EIAsLtUXfAUikbE93IdJm7x2io0OTMRvDbfaC7d0d3emS5e08n9Lb
	r6Zjjs32+YMHA8/2aWYH8l8NmPeHWQPXneasNVFYl6hCdV+lZ6TIp4U4FLHJQr0ro3Hf
	0Sz5ynf7uAx97mBfY85C2hYz+O1E2sDWsKg2KousBj9JVYGmbrPwwo5T9gyW+sb6xOqt
	1XhnhaZhsJQq0OK4dKRgXmnQza+Bl/L+TiNO5QCtfS87Qo+VftXs5qXZXAXgzoGhPX3s
	5K6D7DofGFYJAOdr5KtxX6SJQXGYzLYbUPwmgJp7RXx+YIFw1B0xACQXsABxdAnw3/BS
	GTlA==
X-Gm-Message-State: ALoCoQmW1Y5GkkHSRSj2ZXD8ytq+2wVnoG6oArE7Mi/4c07JtMNVW6QIZSUr1eg7DZgN4Wn42mazoxXZLjaBfULM0q4qB4v3SA==
X-Received: by 10.98.15.27 with SMTP id x27mr1104042pfi.61.1452710289546;
	Wed, 13 Jan 2016 10:38:09 -0800 (PST)
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com.
	[209.85.220.45]) by smtp.gmail.com with ESMTPSA id
	n84sm4204134pfa.45.2016.01.13.10.38.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 10:38:07 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f45.google.com with SMTP id cy9so362494992pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:38:07 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.122.97 with SMTP id lr1mr60063327pab.68.1452710286940;
	Wed, 13 Jan 2016 10:38:06 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 10:38:06 -0800 (PST)
In-Reply-To: <315045FB-F742-4125-826E-210A07B68780@gmail.com>
References: <315045FB-F742-4125-826E-210A07B68780@gmail.com>
Date: Wed, 13 Jan 2016 16:38:06 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrKZABvZvEkmDdska_t9JgnWLCT8MM6kzov=HqsCc16Hw@mail.gmail.com>
Message-ID: <CAP9ODKrKZABvZvEkmDdska_t9JgnWLCT8MM6kzov=HqsCc16Hw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-java Workflow
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
X-List-Received-Date: Wed, 13 Jan 2016 18:38:09 -0000
Content-Type: text/plain; charset=UTF-8

Hello Jens,

On Wed, Jan 13, 2016 at 4:03 PM, Jens Rehsack <rehsack@gmail.com> wrote:
> to avoid such a problem as it occurred with ec7b984f, 04d5d0bf and dfb21b44, I strongly suggest that meta-java follows the merge-workflow from other meta-layers:
>
> cherry-pick new stuff into master-next, when settled - merge to master
> Branch releases as other layers do and same, push back-ported patches into ${rel_branch}-next and merge the behaving ones into ${rel_branch}.
>
> The current way - pushing to master and live only there result in the happened revert - and to continue my work I would have to revert the reverts without any nice word in the commit message as I did in reverting 24b98ac3 with a88718b6.

I understand your frustation but I think you are exagerating on this.

The fix you provide (and was reverted by causing regression at that
moment) is a great improvement and those should be brought back. To
bring it back, as I explained on the Hangout, you can revert those and
apply the fix for the sstate. Doing this, we can integrate those
changes back and everyone is happy.

To make all this setup you are asking for, I need to reserve resources
in our autobuilder to properly excercize it and provide useful
feedback otherwise it is useless. To be honest, I am not being an
active user of this and been acting as maintainer just due the lack of
someone more active so I am willing to give the maintenance for
someone more commited to Java use than me, if desired.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

