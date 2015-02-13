Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 83EE4733DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 09:50:01 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9B6E6D403BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 10:49:58 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5E988D403BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 10:49:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(ip5b41c286.dynamic.kabel-deutschland.de [91.65.194.134])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 10:49:57 +0100 (CET)
Date: Fri, 13 Feb 2015 10:49:51 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150213094951.GA14290@mail.itconsulting-heinold.de>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
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
X-List-Received-Date: Fri, 13 Feb 2015 09:50:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 13, 2015 at 08:36:45AM +0000, MONDON Daniel wrote:
> Hi,
> 
> I am under Ubuntu 12.04 server and I build an angstromv2012.05 distribution.
> 
> Making a build all (from scratch), I've got the error:
> | Error: time is more than 10 years from present: 1104530400000
> | java.lang.RuntimeException: time is more than 10 years from present: 1104530400000
> |    at build.tools.generatecurrencydata.GenerateCurrencyData.makeSpecialCaseEntry(GenerateCurrencyData.java:285)
> |    at build.tools.generatecurrencydata.GenerateCurrencyData.buildMainAndSpecialCaseTables(GenerateCurrencyData.java:225)
> |    at build.tools.generatecurrencydata.GenerateCurrencyData.main(GenerateCurrencyData.java:154)
> |    at java.lang.reflect.VMMethod.invoke(Native Method)
> |    at java.lang.reflect.Method.invoke(Method.java:327)
> |    at jamvm.java.lang.JarLauncher.main(JarLauncheERROR: Function failed: do_compile (see /home/lpg/VPN/lpg-project/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/icedtea6-native-1.8.11-r5.3/temp/log.do_compile.8710 for further information)
> 
> The log.do_compile.8710 is attached.
> 
> Please help :)
> 
> Thanks
> Daniel.

The layer has moved and is now available under git://git.yoctoproject.org/meta-java

Bye Henning


> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

