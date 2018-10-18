Return-Path: <ftoth@telfort.nl>
Received: from radex-web.radex.nl (smtp.radex.nl [178.250.146.7])
	by mail.openembedded.org (Postfix) with ESMTP id CEB5D79B85
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 13:33:31 +0000 (UTC)
Received: from [192.168.1.22] (cust-178-250-146-69.breedbanddelft.nl
	[178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id B548924057
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:33:31 +0200 (CEST)
From: Ferry Toth <ftoth@telfort.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <baba8cff-5f3f-b6a4-efcd-377a43ba8096@telfort.nl>
Date: Thu, 18 Oct 2018 15:33:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Subject: libgpiod2 incorrectly depends on python3-core
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
X-List-Received-Date: Thu, 18 Oct 2018 13:33:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On master (to be 2.6): In recipe libgpiod_1.1.1 when enabling python3 
bindings the generated libgpiod2 package depends on python3-core. The 
result is when needing only libgpiod-tools in initramfs the whole of 
python3 is pulled in.

I believe this dependency to be incorrect, instead libgpiod-python 
should depend on python3-core.



