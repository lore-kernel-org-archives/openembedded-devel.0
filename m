Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6A3713DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 19:11:05 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id i17so11122267qcy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 12:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=oR6QAk1Uy4epL8nRC4qR/69jDQq4gG77CZ14xD0dBeA=;
	b=akAqdmnt7TxE8Cic2qpA6Oo3fqtiGqGtCjyNRijex/JR0P1v9sRjRO/bKF7CWlAFWj
	SkdhdtnMMPSS6FKSqzJn8xOdwucB69Wn2Wzxs5+hkCjB/8iVsHlfY1nTruqYdDFTAHh3
	owdN/bn10A5xb9LOaVvKynxJbZzRb+N+U5PsWYEhpsYfX2TKjT7hTQY9brcQDp4YjsaX
	3MDy52ELRxnscL46eQBnLJ0yhxTqwSqubpswQhhecZCAvByq6XDGX/4dZv1BcxC57r7T
	oEbcT6vPROZQLRdbaW6dwWvXD3yxWyuvV4KUHeP30bL8Xni5SW8REeMbs1fEZMqwwZ/U
	xwfg==
X-Gm-Message-State: ALoCoQlgIyGkEZ9lcPeFuo7oWg/jtbn864okNs8+GiKQs5BcWlyH2xwdfsh7qyI3WPjFDnqV+ULp
X-Received: by 10.140.105.138 with SMTP id c10mr9800274qgf.15.1409857865035;
	Thu, 04 Sep 2014 12:11:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 12:10:44 -0700 (PDT)
In-Reply-To: <5408A766.5000605@balister.org>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<CAJTo0LYhvZHJEEQLWuCsfxqqbBCSXnxR3cxJZJt2Z0fgYgwEww@mail.gmail.com>
	<CALbNGRRVvT7Qv868RNWbo8_DjLwkbUjOH_cCNMjPNifFEcHu3g@mail.gmail.com>
	<5408A766.5000605@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 20:10:44 +0100
Message-ID: <CAJTo0Laq3M2RKLmSrp5j7uVK5tvdDfZC=OMhxXadugDrBdsh_w@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Style issue for recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 19:11:15 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 18:54, Philip Balister <philip@balister.org> wrote:
> The qwt recipe uses an include file and two bb files for qt versus
> qt-embedded builds. I do not know if this is wise, but it is a case not
> mentioned here.

That seems a perfectly legitimate use of an inc as it's factoring out
common code.

Ross

