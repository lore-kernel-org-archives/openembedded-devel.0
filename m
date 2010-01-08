Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NTFxf-00039W-6k
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 15:37:14 +0100
Received: by fxm4 with SMTP id 4so16157449fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 06:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=xuHfVNM0+6pP/t8Z8fCfSgKFC00HwNCVUA7/bjpjt7Q=;
	b=nvbtPodgOnXFujfO5D7FrqK73gxeTH/peLkamkrkyV1TqSelJJBFPT9RiIDFlFS0Ml
	Y1Kj5ENlAt2MBeVMkBLzatm7ST5vibj0TRjXsIwe5+0MHZYV4pWK7J53DqYwLzDNi2t/
	OT10Sg+clMabWodI29MfnRW50Inthn0xHmsJk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TcTiOVyqF1LIL7BlPmnY5ubumYksfAm7xq8guSbcFDH1z3hyvI8sZ6ghFi0kfKt1ZR
	WSKvi+r+GgU0kz/WD3QD4wuT62Mvf/v4Q+TxbI/O/njr9uxIu5Haf8gq3V+2EYpm4x3K
	MdbqDqdq6vJ5zEtwCitGx9WuZR2LyBoAhQTtg=
Received: by 10.223.145.133 with SMTP id d5mr218399fav.57.1262961305156;
	Fri, 08 Jan 2010 06:35:05 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm8275317fxm.13.2010.01.08.06.35.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 06:35:03 -0800 (PST)
Date: Fri, 8 Jan 2010 15:35:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100108143501.GD2156@jama>
References: <20100108132344.GB2156@jama>
 <hi7e2e$cda$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hi7e2e$cda$1@ger.gmane.org>
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
X-List-Received-Date: Fri, 08 Jan 2010 14:37:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2010 at 03:05:03PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Can't we just make them both read from the opkg dir?
> 
> regards,
> 
> Koen

Yes this would be nice, but still we would need something for merging
those 2. Because in older image there would be better state in ipkg dir
if it wasnt upgraded much and in newer image in opkg dir.

Because here isn't newer == better :/. I would go with merging "longer"
files to opkg dir. It doesn't work only for users who intentionaly
removed some alternatives with highest priority after image creation.

But it will fail badly in this case:

root@om-gta02 ~ $ cat /usr/lib/ipkg/alternatives/init
/sbin/init
../bin/busybox 50
/sbin/init.sysvinit 60

root@om-gta02 ~ $ cat /usr/lib/opkg/alternatives/init
/sbin/init
../bin/busybox 50

If user have both busybox and sysvinit installed than longer version
from cworth will be merged and sysvinit used - usually good thing. But
if he removed sysvinit intentionally then after ie busybox upgrade init
will be switched to nonexistent file /sbin/init.sysvinit and won't boot
anymore :/.

I can send small patch with PR bump in -cworth,, patching it for opkg dir and
"merger" in postinst.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


