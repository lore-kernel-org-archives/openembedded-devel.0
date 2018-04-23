Return-Path: <cshored@thecshore.com>
X-Greylist: delayed 586 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 23 Apr 2018 04:02:30 UTC
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 735EE6E688
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2018 04:02:30 +0000 (UTC)
Received: from [10.137.0.15] (107-179-160-78.cpe.teksavvy.com [107.179.160.78])
	by mail.thecshore.com (Postfix) with ESMTPSA id 340822696
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 23:52:45 -0400 (EDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 340822696
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 340822696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1524455565;
	bh=SMWH+LWSKFCO39at6vypZCO6go6lQmzfNHJHRM2BJYc=;
	h=To:From:Subject:Date:From;
	b=G8umTpeQuFwT9A5Vw1i3OvotANepVV8b8sJ9kA+79NcNNT5nOc55gYa+ev987JNgG
	k2pd3Zpq+pBUK3phqG7fsrpDcdT8qLPFIHypXGQOIAuXhp6tMMbLKTcVdJJXmqCp2V
	Mcia6LZFrNrtlS8CJksZeFPJthVd6Z3x5OZ+44Bk=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.4 at mail.thecshore.com
To: Openembedded-devel@lists.openembedded.org
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <87699f95-edc2-c7bf-0e19-5ba2ef68d654@thecshore.com>
Date: Sun, 22 Apr 2018 23:52:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
Subject: [meta-xvisor] Working on layer to build Xvisor and guests
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
X-List-Received-Date: Mon, 23 Apr 2018 04:02:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Hi all,

FYI I am currently working on a layer, meta-xvisor, for building Xvisor 
(https://xhypervisor.com); repo is at 
git://github.com/cshoredaniel/meta-xvisor.git), and have a few questions:

Xvisor is basically an alternate kernel (it's a standalone Type-1 
hypervisor), but configuration and building along the lines of u-boot / 
busybox seems to be working, but I need help to properly deal with 
different architectures and machines as the arch/machine organization 
isn't exactly the same as linux kernel.

I'm relatively new to OE so I have lots to learn to do complicated 
things like dealing with openconf (derivative of KConfig) files and 
architecture mappings and so on in a compact, generic way.

Also it'd be useful to know how to use the new MultiConfig stuff so that 
I can build multiple guests and the hypervisor itself from the same tree.

Any help would be appreciated!

Regards,

Daniel

