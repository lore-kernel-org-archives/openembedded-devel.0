Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UDHRp-0004eL-39
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 17:44:09 +0100
Received: by mail-ie0-f171.google.com with SMTP id 10so9702817ied.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2013 08:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=KUIOcLNj4V5Gr8buGZnDAOeJxPJQxEKu5jUeSxmj6cY=;
	b=G1UYGZTwjIrDEXwlH2baY7rv/6bekX5dW36K0QUPmfVFROpbu9G1cCuSK99xdS3YLE
	p6DSD6c6n7Xc+vjqeG4BLl8tyQroPQb6iLGoAQgpkvpeMZaTMLwu2aTTAI0GmzOXwYHQ
	GKkFr+ub9vXJRyEVNTyVLO/3poOaCfecUIZpwadQA6Lkr9jbYevNcku+j5jT/had/z+W
	fTHq18dBwvy1+1SHZW4zgTPLfQL/mU6PxwHF7En/YJBCTr6vMYYV7aUj5jHC2Ws0BwA5
	sCn1dumsWcVDE/mR7vH/hkT13DjbqFXEGEwi1ZZE5RbXwqwKLxAq0E7XaT0GsZ9WUjs7
	+dgw==
X-Received: by 10.42.145.137 with SMTP id f9mr31797331icv.52.1362587257733;
	Wed, 06 Mar 2013 08:27:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Wed, 6 Mar 2013 08:27:06 -0800 (PST)
In-Reply-To: <5137513C.4020007@windriver.com>
References: <1360834325-22890-1-git-send-email-florin.sarbu@windriver.com>
	<1360834325-22890-2-git-send-email-florin.sarbu@windriver.com>
	<20130214094445.GJ3300@jama> <5136F265.1080603@windriver.com>
	<20130306080035.GB32228@jama.dyndns-home.com>
	<5136F879.3050808@windriver.com> <5137513C.4020007@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2013 08:27:06 -0800
Message-ID: <CAMKF1sp3R7Phs5RvG=rv5ftzHF65Q-W7YgK4zf-d_e1R-+Orqw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-systemd][] rpcbind: Add ${PN}-systemd to PACKAGES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 16:44:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 6, 2013 at 6:22 AM, Florin Sarbu <florin.sarbu@windriver.com> wrote:
> So no plans to remove the systemd support from meta-openembedded now that
> poky has a systemd.bbclass merged in? My feeling is that this adds unneeded
> overhead now.

There are outstanding issues that needs to be addressed. We are trying
hard to merge systemd class such that
we dont have to keep another copy


