Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 41CF977352
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2016 22:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1LMiqPc022163; Sun, 21 Feb 2016 22:44:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GqyGdGQzUsza; Sun, 21 Feb 2016 22:44:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1LMimgh022159
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 21 Feb 2016 22:44:49 GMT
Message-ID: <1456094688.28376.178.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Feb 2016 22:44:48 +0000
In-Reply-To: <CA+chaQfOYEfP=h8U1_Q7FXLUKuqvZ=o967=5vSVf3Phqag7yyA@mail.gmail.com>
References: <1455815945-9857-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmnO78wfOe6p05MdU_jZ-9SqrQOAzxrqejrLBU2AXUR0Q@mail.gmail.com>
	<1456050629.28376.160.camel@linuxfoundation.org>
	<CA+chaQfOYEfP=h8U1_Q7FXLUKuqvZ=o967=5vSVf3Phqag7yyA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] fio: Remove --disable-static from EXTRA_OECONF
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
X-List-Received-Date: Sun, 21 Feb 2016 22:44:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-02-21 at 11:47 +0100, Martin Jansa wrote:
> What's the advantage of more global .inc file?

In OE-Core it started as a standalone experiment which made sense as a
separate .inc as we've done with some other things of this nature. I
thought it was going to take longer to work through and establish. 

Having looked at the effect, I decided to adopt it for poky. At this
point I suspect marking up the recipes is the best way to do things.

I'd note that if we had a way to know if a recipe was really autotools
or just acts a bit like it, it would help a lot...

> IMHO it's only increasing chances for conflicts when merging/cherry
> -picking.

I think the central class did make sense for an initial evaluation of
this but probably not going forward...

Cheers,

Richard

