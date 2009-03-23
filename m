Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Llp41-0006wr-01
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 19:39:57 +0100
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Llp2c-000LXR-Vk
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 21:38:31 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2009 21:37:43 +0300
User-Agent: KMail/1.9.9
References: <200902140035.13820.khimov@altell.ru>
	<200902171525.28995.khimov@altell.ru>
	<877i2g63wr.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <877i2g63wr.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Organization: Altell Ltd.
Message-Id: <200903232137.43902.khimov@altell.ru>
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
X-List-Received-Date: Mon, 23 Mar 2009 18:39:57 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Otavio Salvador:
> Roman I Khimov <khimov@altell.ru> writes:
> > Otavio Salvador:
>
> [...]
>
>
> [...]
>
> > +do_install_append() {
> > +	mv ${D}/${sysconfdir}/siproxd.conf{.example,}
> > +}
>
> [...]
>
>
> This is bashims, it would be better to use expanded commands
> instead. Except from it, it looks OK for me.
>
> Mind to fix it?

Sure, I'll fix it this week and will try to push even more things as I'm 
sitting now on a bunch of patches and have zero time to push anything 
upstream.

OK. Also, as I've seen Khem had issues trying to build siproxd and even had 
fixed some of those (original recipe worked fine for me), I've set up two 
sample testing configs with x86-prescott and qemuarm machines and with 
plain Angstrom distro. So I've tried to put siproxd in there expecting to 
reproduce something and discovered another thing - that it wants libosip2 > 
3.0.0 while Angstrom has 2.2.2 in preferred.

What's the best way to handle that and specify that siproxd wants libosip2 > 
3.0.0? Or it shouldn't be handled in recipes in this cases and I'm just 
switching to minimal or something and proceeding?


