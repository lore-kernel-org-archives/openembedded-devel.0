Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Op6gw-00039S-Oc
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 23:42:34 +0200
Received: by fxm6 with SMTP id 6so2421491fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 14:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=QHuPhsAwSbgE5yPjh/+IkddoVD6Y84oRqMMIKAQfj28=;
	b=Lol8cLD40R4pXdIe1U/80aHDO2XTr6aGPc4NNTRBiMXnnekA5YOSnW+1qc7v7IfGcD
	AGPsqNLSfs7X20BOQQ3BKWikA1Od5Xqy+EByWPqcwKvD8gMTTxzApwW1TMIqfvQDVn+D
	Ke+fIA3T8OqjM1V3DUzmvlK1rou3aPUjjezl4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wnLtJTaYPftxNQEcPogKifedKj5GJ5r0fHqhdzNEbiX4AIE/5y3MRrQY9XRP/TsAIm
	1Bq4b2+WQ76IdNI44XeqfdlImTSCGggUCNpCeZM/dz5o9SujKDaPBHuDS1MvCYlOjYJy
	VfInHU7osOmKniGD31OFyZ/OPmCLq6QPdLdtw=
Received: by 10.223.122.202 with SMTP id m10mr583168far.55.1282945321606;
	Fri, 27 Aug 2010 14:42:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b11sm2167082faq.30.2010.08.27.14.42.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 27 Aug 2010 14:42:00 -0700 (PDT)
Date: Fri, 27 Aug 2010 23:42:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100827214240.GI17268@jama>
References: <1282940782400087500@rkmorris.us> <1282944432199625500@rkmorris.us>
	<1282944796856928500@rkmorris.us>
MIME-Version: 1.0
In-Reply-To: <1282944796856928500@rkmorris.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Execution of Build Output Failing (Testing)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Aug 2010 21:42:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2010 at 04:33:16PM -0500, openembedded@rkmorris.us wrote:
> Hi,
> 
>  
> 
> I am running a build with Angstrom, and I receive the following error messages - is this expected (and is there a fix for this?)?
> 
>  
> 
> NOTE: Handling BitBake files: \ (0754/7160) [10 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Handling BitBake files: \ (0960/7160) [13 %]NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
> NOTE: Handling BitBake files: \ (0970/7160) [13 %]NOTE: Angstrom DOES NOT support ipkg because ipkg has been superseded by opkg
> NOTE: Handling BitBake files: | (1191/7160) [16 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Handling BitBake files: \ (1404/7160) [19 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Handling BitBake files: | (4881/7160) [68 %]NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
> NOTE: Handling BitBake files: | (5731/7160) [80 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Handling BitBake files: \ (5964/7160) [83 %]NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv replacement is used
> NOTE: Handling BitBake files: - (6038/7160) [84 %]NOTE: Angstrom DOES NOT support fso-apm because regular apmd is good enough
> NOTE: Handling BitBake files: - (6508/7160) [90 %]NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
> NOTE: Handling BitBake files: \ (7160/7160) [100 %]

Those are not error messages, just note that some packages are
blacklisted, see ie: 
ANGSTROM_BLACKLIST_pn-bluez-libs = "bluez-libs 3.x has been replaced by bluez4"
etc in distro configs like conf/distro/angstrom-2010.x.conf

So it's expected.

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


