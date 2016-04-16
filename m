Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C9CB5602D9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 06:29:20 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id B172D68A01A; Sat, 16 Apr 2016 07:29:19 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 0BE7D68A019;
	Sat, 16 Apr 2016 07:29:18 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 71E226740435;
	Sat, 16 Apr 2016 08:29:18 +0200 (CEST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5711DBBC.1070207@mlbassoc.com>
Date: Sat, 16 Apr 2016 08:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: [meta-browser] chromium issues
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
X-List-Received-Date: Sat, 16 Apr 2016 06:29:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm having some issues with chromium on my i.MX6Q target. Using Poky/Yocto
meta              = "master:20a0121b558b32179220e394a66cb90dc6ff3879"
meta-browser      = "master:a67a3461a135668dba573183f0f62fcd5dfb3121"
meta-fsl-arm      = "master:682b957545172a79cfb19108a9d0b61209f8671e"
meta-fsl-arm-extra = "master:39eb21c4c24a0be6d8277b566ebd52b657fbc2bb"

* When chromium starts, I get a message:
     "Google API keys are missing.  Some functionality of chromium will be disabled"
   This seems to only be related to speech - should I worry about it?

* Accessing any page via https yields an SSL error.  How do I fix it?
   Note: firefox built from same layer on this target works fine.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

