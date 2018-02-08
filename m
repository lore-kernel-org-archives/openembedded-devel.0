Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9767978448
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 19:55:48 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id g14so891139iob.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Feb 2018 11:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=f4N0r+5qMDvi2jo9QGIs3REiEBPhEuCpMIOO9i1mMcg=;
	b=qEd8mp30QPT4B+onkXcSx9Q7EO/tWBGj87pI/4z+cylXhUyT4+cxQQLguSBCno0WCX
	rv2+yQldzNAmvXN+ysxWASTtvjXYNc/u8/hGUgnSCJocqHL3STNfZ7AsGg0wwhzwLm1p
	O9XpHldxb6EKLTPlBJAAkEz7yBIIY79YnyiWSBJZJlKg9yp07NIpK1gmb8iyb0Yx12aG
	pn6fx5gXFKPJpChlQ1hTotwt2RnMOQ/G/b1PFaTwWAyzprzhPbgtTj5+aFS36bUUgchk
	oUWIRjSEjCxzTMUxIQ6KzamkqnIsUJiRioreCe8yr56VE2wZ53665bXbYMRWZ9H0qWPG
	ozaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=f4N0r+5qMDvi2jo9QGIs3REiEBPhEuCpMIOO9i1mMcg=;
	b=kAn6uKS8SMOkEMNPE8B+X8znVrxVgtI0V93FpkFYFGoga7qLaor7IrLPaZtF3xDXb/
	unL28JaqyUVR0yOKpDZ7awZ+mgqud4MbcydYw5wOH+TZpFRR/o2s48xjbC5inlNnNnqn
	X2362zZLuGzgOvgjdCxG8AXLMdBPQutME7ZtLb0SqKdriemid61vFrRmM3kBJ3Rsqb4q
	ZaA+OOR4vlaI/CCPmMeP2qI8xr1yNqALf15OMdvoPSsDwdmdLwAwbff1aLdu7Qk6jB4T
	Z0LAB/R4uX/aUq34+nhOWoauRUPHYLgSXP7t7Pzq4NpjPbnIrcApZVkxuxs9StSNUbBE
	tsqg==
X-Gm-Message-State: APf1xPCL6ATPYi6gugV0HKKVPuVVWnty5c6gcLElMoeWlX9w0eS9QQbv
	ULWFb3c8xntSpvuOlilOo7Q=
X-Google-Smtp-Source: AH8x226kZbOplpiXe3VPeDPO71TQj44rtSlqFy23s6JtIJ5DWC+LCKWmCAbkOwpblDc1aJZNaVOAxA==
X-Received: by 10.107.134.194 with SMTP id q63mr422061ioi.225.1518119749738;
	Thu, 08 Feb 2018 11:55:49 -0800 (PST)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id 17sm501977ioc.33.2018.02.08.11.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 11:55:48 -0800 (PST)
Date: Thu, 8 Feb 2018 14:55:43 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180208195543.GA29027@linux-uys3>
References: <bbc09ab4-1bc7-3120-5de5-0bf02636c629@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bbc09ab4-1bc7-3120-5de5-0bf02636c629@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: World builds
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
X-List-Received-Date: Thu, 08 Feb 2018 19:55:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Armin,

On Mon 2018-02-05 @ 08:19:56 AM, akuster808 wrote:
> There will be delays merging  changes into meta-openembedded.  One of
> our two build nodes has go off-line again. This the second time in a
> week it has happened.

Thanks for the update.

This makes me curious to know a bit more about how the world builds are done.
Can you give details about these nodes? What are they? Where are the hosted?
How pays their electricity?

> I am currently running basic world builds on my home system.

Is your home machine beefy enough? Is there a way to divide up the world build
so members of the community to volunteer to run some parts of the build?

Best regards,
	Trevor

