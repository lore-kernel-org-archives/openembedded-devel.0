Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jqbhb-0008G4-SX
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 00:20:04 +0200
Received: by wx-out-0506.google.com with SMTP id h27so4971130wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=2BgbKR88fU8U91POb5HpgfcplYtaDqAlGOFKFEJ5JAE=;
	b=hG08XmN7Xh7N+vyiM97nu8hhp6r+q2iXVw7eLGqzGOzR/7rIARcFJ+S4znaSPGWVtf12Tkmv9ozStOBFhS5aheqsLJ0iXxurwiIL2EZOsZbEW1M8w8bJj9uVGWQnId7JS8h0zBnSYg6ijTu65LqQgVY4t83JDKEicWSIjoHQTFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=c3Zend2FSfvFemM7d1eov4XfB+0ZHMFcIuU0/6rzmuJCzJyGfBN+ahIVLKqHUxiF8gKT1U7pOLQzuR3e/OuPKCjSXW8HhKMkjQppr4vvwggU5qlReWmRVvBYfddoQfOAiwZnLOWkwaTT7Xx3PKSh5f8YmAldT9ZZqLNT6tpBBrA=
Received: by 10.100.140.15 with SMTP id n15mr370931and.94.1209421170693;
	Mon, 28 Apr 2008 15:19:30 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 28 Apr 2008 15:19:30 -0700 (PDT)
Message-ID: <c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
Date: Tue, 29 Apr 2008 00:19:30 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804282349.46539.zecke@selfish.org>
MIME-Version: 1.0
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 22:20:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Mon, Apr 28, 2008 at 11:49 PM, Holger Freyther <zecke@selfish.org> wrote:
> On Monday 28 April 2008 21:51:05 Geoffrey Wossum wrote:
>  hmm, in autoconf terminology host is:
>  "  --host=HOST       cross-compile to build programs to run on HOST [BUILD]"
>
>  if uclibc has the same terminology your patch is wrong, I don't know it
>  though.
>
I think uclibc's usage is that HOST is the build machine.

Adding DEPENDS ncurses-native for both uclibc.inc and
uclibc-initial.inc together with Geoffrey's patch looks the sane
solution to me, but hey, I might misunderstand something here.

The confusion started with commit "3afb4ffc02c1e4bde1031645cfa9f8e5465f2138".

Could you guys please see into that commit, and follow-up from there?

I hate to unbreak things into the wrong direction.

Regards,
-- 
Leon


