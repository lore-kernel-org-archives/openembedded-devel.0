Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id BE55376E70
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 14:06:38 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 23EBBF811D7; Thu,  5 Nov 2015 07:06:38 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 84708F811D7;
	Thu,  5 Nov 2015 07:06:38 -0700 (MST)
To: openembedded-devel@lists.openembedded.org
References: <563B6051.2080501@mlbassoc.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <563B62BE.4020002@mlbassoc.com>
Date: Thu, 5 Nov 2015 07:07:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <563B6051.2080501@mlbassoc.com>
Subject: Re: [meta-oracle-java] Problems building recipe
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
X-List-Received-Date: Thu, 05 Nov 2015 14:06:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-11-05 06:57, Gary Thomas wrote:
> I have problems building oracle-jse-jre from this layer:
>    meta-oracle-java  = "master:769b95d088fa4ead41939c9bcb8475438d0fe449"
>
> ERROR: Fetcher failure for URL: 'http://download.oracle.com/otn/java/ejre/7u60-b19/ejre-7u60-fcs-b19-linux-arm-vfp-hflt-client_headless-07_may_2014.tar.gz'. Checksum mismatch!
> File: '/local/p0382-cutting-edge_2014-11-21/downloads/ejre-7u60-fcs-b19-linux-arm-vfp-hflt-client_headless-07_may_2014.tar.gz' has md5 checksum b72400960629e7403c4b579dada2a804
> when b9b8f598b0a7f49e4d221f16ba25c6c0 was expected
> File: '/local/p0382-cutting-edge_2014-11-21/downloads/ejre-7u60-fcs-b19-linux-arm-vfp-hflt-client_headless-07_may_2014.tar.gz' has sha256 checksum
> c4a64be693e0e27ca95ffe3036c56156e3d75e07f620fd913308eb03cdf86779 when ed061060011d88efe5563c2949c00993db85db17ab94f18a78713007a2b90faf was expected
> If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
> SRC_URI[md5sum] = "b72400960629e7403c4b579dada2a804"
> SRC_URI[sha256sum] = "c4a64be693e0e27ca95ffe3036c56156e3d75e07f620fd913308eb03cdf86779"
> Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
>
> My target is i.MX6 (arm-amltd-linux-gnueabi)
>

Oops, I should have read more of the README.  I'm jumping
through the Oracle hoops to download this manually now.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

