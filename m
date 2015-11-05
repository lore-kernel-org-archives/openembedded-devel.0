Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6339E75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:56:17 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 714C2F811D7; Thu,  5 Nov 2015 06:56:17 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL,TVD_SPACE_RATIO autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id DA70CF811D7;
	Thu,  5 Nov 2015 06:56:16 -0700 (MST)
To: openembedded-devel@lists.openembedded.org
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <563B6051.2080501@mlbassoc.com>
Date: Thu, 5 Nov 2015 06:57:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: [meta-oracle-java] Problems building recipe
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
X-List-Received-Date: Thu, 05 Nov 2015 13:56:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I have problems building oracle-jse-jre from this layer:
   meta-oracle-java  = "master:769b95d088fa4ead41939c9bcb8475438d0fe449"

ERROR: Fetcher failure for URL: 'http://download.oracle.com/otn/java/ejre/7u60-b19/ejre-7u60-fcs-b19-linux-arm-vfp-hflt-client_headless-07_may_2014.tar.gz'. Checksum mismatch!
File: '/local/p0382-cutting-edge_2014-11-21/downloads/ejre-7u60-fcs-b19-linux-arm-vfp-hflt-client_headless-07_may_2014.tar.gz' has md5 checksum b72400960629e7403c4b579dada2a804 
when b9b8f598b0a7f49e4d221f16ba25c6c0 was expected
File: '/local/p0382-cutting-edge_2014-11-21/downloads/ejre-7u60-fcs-b19-linux-arm-vfp-hflt-client_headless-07_may_2014.tar.gz' has sha256 checksum 
c4a64be693e0e27ca95ffe3036c56156e3d75e07f620fd913308eb03cdf86779 when ed061060011d88efe5563c2949c00993db85db17ab94f18a78713007a2b90faf was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "b72400960629e7403c4b579dada2a804"
SRC_URI[sha256sum] = "c4a64be693e0e27ca95ffe3036c56156e3d75e07f620fd913308eb03cdf86779"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.

My target is i.MX6 (arm-amltd-linux-gnueabi)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

