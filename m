Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E3B367FA18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:40:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47n5nM3KW4zRj;
	Tue, 31 Dec 2019 08:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577778039;
	bh=Q9SEthOmSDPMo5yOjD05ALo2FFQXn20Casa87W39B7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YjD4QpfHqIh0ze7M4TvX5HQ5VJQ4UwMIqZ8nAXlMXr64IWceW+6NzZZGZ3JPIoIRx
	pzqp1bF9cI+8E0MAGQVLH4e1MMP0nmQWtui7534b1U/iyUkDdDQ2i5ni7PdkP7rfC2
	rR4SiElN4yoHKiTzeMl5E78LVqeUd0yu0Or8Foc414RSfa2UMU+rmnN9GAbHigNfIQ
	EqzXKjCSi5EHXRPrA1wmox0GkR/oBPwW5taXWlFPzE60tDNkgdkN1cwZDu3ko04osP
	pbn95EsuJ5B2+DIKyBk2bEAgGExkrv4/n/mwZt6oNAykHdQmn6Lz6eqBTS/7RgU06J
	1e7wndMif2rWIqYDrk0wBJs9VgF95QegFSXvktIH28SZ1vSyiKpBQs+a+Md5erKfGS
	Kio/f/1dRb9yYKYeG/8UDvQCbgNUX9jGX5qXeDzA1iC0ubzvLfgq0IUq2RnEbi5UVO
	iemsjuNogrTsv7AWmaiY+1uh2HgsGJ1xZNpSWJagpF4k6BDPyzG2zHUABRdga/N92A
	IKacVhOIatQVyHEcL/QaIE9yXqNueI3UUUfWqyYJNPLQIE1wKny1BtZqFpRGbbgBBR
	V0kh5bq2ntAX/cIGbGhoZYNMbjTEz1xRbWve+YwMsQ/qFQe46xJT4IbVthZ43NQKFp
	5S+YNKdZ+8mHF/M7Ay5sFX2c=
Date: Tue, 31 Dec 2019 09:40:37 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191231074037.GC934@localhost>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
	<20191231010652.3206534-6-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191231010652.3206534-6-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 7/8] upm: Disable -Wno-misleading-indentation with clang10+
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
X-List-Received-Date: Tue, 31 Dec 2019 07:40:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 30, 2019 at 05:06:51PM -0800, Khem Raj wrote:
>...
> ++# clang-10 added  -Wmisleading-indentation as well, skipp it too
> ++if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "9")
> ++  list (APPEND C_CXX_WARNING_FLAGS -Wno-misleading-indentation)
> ++endif ()
> ++
> + # Warnings as errors?
> + if (WERROR)
> +   list (APPEND C_CXX_WARNING_FLAGS -Werror)
>...

Would disabling WERROR solve this and future similar problems?

cu
Adrian

