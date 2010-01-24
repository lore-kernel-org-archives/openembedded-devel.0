Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NZ4fd-00014U-Hk
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:46:40 +0100
Received: by fxm6 with SMTP id 6so895472fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HOANu1YVpBn0ratTZ48CFCQp790hD99Csg2na1v5jAs=;
	b=Yx5IUDCgjr9/wPItK73Ivgm2p7NCfJ+snXU+xTGMPRSYVUFdzkfY1GulPDJ+Wws3et
	npONHeLkVpLh2AUsJXOJFZUDb1p1M3wgDy3WrROUVdQQr/hahl5zc8gaqoukmN0P6RV4
	KzJezbYf9GuDDdvzs4lHxKYRK8jspWW+RnqQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=s3WFglziz7AJxIvuN9WFkPlY1v/kemF6cBakJ3pi7OEPo81rMYNjExl4GDP4rgUV7v
	T35ayiUg18T0dctZnxosKym65IlrRes3ROtrAqVxbpUIt6rLX65Wf1JlvZJRb4yvT47J
	iZhdPxbXbwnmmEEgGoPNlZRiiVSuUmVfZmRKw=
Received: by 10.223.63.8 with SMTP id z8mr5569239fah.89.1264347857697;
	Sun, 24 Jan 2010 07:44:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2272126fxm.12.2010.01.24.07.44.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 Jan 2010 07:44:16 -0800 (PST)
Date: Sun, 24 Jan 2010 16:43:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100124154357.GG15943@jama>
References: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
	<9210BA9D-8420-46C3-BDD6-CEE4E853B42F@mac.com>
MIME-Version: 1.0
In-Reply-To: <9210BA9D-8420-46C3-BDD6-CEE4E853B42F@mac.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.214
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Build failure module-init-tools-cross_3.2.2.bb on Fedora 12 x86_64
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
X-List-Received-Date: Sun, 24 Jan 2010 15:46:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 24, 2010 at 07:37:36PM +0400, Elvis Dowson wrote:
> Hi,

Hi

> | /usr/bin/ld: cannot find -lc
> | collect2: ld returned 1 exit status
> | make: *** [insmod.static] Error 1

Thomas White had the same problem and reported that:

in F12 there's a separate package for glibc static linking
ok, after installing the static package, it works

Not sure if it's correct fix (I would expect that static libc should be
in staging already for module-init-tools-cross), but you can give it a
try.

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


