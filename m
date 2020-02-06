Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8401B60D25
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Feb 2020 21:51:43 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id j20so181532qka.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Feb 2020 13:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Dhj5TPmjKVwLqfRAtFYxIlQ0kDfN7+Jt1cbynfbjTG8=;
	b=Jwgw5AjXN2IL6XvXXr3K5ePG4xRif4p36/3AZSQZMMgn0tO4o8ZVzU/oi2+OWenCt4
	+GpHo5YGlcmF/Jm00YQBVtw75zQu6J2b9/mhJAB2EdzUDdXmU+99denlENa5F4AoWvXR
	i6qcKldF3jR4/XssIEf08jkvwnZWA04FZ5mkVjgkaGquF1wEKEc2XozshyDwnr55UfZJ
	D697hz2Bv7EvUj310c7KnAgRBdIXaMDNFsTEcnRGcD+Cuiy6puFqr+aXCrmRYnwRmlI8
	l/n9lSjKYOaatuPJmVwmf09nw9bYwe09a8LdjtPpUgoYcddziwivSbsB4nO0mUvsVSAK
	4Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Dhj5TPmjKVwLqfRAtFYxIlQ0kDfN7+Jt1cbynfbjTG8=;
	b=A4Vy9yQhtCGprlookTQt6IDluqKUvfJAmQICtbF4IPf0l3agqCJTrd26y2MwRzSIfB
	czoRBSMF/ZXZdYvMZQRG2KHxZxbK7Jm7xtpQRC5PxO/k8/O/6g5ueUZ4bFekM8MePZHK
	wptBfYrfIOlXVYIxkEuG+Hnz+FHVfsypIbSig/MNi78iOgtYg5AnzhVw15MoZS9mxSZK
	Dh1ja9bKGw7aLAuX7Lz9J5aElGomvy1KfTVo8NBHm3K7jqMKBLmtDLcTOlgLs4goBYcP
	HrBc2cLPYITTYEbenKfYJEOIWZLQuKsu/pAQw97rnyREfubt+FWVJ133LGaSVreVcBo1
	vGew==
X-Gm-Message-State: APjAAAUX87vb+LB4vW/L9u6G01wXghOCKeOZTr08U77baavK5lheIo8y
	uwHp2l4/3ZYYjWUCgeIMdRA=
X-Google-Smtp-Source: APXvYqya7qBZxK7zw19pl3XeZrKVvWIu4NDHkjNd/kbcehaMy0IfYFth+t/nH1kGvIeSMPbgrLjwRw==
X-Received: by 2002:a37:6794:: with SMTP id b142mr166566qkc.399.1581025904447; 
	Thu, 06 Feb 2020 13:51:44 -0800 (PST)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	d197sm321025qkc.16.2020.02.06.13.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Feb 2020 13:51:43 -0800 (PST)
Date: Thu, 6 Feb 2020 16:51:41 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20200206215141.GA40464@linux-uys3>
References: <20200205203053.6742-1-twoerner@gmail.com>
	<20200205210707.c4eqrvbyl7tl3knt@jama>
	<20200205230236.GA18868@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20200205230236.GA18868@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mpv: 0.26.0 -> 0.32.0
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
X-List-Received-Date: Thu, 06 Feb 2020 21:51:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2020-02-05 @ 06:02:36 PM, Trevor Woerner wrote:
> On Wed 2020-02-05 @ 10:07:07 PM, Martin Jansa wrote:
> > Also was this sent with -M?

-M2 works better, I'll use that for v2

