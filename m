Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@gmail.com>) id 1Q9RX6-0007S0-2x
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 02:32:40 +0200
Received: by iwn10 with SMTP id 10so6609372iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 17:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AKte4AIbhOP9XAZIda9zBwAEbgD4U5/L5UECwl2RPY4=;
	b=EdOCR7kiJcL5UwFM0dRDMTT2z0mfYUcuce0X7G24XY7XwDV1pXmEiuRijK90nGWXUo
	3GswNQQtt0gaVt17BjNzhd4sn3ouOKRNNFpVK1/LPbQO6u0rbT6NmQjdYRXlPZdBgtcZ
	TVtYO0tac5vTCpqJhk68hheunS4w6wJnbSJn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=DMUrIJ4pTLw5659RCsMYZnCru2v+5wE2mTbXJ0aNUMOBu3ptqqrRz8B1ZQL19GePLH
	11knIVD7h1tuThYN/VVk226ylgPttXCeFcFidoraA2NeBho5uNkgdQf5YglpenZN1Hvd
	9OJ+LeT3WcYKPRDOuzWfm7oiDfo5/65F9Kl98=
Received: by 10.42.219.200 with SMTP id hv8mr962452icb.271.1302568226209; Mon,
	11 Apr 2011 17:30:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.222.135 with HTTP; Mon, 11 Apr 2011 17:30:06 -0700 (PDT)
In-Reply-To: <4DA1189E.5050703@gmail.com>
References: <BANLkTimPVgqbjMhJnBcniZgJBbRd_1D8yQ@mail.gmail.com>
	<4DA1189E.5050703@gmail.com>
From: Kartik Mohta <kartikmohta@gmail.com>
Date: Mon, 11 Apr 2011 20:30:06 -0400
Message-ID: <BANLkTimu9ty9mvC7YLfGTh0K92PUVXq4Mg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: python-distutils_2.6.6: config/Makefile contains sysroot
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
X-List-Received-Date: Tue, 12 Apr 2011 00:32:40 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 9, 2011 at 10:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> you should try to figure out why binutils was build without sysroot. Check
> the configure args for binutils-cross

I guess there was some misunderstanding, the problem is that the
Makefile on the target contains references to the sysroot on the host.

-- 
Kartik


