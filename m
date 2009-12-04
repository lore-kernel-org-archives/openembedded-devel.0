Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NGYFQ-0005He-QN
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 14:31:03 +0100
Received: by bwz9 with SMTP id 9so1870267bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 05:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vqi6td7Yv8+L8sLxessDFwq4GE5DFoM8xHw9VdPJuc8=;
	b=M7HAUmHCuTry55S4IOzLEg1aWlLfYC+m77fAXhgDgh/Y3skcT0xuT8PK4lptotlB3c
	XElxVEFM2k2lRWJm4q1Cgw6hcAgOqLn9sl35Mrb0NjMEDH2jYcm/LaigtT4sW+aj9otL
	rJkcS7+SDu5Y1GEqM3kqX8XMsKJCUmOlQfPkA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aC93njhVdhhVDDomQnLT2ejerZXUo3g8zMYGNNbNV12fOetQJ+1sXXttPoR80gu9a2
	HKJ9AcX6K1WRGZj8VWnTDLfRTewyX42mZKzqhfwqGrnYvZOGxs9Tvw6CoTX0Go10p8nJ
	mVDvwsZ/uKkCcwmEZ1a56Px293CnIkDMKVE3g=
Received: by 10.204.154.219 with SMTP id p27mr3239944bkw.115.1259933363279;
	Fri, 04 Dec 2009 05:29:23 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1091503fxm.5.2009.12.04.05.29.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Dec 2009 05:29:21 -0800 (PST)
Date: Fri, 4 Dec 2009 14:29:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091204132917.GB13717@jama>
References: <E1NGUiP-00061U-6s@melo.openembedded.org>
	<141020e30912040151l26670979g9cb02c4d4539da38@mail.gmail.com>
	<20091204095951.6846190d@xora.org.uk> <20091204100443.GA13717@jama>
	<hfanak$9l5$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hfanak$9l5$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: David-John Willis : font-util: Add 1.1.1 target and native.
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
X-List-Received-Date: Fri, 04 Dec 2009 13:31:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2009 at 11:12:36AM +0100, Koen Kooi wrote:
> On 04-12-09 11:04, Martin Jansa wrote:
> 
> >Should I merge oe.dev to that "short lived" xorg-7.5 branch? (lots of
> >commits but better to resolve conflicts once there than in every
> >distribution tester who merge that branch as shr do).
> 
> That'd be nice.

Pushed..

woglinde suggested pushing remaining recipes with 
DEFAULT_PREFERRENCE = "-1"
I would add
DEFAULT_PREFERRENCE_shr = "1"
as we are already using it without include for preferred-xorg-versions,
can I merge that branch with those 2 in all new recipes (except util-macros
and font recipes)?

Or can Angstrom include
preferred-xorg-versions-X11R7.4-updates.inc
+ updates already used in Angstrom (ie util-macros, pixman, fonts). Then
I could merge it without DEFAULT_PREFERRENCE change..

Thanks
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


