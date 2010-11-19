Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PJSDV-0007yz-Qm
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 15:45:38 +0100
Received: by fxm11 with SMTP id 11so2762566fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 06:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FhSJGgW46aCBt+ESys3LS2Wl4qC75mYpDd3a1d2JSms=;
	b=HCjqScMXio1ZhTIuWl2JdT47qG8nQvhZ2gmJrusNkwndBhtP0h8gtYyeYBMkFLlKv3
	VL8tdsh2tbvWMKkCy9lw54mdmdcAE6/DQTokFg3hjIF5GgmQASpToqG6UOkf5BiJiZ7Y
	ZhbPykvj4p6uY1t7nR7zCEuk/F63/GKA3khUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Lzg7gvYIIJN15mL9wz+EWjo3SurJTYGH6jN1akNduQXE5cYIYgbXTvQ+PJpT7ggWHE
	0frFLep545OtdYA9M6FGXmbIcg8dR3UPtHkrMgZWdRpKUJTl1cGxCSdD2J02O8n8H+/l
	SnBLHebvuSPyuUeKRNthEOEENzCbDiaH/Y9j8=
Received: by 10.223.86.194 with SMTP id t2mr938921fal.40.1290177865288;
	Fri, 19 Nov 2010 06:44:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j14sm524473faa.23.2010.11.19.06.44.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 06:44:24 -0800 (PST)
Date: Fri, 19 Nov 2010 15:44:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119144425.GC3411@jama>
References: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>
	<ic5jrc$ksc$1@dough.gmane.org> <4CE67FA1.6020901@mentor.com>
	<ic60r2$hrs$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ic60r2$hrs$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12 branch ready for testing
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
X-List-Received-Date: Fri, 19 Nov 2010 14:45:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2010 at 03:16:02PM +0100, Koen Kooi wrote:
> Well, that was the whole point. The release is supposed to be only a
> testing tag...
> 
> We were very clear at OEDEM, no *branch* only a tag. If .dev isn't
> working, find a testing tag in the past that does work and use that as a
> release.
> 
> It seems people are trying to polarize issues, when they shouldn't. So
> no "freeze .dev", but "pay more attention to .dev" and no "release
> branch" but "encourage getting more green into tinderbox".
> 
> The idea was to get a release out and see how people are using it to
> improve the process and test conditions, not making a kneejerk process
> for this release.
> 
> I've seen no discussion on this list why we need a branch or a freeze
> instead of following the OEDEM plam, only people stating that we need
> it. So what's wrong with the original plan of getting the release out
> and using actual experience as feedback for future releases?

Hi,

I think that short-lived branch is better, because every testing branch
had few easy-to-fix issues which were fixed almost immediately in .dev 
after testing branched and it would be hard to choose which branch was best.

But tag from any testing branch + first few quick fixes would be almost as 
good as based on any other testing branch. 

And I also agree with Phil that this short lived branch should be
removed when the tag is created (to show that it's final state without
maintainance).

Just my 2c.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


