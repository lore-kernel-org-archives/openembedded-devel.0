Return-Path: <victorascroft@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB996013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jul 2016 04:04:32 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id c2so2356437pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2016 21:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Qb2V6ViFDCmqz8Bd/ozBGH3+16LXz4mkywMgkaIdLyo=;
	b=jbK2rGVlP613FtzpWcvwrLi0b8q8hfX2rfnApeYf8nsdgeE5blhuXXMICDTS/Z7UZf
	X40HzoLr2eUKkqx/4lBxd9Ygp+q4vSrz1YdGVS3Q2sgmSaBQF2xuUNOrd/qUA7p5KeI1
	KSOHfJE1dR9Q0VlISfmyc9Jcz9CJLguKd7/2nVyqieXo0eH6Y9yfuT4QDohp34dvECJ4
	Hv+eJOaJE5tF03HIJ2O3VmIecrKdywzgRg2L0He2d/HaRMPG2KgICpzgCUzIE4gf2ZGn
	tRTnYjp5oSFPT3en6p4TDF7lC0cY6uP9MHJM0hp9BP2RfOeH9+GoyL37RAbNMhfnu4Xf
	T9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Qb2V6ViFDCmqz8Bd/ozBGH3+16LXz4mkywMgkaIdLyo=;
	b=XBxaS2oAfJXLqkruRRqbnf+AMCKrWu/ZndfhmgKtM5fk5lRGzkOCtdZAtQ3ya6q9gI
	+ZeS29ZmmKZIdb9VvbXs4OuVWAE0tw1bUQN8PI6PPor74fQQXPfYHdUVrUEHE/DxIeqH
	FQng8FtFAX02euQ/WqUqsosYWLLb1FdU+L3C10Zy+vKj46uHv1K8OP1tqiOVpiIha1my
	OBIlNFIuwbtRVOyrXJEEu5Dqec5ulLUtigRiDrdnGeGzqQtiO9PpiYnDih0d0O75bkIu
	CuNvOcg2Dh+TtMsGKH0f5amo4HjOH3s2dvWRK04Yh+cvE8W6P9jXtna4RJz5HUuS9z/y
	9BIA==
X-Gm-Message-State: ALyK8tKdC1LzxSrc5pj5Yi5f0CcnTA+os+n8qNrj37Pvd/5csc95GusUGvDZSwN1kRo7pw==
X-Received: by 10.98.10.25 with SMTP id s25mr1563072pfi.44.1467864273164;
	Wed, 06 Jul 2016 21:04:33 -0700 (PDT)
Received: from localhost ([115.115.243.34])
	by smtp.gmail.com with ESMTPSA id e14sm135332pfb.89.2016.07.06.21.04.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Jul 2016 21:04:32 -0700 (PDT)
Date: Thu, 7 Jul 2016 09:27:14 +0530
From: victorascroft@gmail.com
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160707035714.GA2617@Sanchayan-Arch.localdomain>
References: <20160701182008.GA20145@Sanchayan-Arch.localdomain>
MIME-Version: 1.0
In-Reply-To: <20160701182008.GA20145@Sanchayan-Arch.localdomain>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: Building php with postgres support
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
X-List-Received-Date: Thu, 07 Jul 2016 04:04:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

Ping?

On 16-07-01 23:50:08, victorascroft@gmail.com wrote:
> Hello,
> 
> I want to build php with postgres support. Am using the jethro
> branch. Looking at the php.inc file
> 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/php/php.inc?h=jethro
> 
> postgres doesn't seem to be enabled by default.
> 
> Tried enabling postgres by adding the following to EXTRA_OECONF
> 
> --with-pgsql=${STAGING_DIR_TARGET}${exec_prefix}
> 
> based on the PKGCONFIG defined in that file later but that does not
> seem to work.
> 
> Checking phpinfo does not show postgres support enabled.
> 
> What would be the required change to php.inc file for enabling
> postgres with php?
> 
> Regards,
> Victor.

