Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.1226.1588743849816608102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 22:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=gVXQbHwY;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588743849; x=1620279849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o1Xx3jl+H4wgVGJbYW0t3HdkuMDux1Dmj0XwfCB9byk=;
  b=gVXQbHwY54+O4rJTZtjOGOUckOG9cAlSoVqLRHkgKY+GOJDGKSnT/Ww1
   egA9EQbrt7zBI9zdWvZDy0sf+N5nfBoxhfykKXj4/oMepOsPKXAqqzuly
   wpO8kank+MMCIkD3Jj97mUP1lwjtLnpIzd4TfxbFrqrM7r+bYOElzHwIk
   tqHJeMJy5moXSZMXN6Yu+DZ9L+Ku8fCBPWFb4UbU/yMcl6OjHuLkXhDFO
   XR+p8NCmRsZfS4Bl9w9LSGYGBrzgHWx+HksoLDkPfyFSe0vWEbpN5qCL1
   I5Z95pyebpyd8ERqAG4UoKvv75FvWLmGiQ/Uf8mmun8mNYAOUzlghWyno
   A==;
IronPort-SDR: h56XRC80PdIl8hzLPwqT1qmTG0YUxdCwlT4gdntV3w0BoCdorpNnsyK2auySq8gnc3s4was+qn
 HzOUqz0/aGq/jR+fVeK4tsJ04VKohHISopSfMV4PsI8D4tMaTWx9RA2EgueR/poGEx8IdumUiL
 EPHljPJ5XmoMjFy94887B7iAOiDZOwLiON1kqiI/1osB/tkGINrfnnFqCa7obNcjurQqjxOpdz
 ErfH3o0lH7W/adCf7vo9mj7ZZh8I6m69uxWIUmYT60oP4CFKpE9teuHLSqRIaJfFEidZBDQAey
 aOw=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="2575416"
Date: Wed, 6 May 2020 07:44:07 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jacob Kroon <jacob.kroon@gmail.com>
Subject: Re: [meta-java][PATCH 1/2] openjdk-8: require GCC >= v6
Message-ID: <20200506054407.GB250994@pcleri>
References: <20200506053312.251699-1-richard.leitner@skidata.com>
MIME-Version: 1.0
In-Reply-To: <20200506053312.251699-1-richard.leitner@skidata.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This series was applied to master-next and will be merged to master
after some testing.

regards;rl

On Wed, May 06, 2020 at 07:33:11AM +0200, Richard Leitner wrote:
> As nobody should use older versions of GCC anymore this patch drops all
> version dependent workarounds and requiers host gcc >=6 for building
> openjdk-8.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Tested-by: Jacob Kroon <jacob.kroon@gmail.com>
