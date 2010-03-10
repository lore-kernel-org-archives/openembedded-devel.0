Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NpONG-0006dt-HA
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 17:03:14 +0100
Received: by fxm20 with SMTP id 20so8461403fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 08:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ertHfjbb9NB3+x2C7kBjc/k5Zrm4IAe11SDa6+NSXqc=;
	b=Wsx1lZcpNECJWtkjSBPep8iiHUWSaWo5BcBhGaYERXPinoaXvynoRdN8sITsgZBCKx
	evVGvgsMjXuJ7N91MyPE9x5LgkXeWievYuWZROQZ+0paAjUeywxU2Gw6r+bMduUcqgiQ
	4ZcOe+ow4OvHMg5nuC8zXz8VnQvrBE2nPo6mI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IWvpKXwJUv9Xt9bkcZJ7la1wRCqbsjipOuqsn98nFu6cKyW+wfmFhfrGZlt+JJcAYm
	Aaq3ywqyVmM/3/m+7BF+Oa00ueUHj10bIP4LIvor6+6zxjUcPzPCx13OKFz/XdI5z1nu
	WKFOmYLEVCaVQxGSa6KtgiwaR9LUc2OMqmCe0=
Received: by 10.223.5.75 with SMTP id 11mr1840819fau.46.1268236808967;
	Wed, 10 Mar 2010 08:00:08 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm259730fks.42.2010.03.10.08.00.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Mar 2010 08:00:08 -0800 (PST)
Date: Wed, 10 Mar 2010 17:01:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100310160116.GO31945@jama>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
	<20100228221056.GG30145@xora-desktop.xora.org.uk>
	<ac9c93b11002282328l61356cc1y188b47d0f974369e@mail.gmail.com>
	<ac9c93b11003100744g5eee3250me7f0b668e8727060@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11003100744g5eee3250me7f0b668e8727060@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Wed, 10 Mar 2010 16:03:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2010 at 04:44:48PM +0100, Frans Meulenbroeks wrote:
> Time for a summary I guess:
> 
> original proposal from me:
> Probably the best scenario is to remove all versions which
> - are not the latest version
> - are not  pinned with  PREFERRED_VERSION  in conf/distro/*
> - do not have the largest DEFAULT_PREFERENCE

I think this rules are quite strict, in first iteration would be enough
to keep only latest from each "major" version

where major version is defined by common-sense (ie first 2 version
number for xorg, but somewhere first number is enough)

ie for xserver-xorg:
../dev/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
../dev/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
../dev/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
mv ../dev/recipes/xorg-xserver/xserver-xorg_1.4.bb
mv ../dev/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
../dev/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
mv ../dev/recipes/xorg-xserver/xserver-xorg_1.7.1.bb
../dev/recipes/xorg-xserver/xserver-xorg_1.7.4.bb

and update preferred-xorg-versions (1.7.1->1.7.4) and other if needed

> opinions:

JaMa: move older minor versions to obsolete, keep latest for each "major"

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


