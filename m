Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3A57029A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 14:11:56 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4787D2232CC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 16:11:55 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id ED2D72232CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 16:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 16:11:53 +0200 (CEST)
Date: Fri, 11 Jul 2014 16:11:50 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140711141150.GB6407@mail.itconsulting-heinold.de>
References: <F48900D76F0D8349918584FEEFEB4BCA0612C430@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612C63E@SEXCHANGE0100.lpg.priv>
	<20140627141915.GA23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6A6@SEXCHANGE0100.lpg.priv>
	<20140627151503.GB23711@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C6D6@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612EC9F@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0612F212@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0614A7C3@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA0614BE8C@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0614BE8C@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Building openjdk-7-jre
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
X-List-Received-Date: Fri, 11 Jul 2014 14:12:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 11, 2014 at 01:51:37PM +0000, MONDON Daniel wrote:
> Hi,
> 
> New compilation test of java.
> 
> I've just do:
>    git clone git://git.openembedded.org/openembedded-core openembedded-core
>    cd openembedded-core
>    git clone git://git.openembedded.org/bitbake bitbake
>    git clone git://git.openembedded.org/meta-openembedded
>    git clone https://github.com/woglinde/meta-java.git
>  
> Following meta-java ReadMe Instructions:
> conf/local.conf:
>    PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
>    PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
>    PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
>    PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
>    PREFERRED_VERSION_icedtea7-native = "2.1.3"
> 
> conf/bblayers.conf:
> BBLAYERS ?= " \
>    /home/me/java/openembedded-core/meta \
>    /home/me/java/openembedded-core/meta-openembedded/meta-oe \
>    /home/me/java/openembedded-core/meta-java \
>    "
> 
> bitbake openjdk-7-jre errors:
> /home/me/java/openembedded-core/meta/recipes-devtools/rpm/rpm_5.4.14.bb, do_compile
> /home/me/java/openembedded-core/meta-java/recipes-core/icedtea/icedtea6-native_1.8.11.bb, do_compile

rpm is not my part.

For the native icedtea build libstdc++ dev library is missing as the log says.

Please install this package for your distro and I will update the readme not only for redhat.

Bye Henning

