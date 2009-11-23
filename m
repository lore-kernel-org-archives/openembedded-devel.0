Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCcG5-0001Ff-WA
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 17:59:29 +0100
Received: by bwz19 with SMTP id 19so5250776bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=i37fjpFEuKG47hZlql16+J+WVL1G3PSq+TB5TEe+cms=;
	b=HULsjXk1NWzOQAGkmQLAdFCPKshRdMLKW9FknTqWNG97AknumUyeGVGCE2G7pUIhJu
	ru542jbK/UXJFvUrEX65foxFe9LyE397SLVsVKKZ2nuY5VDActiGlflpAXFJntbVhjC+
	NquaCfu+oKG/RtoHbZwbmpRu0my7qRv2QWkDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HLqttyij5gM32m/664zOCa3FeJ9j4Vz+lNbIWAdshPRu81vtd6uUkKeT0IEGuVk0qQ
	d/auKHylfWf3okiZxEMC1sz8SsFMKkSdw5tmYacwZSu7U6RjeNs/XWWrnlXvIGgtNKZu
	YVGVxhfmv/1Nb1o+qq/jKMXQNMrAQ5OOiwWTA=
Received: by 10.204.29.18 with SMTP id o18mr5043000bkc.39.1258995477627;
	Mon, 23 Nov 2009 08:57:57 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1453129fxm.2.2009.11.23.08.57.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Nov 2009 08:57:56 -0800 (PST)
Date: Mon, 23 Nov 2009 17:57:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Message-ID: <20091123165758.GB28485@jama>
References: <c384c5ea0911230835h20b388f8q81ab96b8bc82601e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0911230835h20b388f8q81ab96b8bc82601e@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Please indicate *why* in the commit messages; commit "kernel.bbclass: force do_deploy call before do_build"
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
X-List-Received-Date: Mon, 23 Nov 2009 16:59:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2009 at 05:35:12PM +0100, Leon Woestenberg wrote:
> Hello Martin,
> 
> especially for changes to core files (such as kernel.bbclass) could
> you indicate in the commit message not only *what* has changed but
> also *why*?
> 
> Your commit message leaves me only guessing for the why:
> 
> kernel.bbclass: force do_deploy call before do_build
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> 
> Thanks!
> 
> Regards,

Sorry, we discussed it with RP and after previous patches of this
bbclass it looked clear to me. But if you look only on this last commit
it is not clear at all.

First do_deploy was called in ${D} dir, where as RP said no stripping
should be allowed.

RP fixed module_strip.bbclass to operate in ${PKGD} directory and fixed
issue that modules in kernel-module-*.ipk files were not stripped at
all.

And also changed kernel.bbclass to create modules.tgz from there, so it 
should contain stripped modules too.

But that task where uImage are coppied to deploy dir was called
before do_package after do_install
which was good for uImage files, but failed to create modules.tgz,
because ${PKGD} dir is not populated in that time.
When I was testing this change i called -c build and because I didn't
see refreshed modules.tgz in my deploy dir i called it twice and it
worked ok (because it was populated already for 2nd run).

After clean rebuild no modules.tgz were created, so I talked to RP again
and he confirmed that we need to call do_deploy AFTER do_package and
that I can remove before parameter and pushed that change, becase RP
said it should be safe.

Then I tried clean rebuild with -c clean -c build and found that
do_deploy wasn't called at all, so I guessed that without before
parameter it can be called somewhere later (before buildall or rm-work
or something) but it wasn't called even without -c argument, so I forced 
it in addtask before do_build, because when -c build finish everything
is in right place so also deploy stuff should be.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


