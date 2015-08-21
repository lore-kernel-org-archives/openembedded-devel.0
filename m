Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 84E6660557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:27:59 +0000 (UTC)
Received: by igxp17 with SMTP id p17so8348029igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Q/CD3QPztpSCJAhx9A8xK9H3AdIyGrpOc8UPZ/W/NF0=;
	b=QSTORdMOxKTc/yzMNzzm1J8Gqon671CeYw4g2MY9TmuQvY91gaj7QkSsnVsSMLrNF6
	ef32xQE16RszjXQtxXL/QsOE4hb8NzkKempDRPNqQD7KCeDQUXFNxs0UedcGTpibgqnJ
	ZNc1LTJvagTraqH1F4+eUzB30dpbL/+0mLYyIuqFXqH+usJvaNVqF5QdRZgciwIUZk5F
	Yis9RSpKVwcZ1I1aogcxrQo4OvQ04agcEjZFAtIe+txhCNDt4/wcETivwhfBbNkXxajF
	Tz7kUFN+b5ANQNW6BaKI8LZkbpDFRWAL2fxOjJBv40DTtZyr2+wFsUHjXKSJTPgoZXG1
	eKYA==
X-Received: by 10.50.30.196 with SMTP id u4mr1621552igh.11.1440142079488; Fri,
	21 Aug 2015 00:27:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 00:27:30 -0700 (PDT)
In-Reply-To: <cb06e085a8cd5f4a6251d8c0e4168c022fda564e.1440139197.git.yi.zhao@windriver.com>
References: <cover.1440139197.git.yi.zhao@windriver.com>
	<cb06e085a8cd5f4a6251d8c0e4168c022fda564e.1440139197.git.yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 00:27:30 -0700
Message-ID: <CAMKF1sp4FKaBu33oYCLX9MZ6+URBtJL_UB_wALMHrO8xJ8USLQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/8] tomoyo-tools: pass correct libdir to make
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
X-List-Received-Date: Fri, 21 Aug 2015 07:27:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 11:46 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
> -CFLAGS_append += "-D_GNU_SOURCE"
> +

why was CFLAGS append removed ?

> +EXTRA_OEMAKE = "-e USRLIBDIR=${libdir}"

