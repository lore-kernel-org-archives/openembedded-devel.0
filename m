Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 3948660702
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 15:15:08 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 745782232CC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 17:15:07 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 59BE22232CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 17:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (91-65-194-134-dynip.superkabel.de
	[91.65.194.134]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 17:15:06 +0200 (CEST)
Date: Fri, 27 Jun 2014 17:15:04 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140627151503.GB23711@mail.itconsulting-heinold.de>
References: <1403794582-16605-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C430@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612C63E@SEXCHANGE0100.lpg.priv>
	<20140627141915.GA23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6A6@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0612C6A6@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Building Java 7
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
X-List-Received-Date: Fri, 27 Jun 2014 15:15:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2014 at 02:56:55PM +0000, MONDON Daniel wrote:
> I've got another problem:
> | 47 problems (10 errors, 37 warnings)WARNING: exit code 255 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/me/poky/build/tmp/work/x86_64-linux/log4j1.2-native/1.2.17-r2/temp/log.do_compile.7471)
> ERROR: Task 2038 (virtual:native:/home/me/poky/meta-java/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb, do_compile) failed with exit code '1'
> 
> Thanks
> Daniel.

Hm,

maybee a race condition when making parallel builds. Can you run it with a couple of times with bitbake -k whatever?

Bye Henning

