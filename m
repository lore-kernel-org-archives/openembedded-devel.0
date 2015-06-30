Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 49F9375C0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 10:16:10 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so2650160qkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9/AimJyFTD3vsdbsP7+eEwlR/ye9qpbEzEeIOfrXI/Q=;
	b=HYSe6zrY3JXdErkNuKQi0r2A0isz65B0vQk7GwUf6fqbP3CnRltwLfOv/XKFOfWN+H
	xSb6NKpvT01CaS1pS7J5HbBgg9dlcXqlYxpbTBcsNumj7ii3bj+O6xnxemFk/MiiINAn
	ZR1yWH52LY4AxVGPoZTwj6oyo6Wnhiq3Q3pQ09Qf9FpZuUutdAGYq/My5PzNg+46qp8B
	98nNXURZBXfrdlQ6MuIzJUcy10PBu/mlVVq0+xQvqwTFjyeX3iLH236gZ3x3s+Or2znJ
	v8cql6t08DYBr6t/WDNLhOJp+pqPDzxsX8pn7+eO7OY2JM7tVJ+xCz4w08y38PlSMg6L
	f3WA==
X-Gm-Message-State: ALoCoQlF0Sp/9jPaacGGZqTzswBcSR93d+mXbI7sEN+5VuLiM1xMnac84HYRDZHukw2cSB8k1mgv
X-Received: by 10.55.18.197 with SMTP id 66mr22941607qks.13.1435659371616;
	Tue, 30 Jun 2015 03:16:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 03:15:52 -0700 (PDT)
In-Reply-To: <mmtpa9$67d$1@ger.gmane.org>
References: <5591E548.8090706@gmail.com>
	<CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
	<mmtpa9$67d$1@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 11:15:52 +0100
Message-ID: <CAJTo0LaUtsGYH99Dqr2zyWB38HeM5w-K6Jw0q2VFUQMrwFC6rQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 10:16:12 -0000
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 10:59, Koen Kooi <koen@dominion.thruhere.net> wrote:

> CMake Error at CMakeLists.txt:86 (PROJECT):
> |   The CMAKE_C_COMPILER:
> |
> |     gcc
> |
> |   is not a full path and was not found in the PATH.
>

I'm definitely not the cmake maintainer and barely understand cmake files,
but the new release needs that to be a full path and not a filename.  The
recipe/class does this (as demonstrated by it working in
oe-core/meta-multimedia) so does the mariadb recipe do something else or
use a different class?

Ross

