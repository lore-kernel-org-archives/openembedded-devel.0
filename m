Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NUp9J-0002EB-09
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 23:23:44 +0100
Received: by fxm4 with SMTP id 4so19470031fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 14:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=r9oQn4yXLoF519yCMuZ0eP6J96lBqKyOsKJFQB7wJVs=;
	b=QAIXvaxgz4KEyY6YN9qvz3IqNbk3OcdTLLjbTSiynDgkio/V3OB+cNgo8Cwm+gvw6q
	BV4MP7xPl5aYq7gOcsvHgeA9GP/zDBj0SCIpzE6sI1+3ObJOfrGuqUVz7gzZQy704p9K
	doPNpaDfHRiteJnwVbLosWqipHPICjNQ8USOI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RtSbaP2C9Xjj4ySvr8dlOTcciRwPXopthW2X/AkEckIdT30KE0Tok0UBWOx03p9oYb
	64UBK5hGdLINQsqLxr5rhKwsJs47gySYC/aafz+WbaJpHUekjJekEf22xQSa4MgI4or1
	FRFVmcv28v/e2HLy+GR51lLAocTuQoO9GhLkE=
Received: by 10.223.95.72 with SMTP id c8mr4319651fan.73.1263334891275;
	Tue, 12 Jan 2010 14:21:31 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm559136fxm.10.2010.01.12.14.21.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Jan 2010 14:21:29 -0800 (PST)
Date: Tue, 12 Jan 2010 23:21:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100112222121.GD10781@jama>
References: <20100108132344.GB2156@jama>
MIME-Version: 1.0
In-Reply-To: <20100108132344.GB2156@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update-alternatives broken badly (by me :()
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
X-List-Received-Date: Tue, 12 Jan 2010 22:23:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Still no review/ACK :(.

I'll try to explain it better to show how bad it can be and even make
review easier.

We have target where sysvinit as init is crucial for successful boot (ie
SHR on freerunner) and u-a-cworth is installed on image, because
task-boot RDEPENDs on update-alternatives.

Let's start with image built after 2009-12-08.
u-a-opkg is used for in do_rootfs, but u-a-cworth is installed in image
too and is used by default.

T1) after flashing
  ipkg/alternatives/init        opkg/alternatives/init
    doesnt-exist                  /sbin/init
                                  /sbin/init.sysvinit 60
                                 ../bin/busybox 50
  =>sysvinit is used, everything is fine

good scenario:
T2a) sysvinit is upgraded first
  ipkg/alternatives/init        opkg/alternatives/init
    /sbin/init                    /sbin/init
    /sbin/init.sysvinit 60        /sbin/init.sysvinit 60
                                  ../bin/busybox 50
  =>sysvinit is used, everything is fine
  - newer file works but is incomplete

T3a) busybox is upgraded
  ipkg/alternatives/init        opkg/alternatives/init
    /sbin/init                    /sbin/init
    /sbin/init.sysvinit 60        /sbin/init.sysvinit 60
    ../bin/busybox 50             ../bin/busybox 50
  =>sysvinit is used, everything is fine
  - newer file works and is the same as opkg

bad scenario
T2b) busybox is upgrade first
  ipkg/alternatives/init        opkg/alternatives/init
    /sbin/init                    /sbin/init
    ../bin/busybox 50             /sbin/init.sysvinit 60
                                  ../bin/busybox 50
  =>busybox is used, device won't boot anymore
  - newer file is from cworth but is worse

T3b) sysvinit is upgraded
  ipkg/alternatives/init        opkg/alternatives/init
    /sbin/init                    /sbin/init
    /sbin/init.sysvinit 60        /sbin/init.sysvinit 60
  ../bin/busybox 50             ../bin/busybox 50
  
  =>sysvinit is used again, everything is fine
  - newer file works and is the same again

If we merge ipkg/alternatives and opkg/alternatives before T2b) there
will be no problem.

If we merge it after T2b) and then force busybox upgrade then we will
fix broken image too (as busybox is using probably the most u-a links
and has lowest priority). So busybox PR bump is good idea AFTER merging
u-a alternatives.

Worst scenario (where merger fails):
Tfsck) After T3a) or T3b) user intentionally remove sysvint package 
  (ie because he can boot even with busybox)
  ipkg/alternatives/init        opkg/alternatives/init
    /sbin/init                    /sbin/init
    ../bin/busybox 50             /sbin/init.sysvinit 60
                                  ../bin/busybox 50
  =>busybox is used, user is happy

then we run merge script (longer alternative file wins
=>sysvinit is used again, but without actuall /sbin/init.sysvinit file
in fs.. boot fails, user is sad. I think there is no way to distinguish
between T2b where newer shorter file is wrong and Tfsck where newer
shorter file is the right one (without checking opkg history..)

With images built before 2009-12-08 it should be simple
opkg/alternatives should be empty, all files from ipkg/alternatives are
just moved there..

Why would I like to add the same merge script to opkg?
1) someone maybe already removed -cworth from image with first sign of
   issues (but still too late) and -cworth postinst is still needed

2) task-boot will be fixed (RDEPEND on same u-a as
   virtual/update-alternatives-native) and user won't get -cworth update.

3) If I get new -cworth and busybox in one opkg upgrade batch, then I'm
   not sure which postinst will be executed first (we need -cworth first),
   but opkg maybe run own postinst before configuring other packages (ie
   portage does that completely even with restart of upgrade process)

Updated -cworth is already used in SHR (from shr/merge branch).

My shell foo is maybe not strong enough to check that everything is available 
in all environments and no bashisms were used..)

Thanks and please comment (I'll resend whole patch serie as soon as
someone confirms that's good path to go).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


