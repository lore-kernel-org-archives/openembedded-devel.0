Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0AC6F6AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 11:52:17 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1CAEC2232071
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 12:52:16 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3378D2232070
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 12:52:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (g225145087.adsl.alicedsl.de
	[92.225.145.87]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 12:52:13 +0100 (CET)
Date: Sat, 15 Mar 2014 12:52:07 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140315115207.GA31191@mail.itconsulting-heinold.de>
References: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
	<20140306120645.GB4680@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD4C2@SEXCHANGE0100.lpg.priv>
	<20140307170947.GB25806@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA060AD8AC@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA060AE963@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA060AE963@SEXCHANGE0100.lpg.priv>
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
X-List-Received-Date: Sat, 15 Mar 2014 11:52:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 14, 2014 at 04:17:18PM +0000, MONDON Daniel wrote:
> Hi,
> 
> Is there any git repository (or configuration) to add ?
> I've just do:
>   git clone git://git.openembedded.org/openembedded-core oe-core
>   cd oe-core
>   git clone git://git.openembedded.org/bitbake bitbake
>   git clone git://git.openembedded.org/meta-openembedded
>   git clone https://github.com/woglinde/meta-java.git
> 
> Following meta-java ReadMe Instructions:
> conf/local.conf:
>   PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
>   PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
>   PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
>   PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
>   PREFERRED_VERSION_icedtea7-native = "2.1.3"
> # option PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
> 
> conf/bblayers.conf:
> BBLAYERS ?= " \
>   path_to_source /oe-core/meta \
>   path_to_source /oe-core/meta-openembedded/meta-oe \
>   path_to_source /oe-core/meta-java \
>   "
> 
> Thanks,
> Good weekend
> 
> Daniel.

The configuration looks good so far. Do you still have the libffi error?
What is your hostbuildsystem?

Bye Henning

