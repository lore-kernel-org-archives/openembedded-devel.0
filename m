Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LlqjQ-0003Py-5a
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 21:26:48 +0100
Received: by qw-out-1920.google.com with SMTP id 5so1084210qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=whmaXnx/cArBAdRsjpPUdoA1D6snmOt2mNmO5pxzLk8=;
	b=Wqqv24heYBwnWm/AWoEXQfheIHuCPCRP834/FCMkgPA1vyZagYyCksZwcDslN+8m/p
	eCw3RtM3Af46QNlhftljKOeRtlysN6znAhm/NV2c3heJCldc+t716zSximJ0bSG+U8mt
	Hk5O5vuuzKDkvvWg1DOY+L1PPzj69oHcrnkD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=BflweVCRocay+YR9FteAHm9LW08JFnfcArxeuwv0y81RSOXAWFQqMBdLZey8/Ljfzk
	EaZqPGz3skU5KhyGcC1CPmE25OVBy/L9oZrw7KE1lG/062MaXq0RadshZVunAWDordzc
	/Bj0yg+lPRv/6B0dz0j7dla0YbB+68QlYWx2U=
Received: by 10.224.73.208 with SMTP id r16mr8101088qaj.45.1237839923997;
	Mon, 23 Mar 2009 13:25:23 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm9946899ywn.2.2009.03.23.13.25.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 13:25:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 5F623610054; Mon, 23 Mar 2009 17:25:19 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902140035.13820.khimov@altell.ru>
	<200902171525.28995.khimov@altell.ru>
	<877i2g63wr.fsf@neumann.lab.ossystems.com.br>
	<200903232137.43902.khimov@altell.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 23 Mar 2009 17:25:19 -0300
In-Reply-To: <200903232137.43902.khimov@altell.ru> (Roman I. Khimov's message
	of "Mon, 23 Mar 2009 21:37:43 +0300")
Message-ID: <87tz5k3s28.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Mon, 23 Mar 2009 20:26:48 -0000
Content-Type: text/plain; charset=us-ascii

Roman I Khimov <khimov@altell.ru> writes:


[...]

>> Mind to fix it?
>
> Sure, I'll fix it this week and will try to push even more things as I'm 
> sitting now on a bunch of patches and have zero time to push anything 
> upstream.

Nice, thx.

> OK. Also, as I've seen Khem had issues trying to build siproxd and even had 
> fixed some of those (original recipe worked fine for me), I've set up two 
> sample testing configs with x86-prescott and qemuarm machines and with 
> plain Angstrom distro. So I've tried to put siproxd in there expecting to 
> reproduce something and discovered another thing - that it wants libosip2 > 
> 3.0.0 while Angstrom has 2.2.2 in preferred.
>
> What's the best way to handle that and specify that siproxd wants libosip2 > 
> 3.0.0? Or it shouldn't be handled in recipes in this cases and I'm just 
> switching to minimal or something and proceeding?

This is a distro setting, you shouldn't worry about it in your recipe.

If Koen thinks it should be the default, he will handle the preferred
version change by himself.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


