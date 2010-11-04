Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PDnTa-0003fG-L7
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 01:14:47 +0100
Received: by bwz10 with SMTP id 10so1271185bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+lPyIlLTgWpGdKU44GwsNCxCd6qDyVeROEpQrjAncE8=;
	b=OohHoN82NkbBFZkA83XatYbXXLDbAPs7f7X+fEZOJNY59QegcE4c5HRSPAr8y4/nu2
	KLav5eX6utZwBIwsiEpzxQxcBJLvxpzHCG/NpSm5cq3P6t+sJil1Fqm/XT/fjx0PVIPp
	Ppxahz1IuUOEprksuaqXABWT84MvPPjAC+ros=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jqzJxMtloTStP2LcUGvNicvAdWG5NAfdbohU5r3BZcsGU/H9xcQYUwl1uNuoDlanRs
	8yp/UOSSUeH+Kz9RqtOzRIhI9bBL4lDg68cbILSvwKVqwA+KseRimtofhk+E73RkDdlO
	3ZfDaz9RxoAsz5Jobzod6bwO4pqb+JLST6e6U=
Received: by 10.204.116.141 with SMTP id m13mr6875152bkq.187.1288829637386;
	Wed, 03 Nov 2010 17:13:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r21sm6135019bkj.10.2010.11.03.17.13.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Nov 2010 17:13:56 -0700 (PDT)
Date: Thu, 4 Nov 2010 01:13:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101104001342.GG3440@jama>
References: <1288824035-27654-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=OOneV24BDurQ+ECpQJ+-U4AH=MpFZ-YM0jOJq@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] metadata_scm.bbclass: get the metadata revision for current HEAD
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
X-List-Received-Date: Thu, 04 Nov 2010 00:14:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 03, 2010 at 04:55:52PM -0700, Chris Larson wrote:
> On Wed, Nov 3, 2010 at 3:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > Currently we report wrong revision when we build from branches not based
> > on master because we only fetch the HEAD value which is remote master
> > This patch makes it to report the HEAD of whatever branch one has
> > checked out.
> >
> 
> This doesn't make sense.  The HEAD ref always points to the current checked
> out commit or branch, it is *not* specific to master.

No it does make sense, because it fixes my <unknown> METADATA_REVISION :).

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

in my R/W checkout I have it right even before patch

bitbake@jama ~/oe $ git show-ref HEAD
b3246d96069fd11caee42ec6ebcbf6dca2d62449 refs/remotes/origin/HEAD

OE om-gta02@shr ~/oe $ git remote -v
jama    /OE/dev/ (fetch)
jama    /OE/dev/ (push)
....
origin  git@git.openembedded.org:openembedded (fetch)
origin  git@git.openembedded.org:openembedded (push)


but in my "work" checkout, where I have this R/W used as origin
bitbake@jama ~/dev $ git show-ref HEAD -> nothing

OE om-gta02@shr ~/dev $ git remote -v
gitorious git@gitorious.org:~jama/angstrom/jama-shr-experimental.git (fetch)
gitorious git@gitorious.org:~jama/angstrom/jama-shr-experimental.git (push)
....
origin  /OE/oe/ (fetch)
origin  /OE/oe/ (push)

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


