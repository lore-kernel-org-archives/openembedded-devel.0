Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB756BF88
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 22:55:32 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BB733F81201; Fri, 14 Mar 2014 16:55:33 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 19CE1F811EB;
	Fri, 14 Mar 2014 16:55:33 -0600 (MDT)
Message-ID: <532388EC.3040403@mlbassoc.com>
Date: Fri, 14 Mar 2014 16:55:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1394820299-22792-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1394820299-22792-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-browser][PATCH V2] chromium: Upgrade 29 -> 35
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
X-List-Received-Date: Fri, 14 Mar 2014 22:55:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2014-03-14 12:04, Khem Raj wrote:
> Removed already applied patches
> 
> License year changed thats why there is change in checksum
> 
> -// Copyright 2014 The Chromium Authors. All rights reserved.
> +// Copyright (c) 2013 The Chromium Authors. All rights reserved.
> 
> we see
> 
> rpm/bin/debugedit: canonicalization unexpectedly shrank by one character
> 
> so we add PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
> 
> Enable SUID sandbox
> 
> Install ICU configuration file which is required
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>

Build and run tested.  Seems to work fine.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

