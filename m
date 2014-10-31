Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 419 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Oct 2014 23:01:32 UTC
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id F2D7871F1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 23:01:32 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C6355F811E4; Fri, 31 Oct 2014 16:54:33 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id DD4E9F811E1;
	Fri, 31 Oct 2014 16:54:31 -0600 (MDT)
Message-ID: <5454132F.9080305@mlbassoc.com>
Date: Fri, 31 Oct 2014 16:54:39 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-browser] Problem building chromium
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
X-List-Received-Date: Fri, 31 Oct 2014 23:01:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I just tried to build chromium on the Raspberry-Pi.  All repos
are up to date as of 2014-10-31.  Here's the error I got:

| lib/libcontent.so: undefined reference to `WebRtc_GetCPUFeaturesARM'
| collect2: error: ld returned 1 exit status
| ninja: build stopped: subcommand failed.
| WARNING: /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/temp/run.do_compile.10091:1 exit 1 from
|   ninja -C /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/chromium-38.0.2125.101/out/Release chrome chrome_sandbox
| ERROR: Function failed: do_compile (log file is located at 
/home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/temp/log.do_compile.10091)
ERROR: Task 592 (/home/local/poky-latest/meta-browser/recipes-browser/chromium/chromium_38.0.2125.101.bb, do_compile) failed with exit code '1'

Note: I was able to build this same recipe just fine for my
i.MX6 platforms, so it must be something to do with armv6 vs
armv7a/cortex.  I've not found it yet but thought someone might
have ideas.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

