Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Odon1-0006c0-4y
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 20:22:08 +0200
Received: by bwz10 with SMTP id 10so3728575bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Zr4Di/MxoTU9YpLBIAmuiCADes81ilzO2E0bXr/lGoY=;
	b=X2M/LVID8O80SBRwfCKNa0xbMCWfjVGhsZd1k+qUI17/9MxbKW5LCCDob9lxfZ53Ey
	Ag1K8A97K+f8vBQtpte61TWXaCSWKwP5OgLYuJDVUR3mzPfHB5yDLTZMrFE+cKL9fOZJ
	TdFULrVeC1c+R0RI+KQDHRyOgVwmpyon9Y3J0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ii2ooby7xs3f4rQdNOx1umatM+721nx/APL/RY/5JRx4XEPJw/IKSlbkvUCgUES8UI
	sLz3oCcB5mkQ8LI103jU+mOlFxxEet2XCTwcY8BUtjb4m9BN6wyo7ZnmcpaVOcUxhzsF
	Jwpn6Z5hS1Jhx8bbZO75xkpBAC5w+YqzMzMcs=
Received: by 10.204.33.86 with SMTP id g22mr7001307bkd.26.1280254911537;
	Tue, 27 Jul 2010 11:21:51 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id f10sm4057725bkl.17.2010.07.27.11.21.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 27 Jul 2010 11:21:50 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Odomc-0007jn-E7; Tue, 27 Jul 2010 20:21:42 +0200
Date: Tue, 27 Jul 2010 20:21:42 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100727182142.GA29621@mx.loc>
References: <AANLkTikZkRU-dCiBNlVdZ6XYsdBk3MjZBksexc6JtSAT@mail.gmail.com>
	<i1qodg$i28$1@dough.gmane.org> <20100717000603.GK23169@mx.loc>
	<1279373863.21888.10.camel@lenovo.internal.reciva.com>
	<AANLkTimFuoxBKczjwGexQZAVGwEXqkHqfSbCf7xf7x90@mail.gmail.com>
	<1279394951.21888.31.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1279394951.21888.31.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: busybox mdev
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
X-List-Received-Date: Tue, 27 Jul 2010 18:22:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 17, 2010 at 08:29:11PM +0100, Phil Blundell wrote:
>I'm not familiar with that recipe and I don't seem to have a
>micro-base.bb in my tree.  But, if it's sucking in udev, it sounds like
>a bogus dependency somewhere.  You can use bitbake -g to find out where.

my bad, i ment micro-image.

i'm doing this now locally, fwiw.
cheers,

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 26265a6..74989b5 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -5,7 +5,7 @@
 #@MAINTAINER: Martin Lund <mgl@doredevelopment.dk>
 #@COMMENT: This distribution configuration defines a truely tiny OE Linux  
 #@COMMENT: distribution. The matching buildable image target (micro-image)
-#@COMMENT: basically consists of: libc, busybox, udev, sysv init, and a few
+#@COMMENT: basically consists of: libc, busybox, sysv init, and a few
 #@COMMENT: init scripts for running up the system.
 #############################################################################
 
diff --git a/recipes/images/micro-image.bb b/recipes/images/micro-image.bb
index c2cff93..19cb53b 100644
--- a/recipes/images/micro-image.bb
+++ b/recipes/images/micro-image.bb
@@ -23,7 +23,7 @@ IMAGE_LINGUAS = ""
 IMAGE_LOGIN_MANAGER = "busybox"
 
 # Include minimum init and init scripts
-IMAGE_DEV_MANAGER = "udev"
+IMAGE_DEV_MANAGER = "busybox-mdev"
 IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
 IMAGE_INITSCRIPTS = ""
 

>
>p.
>
>On Sat, 2010-07-17 at 17:09 +0200, Bernhard Reutner-Fischer wrote:
>> Baking micro-base (not -image) tries to build udev for me?
>> 
>> On 17 Jul 2010 15:39, "Phil Blundell" <philb@gnu.org> wrote:
>> 
>> On Sat, 2010-07-17 at 02:06 +0200, Bernhard Reutner-Fischer wrote:
>> > (what's the reason micro-base u...
>> Er, does it?  My copy of micro-base-image.bb says:
>> 
>> # Include minimum init and init scripts
>> 
>> IMAGE_DEV_MANAGER = "busybox-mdev"
>> IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
>> IMAGE_INITSCRIPTS = ""
>> 
>> If it's using udev then that is definitely a bug.
>> 
>> p.


