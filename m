Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9DE0-0007ps-Ic
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:43:48 +0200
Received: by fxm3 with SMTP id 3so497873fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=sPmeTkyYG0Vf0VKbjbvFi/vKv/hnx0+EPYJoYxvfgWg=;
	b=fIZhRn7hj5Av3TtwPuVH3b2PXZ0UO3jRAqdY3Vqa+O+SgqGaOS/g40kf6qHmxIlmJp
	tlJr15URU7O28a+l0JLo/YrzaVwZAOAlEMn0+C2HFxskY++pFLEpKANcFIa2nMpuFUv8
	36/s91kNxrj1enQQl6O8NRKY90AxVyfGCe3RY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=g88kkEA/+MoZhEHLyxemoV7VJWI3pzdMTF3MeFUhZUKa6OKBuPw1Yf2PLnDxRdUZ/M
	4DwPE+hR7I+tR16Ctz27WOlaTohN3nzQR2Rug9kbvKp0QK5baX+rZ39wcjzc1GF2Fi9D
	zVmzdJbkmrVAlJlJuZPBz6eypdD4ewmfbLNJw=
Received: by 10.103.134.8 with SMTP id l8mr2946617mun.34.1287736976121;
	Fri, 22 Oct 2010 01:42:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k21sm1304544faa.25.2010.10.22.01.42.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 01:42:55 -0700 (PDT)
Date: Fri, 22 Oct 2010 10:43:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101022084301.GD3527@jama>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
	<i9rbsq$tad$1@dough.gmane.org> <20101022065559.GC3527@jama>
	<AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork cleanup call
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
X-List-Received-Date: Fri, 22 Oct 2010 08:43:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 09:32:19AM +0200, Frans Meulenbroeks wrote:
> Nice ideas, but....
> 
> As far as I see it there are two often occurring situations:
> 
> - a patch is submitted for review and gets zero feedback. I have quite
> a few of these in patchwork. I once proposed that if a patch does not
> get neg feedback in two weeks or so it could be pushed anyway. While
> this got some positive response it was never really made a policy. But
> I must say I'm becoming more and more inclined to push them anyway.

Maybe it's not written as policy but as koen said, send ping and if
still no reply then probably nobody cares it being pushed (so you can
push it).

> - a patch is submitted by someone without commit access but no one
> picks up the patch.

ping stating that author has not commit access would be nice

> In either case if patches just get archived without being looked at,
> it'll probably have an adverse effects.

Agreed

> But we of course still have the problems that
> - people nak recipes but do not update patchwork
> - patches receive improvement suggestions and are not updated in patchwork
> - new versions are posted but patchwork is not updated.

All 3 cases seems like author fault, sometimes I've contacted author for
patch update and never received reply :/.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


