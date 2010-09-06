Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OsT6y-0006nL-Ew
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 06:15:35 +0200
Received: by pvg6 with SMTP id 6so1386991pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=85cN2Cky9iH7iYQa+Gel8dBIIZsmKdGpzwsprKDx434=;
	b=ZI/y5YhW3uKmTg90gZpBzKPwyFYHuwKwOxfDcJROpQIFqyv+5DrKsXU6pcsZzkfZew
	V0bHFA/ppTRapKsSxPcr36CFre/YCSM9wO1k8SXPdA0upGvyTX+bWC75ci2pnjekMy12
	egTkb+ppOuwVkzrx8+XV3P9ZDOw4uahchEYS8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jp8B//c35QH20pabuhKovbQvh8SrahjuKxa8EpgFieKpnAxAl0wUlYpLX4KkJoVKbw
	11OgnunFmYcvaAov4HSEIhKWb+iPqEAA0UmZHeC3pXNzeZNeQuPwpV62k1IwajoAFTOp
	6A+lcPhZ1yOVNJv2x07Y5iJarv8zKwpCvhuNY=
Received: by 10.114.77.11 with SMTP id z11mr1175157waa.112.1283746476128;
	Sun, 05 Sep 2010 21:14:36 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x9sm10383696waj.15.2010.09.05.21.14.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 21:14:35 -0700 (PDT)
Date: Sun, 5 Sep 2010 21:14:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100906041418.GD5320@gmail.com>
References: <AANLkTi=AYdkOG3e-DmhTNqULsCFHW2bvDGr+M0xTs0HJ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=AYdkOG3e-DmhTNqULsCFHW2bvDGr+M0xTs0HJ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
Subject: Re: base_files 3.0.14 has dangling symlinks
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
X-List-Received-Date: Mon, 06 Sep 2010 04:15:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/08/10 10:54), J. L.  wrote:
> While trying to do a new image I came across this error is it anything
> to worry about? Or something that needs to be fixed?  Here is the
> error:
> 
> NOTE: Running task 8590 of 11052 (ID: 251,
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/base-files/base-files_3.0.14.bb,
> do_package)
> NOTE: base-files contains dangling symlink to /media/net
> NOTE: base-files contains dangling symlink to /media/card
> NOTE: base-files contains dangling symlink to /media/ram
> NOTE: base-files contains dangling symlink to /media/cf
> 

Worth looking into them I guess. Sometimes they may be ok when they appear
on root file system on target

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


