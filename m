Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 634DC609B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 15:24:55 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0ABB4D40345
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:24:56 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 200EBD4025E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (e179143209.adsl.alicedsl.de
	[85.179.143.209]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 16:24:52 +0100 (CET)
Date: Sun, 11 Jan 2015 16:24:44 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150111152441.GD2465@mail.itconsulting-heinold.de>
References: <54B220B0.8070609@gmail.com>
 <54B222F2.4070802@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54B222F2.4070802@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Sun, 11 Jan 2015 15:24:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 11, 2015 at 12:44:58PM +0530, Victor Ascroft wrote:
> Hello,
> 
> I have OpenEmbedded setup and using the daisy branch. For the meta-java layer I
> am using the master branch of http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/.
> 
> For our embedded modules we have our own meta layer. I am trying to build
> an angstrom image with LXDE.
> 
> We are using ARMv7 hard-float Thumb2 builds (armv7at2hf-vfp). Most errors seems
> to be "not declared in this scope" errors. Are there some definitions to be 
> declared in the conf file, so the build picks it up or is some modification
> required to the source with a custome patch declared in the bb file for this?
> 
> Not much knowledge on OpenEmbedded. Also can someone explain the qemu segmentation
> fault errors?
> 

The segfaults comes with the latest update of qemu in openembedded-core. Try to revert the
commits on your local branch for now.

Bye Henning

