Return-Path: <alfonso@tames.com>
X-Greylist: delayed 416 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Oct 2014 02:31:30 UTC
Received: from mail.tames.com (tames.com [72.2.119.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE5D65CED
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 02:31:30 +0000 (UTC)
Received: from [10.178.247.148] (unknown [187.189.166.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alfonso@tames.com)
	by mail.tames.com (Postfix) with ESMTPSA id 7FB4629A10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 02:23:47 +0000 (UTC)
Message-ID: <5452F2DB.5030603@tames.com>
Date: Thu, 30 Oct 2014 20:24:27 -0600
From: =?UTF-8?B?QWxmb25zbyBUYW3DqXM=?= <alfonso@tames.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: clamav-milter 0.98.1 at 56cb6755-5e21-c698-f8be-a3023abd5444
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: gcc-cross-canadian not choosing correct float type in meta-toolchain-qt5 (dizzy)
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
X-List-Received-Date: Fri, 31 Oct 2014 02:31:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Otavio,

Did your patches to meta-qt5 that recognize hard float and configure 
meta-toolchain-qt5's gcc-cross-canadian accordingly ended in dizzy or 
are they still in the master branch? I just fresh repo synced and 
bitbaked a dizzy image with a meta-toolchain-qt5 and gcc-cross-canadian 
is not configured///--with-float=hard/ by default.

I would be happy to help but I am still figuring out how Yocto works. In 
the meanwhile I just forced an ugly /--with-float=hard/ in 
/poky/meta/recipes-devtools/gcc/gcc-cross-canadian.inc inside the 
multilib environmental variable that does the trick.

Thanks !

Alfonso

