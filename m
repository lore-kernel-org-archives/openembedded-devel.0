Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LUVQL-00052k-HC
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 01:15:28 +0100
Received: by wf-out-1314.google.com with SMTP id 25so2299882wfc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 03 Feb 2009 16:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vewQkC8s8ZneZJJdtAB/XhJbvyelQKd8hJh6ge/shDE=;
	b=bnEY3n8BjybmT6isl2F/DWiUJ0CKZ+vq5SF8ZQzMKJvyMLdsD5yfq48CfPUvtFWLq2
	1xgegviOYb3XDVcU6HmapqDC5U/LJ7fDh1SuMjUoavEfMK0T3tDjHBjgQH1ASb513jKr
	ZsKTgAFpszZczpAIne5kT0UZLaelu5Y/Dz+Cw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NhEqwz1zseIg+kNqQFEEZJjL1J4fytZbpfPJHUv+OJb5KwqYKXkOHE9Ot7GdwA56l+
	sZn1s/B0v3SB759ucelZ4ktBy+QiBqLLBV5q/6Q4SBQLJCth/YF/8hMBZwBj1XQJ2wJv
	kYDaz461DhdKRTp9Z4htHBB1sm93WSTk7TMAw=
Received: by 10.142.128.15 with SMTP id a15mr2598552wfd.84.1233706521199;
	Tue, 03 Feb 2009 16:15:21 -0800 (PST)
Received: from gmail.com (adsl-71-146-21-217.dsl.pltn13.sbcglobal.net
	[71.146.21.217])
	by mx.google.com with ESMTPS id 29sm10971786wfg.46.2009.02.03.16.15.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Feb 2009 16:15:20 -0800 (PST)
Date: Tue, 3 Feb 2009 16:15:15 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Tom Rini <trini@kernel.crashing.org>
Message-ID: <20090204001515.GA16300@gmail.com>
References: <20090203234237.GI3856@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090203234237.GI3856@smtp.west.cox.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] Make eglibc_{2.9,svn} depend on gperf-native
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
X-List-Received-Date: Wed, 04 Feb 2009 00:15:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/02/09 16:42), Tom Rini wrote:
> Hello.  Trying to build eglibc 2.9 today I hit a problem on install as I
> didn't have gperf installed.  OK to push the following?
> 
> diff --git a/packages/eglibc/eglibc_2.9.bb b/packages/eglibc/eglibc_2.9.bb
> index 207c73a..e2cac82 100644
> --- a/packages/eglibc/eglibc_2.9.bb
> +++ b/packages/eglibc/eglibc_2.9.bb
> @@ -1,9 +1,10 @@
>  require eglibc.inc
>  
> +DEPENDS += "gperf-native"
>  DEFAULT_PREFERENCE = "1"
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/eglibc-svn"
>  PV = "2.9"
> -PR = "r0"
> +PR = "r1"
>  SVN_REV="7430"
>  EGLIBC_BRANCH="eglibc-2_9"
>  SRC_URI = "svn://svn.eglibc.org/branches;module=eglibc-2_9;rev=${SVN_REV};proto=svn \
> diff --git a/packages/eglibc/eglibc_svn.bb b/packages/eglibc/eglibc_svn.bb
> index a0d322a..fc3ed59 100644
> --- a/packages/eglibc/eglibc_svn.bb
> +++ b/packages/eglibc/eglibc_svn.bb
> @@ -1,10 +1,11 @@
>  require eglibc.inc
>  
> +DEPENDS += "gperf-native"
>  SRCREV = "7542"
>  # DEFAULT_PREFERENCE = "-1"
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/eglibc-svn"
>  PV = "2.9+svnr${SRCREV}"
> -PR = "r0"
> +PR = "r1"
>  EGLIBC_BRANCH="trunk"
>  SRC_URI = "svn://svn.eglibc.org;module=trunk \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch;patch=1 \
> 
> -- 
> Tom Rini

Patch is ok. 

Thanks

-Khem



