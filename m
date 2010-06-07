Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OLXBC-0006iJ-4s
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 09:55:31 +0200
Received: by fxm9 with SMTP id 9so1886962fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 00:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=YsaAT6s5xY4tcFgIrUNylUDN8K6zOeRHeDJSuFJ+Mas=;
	b=lFTbLRvaAZViFSgEF36EKDZw6XZxcNfshYPGzLqRv0dgI+HdA/7fO006KZoRouAo2A
	CskUuncvFqfxMfPlTbj42LN8sDvY7mz6fOeZjnTIhbE/7d5BkHkCF/nUjuO6sIUiZc5D
	JGbDJff2R2IMkYnRzYHMwhLljp3DvSjGOtV9E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hLol1eNPG9wu/YaD93nMT8VAEiGzQsK5Qew84/XgNpI4EGx7c6yAQW2UuUBC7YQGc1
	yLGLEkryHU0BAZ6bkXXpjza6/RV3XgJlS8zyWP7u3D5YbenM/k6GI36JlmmYT2mdTyXa
	GhKYT05FxpAAcvnED3Z7+inu/mi/p+ErjNbjs=
Received: by 10.86.119.19 with SMTP id r19mr22146090fgc.76.1275897062203;
	Mon, 07 Jun 2010 00:51:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm19062295faf.3.2010.06.07.00.51.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 00:51:00 -0700 (PDT)
Date: Mon, 7 Jun 2010 09:50:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607075056.GC1403@jama>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
	<1275299757-28908-2-git-send-email-ospite@studenti.unina.it>
	<hu0602$c6i$2@dough.gmane.org>
	<20100607092454.54ea161f.ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <20100607092454.54ea161f.ospite@studenti.unina.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.gnumonks.org
Subject: Re: [PATCH 01/12] fso-image.inc: add an even shorter alias, for ls -l
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
X-List-Received-Date: Mon, 07 Jun 2010 07:55:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 07, 2010 at 09:24:54AM +0200, Antonio Ospite wrote:
> On Mon, 31 May 2010 13:19:30 +0200
> Koen Kooi <k.kooi@student.utwente.nl> wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > On 31-05-10 11:55, Antonio Ospite wrote:
> > > 'l' is a must have along with 'll'.
> > > 
> > > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> [...]
> > diff --git a/recipes/images/fso-image.inc b/recipes/images/fso-image.inc
> [...]
> > > +    echo "alias l='ls -l'" >>./etc/profile
> > >      echo "alias ll='ls -al'" >>./etc/profile
> > >      # nfs
> > >      mkdir -p ./local/pkg
> > 
> > And what happens if you opkg upgrade base-files? You suddenly lost all
> > your tweaks to /etc/profile.
> 
> Right, /etc/profile would be overwritten, but that's quite independent
> from this very patch, it's the whole fso-image.inc approach which
> should be revised, so I'd like this one could still make it.
> 
> Or if you can point to the right way to do what
> recipes/images/fso-image.inc::fso_rootfs_postprocess() is doing I can
> try to implement that.

Apply those changes in base-files recipe.

If you send it as RFC to list than maybe it will be OK for everyone,
otherwise you can apply it with distro override or something.

Maybe those profile tweaks should be in user profile instead of system
profile? Someone noticed that xserver-common Xsession script is using
only "ls" to list Xsession.d scripts and then later fails if profile has
alias ls="ls --color"...

FYI: I removed similar postprocess tweaks from shr images about a month
ago, because of those reasons...

Regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


