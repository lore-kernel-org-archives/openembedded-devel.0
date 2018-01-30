Return-Path: <cshored@thecshore.com>
X-Greylist: delayed 343 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Jan 2018 01:43:51 UTC
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id B06B578858
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 01:43:51 +0000 (UTC)
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id D6A592677
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:38:08 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com D6A592677
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com D6A592677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517276289;
	bh=K6rgTUfG/ezYYWw8rHXMltW+EZfJ8HAPH0M6L2i3bjQ=;
	h=To:From:Subject:Date:From;
	b=MZ3MEzwU68iRBI7sV/8aTxvjXqxRVmR1SSg/6OJUXGucU2755arSiUFHWlSmiAQje
	1Unlqh+7TXUSjzOWuG810KaG6CfWNVokDmNXir9AsaTlEhPob5dNZdTkr2XJECbcZW
	yRiOl9cHlxmVOW2DIlRZ7S0dDG4JFESnkiBEgb+Q=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
To: Openembedded-devel@lists.openembedded.org
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <4e5a0f53-a5eb-a4d4-2030-d7580d16bac3@thecshore.com>
Date: Mon, 29 Jan 2018 20:38:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
Subject: Per-binary-package LICENSE? and/or dependent on PACKAGECONFIG?
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
X-List-Received-Date: Tue, 30 Jan 2018 01:43:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Hi all,

I have a question about packages which by default don't ship e.g. LGPL 
code in their binaries, but if a configure option is turned on then the 
package generates examples / test programs that are LGPL (in this case 
due to a shell script from shunit2).

How can you define the LICENSE so that it's correct in each case?

Is it possible to do e.g. LICENSE_ LICENSE_${PN}-examples, etc?

What about making LICENSE contents conditional on PACKAGECONFIG
(for if the offending examples are built)?

Or is it best to not just build the examples and not worry about the 
LGPL source code that's not in the output packages?

Also, I'm planning on a two patches for this package (libubox in 
meta-oe/recipes-devtools); one which corrects the LICENSE (it's actually 
BSD-1-Clause&BSD-3-Clause for the shipped binaries), and another which 
updates to the latest stable release from upstream.  Since this is a new 
ABI version/SOVERSION, should this be built as a separate recipe that 
can exists alongside the older version?  (Not that there are likely many 
users of this library yet; it really is primarily useful for the work 
I'm doing on munging Openwrt packages like procd and netifd which depend 
on ubus and libubox so they are useful outside Openwrt.

In particular I'm interested in procd as a tiny init with 
process-handling (e.g. rewspawn, hotplug, network, and config change 
triggers).

IIRC < 100K for procd stack vs. some # of MB's for systemd (not 
including network).

The real question is whether there is any *modern* *Linux* embedded 
hardware where that's a big deal.  Obviously old routers with 8MB flash 
and 128 MB RAM it matters, but I'm have no insight into how common that 
size of hardware is in any new development.

If not much, then a better road for me would be to deal with UX for 
headless (e.g. network/web) systemd builds.

Regards,

Daniel

