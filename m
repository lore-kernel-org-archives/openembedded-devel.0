Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0608C60FAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 18:27:35 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so7721841pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6LhCX+ii6u0PvCt2RDKT3gl25zJoQ0ZxHp+ODNQ2DuI=;
	b=Rk3WK3Ia1ymt8BTwJnUX/BcwwWpNpk32N57MleeTgLAHnI/yN7X0iY/cUrZ/KJvrWF
	WMINOQ0Jb4usTDVfAzbgpIkP33vBZIcKZXn8ANLNd4vjqf8cRddLhCxrxJ6VjFoyAkYU
	usqUPcoGSDTP8ivC8dDYQ70JqSt99Ih2guD/Y7KWnI22NFAH110jHtPcYWy4+CWmDLej
	/L2rNshpns5b2pMZTUZpHbX2U/9IeWLaDerPT9vwSirl7AjY3V70cIkV9k2kuWxHHkTm
	VWEbRDLwPbL8A/hIkl7y+naPe9PNNJTOfBP16807Gdaw2nyyAZY5bFfFFzbMxvUT5aw2
	577w==
X-Received: by 10.66.187.34 with SMTP id fp2mr33633952pac.12.1381170456535;
	Mon, 07 Oct 2013 11:27:36 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	b3sm34797856pbu.38.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 11:27:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8738odt9g6.fsf@parenteses.org>
Date: Mon, 7 Oct 2013 11:27:29 -0700
Message-Id: <2003E198-F427-4B12-85EF-7CCF383B2823@gmail.com>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
	<CAP9ODKpxHF4NUurt-U9HakdAWJ6LAz6HaNoHnuuf5fpEh0h-ow@mail.gmail.com>
	<20131004141938.GI6240@jama>
	<CAP9ODKqLRgh2jO4dDDPwkFd5RLM+hZjaFVVg=VXuTy0C_ukTkg@mail.gmail.com>
	<CAMKF1spqdOMP3YTawqtXtGQ3UUcGki91GJN56iT7wirmLSrrKA@mail.gmail.com>
	<8738odt9g6.fsf@parenteses.org>
To: Mario Domenech Goulart <mario@ossystems.com.br>
X-Mailer: Apple Mail (2.1510)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] wvstreams: add recipe for version 4.6.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Oct 2013 18:27:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

>> ut of box if possible.
> 
> Good point.  I'll submit a new patch to replace --without-valigrind with
> --with-valgrind (it doesn't require valgrind as a build dependency).
> 
> Since .supp files are only useful if you have valgrind installed, I
> think we should add valgrind to RDEPENDS_${PN}-<?>.
> 
> Now we need to decide on -<?>.  Maybe -valgrind is cleaner in the sense
> that those who need the -dev files but don't need valgrind won't get
> valgrind as a runtime dependency.  Adding valgrind to
> RDEPENDS_${PN}-valgrind sounds ok to me (those who install it will be
> clearly stating that they do want valgrind stuff).
> 
> What do you think?


seems ok


