Return-Path: <ulf@emagii.com>
Received: from mxf5.bahnhof.se (mxf5.bahnhof.se [213.80.101.29])
	by mail.openembedded.org (Postfix) with ESMTP id 07B5B758DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 11:53:20 +0000 (UTC)
Received: from localhost (mxf5.local [127.0.0.1])
	by mxf5-reinject (Postfix) with ESMTP id 33B5D9CDAD3;
	Wed, 30 Sep 2015 13:53:18 +0200 (CEST)
X-Virus-Scanned: by amavisd-new using ClamAV at bahnhof.se (MXF1)
X-Spam-Score: 0.306
X-Spam-Level: 
X-Spam-Status: No, score=0.306 tagged_above=-99 required=5
	tests=[DNS_FROM_AHBL_RHSBL=0.306]
Received: from mxf5.bahnhof.se ([127.0.0.1])
	by localhost (mxf5.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqVfhcn5ClRR; Wed, 30 Sep 2015 13:53:10 +0200 (CEST)
Received: from smtp-auth1.bahnhof.se (smtp-auth.bahnhof.se [213.136.33.6])
	by mxf5.bahnhof.se (Postfix) with ESMTP id 351D39CDAD8;
	Wed, 30 Sep 2015 13:53:10 +0200 (CEST)
Received: from [10.175.196.237] (h-169-62.a454.priv.bahnhof.se [37.123.169.62])
	(Authenticated sender: mb782575)
	by smtp-auth1.bahnhof.se (Postfix) with ESMTPA id D8E1928440;
	Wed, 30 Sep 2015 13:53:09 +0200 (CEST)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Khem Raj <raj.khem@gmail.com>
References: <1443601616-25650-1-git-send-email-ulf@emagii.com>
	<1443601616-25650-2-git-send-email-ulf@emagii.com>
	<CAMKF1spL0-FpdJVNrPjDQNfrGzHztqUqCjeHR2YBtRbvBSH=Ag@mail.gmail.com>
	<3684850.Dr1EhiOegx@peggleto-mobl.ger.corp.intel.com>
From: Ulf Samuelsson <ulf@emagii.com>
Message-ID: <560BCD24.7090403@emagii.com>
Date: Wed, 30 Sep 2015 13:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <3684850.Dr1EhiOegx@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Wed, 30 Sep 2015 11:53:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


There is no GFDLv1.1 file in the license directory
----------------------------------------------------------------------------------
openembedded-core/meta/files/common-licenses$ ls GFDL*

GFDL-1.1  GFDL-1.2  GFDL-1.3
----------------------------------------------------------------------------------

It does not make sense to have a duplicate file.

Incidently, the GFDL-1.1 file contains the GFDL-1.2 license, not the 1.1 
license.

/Ulf

Den 2015-09-30 kl. 13:05, skrev Paul Eggleton:
> On Wednesday 30 September 2015 03:10:56 Khem Raj wrote:
>> On Wed, Sep 30, 2015 at 1:26 AM, Ulf Samuelsson <ulf@emagii.com> wrote:
>>> -LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
>>> +LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
>> IIRC both are correct
> I don't think we have an SPDXLICENSEMAP entry for this though, so it won't be
> being mapped (unlike GPLv2 -> GPL-2.0).
>
> Cheers,
> Paul
>


