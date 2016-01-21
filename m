Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 494 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Jan 2016 09:49:27 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D748E60667
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 09:49:27 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 02E21D4025E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 10:41:12 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 96F22D40046
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 10:41:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 10:41:10 +0100 (CET)
Date: Thu, 21 Jan 2016 10:41:04 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160121094057.GA30584@mail.itconsulting-heinold.de>
References: <56A071BB.6070608@mlbassoc.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C79ADFA@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C79ADFA@ALA-MBA.corp.ad.wrs.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java] unversioned source files
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
X-List-Received-Date: Thu, 21 Jan 2016 09:49:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 21, 2016 at 09:08:35AM +0000, Huang, Jie (Jackie) wrote:
> 
> 
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Gary Thomas
> > Sent: Thursday, January 21, 2016 1:51 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-java] unversioned source files
> > 
> > I just built the latest openjdk-7 and noticed that there are
> > a number of source files downloaded that have no version
> > information:
> >    sources/corba.tar.bz2
> >    sources/hotspot.tar.bz2
> >    sources/jaxp.tar.bz2
> >    sources/jaxws.tar.bz2
> >    sources/jdk.tar.bz2
> >    sources/langtools.tar.bz2
> >    sources/openjdk.tar.bz2
> 
> The original download file doesn' t have version in the name:
> http://icedtea.wildebeest.org/download/drops/icedtea7/2.7.0/corba.tar.bz2
> 
> > 
> > This seems very problematic to me - how is this expected to work,
> > especially when there are changes?
> 
> Yeah, there is potential issue, we should fix it by using "downloadfilename"
> in SRC_URI to rename those files.
> 

Okay,

but when we copy them into the buildir we must use the old name, because
icedtea/openjdk configure script checks for them and will download them itself if not found.

> Thanks,
> Jackie

Bye Henning

