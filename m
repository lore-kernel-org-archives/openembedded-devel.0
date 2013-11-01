Return-Path: <B40527@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFD446D4EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 03:18:59 +0000 (UTC)
Received: from mail215-tx2-R.bigfish.com (10.9.14.231) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Fri, 1 Nov 2013 03:19:01 +0000
Received: from mail215-tx2 (localhost [127.0.0.1])	by
	mail215-tx2-R.bigfish.com (Postfix) with ESMTP id 20933AC00A9;
	Fri,  1 Nov 2013 03:19:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzzz2dh2a8h5c0h839h944hd24hd2bhf0ah1220h1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h20dbh2218h2216h1155h)
Received: from mail215-tx2 (localhost.localdomain [127.0.0.1]) by mail215-tx2
	(MessageSwitch) id 1383275938418659_19369;
	Fri,  1 Nov 2013 03:18:58 +0000 (UTC)
Received: from TX2EHSMHS008.bigfish.com (unknown [10.9.14.235])	by
	mail215-tx2.bigfish.com (Postfix) with ESMTP id 61613D40040;
	Fri,  1 Nov 2013 03:18:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS008.bigfish.com
	(10.9.99.108) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 1 Nov 2013 03:18:58 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 1 Nov 2013 03:18:58 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rA13Iqn8001076;	Thu, 31 Oct 2013 20:18:53 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Joe MacDonald' <joe@deserted.net>, 'Martin Jansa' <martin.jansa@gmail.com>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<20131031081012.GC32015@jama> <006201ced618$dc97d420$95c77c60$@com>
	<20131031092314.GF32015@jama> <20131031135632.GA4563@deserted.net>
In-Reply-To: <20131031135632.GA4563@deserted.net>
Date: Fri, 1 Nov 2013 11:22:36 +0800
Message-ID: <001d01ced6b1$9f6f9ad0$de4ed070$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac7WQQZ22XMjL9UTR3eJ6o7Qi6FCnwAbyCsQ
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: openembedded-devel@lists.openembedded.org, b44149@freescale.com
Subject: Re: [meta-oe][PATCH v2] tcpreplay:add recipe
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
X-List-Received-Date: Fri, 01 Nov 2013 03:19:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn

>Wow, been a while since I thought about tcpdump's location in the tree.
>I knew we'd discussed moving it to meta-networking it previously and it
didn't move but I couldn't remember why.  Looks like it was mostly due to
inertia.  I've no objection to relocating it, I think it's a sensible
location for it anyway.  Zongchun:  would you be able to prepare a patch set
that includes the move and the introduction of tcpreplay?

>As for the recipe itself, I only noticed two small things on a quick scan.
tcpreplay-3.4.4-no-bfp-support.patch is lacking OE headers, at least an
upstream-status is important here, even though it's pretty clear what
that'll be.  :-)  Also, I don't think you need the PR in the recipe.

Joe: Thanks for your comments. I will prepare the patch set.



