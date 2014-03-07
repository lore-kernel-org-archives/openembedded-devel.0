Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id AB7A06E8A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 17:10:05 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2AD702232069
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 18:10:04 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E07B52232068
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 18:10:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 18:10:02 +0100 (CET)
Date: Fri, 7 Mar 2014 18:09:56 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140307170947.GB25806@mail.itconsulting-heinold.de>
References: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
	<20140306120645.GB4680@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD4C2@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA060AD4C2@SEXCHANGE0100.lpg.priv>
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
X-List-Received-Date: Fri, 07 Mar 2014 17:10:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 07, 2014 at 02:28:15PM +0000, MONDON Daniel wrote:
> The README for meta-java clearly states which layers are needed, giflib is only on meta-openembedded.
> 
> Bye Henning
> -----------------------------------------------------------------
> Hi,
> 
> Then ... I do
> 
> I am under virtualized Ubuntu 12.04 server.
> I compile for MACHINE = "qemuarm".
> 
> WARNING: /home/lpg/Test/oe-core/build/tmp-eglibc/sstate-control/manifest-qemuarm-cacao-initial.populate_sysroot not found
> WARNING: /home/lpg/Test/oe-core/build/tmp-eglibc/sstate-control/manifest-qemuarm-libecj-bootstrap.populate_sysroot not found
> WARNING: /home/lpg/Test/oe-core/build/tmp-eglibc/sstate-control/manifest-qemuarm-ecj-initial.populate_sysroot not found
> WARNING: /home/lpg/Test/oe-core/build/tmp-eglibc/sstate-control/manifest-qemuarm-classpath-initial.populate_sysroot not found
> WARNING: /home/lpg/Test/oe-core/build/tmp-eglibc/sstate-control/manifest-qemuarm-jikes-initial.populate_sysroot not found
> 
> 
> I've got this error:
> ERROR: Task 637 (virtual:native:/home/lpg/Test/oe-core/meta-java/recipes-core/jamvm/jamvm_git.bb, do_configure) failed with exit code '1'
> 
> 
> The log is attached ...
> 
> 
> Thanks
> Daniel.
> 

Hi,

okay seems I have to add libffi native to the depends of jamvm and "inherit pkgconfig".
For now try to bitbake libffi-navtive before your bitbake command.

Bye Henning

