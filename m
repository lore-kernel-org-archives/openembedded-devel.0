Return-Path: <cshored@thecshore.com>
X-Greylist: delayed 333 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Jan 2018 02:11:38 UTC
Received: from smtp73.ord1c.emailsrvr.com (smtp73.ord1c.emailsrvr.com
	[108.166.43.73])
	by mail.openembedded.org (Postfix) with ESMTP id BA96C7842D
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 02:11:38 +0000 (UTC)
Received: from smtp18.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
	by smtp18.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id
	46447E0287; Sun, 21 Jan 2018 21:06:07 -0500 (EST)
X-Auth-ID: highvolume@thecshore.com
Received: by smtp18.relay.ord1c.emailsrvr.com (Authenticated sender:
	highvolume-AT-thecshore.com) with ESMTPSA id B129AE0249; 
	Sun, 21 Jan 2018 21:06:06 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thecshore.com;
	s=20170504; t=1516586767;
	bh=hkv/XPguF0VMIaL6+FLFrocKw6ic6bawVOO8T7a06ak=;
	h=From:Subject:To:Date:From;
	b=b2QWVHPuCijqYZ0omPhMV/lai3cd2Y6fA36EclpaLjLdbZL19c/3Xp4fUZjvR99Rq
	GdjIWBWARGRqb4jvYpIZOJ6fxEdUaQrjeKS49L9qyp/ktsrXX8w4b9bmTv0Tvz65mo
	y5N/ZkLQmKQaQ7gVCII6MAGoAxE8Z0Za2YoVdBT4=
X-Sender-Id: highvolume@thecshore.com
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Sun, 21 Jan 2018 21:06:07 -0500
From: "Daniel F. Dickinson" <cshored@thecshore.com>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <35308e99-f447-3e17-f652-be4f981c19fa@thecshore.com>
Date: Sun, 21 Jan 2018 21:06:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
Subject: [meta-openwrt] PV for git versions for 17.01.4 upstream release, git for master?
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
X-List-Received-Date: Mon, 22 Jan 2018 02:11:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Hi,

Wondering thoughts on using a package version with the git revisions of 
openwrt recipes that are in current stable (17.01.4) and using _git 
version for tracking upstream master?  Also in that case would it be 
necessary to use PREFERRED_VERSION for in e.g. openwrt.bbclass, or it a 
versioned recipe preferred to a git one, unless overridden?

Openwrt doesn't cut tarball releases of the sources that I am aware of, 
and only some of the code is on github; there's a lot at git.openwrt.org.

(Oh and for those not in the loop, Openwrt and LEDE have re-merged; for 
those really not in the loop Openwrt was forked into LEDE project for
a while).
--
https://www.thecshore.com

