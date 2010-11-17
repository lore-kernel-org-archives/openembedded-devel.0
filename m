Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1PIdkD-0003gz-LR
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 09:53:55 +0100
Received: by ewy6 with SMTP id 6so715378ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 00:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:reply-to:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=xfsWVufWiGEPKIwfVGlfgyIxE6KwuKrgqv7++EtmFZ0=;
	b=ofZytpSAejVY/A3emEnY7Hu2Vm6tCNExRW+4T9iNGKNg6c/HhxMrKlVtofODfdS1Me
	vKZ5C1TfDkSiOUqNjE4sYvMcUqgclOcaVRvpd5oLldJ2dx+p20MkprbTYHAkIuUskLmb
	WZVqdiDizq+xk1jwPMAjcL4ma/JTporcMSDuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:reply-to:to:subject:date:user-agent:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=SVIv0rdL6L7F5MtrEfN+goKqaxzYEDK27j2UH8nWJRq7N0ECq74gcFtP6RlzitPtyO
	91aST0/zOYn7toKkXcLu5DLmpyezxCRM58vFk+1OPO71XH59lrviztlfSa6/kXg6iuqG
	8uo0s+1OvKhU8lKKudJLfmDlPcT2j/BPMupsM=
Received: by 10.223.101.196 with SMTP id d4mr2845305fao.23.1289983847833;
	Wed, 17 Nov 2010 00:50:47 -0800 (PST)
Received: from bamboo.localnet (dsl-51-41.dsl.netsource.ie [213.79.51.41])
	by mx.google.com with ESMTPS id y13sm1552058fah.2.2010.11.17.00.50.46
	(version=SSLv3 cipher=RC4-MD5); Wed, 17 Nov 2010 00:50:47 -0800 (PST)
From: captain.deadly@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 08:50:44 +0000
User-Agent: KMail/1.13.5 (Linux/2.6.36-jfw+; KDE/4.5.1; x86_64; ; )
References: <4CE1D1D1.1000009@gmail.com> <20101116061352.GG20958@jama>
	<AANLkTikC0c057fz7BFAWEjw4BGqmJfQ5OkvR+AZBOA_9@mail.gmail.com>
In-Reply-To: <AANLkTikC0c057fz7BFAWEjw4BGqmJfQ5OkvR+AZBOA_9@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201011170850.44932.captain.deadly@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: emacs copying ${STAGING_DIR_TARGET} - wtf?
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
X-List-Received-Date: Wed, 17 Nov 2010 08:54:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 16 November 2010 07:38:07 Graham Gower wrote:
> On 16 November 2010 16:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Tue, Nov 16, 2010 at 11:05:29AM +1030, Graham Gower wrote:
> >> PS: emacs and emacs-x11 fail for me in do_compile.
> > 
> > Do you have make-3.82 on your host? emacs-x11_23.1.bb compiles fine with
> > SHR.
> 
> Nope. make --version says 3.81.
> 
Just installed make-3.82 and got a different error message but on the same line 
in the makefile:

| Makefile:149: *** recipe commences before first target.  Stop.

Looking at the Makefile's being generated newlines are getting inserted 
somewhere and messing up the makefile. If you manually remove these newlines 
from the makefile you can walk the error down the makefile but there are a lot 
of them.

I don't understand where they're coming from but that's what I see the problem 
as being.


