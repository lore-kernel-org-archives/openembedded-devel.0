Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PBqNj-0000UB-Q3
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 16:56:40 +0200
Received: by bwz10 with SMTP id 10so2597154bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=VPSahHN7ee3vs/TeRmWtKQZjyw7CcNW+0zaAnlA0Aqc=;
	b=T4Ic7OY4c5yp0wgmy9YxbCsZiz3ybJMuBcOY9OVqFE9XFFa0uIq59bxbFeIqjvRQq5
	8gG3Hjxbfu3YEoWi4g7vNMWoPF+CRuCD4FToluXyMfgpInkSbSSXUIZiba7lqBPd7B69
	MvjaYLde0wycbzcFXEN+v+Td5TVON+lXnkQBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iIkDCnF+hqs+QPhxgalEC5olyDRp8zVCOFbevnPzYSuGqh70hwd64KvRw3Ms1S9lGV
	o3oXxhQ+fIsFEjpkS7PspjZ9mqEKR2iz8TdGJhR9vOa1zt52cs1s4uzPr/oaClRSBI3L
	3g9LBTVp/jEcA5ddZqu5Tsuz9ddII74BpKDH8=
Received: by 10.204.51.142 with SMTP id d14mr6560166bkg.48.1288364156364;
	Fri, 29 Oct 2010 07:55:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm914967bkw.2.2010.10.29.07.55.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 Oct 2010 07:55:38 -0700 (PDT)
Date: Fri, 29 Oct 2010 16:55:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101029145536.GA3206@jama>
References: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Alex Ferguson <thoughtmonster@gmail.com>
Subject: Re: [PATCH] classes: Modify rootfs_ipk.bbclass for -force-overwrite.
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
X-List-Received-Date: Fri, 29 Oct 2010 14:56:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 29, 2010 at 05:08:54PM +0300, Alex Ferguson wrote:
> Rationale: In Jlime we ship a package called jlime-extras which
> contains several files (configuration files, scripts, etc.), some
> of which conflict with files provided by other packages. This is
> intentional, and is for distro customization purposes. For example
> we ship a modified version of the /usr/bin/startx script, some
> alternative icons for applications, some modified .desktop files
> and so on. Building an image with this jlime-extras package fails,
> of course, due to conflicting files.

Why not modify the original files in corresponding recipes with distro
override?

Problem with this kind of package overwritting other packages is when
original package is upgraded (PR bump or even just DISTRO_PR) it forces
user to also use -force-overwrite and then he will loose those
customizations.

I don't have problem with it as long as it's conditional, but I would be
very carefull with using it. IMHO this is good only if you're building
images which are not supposed to be upgraded by user with ie opkg on target.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


