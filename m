Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNP0O-00032U-NG
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 13:08:21 +0100
Received: by fxm17 with SMTP id 17so3439106fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 04:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FL6qYYuidk4yo02XtvJx+McmtLkbPyHDWN8/419/ITU=;
	b=cSUDzoKj7UfilDkwO3hN2mvzpB3Yi8S6CTzy7ZO/kMDsRdy+VLfFPYsMLQdC+1uJvw
	NN7XeTUshltXSaIUvMgB9MnN350PBj0JKy4uQo5sQGzuZhXh0h6gUne22J2H762Eg19a
	WS2ET0Nif3ifvWgwKVlSNW39ngatPcz7IMffk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XmMHUmp4wySN/g6AxeLlBNxW+ZpPf9LUHnHmmR2Pp7BbkhtzYni+EuWYyvZ8AbzGQm
	MmuiCbi3LafR56453aitZDKhE3U1vDYOealsJt3E1K/5WG0GPldJtO0ZTwQbiXoKvCAD
	q04hNarxPuBwj0jMA/evxOFEIlD8bJpgEeRVc=
Received: by 10.223.97.13 with SMTP id j13mr6654328fan.146.1291118816854;
	Tue, 30 Nov 2010 04:06:56 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm1588160fak.44.2010.11.30.04.06.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 04:06:55 -0800 (PST)
Date: Tue, 30 Nov 2010 13:07:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101130120713.GH3387@jama>
References: <1291103706-18824-1-git-send-email-Martin.Jansa@gmail.com>
	<1291103706-18824-2-git-send-email-Martin.Jansa@gmail.com>
	<4CF4E21A.90009@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4CF4E21A.90009@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] sane-srcdates.inc: remove from all distro configs as well as file itself
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
X-List-Received-Date: Tue, 30 Nov 2010 12:08:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 30, 2010 at 12:38:02PM +0100, Andreas Oberritter wrote:
> Hello Martin,
> 
> On 11/30/2010 08:55 AM, Martin Jansa wrote:
> > * it's empty for > 6 months
> > * entries were moved to recipes
> > * SRCREV instead of SRCDATE is preferred anyways http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=8da9744fcdf856abebcfbe9e3bc1b8cf07bc317b
> 
> > diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
> > index 5e5e121..2bfd038 100644
> > --- a/conf/distro/include/sane-srcrevs.inc
> > +++ b/conf/distro/include/sane-srcrevs.inc
> > @@ -2,4 +2,4 @@
> >  # only SRCREVs included in more recipes should be here, otherwise put sane SRCREV to recipe directly
> >  
> >  OPKG_SRCREV ?= "587"
> > -EFL_SRCREV ?= "55033"
> > +EFL_SRCREV ?= "55077"
> 
> this change doesn't seem to be related to the patch.

Ups, sure, won't be in pushed patch if someone ack it..

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


