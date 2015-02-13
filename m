Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 04435733DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 10:35:51 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w55so15691543wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 02:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:content-type
	:mime-version:content-transfer-encoding;
	bh=diPisWaMD5riLkVfJEn32f84RVdespaScGSnNK+2IUw=;
	b=I5di6w5zzkenEcaSs97K5WFsGm02Zb60Y6AhTqwreTsREyMn2DENBZoZWtlDxAWRgW
	yL48vhANDbBG3UAOtkpwtNFAl313/I+2dj8AmEV6aX9KFZ1aHmgZcJUVFtgiU+n6OHhf
	vNAH4kdZ+A4N+P8NYJ7N+jZxPwUd0M/o/dHQ/BOTkLe+UpGsea7XXplTJLtBH5xgKsQu
	LLJMCKgNMffXGhtaXUeEtQgZOfAe5wbOySI7qmnjjOyXkfBk3h+kbHO7qVS6Vv4qcf3j
	272baIR/bpCPgSi+eOCah0drOiRq+YCO0lDqQrydiFt+k8o9vI8HYFZRuCaAuOQeNwU7
	4zhQ==
X-Received: by 10.180.35.72 with SMTP id f8mr14718450wij.31.1423823752267;
	Fri, 13 Feb 2015 02:35:52 -0800 (PST)
Received: from [192.168.0.7] (212-41-70-184.adsl.solnet.ch. [212.41.70.184])
	by mx.google.com with ESMTPSA id q10sm9488241wjr.41.2015.02.13.02.35.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Feb 2015 02:35:51 -0800 (PST)
Message-ID: <1423823635.2285.5.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 11:33:55 +0100
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 13 Feb 2015 10:35:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Daniel


Am Freitag, den 13.02.2015, 10:08 +0000 schrieb MONDON Daniel:
> Ok, but my problem is I must not change distribution.
> The system is installed on many machines, and moving to and other repo will generate too many work (dev and validation)!
In order to fix an error you will have to change something.

> I have not enough time to pass on this problem : It was so complicated to build, install and configure Java on angstromv2012.05 environment!
> 
> Is it because Ubuntu 12.04 java was updated ?
No.

The error you see is because some sources test if now is more than 10 years from 2015 and refuse to compile (and maybe execute later?) if this is the case.

This is fixed in meta-java, but as Henning said you have to get the
meta-java layer from git://git.yoctoproject.org/meta-java and update to
HEAD.

Regards
Max

> Thanks
> Daniel.
> 
> -----Message d'origine-----
> De : openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] De la part de Henning Heinold
> Envoyé : vendredi 13 février 2015 10:50
> À : openembedded-devel@lists.openembedded.org
> Objet : Re: [oe] package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
> 
> On Fri, Feb 13, 2015 at 08:36:45AM +0000, MONDON Daniel wrote:
> > Hi,
> > 
> > I am under Ubuntu 12.04 server and I build an angstromv2012.05 distribution.
> > 
> > Making a build all (from scratch), I've got the error:
> > | Error: time is more than 10 years from present: 1104530400000
> > | java.lang.RuntimeException: time is more than 10 years from present: 1104530400000
> > |    at build.tools.generatecurrencydata.GenerateCurrencyData.makeSpecialCaseEntry(GenerateCurrencyData.java:285)
> > |    at build.tools.generatecurrencydata.GenerateCurrencyData.buildMainAndSpecialCaseTables(GenerateCurrencyData.java:225)
> > |    at build.tools.generatecurrencydata.GenerateCurrencyData.main(GenerateCurrencyData.java:154)
> > |    at java.lang.reflect.VMMethod.invoke(Native Method)
> > |    at java.lang.reflect.Method.invoke(Method.java:327)
> > |    at jamvm.java.lang.JarLauncher.main(JarLauncheERROR: Function failed: do_compile (see /home/lpg/VPN/lpg-project/build/tmp-angstrom_v2012_05-eglibc/work/x86_64-linux/icedtea6-native-1.8.11-r5.3/temp/log.do_compile.8710 for further information)
> > 
> > The log.do_compile.8710 is attached.
> > 
> > Please help :)
> > 
> > Thanks
> > Daniel.
> 
> The layer has moved and is now available under git://git.yoctoproject.org/meta-java
> 
> Bye Henning
> 
> 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



