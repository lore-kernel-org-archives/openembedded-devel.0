Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7CB606E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:38:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s428cJQa027552; Fri, 2 May 2014 09:38:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G3lwtGlQZWV5; Fri,  2 May 2014 09:38:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s428cG7F027530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 2 May 2014 09:38:17 +0100
Message-ID: <1399019890.12731.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 02 May 2014 09:38:10 +0100
In-Reply-To: <CAAQYJAtY33YvGL7RVYpBiKtOkt3OxV7h=XV0EyY8yovZwDFdtg@mail.gmail.com>
References: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
	<1399018873.12731.21.camel@ted>
	<CAAQYJAtY33YvGL7RVYpBiKtOkt3OxV7h=XV0EyY8yovZwDFdtg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klcc_cross: move in target sysroot as crosscript
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
X-List-Received-Date: Fri, 02 May 2014 08:38:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-05-02 at 10:34 +0200, Andrea Adami wrote:
> I probably misunderstand that part.
> 
> I could not see any difference in the produced klcc.cross scripts with
> or without the mangling.
> Tested runtime on 3 machines.
> What I did not yet try is a rebuild from sstate but I expect it to be rebuilt.

The easy way to reproduce a problem is to build for MACHINE=A and then
build for MACHINE=B where the two machines have the same architecture.
You will find that whilst it will switch the commented line at the top
to refer to the new machine, the encoded lines do not get changed.

You would also find that if you run a build in dirA, then a build in
dirB using the sstate cache from dirA, the paths would reference dirA,
not dirB. After this change they will reference dirB.

Cheers,

Richard


