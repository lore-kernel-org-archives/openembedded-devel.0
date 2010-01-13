Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NV4V2-000852-DR
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 15:47:11 +0100
Received: by fxm4 with SMTP id 4so20016571fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 06:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HaYg8iaPR4RoYMHpQ1CFXUm91Ct79A8mYhzPDglIMRc=;
	b=lMOhXxK7e9osJn0bN/qNnLhXHwRsUR8SRo0Cmz96azCLZVxt/Uh5yXIl7suOt4aON3
	wFH4yz615NCrZLF1CoE7qau88S1rIKLnMb2VkAg2/VL88I4WVw+s9K86EwYArdzvYUCa
	6gJPXwTxFuecLpwugrE2ZDchThdMvGPZCjkAc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QrspAMT/N6SjN4PUruJes64kwPiKBrajU37d2HWd5bvBL022XdVaOVX8o8vOqE2uAj
	3sMr8Y3afjgR+Nwc059TcEl2HJHo4imun2VtGocDqhusUc7wd+JuSts0OSNHio7hmAho
	T+t0hhgS5fFOjzkscFLIZlt+66ORAEIVXPJY0=
Received: by 10.223.22.81 with SMTP id m17mr3512453fab.28.1263393898257;
	Wed, 13 Jan 2010 06:44:58 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm10806352fxm.4.2010.01.13.06.44.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Jan 2010 06:44:56 -0800 (PST)
Date: Wed, 13 Jan 2010 15:44:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100113144449.GF3340@jama>
References: <20100108132344.GB2156@jama> <20100112222121.GD10781@jama>
	<hik08h$l2q$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hik08h$l2q$2@ger.gmane.org>
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
X-List-Received-Date: Wed, 13 Jan 2010 14:47:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2010 at 09:29:05AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 12-01-10 23:21, Martin Jansa wrote:
> > Hi,
> > 
> > Still no review/ACK :(.
> 
> They seem to look decent enough, but I lack the time to test them, so
> feel free to apply them
> 
> regards,
> 
> Koen

Thanks, pushed.

and small warning.. 

buildhost with u-a-cworth staged from times before 2009-12-08 should be
also "fixed", because after P_P_virtual/update-alternatives-native
change is not -cworth-native upgrade with opkg patch pulled to build and new 
image is still using old u-a-cworth and store alternatives in /usr/lib/ipkg/.
u-a-cworth-native should be removed or at least upgraded.

shr@opmbuild:~/shr-unstable$ find tmp/staging/ -name update-alternatives
tmp/staging/x86_64-linux/usr/sbin/update-alternatives
tmp/staging/x86_64-linux/usr/bin/update-alternatives
shr@opmbuild:~/shr-unstable$ bitbake -c clean -b openembedded/recipes/update-alternatives/update-alternatives-cworth-native_0.99.154.bb
...
shr@opmbuild:~/shr-unstable$ find tmp/staging/ -name update-alternatives
tmp/staging/x86_64-linux/usr/bin/update-alternatives

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


