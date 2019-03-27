Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA17A7D03B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 20:18:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2RKHguV027148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 13:17:53 -0700
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 27 Mar 2019 13:17:32 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <829e1340-4709-3c80-9b68-92d3f67a42ea@windriver.com>
Date: Wed, 27 Mar 2019 16:17:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
X-Originating-IP: [172.25.44.10]
Subject: Where to commit packages that depend on meta-rust: stratis
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
X-List-Received-Date: Wed, 27 Mar 2019 20:18:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

For 2.8,
if a package depends on meta-rust can it be part of meta-openembedded?

Specifically, I'd like to add stratis, a filesystem mgmt tool to
meta-filesystems.


Here's some background and my current status.

From:   https://stratis-storage.github.io/
   Stratis is a Linux local storage management tool that aims
   to enable easy use of advanced storage features such as
   thin provisioning, snapshots, and pool-based management
   and monitoring.

I have it building and running some manual tests for qemux86-64.

So where does it belong for the 2.8 development timeline.
There have been suggestions that we'd merge rust into oe-core but
I'm not sure if anyone is intending to work on that early in 2.8.

Oh and the stratis-cli depends on some python recipes so I guess
I'll have to keep them in meta-filesystems rather than meta-python
as I have them now.
-- 
# Randy MacLeod
# Wind River Linux

