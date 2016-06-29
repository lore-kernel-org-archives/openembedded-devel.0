Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id E367160043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 11:41:28 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id v6so6001841vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=wNGYn2WculFxLlQo1jvDNmnmKq6oKYdu5KM2yqHzXTQ=;
	b=daGZRPpD3v0PmCjbZKq2XMpyXhVsxzKP40h4/xVTVxwjESmreCXDUjLlnVUvVJkpJ3
	BMJT2fzbACSX9rRwcpJRG4+v2b8G8Ug2/lmw0lUJQu9059r8Xt8/8tx0cFnDsa/8X7zk
	AT2NZ4OoYWN4ida+wgJqIV7SXygbZT/BzWalp7ixofwGMvVqBhXCyv5Is6kCjbS9yLf2
	xA1VxtwMGSnRuuXyVH8A54uvo6f+3Fq2QnxODc+9GZvwIRlYsPeyL+GYTP8tbJ2frt8o
	RPcU9/qBhd/E2zCe7T4dg2hh0lOtoRoT4W4mcSRNbDgYkkaSvZE2HKqS51gBlorjUcpB
	rjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=wNGYn2WculFxLlQo1jvDNmnmKq6oKYdu5KM2yqHzXTQ=;
	b=g0M4FaFRW291SKTMwVP79q9tPjKtaqL+mqNrhZZTcNEJQkuUs/P7kWcdVmfl0Rshi4
	H/KrzSb+jpm4CARu4fYRW2V9i2n36DQRoTMfH8CcRqhm3bllJdpZn1sqhfF1j2XbnJE2
	Y2LgKlq7glhWDOUKLgthyn7+DR6A3l+8cgmrBJVIQEgYazCN5yWhko2/tW8ax8cAtHgI
	VFI3eZIxT4cDl8rqPrcPv+FbEV8ehyZzxO9oeXDxYbbpRh1hrRG3Qksl/q8faskrA54m
	FXoxya0fFeA7y+r+zRU6lRYw9k6W1OuKDL5gBUe1oC+Jvx+K51d39yIGB/87HQ9mLQUd
	CAZA==
X-Gm-Message-State: ALyK8tJRpzqdHbODezqQADrAcVvuKtS8N+RX44zUNJh+6zNUsNUGnEHJx5lNeo0XAX3KVA==
X-Received: by 10.31.169.85 with SMTP id s82mr3239411vke.95.1467200488603;
	Wed, 29 Jun 2016 04:41:28 -0700 (PDT)
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com.
	[209.85.213.54])
	by smtp.gmail.com with ESMTPSA id 73sm509735uau.2.2016.06.29.04.41.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jun 2016 04:41:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f54.google.com with SMTP id c2so62005172vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2016 04:41:26 -0700 (PDT)
X-Received: by 10.176.0.238 with SMTP id 101mr2953149uaj.107.1467200486721;
	Wed, 29 Jun 2016 04:41:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Wed, 29 Jun 2016 04:41:26 -0700 (PDT)
In-Reply-To: <20160629092402.GA2558@jama>
References: <64fedf2a-0ac7-1c88-fb2e-132ad5cd5690@siemens.com>
	<20160629092402.GA2558@jama>
Date: Wed, 29 Jun 2016 08:41:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqSYd=u43i2t8QXaU-oKaBxHyGzfGv=CWnA=nELY_a6cg@mail.gmail.com>
Message-ID: <CAP9ODKqSYd=u43i2t8QXaU-oKaBxHyGzfGv=CWnA=nELY_a6cg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Update master to Qt 5.7 release
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
X-List-Received-Date: Wed, 29 Jun 2016 11:41:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 29, 2016 at 6:24 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
...
> Otavio said he will be working on next upgrade, I haven't seen any patch
> yet, but maybe there is some wip on his side.
...

I did not get to it yet; if you, Pascal, have some spare time for the
next couple of weeks - perfect! :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

