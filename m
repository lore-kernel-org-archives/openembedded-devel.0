Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Oe7gO-000322-Fv
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 16:32:40 +0200
Received: by fxm12 with SMTP id 12so1300782fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2swoaC/mIIQz+upicAm5rUJ1AGqYzV/P+SsvITovhp0=;
	b=gIxuDhUEmX2QrKb45saNw0/Aa+yQpddyfK5w/ck4KfKLWaXdx0em2P4zQHwrn2UU9t
	ntXY6mj/S+yb7qJzlO7asH2Ywthk2muee2+GXGX3Z/cp4XXCN2GZGBt2rgTzxDopNf3j
	dld/v4u5NhRRgqFLFQSpZRaRbl9KGpW7D2EcM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=up7FgrBBERXFzPtGTEOXqRDn62BrTQV2cdMDDzKYy/YXBkeXUWqIhJxsnsNQB3vvJh
	kr2TIgm9PGyiMx3Y3E23Vv7oNItrzJvdyWXyzDLm2ArIUMThn3IxRewhl/3lW4Ev2O+p
	CIRfvg9UfRzc1gf3s4vl/BnGd2W35UI6xgitw=
Received: by 10.223.119.210 with SMTP id a18mr10045021far.52.1280327534441;
	Wed, 28 Jul 2010 07:32:14 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id a9sm2596701faa.27.2010.07.28.07.32.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 07:32:13 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Oe7g0-0005mV-DF; Wed, 28 Jul 2010 16:32:08 +0200
Date: Wed, 28 Jul 2010 16:32:08 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100728143208.GC19135@mx.loc>
References: <1280309434.7083.8.camel@utx.lan> <4C503315.8090009@gmail.com>
	<20100728140613.GB19135@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100728140613.GB19135@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)
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
X-List-Received-Date: Wed, 28 Jul 2010 14:32:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2010 at 04:06:13PM +0200, Bernhard Reutner-Fischer wrote:
>On Wed, Jul 28, 2010 at 03:39:33PM +0200, Marco Cavallini wrote:
>>Stanislav Brabec ha scritto, Il 28/07/2010 11:30:
>>> I just built an angstrom image and thinks failed.
>>> 
>>> lzma image depends on lzma-native, grep and other programs that use .xz
>>> suffix for tarballs depend on xz-native.
>>> This fact itself is bad - it creates file conflicts in the sysroot.
>>> 
>>> But things were even worse:
>>> - xz-native staged xz binary and lzma as a symlink to xz.
>>> - lzma-native tried to stage lzma 4 minutes later
>>> 
>>> But staging of lzma apparently went wrong. Instead of removal of lzma
>>> symlink and installation of lzma binary, bitbake followed the symlink
>>> and staged lzma as xz with a result of broken build environment.
>>> 
>>> I have bitbake-1.8.18.
>>> 
>>
>>
>>In the meantime we are waiting for a patch I used
>> bitbake xz-native
>>prior to launch
>> bitbake x11-image
>
>To rectify this extra manual step, one would need to something like the
>attached (untested). This does not take care of diverting lzma/xz
>binaries which is a separate issue.


>diff --git a/classes/native.bbclass b/classes/native.bbclass
>index 3437836..57de77e 100644
>--- a/classes/native.bbclass
>+++ b/classes/native.bbclass
>@@ -89,7 +89,7 @@ PKG_CONFIG_SYSROOT_DIR = ""
> 
> ORIG_DEPENDS := "${DEPENDS}"
> 
>-DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
>+DEPENDS_virtclass-native ?= "${@['${ORIG_DEPENDS}',''][bb.data.getVar('INHIBIT_DEFAULT_DEPS_virtclass-native', d, True) or False]}"
> 
and if that reads
DEPENDS_virtclass-native ?= "${@base_conditional('INHIBIT_DEFAULT_DEPS_virtclass-native', '1', '', '${ORIG_DEPENDS}', d)}"
then it actually does what it's supposed to do ;)


