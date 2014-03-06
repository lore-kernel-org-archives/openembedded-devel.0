Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id C8B4C6EEEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 12:06:53 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 34D5F2232069
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 13:06:52 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7310C2232068
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 13:06:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 13:06:51 +0100 (CET)
Date: Thu, 6 Mar 2014 13:06:45 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140306120645.GB4680@mail.itconsulting-heinold.de>
References: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Meta java under poky-dora-10.0.1
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
X-List-Received-Date: Thu, 06 Mar 2014 12:06:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2014 at 11:00:56AM +0000, MONDON Daniel wrote:
> Hi,
> 
> I take poky-dora-10.0.1 and bitbake -k core-image-sato (for beagleboard).
> 
> I want to have openjdk7 : I take git meta-java.
> 
> But I have the bitbake error : 
> ERROR: Nothing PROVIDES 'giflib' (but /home/toto/poky-dora-10.0.1/meta-java/recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb DEPENDS on or otherwise requires it)
> ERROR: Required build target 'openjdk-7-jre' has no buildable providers.
> Missing or unbuildable dependency chain was: ['openjdk-7-jre', 'giflib']
> 
> Did I make an error (ie : don't take the right meta-java)?
> Or is it missing something ?
> 
> Thanks
> Daniel.

The README for meta-java clearly states which layers are needed, giflib is only on meta-openembedded.

Bye Henning

