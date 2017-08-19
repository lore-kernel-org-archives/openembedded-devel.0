Return-Path: <idealsim@laposte.net>
Received: from smtp.laposte.net (smtpoutz26.laposte.net [194.117.213.101])
	by mail.openembedded.org (Postfix) with ESMTP id C4EEC78357
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 16:10:46 +0000 (UTC)
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout014 (Postfix) with ESMTP id DC3C0121F08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
	t=1503159046; bh=EaVXLZEYd9Rb+yzjpSrcV6/5ZvhJmRyJqRDVXHbAbps=;
	h=To:From:Subject:Date;
	b=E+/Bqb9lFXt/yRH3vkgDooqg9MBtAX4Y//vZd9F3FZY5/5lyIFde1HLIE4zoiZ6C/
	awRcIl+Nl10SUWS4RChtyoy25hpIQbmGLEmAs0NrKT1KIZd+1wSTdKsu9Z9HmzYrdw
	oAHboErdov0ANJHC7uRIUtjtqv/kIb8KRuDcwd9Qt6Lh7+qp/+G91MuC+069dErzec
	xt7v+Y5mvZo+OK7M/4BYo+D01qnH3/0TV1CbORXV97eVTaY93Gxhui9SrMfu8puQzu
	3rJQgByjDKs0aloj4d7gtlL1gvxel/KC/s4FqFYxUHOxRnu1H+N5yNJGG1AST1B1kR
	gBNizek96z7yg==
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout014 (Postfix) with ESMTP id CE79C121F0D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:10:46 +0200 (CEST)
Received: from lpn-prd-vrin003 (lpn-prd-vrin003.prosodie [10.128.63.4])
	by lpn-prd-vrout014 (Postfix) with ESMTP id CAB30121F08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:10:46 +0200 (CEST)
Received: from lpn-prd-vrin003 (localhost [127.0.0.1])
	by lpn-prd-vrin003 (Postfix) with ESMTP id BC0994932F5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:10:46 +0200 (CEST)
Received: from [192.168.1.19] (ARennes-654-1-118-187.w2-13.abo.wanadoo.fr
	[2.13.101.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lpn-prd-vrin003 (Postfix) with ESMTPSA id 965484931FE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:10:46 +0200 (CEST)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: idealsim <idealsim@laposte.net>
Message-ID: <55765cc3-9a1c-14fb-35ea-005ee7e833b9@laposte.net>
Date: Sat, 19 Aug 2017 18:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
X-VR-SrcIP: 2.13.101.187
X-VR-FullState: 0
X-VR-Score: 0
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrfeelkedruddthedgleelucetufdoteggodetrfdotffvucfrrhho
X-VR-Cause-2: fhhilhgvmecunfetrffquffvgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefvhffukfff
X-VR-Cause-3: fgggtgesrgdtreertdefjeenucfhrhhomhepihguvggrlhhsihhmuceoihguvggrlhhsihhmsehlrghp
X-VR-Cause-4: ohhsthgvrdhnvghtqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrddufedruddt
X-VR-Cause-5: uddrudekjeenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopegludelvddrudeikedr
X-VR-Cause-6: uddrudelngdpihhnvghtpedvrddufedruddtuddrudekjedpmhgrihhlfhhrohhmpehiuggvrghlshhi
X-VR-Cause-7: mheslhgrphhoshhtvgdrnhgvthdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlhes
X-VR-Cause-8: lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] populate_sdk error in pyro
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
X-List-Received-Date: Sat, 19 Aug 2017 16:10:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all, i'm trying to build the sdk with "-c populate_sdk" but i have 
this error at end :

/Transaction Summary//
//================================================================================//
//Install  103 Packages//
//
//Total size: 108 M//
//Installed size: 310 M//
//Running transaction check//
//Transaction check succeeded.//
//Running transaction test//
//Error: Transaction check error://
//  file 
/opt/poky/2.3.1/sysroots/x86_64-pokysdk-linux/environment-setup.d 
conflicts between attempted installs of 
nativesdk-cmake-3.7.2-r0.x86_64_nativesdk and 
nativesdk-qtbase-tools-5.8.0+git0+49dc9aa409-r0.x86_64_nativesdk/


Complete log here : 
https://gist.github.com/modjo756/c8a6eeebc1ab0787ee72033f09d99ac2

Do you already meet this issue ?

regards


Mickaël


