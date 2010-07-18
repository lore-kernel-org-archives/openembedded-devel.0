Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OaRHb-0007sf-Pj
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 12:39:48 +0200
Received: by fxm12 with SMTP id 12so1750130fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 03:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Y6OFuCZGWt5FwLXmApcFD4edcksdcZ/wW2kDcSPZQXc=;
	b=owjqi1GZVrQclTqPpe8ErRg1y+Pw4fc2kcCYwbcSiGTALl+NSd+5zeCU+Gump0u7vJ
	slHBzPnqMilJS93Q3SLiEJ5RfSaY64hMNRxxFCejFS2tmnRGO7AJte1cIXSGoFTjhl6H
	JZz1vlzNnWj/Yq3dV+LBVu0TVfylcvgaSsF4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dOjRUqn6pibgnR8U7jODdD59NJJ80Bt4sJGPRwVQRqMMBGjqk45Z70G37NAOE0wotj
	Er0OGYmD2lD+W/XeEowSnLwPA/pqFol/qkFDlUmOa3n55FcIMelxbRcbSalMfus4gvLc
	ZqMXe5h3tB7jAAN+n9dsb1241SYnU0ci9nTBI=
Received: by 10.223.113.77 with SMTP id z13mr2448224fap.39.1279449574144;
	Sun, 18 Jul 2010 03:39:34 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b9sm1545286faq.7.2010.07.18.03.39.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 18 Jul 2010 03:39:33 -0700 (PDT)
Date: Sun, 18 Jul 2010 12:40:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100718104000.GE16225@jama>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
	<1276068782-23257-4-git-send-email-mad_soft@inbox.ru>
	<20100609133618.GC29724@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100609133618.GC29724@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] mupdf-0.6: new recipe
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
X-List-Received-Date: Sun, 18 Jul 2010 10:39:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 09, 2010 at 06:36:18AM -0700, Khem Raj wrote:
> On (09/06/10 11:33), Dmitry Artamonow wrote:
> > +do_configure() {
> > +    cp ${WORKDIR}/Makerules ${S}/Makerules
> > +
> 
> Why not create a patch for Makerules instread of creating a file and then
> copying. It will help upgrades the patch will get refreshed for any changes
> but this will overwrite those changes.

This Makerules doesn't work very well for me

    oe_runmake build/debug/cmapdump LD=${BUILD_CC} CC=${BUILD_CC}
    oe_runmake build/debug/fontdump LD=${BUILD_CC} CC=${BUILD_CC}

needs couple of -native stuff missing in DEPENDS and then pkg-config
doesn't find ie freetype, because my host system doesn't have freetype
etc.

Any advice? (using pkg-config from armv4 staging dir returns right
freetype for non-native build, but injects the same libs to
cmapdump/fontdump which of course fails.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


