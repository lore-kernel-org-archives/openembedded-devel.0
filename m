Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCtgS-0008GL-RN
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 12:35:51 +0100
Received: by bwz19 with SMTP id 19so5941088bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 03:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=EX+tFHOmKGoazo1vmAdAbpz5pfO12xn20esxc6eTG8A=;
	b=Nw7sWl9Lga3oDEBb9c/vSYZkxd5kdjs9jGUcKwX/NFBmX3WjI/5hyV+6jCIZ0MPmlJ
	QzXsu0k4hpsS7KT4wZOjxEKAxmDttCMlkX6ypJZTOtZN3zsQ5Z37O09Aoe1wNyJvzzGY
	eKweH98tP0MjJxYdEYS04uAvJPmH17W1ODmdA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Iy8Rh2MhC4J2TF6naUEhEnIUZYE1ReCayYlARJMs2AFENzSND4xAIGSLFNZw7hT2Iq
	CYLeWsu3ZLBN9LOME8Sh7X4hmCKzqoJmZGss6+sq9UXCMhqWwH0IBDK+9q7BvmDhFul9
	yCCu30SeXm6YfLdZdLcG1iJGfrpawwvsdr1wM=
Received: by 10.204.155.65 with SMTP id r1mr6005820bkw.143.1259062459971;
	Tue, 24 Nov 2009 03:34:19 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1745001fxm.13.2009.11.24.03.34.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Nov 2009 03:34:19 -0800 (PST)
Date: Tue, 24 Nov 2009 12:34:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091124113424.GH28485@jama>
References: <E1NCsJm-0008Ly-9m@melo.openembedded.org>
	<20091124102028.GG28485@jama>
	<6ec4247d0911240309o4f296a6cy42dcbdad758afcc4@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <6ec4247d0911240309o4f296a6cy42dcbdad758afcc4@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : opkg-target,sdk: bump SRCREV
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
X-List-Received-Date: Tue, 24 Nov 2009 11:35:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2009 at 09:39:27PM +1030, Graham Gower wrote:
> Is there a reason why another update-alternatives exists at all?
> Wouldn't it be better to get fixes merged upstream?

I'm not sure what update-alternatives-dpkg in OE does different
grep -R  virtual/update-alternatives conf/distro
shows only mamona.conf using dpkg

Even with fixes merged upstream we should block installing own u-a with
images, because its really confusing to have one u-a in /usr/bin/ and
second in /usr/sbin/ and if someone in OE doesn't use opkg as pkg
manager then we still need virtual/u-a.

Maybe add
PROVIDES = "virtua/update-alternatives" to opkg recipes (the same for
-native) and switch default providers in distro configs?

> I would be quite happy to accept diffs.

You can consider u-a changes in
http://patchwork.openembedded.org/patch/1291/
should apply cleanly to your u-a, last time I checked it was the same as
unpatched update-alternatives-cworth in OE repo.

First 2 chunks are for use case, when I install new package foo-bar which
provides alternative for foo with same priority as some other package
foo-old before. 
Then I would like to use alternative from foo-bar if there is no
alternative with highest priority (foo-bar and foo-old have highest
alternatives installed)

Last chunk solves issue when you use update-alternatives for links to
directories, when new link is "installed" inside the old alternative
directory instead of replacing old link.

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


