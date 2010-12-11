Received: from mail-iw0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRNGg-0004RP-BS
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 12:05:36 +0100
Received: by iwn40 with SMTP id 40so6559639iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 03:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=suYBpD5czJd0eWkQU+85zEtLE4e3HIC9HjIG1Xo+SPE=;
	b=jkMVcBAI9YSNMy28Ma/cT82qxR+i/TyyhCMvNKtGBJe2IPogYcm8e2t6oYvTrV8Dpf
	mtWOgIksB6sSDQLpsVCe/OYzx6SpNaB2clHmTiRQv3gB2SIMVXrwHN5X0BcP5Z5reHuA
	pORNCP7Gu8iJQanbHEBzuXxspj/leFJI0BqRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=U+LHcXZSRP6e8ZTQIl3aV0fyY8P5ZkXwJXIfs8mWhB46WKiGm9qIYQiIfri9FoMxXp
	w9hJcCS/Cwx1c/utOIwFIsAgaY9anOPiTeLn4AVdLmpgw9Fhjhn/sugAiyYlwBDlXDpC
	SPMR+KblZIrLwGrHs4ph3qshrfKkNwjPB0tLI=
Received: by 10.42.167.66 with SMTP id r2mr1324200icy.124.1292065443024;
	Sat, 11 Dec 2010 03:04:03 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 34sm3669077ibi.14.2010.12.11.03.04.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 03:04:02 -0800 (PST)
Date: Sat, 11 Dec 2010 03:04:02 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211110402.GC10409@gmail.com>
References: <AANLkTimi=FMoZrm_Yum8xLkUkwd5+aYXDjguAqHj3mQS@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimi=FMoZrm_Yum8xLkUkwd5+aYXDjguAqHj3mQS@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.173
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc QA issue
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
X-List-Received-Date: Sat, 11 Dec 2010 11:05:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (08/12/10 09:18), Frans Meulenbroeks wrote:
> We bumped intot he following gcc QA issue (distro angsgtrom, machine
> mpc8313e-rdb)
> 
> ERROR: QA Issue with gcc: non -dev package contains symlink .so: gcc
> path '/work/ppce300c3-angstrom-linux/gcc-4.3.3-r20.1/packages-split/gcc/usr/lib/gcc/powerpc-angstrom-linux/4.3.3/libgcc_s.so'
> NOTE: package objc skipped
> NOTE: package gcc-4.3.3-r20.1: task do_package: Succeeded
> 
> Anyone a suggestion?

Do you still see this after my latest fixes to gcc ?

> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


