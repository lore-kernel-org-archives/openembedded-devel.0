Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PJTVr-0003FI-2C
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 17:08:39 +0100
Received: by fxm11 with SMTP id 11so2846933fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 08:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=iclQMHaVODGXH/SurxFCWj/N3GK4Olq69ezYejnqNoE=;
	b=LBLiRXZz6exZCKVrog855+U9tyJj/xymeCk81IvbIEQ++j+X9AkSMCsDFN31e8fR07
	8/mOeAw+iY0CLwk09veTi/F9f5RxIIWxzCw9X9BeljOr4xa04HyLJAze8QrS+i4YX4Sb
	y3IiVb5X59XkfBrROHI7cgjJPnHOKyCXlI1l4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=B5eT2xhbd0KGbKxx17yl4Qe8GcRE7T5Cls6aMH/sgwLGjBlPij6+TRTlCn8ocNMTWV
	9pg1ioxmi0NwKQn3TBvSaW+H6RKhjiHUBAtMB5Ky41iQA7cLNwPpg04OzSGNtJP/JZaY
	JZL2Ah+RPl42Cf5Y22KsQzM6MOPwKhdM5LbTc=
Received: by 10.223.72.195 with SMTP id n3mr1054063faj.132.1290182838524;
	Fri, 19 Nov 2010 08:07:18 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm561355fal.24.2010.11.19.08.07.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 08:07:15 -0800 (PST)
Date: Fri, 19 Nov 2010 17:07:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119160716.GD3411@jama>
References: <4CE69DDB.9030500@atmel.com>
MIME-Version: 1.0
In-Reply-To: <4CE69DDB.9030500@atmel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: parsing error while building from scratch: literki_git.bb
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
X-List-Received-Date: Fri, 19 Nov 2010 16:08:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2010 at 04:55:07PM +0100, Nicolas Ferre wrote:
> Hi,
> 
> While trying to build from scratch the latest .dev branch with:
> - at91sam9m10g45ek machine
> - angstrom-2010.x distribution
> - bitbake 1.10.1
> 
> I have the following error just after bitbake parsing .bb files:

what does it show if you do
git ls-remote http://git.senfdax.de/git/literki master
in terminal?

are you using BB_LOCALCOUNT_OVERRIDE and/or BB_GIT_CLONE_FOR_SRCREV (ie
in your local.conf?

Regards,


