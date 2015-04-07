Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E14FA60043
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 13:56:31 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8C280F811DA; Tue,  7 Apr 2015 07:56:30 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 27E57F811D8;
	Tue,  7 Apr 2015 07:56:30 -0600 (MDT)
Message-ID: <5523E21B.5070100@mlbassoc.com>
Date: Tue, 07 Apr 2015 07:56:43 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Issues building vlc
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
X-List-Received-Date: Tue, 07 Apr 2015 13:56:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to build vlc and I get this error:
ERROR: Multiple .bb files are due to be built which each provide jpeg (/local/poky-cutting-edge/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb 
/local/poky-cutting-edge/meta/recipes-core/jpeg/jpeg_8d.bb).
  This usually means one provides something the other doesn't and should.

This comes from the fact that vlc depends on libjpeg-turbo
which conflicts with the main jpeg library in OE-core.

What's the best way to fix this?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

