Return-Path: <anatol.oe@belski.net>
Received: from h1123647.serverkompetenz.net (klapt.com [85.214.73.107])
	by mail.openembedded.org (Postfix) with ESMTP id A9F107EF26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:56:25 +0000 (UTC)
Received: by h1123647.serverkompetenz.net (Postfix, from userid 1006)
	id 5D42417A05D5; Sun, 21 Jul 2019 18:56:26 +0200 (CEST)
Received: from fringe.fritz.box (i5387DFE8.versanet.de [83.135.223.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by h1123647.serverkompetenz.net (Postfix) with ESMTPSA id D96A117A05A3; 
	Sun, 21 Jul 2019 18:56:23 +0200 (CEST)
Message-ID: <373454f47290e76a883ef1e5ffa5bf9b3b0e06fe.camel@belski.net>
From: Anatol Belski <anatol.oe@belski.net>
To: Khem Raj <raj.khem@gmail.com>, Anatol Belski <anbelski@microsoft.com>, 
	openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 18:56:21 +0200
In-Reply-To: <497ba06b-0113-3430-f9be-8d80a6ed6fde@gmail.com>
References: <20190721013327.27634-1-anbelski@microsoft.com>
	<497ba06b-0113-3430-f9be-8d80a6ed6fde@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] Finer gperftools packaging
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
X-List-Received-Date: Sun, 21 Jul 2019 16:56:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-07-20 at 19:17 -0700, Khem Raj wrote:
> > +EXTRA_OECONF_append += " --enable-static"
> > +
> 
> why do we need this ?
> 
Overseen this. This is needed, because for some reason static libraries
was not produced on ARM64 by default, while they was on AMD64. I'll put
a comment for this line.

Thanks

Anatol


