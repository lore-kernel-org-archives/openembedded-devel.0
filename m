Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 30FD977D24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DD7AE20BCC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 20:36:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id tw7LnoKeRc92
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 20:36:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C1021207AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 20:36:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4C8EC162525; Mon, 10 Jul 2017 16:36:42 -0400 (EDT)
Date: Mon, 10 Jul 2017 16:36:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170710203642.GB26405@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [meta-browser] Chromium and gold linker
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
X-List-Received-Date: Mon, 10 Jul 2017 20:36:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Khem, et al,

I couldn't find below patch being discussed on this mailing list before it got 
merged:

https://github.com/OSSystems/meta-browser/commit/62e323848f569c4cdea5567b1917ce006d7705af

According to the layer README, openembedded-devel is the official mailing list 
to submit patches. I understand that github pull request is a nice shortcut, 
but it prevents others from seeing and commenting on the patches...


My issue with this change is that it makes an assumption of using OE-built 
toolchain. It now breaks external toolchains like this:

| [17/20569] LINK genmacro
| FAILED: genmacro
| gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -fuse-ld=gold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genmacro -Wl,--start-group obj.host/third_party/yasm/source/patched-yasm/tools/genmacro/genmacro.genmacro.o -Wl,--end-group
| /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnueabihf/lib/libgcc_s.so.1: unsupported ELF machine number 40
| collect2: error: ld returned 1 exit status
| [18/20569] LINK genstring
| FAILED: genstring
| gcc  -L/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2016.11/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -fuse-ld=gold -Wl,--disable-new-dtags -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -Wl,--no-as-needed -lpthread -Wl,--as-needed -o genstring -Wl,--start-group obj.host/third_party/yasm/source/patched-yasm/genstring.genstring.o -Wl,--end-group
| /usr/bin/ld.gold: fatal error: /opt/linaro-2016.11/arm-linux-gnueabihf/lib/libgcc_s.so.1: unsupported ELF machine number 40
| collect2: error: ld returned 1 exit status

-- 
Denys

