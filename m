Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id B2B1A65C87
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Nov 2014 03:36:19 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id A3cF1p0060BVjqb013cFQM; Fri, 31 Oct 2014 20:36:16 -0700
Message-ID: <5454552E.3060806@pabigot.com>
Date: Fri, 31 Oct 2014 22:36:14 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5454132F.9080305@mlbassoc.com>
In-Reply-To: <5454132F.9080305@mlbassoc.com>
Subject: Re: [meta-browser] Problem building chromium
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
X-List-Received-Date: Sat, 01 Nov 2014 03:36:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2014 05:54 PM, Gary Thomas wrote:
> I just tried to build chromium on the Raspberry-Pi.  All repos
> are up to date as of 2014-10-31.  Here's the error I got:
>
> | lib/libcontent.so: undefined reference to `WebRtc_GetCPUFeaturesARM'
> | collect2: error: ld returned 1 exit status
> | ninja: build stopped: subcommand failed.
> | WARNING: 
> /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/temp/run.do_compile.10091:1 
> exit 1 from
> |   ninja -C 
> /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/chromium-38.0.2125.101/out/Release 
> chrome chrome_sandbox
> | ERROR: Function failed: do_compile (log file is located at 
> /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/temp/log.do_compile.10091)
> ERROR: Task 592 
> (/home/local/poky-latest/meta-browser/recipes-browser/chromium/chromium_38.0.2125.101.bb, 
> do_compile) failed with exit code '1'
>
> Note: I was able to build this same recipe just fine for my
> i.MX6 platforms, so it must be something to do with armv6 vs
> armv7a/cortex.  I've not found it yet but thought someone might
> have ideas.
>
> Thanks
>

As noted at 
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/096568.html 
and related messages, raspi configures (or at that time configured) gcc 
to build for armv6 but it's actually armv6zk.  It's entirely possible 
chromium doesn't support armv6 without armv6k features being enabled.  
My best guess is meta-raspberrypi needs to be fixed, which might require 
some enhancements in oe-core's gcc.

Peter

