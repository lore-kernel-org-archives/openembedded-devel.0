Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 2D31D6EC83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 11:48:46 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 650122232071
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 12:48:45 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7B6242232070
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 12:48:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 12:48:44 +0100 (CET)
Date: Mon, 17 Mar 2014 12:48:38 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140317114838.GA6946@mail.itconsulting-heinold.de>
References: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
	<20140306120645.GB4680@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD4C2@SEXCHANGE0100.lpg.priv>
	<20140307170947.GB25806@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD8AC@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA060AE963@SEXCHANGE0100.lpg.priv>
	<20140315115207.GA31191@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AEE84@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA060AEE84@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Meta java
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
X-List-Received-Date: Mon, 17 Mar 2014 11:48:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 17, 2014 at 08:54:18AM +0000, MONDON Daniel wrote:
> >The configuration looks good so far. Do you still have the libffi error?
> >What is your hostbuildsystem?
> >
> >Bye Henning
> 
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   virtual:native:/home/Test/Test2/oe-core/meta-java/recipes-core/jamvm/jamvm_git.bb, do_configure
> Summary: There were 5 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> 
> 
> 
> 
> LogFile 28410 joined.
> I have a look and i see 1.6 configuration ... am i right ?
> 
> Thanks
> Bye
> Daniel.
> 

I maybe could help you, when you anwser my second question about your buildhost system(ubuntu fedora homebrew).

All I now see is, that your host gcc is version 4.6 with linaro patches and that this gcc tries to use his own version
of pkgconf, instead of the oe-build one and than fails to find the libffi.pc installed by the libffi-native recipe.

Bye Henning


> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

