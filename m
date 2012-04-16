Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SJiuX-0001s5-QP
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 12:11:54 +0200
Received: by pbcum15 with SMTP id um15so5192997pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WoCXP0RCzBaWSoGA75OO1EkE+SwzXddKW8LM3qZR6cE=;
	b=LRB+cKitVQN01kE1xGlyPevcuXLq+j4S1iOJmnF58f3ipqFsL8/jlUI7Kb53SlJegF
	jRRSFIqpJ9dpZ4JfLTKBGvIfIPuu3mg734/m99KkFoCo8P+4VdAy0+WO8ivX56iRJwyZ
	iTkbMaAxPSsyPesyz5PaT3MZN+iG9z5PJ2g+aqMduOE9l7ruq2bTvFEr1Y30R3MIpicB
	F5CaLJE3Uw8p5fD6cIQ0HLoCPFiW37gkBy6nCSPahXUZNkfi7GNoYLNP1B0qaJ880eh8
	Bfxcm7u4To4K2HwqforpyWM9+I8T2MfO2maXAWwJ5Xbu2FH0sgUcRTei5caqKe7HJRCe
	9v9g==
MIME-Version: 1.0
Received: by 10.68.220.134 with SMTP id pw6mr26544647pbc.149.1334570548106;
	Mon, 16 Apr 2012 03:02:28 -0700 (PDT)
Received: by 10.142.180.4 with HTTP; Mon, 16 Apr 2012 03:02:28 -0700 (PDT)
Date: Mon, 16 Apr 2012 12:02:28 +0200
Message-ID: <CAAQYJAu+Go+CMGauY7CJWrrOj8Ec9yCEPO=JJyGrkde1PkhE4g@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-handheld] Linux yocto & linux-yocto-tiny
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 10:11:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
with the help of Bruce Ashfield I've reworked the recipes which are
now tested and stable enough to be committed.

https://github.com/andrea-adami/meta-handheld

I've tested the build and the kernels on three Zaurus machines
switching the PREFERRED_PROVIDER_virtual/kernel to linux-yocto and
linux-yocto-tiny.
The recipe can be extended and support other out-of-yocto-tree
devices, initially reusing the kernel defconfig of the linux recipes.
Cleaning and polishing the machine.cfg can be done in a second pass.

Please test and add your comments.

Thanks

Andrea


