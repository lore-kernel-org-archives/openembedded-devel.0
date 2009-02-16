Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LZ0eN-0005Hr-6L
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 11:24:31 +0100
Received: (qmail 29156 invoked by uid 813007); 16 Feb 2009 10:22:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Feb 2009 10:22:40 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2009 11:22:30 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
References: <200902140035.13820.khimov@altell.ru>
	<87hc2vi3wy.fsf@neumann.lab.ossystems.com.br>
	<200902161228.26942.khimov@altell.ru>
In-Reply-To: <200902161228.26942.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200902161122.31162.openembedded@haerwu.biz>
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
X-List-Received-Date: Mon, 16 Feb 2009 10:24:31 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 16 of February 2009 10:28:26 Roman I Khimov wrote:
> Otavio Salvador:
> >    $: git format-patch master..
> >
> >  - mail them to ml
>
> And this is another thing I'm not sure about, there might be a lot
> of 'intermediate' commits leading to nice-upstream-acceptable
> package, pushing them all in series is kinda wrong, IMHO.
>
> then again there is reviewing process that leads to more changes and
> more git kung fu to make single patch for single package again.
>
> Does it make any sense? Currently I'm trying to push new things in
> 'one package - one patch' model, extracting package patch from
> overlay as `git diff some_commit..` plus adding checksums to local OE
> tree and doing `git diff` there (not commiting it at all). Then after
> new package is in, I'm able to pull from main OE and remove things
> from overlay.

1. Extract those changes as set of git patches.
2. Checkout org.openembedded.dev into temp branch
3. Apply your patches
4. "git rebase -i" and "squash" all changes into one patch
5. Use "git format-patch" and send it to ML
6. Drop temp branch.


Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




