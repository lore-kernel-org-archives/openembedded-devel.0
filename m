Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D872770269
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:11:09 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 792112232CC0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:11:08 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B4D512232CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:11:06 +0200 (CEST)
Date: Tue, 15 Jul 2014 09:11:01 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140715071052.GA7183@mail.itconsulting-heinold.de>
References: <alpine.LFD.2.11.1407141932020.6827@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1407141932020.6827@localhost>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: avoiding hard-coded filenames in package file lists
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
X-List-Received-Date: Tue, 15 Jul 2014 07:11:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 14, 2014 at 07:35:39PM -0400, Robert P. J. Day wrote:
> 
>   occasionally, i still trip across stuff like this (this is from
> oe-core):
> 
> meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb:FILES_${PN} = "/etc ${datadir}/fonts"
> 
> i'm assuming that one should avoid hard-coding names like "/etc" in
> this case, and instead use (in this case) ${sysconfdir}, yes?
> 
> rday
> 
> -- 

Yes!

Bye Henning

