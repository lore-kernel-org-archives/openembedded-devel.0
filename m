Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OOzgu-00084v-8L
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 22:58:33 +0200
Received: by iwn5 with SMTP id 5so3291109iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=VOHlUyeb9SFrbsLWAWeTcZqRshjTFBtlvZ38Lr4eRYs=;
	b=x5MUWtIT+DhmhqKJU6QUft17RLkycRHjRtVs493qITO5ntIBPVZ9nLcW+iAVvIJwPo
	960zqC9Pd4jKCX6qiIkKVCIndqVmcX/D3wgpjHDBxaTvZ5XdG3lA/cto6csZ4VA4cWuh
	Pwyr1U65M2PWF+RZNa1rVIEniLBhj5qjb6B0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Wg0cR6aFmw9STfck8NH+P2C6hZ6D5AKTdjlx1zstcE5lP4OgJ+upT7aJF/NoA1RFMe
	cB4F85oFcpsclfxKemdW6DuWVzhkYzIPHZCIk2MAzL5PNHV+VU0Q3vvRAHAH0Pq1L9yo
	f/bj0je+9HJJCifVWBCQvWeXY4qORJ7z610BI=
Received: by 10.231.170.201 with SMTP id e9mr9821962ibz.119.1276721644133; 
	Wed, 16 Jun 2010 13:54:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.130 with HTTP; Wed, 16 Jun 2010 13:53:44 -0700 (PDT)
In-Reply-To: <hvbcqi$kvv$1@dough.gmane.org>
References: <E1OOdAL-0005Tc-Dn@melo.openembedded.org>
	<hv9seb$ks1$1@dough.gmane.org> 
	<hvajqb$i26$1@dough.gmane.org> <hvbcqi$kvv$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jun 2010 13:53:44 -0700
Message-ID: <AANLkTim2whLVFDFVvIM36JRK6RUzPDaZl1DBVSrX-JuI@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Khem Raj : gnu-config: Add recipe for git version.
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
X-List-Received-Date: Wed, 16 Jun 2010 20:58:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 16, 2010 at 1:39 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> As a side note, if for some reason you didn't get hit by the dependency
> bug and have managed to fetch it, remove the
> git_git.savannah.gnu.org.config.git_e35217687ee5f39b428119fe31c7e954f6de64f0.tar.gz*
> files from DL_DIR, they probably have different checksums.
>
> If you look closely at
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=54ca80948f1e867c3623af754be97d3b96bc31ec
> you'll notice checksums.
>
> Adding a *second* set of checksums like
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=8fcab9f2a9952270f00d68003997208073168567
> is doing, is wrong, so:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=197acb9de5f0404049a1f4da97d3085ba27cb910
>
> That makes it work again as intended. I would encourage security minded
> people to download the snapshot and diff it against the git tree to
> verify that it has no hidden backdoors added to it.

thanks for fixing this. yes I had problems with my own version of same
tar file and I put the new checksums and  merged them in.
But once I deleted it from downloads then it worked fine. Thanks for
clearing my mess for me.

-Khem


