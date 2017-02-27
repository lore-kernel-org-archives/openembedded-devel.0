Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 407 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Feb 2017 10:45:26 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id AFADC71D82
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 10:45:26 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1DD67D40382
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:38:39 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8E3FAD40344
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:38:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (unknown [178.19.210.209])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:38:37 +0100 (CET)
Date: Mon, 27 Feb 2017 11:38:32 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170227103832.GA25852@mail.itconsulting-heinold.de>
References: <1487759783-10455-1-git-send-email-guy.shapiro@mobi-wize.com>
	<CAH4+OFrHDbj1ZmYRRN+mSAHEHCvnBDiTou0JUQTmiyCmyr-Sig@mail.gmail.com>
	<7b26a808-c448-706f-c595-393e55451c3b@mobi-wize.com>
	<CAH4+OFq=aZeeEayB2TSAiGGiVhwp01EfBdqNavYEwo2kuJ+d+Q@mail.gmail.com>
	<CAH4+OFoigK1HxZYPW-zFcs+dqTt_0yvdTjogzzeMHfXdGnwRRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH4+OFoigK1HxZYPW-zFcs+dqTt_0yvdTjogzzeMHfXdGnwRRw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java] [rfc] openjdk-8: recipe for jdk8u121-b13-aarch32
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
X-List-Received-Date: Mon, 27 Feb 2017 10:45:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

the error log shows "cc1plus: all warnings being treated as errors", so you need to change or remove
the compiler flag "-Werror".

Bye Henning

