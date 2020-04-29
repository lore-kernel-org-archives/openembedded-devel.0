Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.266.1588165356044971578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 06:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=o8+ivbjv;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=381e85789=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588165354; x=1619701354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPC8BgRrkHDyjkHF9+UaqaDJlQSFXlOFGKi3DUUxouw=;
  b=o8+ivbjvbGZVdT9Zh/yU+itOcpe/Bnu02TYb4SZ/G+69erKRhNfBVs7B
   4j2z3Sjgn9v5GsLoUGzIlACcCkszmZ+HjA7ouWCObYpKrxQo8MKqx/7ZI
   DlTkKsZPyo9S5X83Unq1OkudCtd1cjjSfvsVqaqfJb/CNK4cnt2cWCEww
   sdrgzCHUNNdRQfNKl8W0DGc3Lix0dWQNlNz09oORtjOfiWjomE6lfXqgb
   n2RLRz9Ah71MWFZTtly6fS/eKgGAuqBcnN8YqcVC5UpS2t2A5XDDZojf4
   vWfV4FPwYfgjfgLeg1e+CD5OczBHjqChcYwRzxHbYzPUi15lYQXCIeP7R
   w==;
IronPort-SDR: F6BgTewZmT7uPeTfFClrKvlbXKvyi0jY7x+itE1NaFhPTDJBojeBgYwHwDg758C7eK52ats7US
 0QQaLmpS9xSET0JfXs3LQ9wmjAhgmDmZVi5nQnLeaM3ccOy/H+GN+8EthtJhVstkNqKEZnSJkD
 srllty5Y/fbEt/4Zbr+0WeWhkdFyQAVUdfzmIaOHmYmHrTEBkPhA1u95e99/9aLArINkNeAjVk
 PnRV/Jqad30+IkMHKzceavnymrUS0idC2+cYKfrxv9y2yg47Inkkca8+Xxjce4B+WC0rSn3Uan
 E+s=
X-IronPort-AV: E=Sophos;i="5.73,332,1583190000"; 
   d="scan'208";a="2572340"
Date: Wed, 29 Apr 2020 15:02:33 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: robert.berger.oe.devel <robert.berger.oe.devel@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, Robert Berger
	<robert.berger@reliableembeddedsystems.com>
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
Message-ID: <20200429130233.GB249641@pcleri>
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 29, 2020 at 02:41:20PM +0300, robert.berger.oe.devel wrote:
> On 29/04/2020 13:02, Richard Leitner wrote:

> > 
> > I pushed the "g0hl1n/jdk8-fix" branch to the meta-java git repository.
> > It is a temporary test branch and it should fix the GCC version
> > dependencies (as long as you have GCC >= v6).
> > 
> > It would be great if you could do a quick test and give me feedback ;-)
> 
> You mean that should work against dunfell?

Yes, the branch is for dunfell. Nonetheless it should be quite easy
to backport the following commits to other releases:

commit 49b1405 ("openjdk-8: remove -Werror")
commit e3d7bce ("openjdk-8: require GCC >= v6")
commit cc2e1b2 ("openjdk-8: update to latest ga version 252")

> 
> I will give it a try.

Great! Thanks.

> 
> ... for the archiver issue I think I might be able to figure out in Python
> who called the function and react accordingly. Will have a look at this as
> well as time permits.

Ok. Thank you.

regards;rl
