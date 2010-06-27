Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSyc4-0005s3-8g
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jun 2010 22:38:01 +0200
Received: by fxm7 with SMTP id 7so338536fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jun 2010 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2K+r3RxsZ/Vh3fv5Ts+96IgMjJrSI070nfiCgyXlnew=;
	b=e7I2ltKIv59Tdf3iOZ37vXp/P4ac9VGE4Q6bg7G8TEejnyTpsgGO6sG7SnZOgoMC6o
	guE8XUJNLnGDRML3WIzTrzsrUciD2shSgw6MrILsPmf6HsKLmyDSLsYNigMDxEY8GR6C
	zsSoU5TBjRrd5HaFw09ta7KhoqwWDzB7z+UgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IJXbSUtN+J5Pwkaf8i86+Og/9c9C03lMBsGRwz331HSZa/glAZk9m/vZ20R6MuEygW
	fTbZDOEyV4gwkNw6keztkexVsefOcdVhs8NmVP1wUdXRO/LalKSkN9z1pfUDNXs4zmV9
	exN3NodLp7zB2pZbWe6ltMMi64HiajrMxpUqE=
Received: by 10.223.68.131 with SMTP id v3mr2996029fai.82.1277670799473;
	Sun, 27 Jun 2010 13:33:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j23sm43583713faa.26.2010.06.27.13.33.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 27 Jun 2010 13:33:18 -0700 (PDT)
Date: Sun, 27 Jun 2010 22:32:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100627203243.GR17650@jama>
References: <1275485971-23536-1-git-send-email-Martin.Jansa@gmail.com>
	<201006272106.36928.bluelightning@bluelightning.org>
MIME-Version: 1.0
In-Reply-To: <201006272106.36928.bluelightning@bluelightning.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RDEPENDS/RREDEPENDS
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
X-List-Received-Date: Sun, 27 Jun 2010 20:38:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 27, 2010 at 09:06:36PM +0100, Paul Eggleton wrote:
> On Wed, 02 Jun 2010, Martin Jansa wrote:
> > * there is probably very few cases when it's needed without _${PN},
> >   if you find one in attached patch, please enlighten me
> 
> I've just discovered this change is what has broken the build of opie-taskbar-
> images:
> 
> ------------------------------ snip --------------------------------
> paul@linc:~/oe/build-hx4700-dev$ bitbake opie-taskbar-images
> NOTE: Handling BitBake files: / (8377/8377) [100 %]
> NOTE: Parsing finished. 7570 cached, 477 parsed, 330 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> ERROR: '['/home/paul/oe/org.openembedded.dev/recipes/opie-taskbar/opie-
> taskbar-images_1.2.4.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the 
> runtime entity 'opie-taskbar-images' but it wasn't found in any PACKAGE or 
> RPROVIDES variables
> NOTE: Runtime target 'opie-taskbar-images' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['opie-taskbar-images']
> ERROR: Required build target 'opie-taskbar-images' has no buildable providers.
> Missing or unbuildable dependency chain was: ['opie-taskbar-images', 'opie-
> taskbar-images']
> paul@linc:~/oe/build-hx4700-dev$
> ------------------------------ snip --------------------------------
> 
> Can I revert the changes to any opie packages that have been broken? Or is 
> there an alternative solution?

Andrea Adami already asked me about it.

RPROVIDES_${PN} = "${PN}" looks a bit wrong to me and changing it back
to
RPROVIDES = "${PN}"
doesn't make it much better (more understandable in my eyes).

I found one issue in ttf-fonts
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=14c265b107725a8f7534dfb354ad12edf9f7aec3
but there it was because .inc file was setting RRECOMMENDS for all
packages and _subpackages_ including this .inc. So setting it for ${PN}
wasn't enough (and I could also add RRECOMMENDS for every subpackage really
needing this RRECOMMENDS font-update-common).

But having ${PN} on right side of assignment is a bit strange, I'm not
using/building opie, can you check why exactly it needs to be used this
way?.

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


