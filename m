Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 34B927404E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:56:21 +0000 (UTC)
Received: by iofh134 with SMTP id h134so65184323iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=X2Qio3uIK8iIJbqel3EsnZehrcglfFKMkXdfIwg7g48=;
	b=udjaGQuSSnCqTUMqe+9h26D6z6B/CEnrJYQyakkejJktU4zlbKmp/iYJ+wDMcKTaRn
	+4+VSLUrLsop1kQqhTYSBQokCbVziTYEckRCzOea2wbWGxeXl7KF5t6LAAzM7aASOW7g
	cm7BcprI4m7gBmNsDQUgDNBEKV0oqMAl1F1MKUqw0mSogBPM6AOysOXAtNTuUWY6YC/O
	3ZPp34vbvJ1Voybqb75wYPGlTYuqZZ3852fQkpqgxmDuZJYlzLQeLYVD8JuIOkiJHQJu
	5nGj25TPA0Vps9Mq54/afTHvKtQTD2WbXHGhd8Dt9/OFoz0sCi2WyWUnwac9bLJ3m55n
	5+tw==
X-Received: by 10.107.137.106 with SMTP id l103mr41056312iod.112.1443070581444;
	Wed, 23 Sep 2015 21:56:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Wed, 23 Sep 2015 21:55:51 -0700 (PDT)
In-Reply-To: <1443047368-11176-1-git-send-email-andrea.adami@gmail.com>
References: <1443047368-11176-1-git-send-email-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Sep 2015 21:55:51 -0700
Message-ID: <CAMKF1srf0TeAhf_f0uNLOvr_Cyet9b5em-iiYrXygWPg+w6z4g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexecboot_0.6: fix build with gcc 5
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
X-List-Received-Date: Thu, 24 Sep 2015 04:56:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 3:29 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> +-inline void
> ++extern inline void

would it be better to make it static inline ?

