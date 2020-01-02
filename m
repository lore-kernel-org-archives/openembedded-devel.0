Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 591E07FC36
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 10:55:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47pQ161yJgzQJ;
	Thu,  2 Jan 2020 11:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577962522;
	bh=fyK054+ohP6f8GLFGDha3hlS4wONa+hfY8G22bv/DT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPURD59yWbWvgQBgvTP+YwdCdcQX+e9xqjCOpMn5C57v2sZMJ0Ih/QS44jDTodQMQ
	ZbOekRFBWF3VyCIOPNg8r1DCCh1jIFcNVJQSy94u7xSziR1qzoWuQ4yPO83QvHMZ7B
	+DRQ7eAJVkcbCm/1d+4MrM9zJCGYKLH4afdOfdZOp+KIipPKlcjBYLDj/HAEeTWQtT
	g3+yflclkp4jRsQyj4DHGeWG2QuhNSdo2SFHf+VC104i5ZQLjB3Mq3LoXclZUqGoSZ
	lKc01/NX99zDz/qY0DLYa64UtbDnil8/4R9cSQQ2T3zT/oqkPl8czaaMGBhAOlhJ3L
	/APfdsfMofdl84cZcegs/Y/KyhYVNF1VaZ+dvjXWlXOAdB8iqePMv0F1hL2bZWB9E/
	EYPbqrA6i2DF0B4NZNqUBzKcGbpziG3IZCWECW7wePSKuwvJa9h4wqKw2z+vRF+M+I
	Jynb6QLVVawTbkpMkR8cz2Jk3HVhlwy56GHu37O9X7IdrHdKiqUi1bfOSQZ5zr+6a2
	KKN2OnOXrYgUppA56Fp623YR6vK2JVa62xMPws1Hsywu1cBSYUV3LbKYud0OfkVnEj
	TpADcRCPIio6E0M+Uuj91eO3GCMD9i6lGBhr1IIqWSBzBXZRYZPk9ggwlRAYiQsqVP
	pOt5fA0g5RzV2JchfIz65XOg=
Date: Thu, 2 Jan 2020 12:55:20 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200102105520.GA11760@localhost>
References: <20200102061330.480482-1-raj.khem@gmail.com>
	<20200102061330.480482-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200102061330.480482-3-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/6] gtkperf: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 10:55:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

It might be time to remove gtkperf?

It is a benchmarking tool for the old GTK+2, and with no upstream 
release in 15 years there is not much chance that gtkperf will get 
ported to more recent GTK versions.

cu
Adrian

