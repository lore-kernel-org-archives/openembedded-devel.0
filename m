Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LeojJ-0002jc-OP
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 11:54:02 +0100
Received: by bwz9 with SMTP id 9so2767898bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2009 02:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ptF1ftGz5/MSRd03u6as+qzVxWJdbsnQPI8bgBWl4qk=;
	b=H1QaSL1PLUwPFgcpgcOU7dWa5r6m0w5KHvZnkf9V2NcA+MFgDAF9x2zbt2lmx9Db9Q
	fgnsJL2KzmRVBwgJbyya4r2PCaNDU/mfit8IMARQ8o69RoFscJscHODU/dTBg6mnzXWc
	FOoiYrXVdCyD+GjvmUJ11QA4Y5alguhlUaXvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=caeHt3LRiyKMlZSS7MfpE+kMa6KacxKCNFKNiOncnB6rfu5gUlDhcqyiyQyvSsyB+s
	m8CW/RTP4QU2TV6oQzEHAeSPCvnxabYimads5nPzEdt8RTcMowf9yu/ervVZ9Y6ylSh+
	A6qXwSa2h+d+hrTO86mOpmBlhjuQaGKmNw+f4=
MIME-Version: 1.0
Received: by 10.181.36.18 with SMTP id o18mr2914139bkj.136.1236163765156; Wed, 
	04 Mar 2009 02:49:25 -0800 (PST)
In-Reply-To: <20090304101045.GA736@gmail.com>
References: <20090304101045.GA736@gmail.com>
Date: Wed, 4 Mar 2009 12:49:25 +0200
Message-ID: <fce2a370903040249t78b98997j8f4a83be45b1d27d@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [patch] Fix for nfs-utils tools build
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
X-List-Received-Date: Wed, 04 Mar 2009 10:54:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

That's what I was going to send to ML now. Voting for this patch.

On Wed, Mar 4, 2009 at 12:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> Currently nfs-utils 1.1.2 does not build correctly. The reason is that
> there are certain tools which are passed in CFLAGS in their makefiles
> even though they are to be build using host compiler for them to be run
> on host machine.
>
> Current builds use target headers to build them due to CFLAGS funkiness
> where we have alters system include dirs. This goes ok with arm and x86
> but on mips you see errors.
>
> This patch fixes the issue
>
> OK for .dev
>
> Thx
>
> -Khem
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


