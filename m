Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 May 2019 09:31:44 UTC
Received: from smtp89.iad3b.emailsrvr.com (smtp89.iad3b.emailsrvr.com
	[146.20.161.89])
	by mail.openembedded.org (Postfix) with ESMTP id E3D107D3AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 09:31:44 +0000 (UTC)
Received: from smtp20.relay.iad3b.emailsrvr.com (localhost [127.0.0.1])
	by smtp20.relay.iad3b.emailsrvr.com (SMTP Server) with ESMTP id
	4E2E5A01D9 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 05:26:37 -0400 (EDT)
X-Auth-ID: scott@jumpnowtek.com
Received: by smtp20.relay.iad3b.emailsrvr.com (Authenticated sender:
	scott-AT-jumpnowtek.com) with ESMTPSA id 2F511A01CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 05:26:37 -0400 (EDT)
X-Sender-Id: scott@jumpnowtek.com
Received: from [192.168.10.4] (c-73-234-253-132.hsd1.me.comcast.net
	[73.234.253.132]) (using TLSv1.2 with cipher AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Tue, 14 May 2019 05:26:37 -0400
To: openembedded-devel@lists.openembedded.org
From: Scott Ellis <scott@jumpnowtek.com>
Message-ID: <41c04e88-4b89-6f1a-57a1-78bcbfcb562b@jumpnowtek.com>
Date: Tue, 14 May 2019 05:26:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Subject: [meta-openembedded] Wireguard broken with 5.1+ kernels
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
X-List-Received-Date: Tue, 14 May 2019 09:31:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This kernel commit removes nf_nat_core.h which breaks wireguard 20190123.

    commit d2c5c103b1337f590b7edf1509a6e294bdf22402
    Author: Florian Westphal <fw@strlen.de>
    Date:   Tue Feb 19 17:38:27 2019 +0100

        netfilter: nat: remove nf_nat_l3proto.h and nf_nat_core.h


Version 20190406 of wireguard fixes this.

Will a patch to upgrade the wireguard version on the warrior branch be
accepted?

