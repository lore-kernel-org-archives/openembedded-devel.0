Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCXVW-00041k-Mg
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 14:27:19 +0200
Received: by fxm11 with SMTP id 11so1168339fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=I88Qhk2nKs2lrwNei+AhbjsA7cHYjdTXLjTUCHXugkg=;
	b=qiOjbCHyVPaiIPeBmul9sk8w4LBK2WnCR9V69pqUc0umNEHbEIX3AIchCBOLiS7ZEm
	EKYzEMu+LTtOQYqFZFyYS1N0ytbOjrx1r1g2NfSZQZJWL9oma0/EsLYicaUBmzlc8oGF
	2FMhYNQyW7tGS0Xy926BJV6MX4qIAhxyjwHEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=c9zogbv57TBE4IA37FnYuQ6z02WMX+5S8BzwyBEjQjid4Rloz9vSQ/yH6yAf625Hft
	8NrK3SFvoDlVnu/hV0hBljOY3QFiUoK6Xpv+v6XPTkTjhC6VG+6MpcWEvr8LcU03ozym
	HDcnkwl3Fa4veLqM6o8A6v+WXWF2tSMtSky9w=
Received: by 10.223.56.206 with SMTP id z14mr9985060fag.97.1273753403653;
	Thu, 13 May 2010 05:23:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm5619358fad.10.2010.05.13.05.23.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 05:23:22 -0700 (PDT)
Date: Thu, 13 May 2010 14:23:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513122324.GL3370@jama>
References: <alpine.DEB.2.00.1005122030010.2471@lynx>
	<alpine.DEB.2.00.1005130808100.8347@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1005130808100.8347@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: current error: fetching enlightenment
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
X-List-Received-Date: Thu, 13 May 2010 12:27:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2010 at 08:09:03AM -0400, Robert P. J. Day wrote:
> 
>   not to sound naggy but any proposed fix for this?
> 
> On Wed, 12 May 2010, Robert P. J. Day wrote:
> 
> >
> >   just did a "git pull" followed by a bitbake fetchall and ...
> >
> > ...
> > NOTE: Update
> > svn://svn.enlightenment.org/svn/e/trunk;module=e;proto=http
> > svn: Failed to add directory 'src': an unversioned directory of the
> > same name already exists
> > NOTE: Task failed: Fetch failed: Fetch command export
> > HOME=/home/rpjday; export SSH_AUTH_SOCK=/tmp/keyring-Ll3M8v/ssh;
> > export
> > PATH=/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/sbin:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/usr/bin:/home/rpjday/oe/angstrom-dev/cross/armv7a//bin:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/sbin:/home/rpjday/oe/angstrom-dev/sysroots/x86_64-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
> > /usr/bin/env svn update -r 48775 failed with signal 1, output:
> > svn: Failed to add directory 'src': an unversioned directory of the
> > same name already exists

cd /OE/downloads/svn/svn.enlightenment.org/
svn stat to check why do you have unversioned src dir here
or just remove this dir and download again

> >
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of /home/rpjday/oe/openembedded/recipes/e17/e-wm_svn.bb
> > do_fetch failed
> > ERROR: Task 439 (/home/rpjday/oe/openembedded/recipes/e17/e-wm_svn.bb,
> > do_fetch) failed
> > NOTE: Tasks Summary: Attempted 1331 tasks of which 1331 didn't need to
> > be rerun and 1 failed.
> > ERROR: '/home/rpjday/oe/openembedded/recipes/e17/e-wm_svn.bb' failed
> 
> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>             Linux Consulting, Training and Kernel Pedantry.
> 
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


