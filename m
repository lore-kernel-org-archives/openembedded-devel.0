Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1PIdGX-00031f-K0
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 09:21:19 +0100
Received: by eya28 with SMTP id 28so928637eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 00:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:reply-to:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=gMhFeZ6nou3fXeubHlyh70RJeIwJnU0FuvY4+60Xzvg=;
	b=uxaX2l2a24D6BifcSiQjvpQH+suu6OIxX5MlFNf4XRERjX3RG27Ggpo4Axdj5egqcw
	cDuba3OoBLhVegV3Sc+EY8wnA1esvMnWYqAY39cN3Lxfylz9OQZ6eS02J31km3LjGFF/
	HXIf3zA2k+17Tzei5YC1ls7seN0YFVF1q+5Tw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:reply-to:to:subject:date:user-agent:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=GgBM1tyEZCK/Zw25lEJrDC8NJqGF5cIBdZvh9D+XJGs513TeMSYxz4hdzrWZk4b/S6
	wkMowppALWp1di1L8sADCJu9RB8zoznm5TDBAxUxO7RylzTA5QiNpsiwUa8yW9stJfVe
	Mc9uhsoAt4rcpsrTozYBwCOyrm6p4yQLHNuKw=
Received: by 10.213.4.135 with SMTP id 7mr4840541ebr.89.1289982005976;
	Wed, 17 Nov 2010 00:20:05 -0800 (PST)
Received: from bamboo.localnet (dsl-51-41.dsl.netsource.ie [213.79.51.41])
	by mx.google.com with ESMTPS id q58sm2041823eeh.21.2010.11.17.00.20.03
	(version=SSLv3 cipher=RC4-MD5); Wed, 17 Nov 2010 00:20:04 -0800 (PST)
From: captain.deadly@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 08:20:02 +0000
User-Agent: KMail/1.13.5 (Linux/2.6.36-jfw+; KDE/4.5.1; x86_64; ; )
References: <4CE1D1D1.1000009@gmail.com> <20101116061352.GG20958@jama>
	<AANLkTikC0c057fz7BFAWEjw4BGqmJfQ5OkvR+AZBOA_9@mail.gmail.com>
In-Reply-To: <AANLkTikC0c057fz7BFAWEjw4BGqmJfQ5OkvR+AZBOA_9@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201011170820.03008.captain.deadly@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.175
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
X-List-Received-Date: Wed, 17 Nov 2010 08:21:19 -0000
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

I'd had problems with emacs before and the error you got was the same as mine. 
I got the x11 verson to build as Martin Jansa advised. My version of Make is 
the same as yours (3.81) so maybe I'll try to do an updgade and see if that 
solves the issue.



