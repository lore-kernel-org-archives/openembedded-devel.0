Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ni27h-0001mO-PT
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 09:52:41 +0100
Received: by fxm25 with SMTP id 25so311464fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 00:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Pz1ygoLYa6R3mex3/Q3sFMplbEmkIz1gPqZ3LoGXdts=;
	b=lFOsEqRp+8IgFWc1rwb+oNof/8/T7CIkumza25Rd2kuDhH3ViJQIWeZXe+zEeV64fi
	nGO6xIdHka2L8bcDi/L2FD3XKhOVLW2FZ39nEHeL4JLmGVZL7FiIwlOlD/xgPSRSzx1n
	AIuP/K8wIqRTUlUXQUIY/KvY2gR6zMB/OYvGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=MectcjMVx/aW6pImg+gGxQw5y7+ajYeFJ3wtwty6hGVMPySImsEs3XDQAIcazPWyHJ
	2PJt91GUt54HUJtslcmoa71k5hPsdIsXujOf6zWsNDbsvZrU3es38h8jnIoookO4fCyt
	YPFVvJoFMe7ILco4zS2Zp1Oo6es/yq1+Z8Zyo=
Received: by 10.223.26.216 with SMTP id f24mr1070957fac.20.1266482997298;
	Thu, 18 Feb 2010 00:49:57 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm4573897fxm.13.2010.02.18.00.49.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Feb 2010 00:49:55 -0800 (PST)
Date: Thu, 18 Feb 2010 09:49:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100218084932.GM3233@jama>
References: <E1Nhfko-0005L8-Mc@melo.openembedded.org>
	<20100217104816.GJ3233@jama> <hlgk42$774$1@ger.gmane.org>
	<201002172046.30607.holger+oe@freyther.de>
	<hlhhfs$ik1$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hlhhfs$ik1$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Jeremy =?iso-8859-1?Q?Lain=E9?= <jeremy.laine@m4x.org>
Subject: Re: Koen Kooi : qt4: add 4.6.2
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
X-List-Received-Date: Thu, 18 Feb 2010 08:52:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 17, 2010 at 08:53:34PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 17-02-10 20:46, Holger Hans Peter Freyther wrote:
> > On Wednesday 17 February 2010 12:32:20 Koen Kooi wrote:
> > for me.. but if it's right way, then it should be
> >>> integrated to .inc files instead.

Thanks for ACKs :).

I guess that part for integrating to .inc is left for me..

But I've seen that -L -I configure params used in non-native .inc
already, so it should be safe.

Do you remember why LFLAGS was introduced? patch is from 4.3.3/4.5 and I
guess it's not needed anymore at least for any 4.6*.

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=8f61b0343b6c56644fdaa8fa3e84e1c29d3f47b9

I would drop it from 4.6 and let in 4.3 and 4.5 as I'm not
really looking forward for rebuilding all of them.

Regards,

> >>
> >> Your patch looks good to me, but I'd like zecke to comment on it. Holger?
> > 
> > Can't hurt..
> > 
> > Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>
> 
> Acked-by: Koen Kooi <koen@openembedded.org>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFLfEk+MkyGM64RGpERAlK/AKCYaiWxXnDLcIsd61mlXzR/kMBV6ACeJ3Bf
> wgQMARXWGwbflsBAs5VxkPY=
> =qnz/
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


