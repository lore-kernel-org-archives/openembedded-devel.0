Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O2sXk-0005ng-45
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 22:53:42 +0200
Received: by fg-out-1718.google.com with SMTP id 19so1232251fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+DAnHDOBFL/z5tPs8EHZihJEs8lyzHxRJk2wIyQunZ0=;
	b=v2pp9AC/C18tmfWzyX88vQrpBogw5PtvydhvaNilON8s1YLoikGFu7i+luAlu/WisE
	Q7tuu+WPD/iejvmF5BdvCSu+QcIdWRfqNVaQxOejgS0ZCLyQVdL4XZVsAKEFzB9xuswo
	WpkVwa7Fl5CN+KC8HJyOimGztS6TNsW3y3yfA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pFSA+mkcAwPd7u2146/PeTJnfvPgzxi0QB9+3s+V8W4t4BjD9lVr2lvs3ymIKsF1IA
	g0++6usMCC3ZZ6rAnyxGIL0WKlDaA3QHymytBDlVRFOimufbhrqxBpm/I/YQy9PR6uE5
	6BCjI7brKt/ASBSbMEjUU78JWcYIhZ46jOBJo=
Received: by 10.223.98.19 with SMTP id o19mr947531fan.80.1271451011602;
	Fri, 16 Apr 2010 13:50:11 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 26sm4753262fks.22.2010.04.16.13.50.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Apr 2010 13:50:10 -0700 (PDT)
Date: Fri, 16 Apr 2010 22:50:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100416205011.GC3323@jama>
References: <20100416123920.GB3323@jama> <hq9ogk$k1j$2@dough.gmane.org>
	<201004161541.23250.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201004161541.23250.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Do we really want shared Xserver script for all machines?
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
X-List-Received-Date: Fri, 16 Apr 2010 20:53:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 16, 2010 at 03:41:22PM +0200, Marcin Juszkiewicz wrote:
> I did send RFC about it on 3rd August 2009. Merged it into stable/2009 in
> October 2009 as we used it on BUG 1.x and 2.0 devices.
> 
> So far I did not noticed anyone using it. For those which use 

I guess this is because task-x11-utils pulls xserver-kdrive-common
unconditionaly.. I've added variable there for distro to pick provider
easily and after some test I'll send it for review.

> xserver-nodm-init script to boot into root X11 session: you need newer
> version from BugLabs repository:
> 
> svn://svn.buglabs.net/bug/trunk/com.buglabs.build.oe/meta-bug/packages/xserver-nodm-init

In patch I have now, I renamed old version to 1.0 and added version from
buglabs as 2.0 with D_P -1. Not best solution as it allows people to use
old xserver-kdrive-common + this newer nodm-init, but comment above D_P
setting should be enough for maintainers to notice.

Thanks hrw, pity that we overlooked xserver-common for so long..

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


