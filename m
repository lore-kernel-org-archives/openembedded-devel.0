Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PVk8Z-0008Sa-8Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 13:19:15 +0100
Received: by fxm17 with SMTP id 17so6120826fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 04:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=V1EocP25LPWNyFiSTuT4lJFC0EoavqiaA6UrE7WxtGY=;
	b=KnndkF4Yo2POi22VhTsGDOw4ykvp72bSu7MmwPV175u1LqYRak6P+m+13NxM2mSGTC
	KPhZ+aSRnvEx52RA3snV2ijNxXHDqIfgy98h2PVNvq8yy2TegUgyezJZNn0ZU8G3WBxB
	3CCEk75CBkaz8JaCccQk2tU86DN6lff0kpGc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oPgfaaf6UT1onNB/bxTuiGMjU/R/qR5ueWumzRMxaugHjApEDf9IBpjNPohm5hdual
	ZSAwU45l3e9sRdT5Sl3O6cNcHQBn/WUOLfiOtKLzI0gCd+pcmQk0DLqd1OIddlgRTSsK
	hpvlODkUG9oDYQg5zYssL1PkOiPDHth5/3ajs=
Received: by 10.223.79.68 with SMTP id o4mr8757268fak.0.1293106744512;
	Thu, 23 Dec 2010 04:19:04 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a6sm1453745fak.1.2010.12.23.04.19.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Dec 2010 04:19:03 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PVk8L-0007vG-SD; Thu, 23 Dec 2010 13:19:01 +0100
Date: Thu, 23 Dec 2010 13:19:01 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101223121901.GB27028@mx.loc>
References: <4D10B09F.2050505@opendreambox.org>
	<1293097031-26936-1-git-send-email-rep.dot.nop@gmail.com>
	<4D132B38.3050808@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D132B38.3050808@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] e2fsprogs: fix symlinks and work with dash
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
X-List-Received-Date: Thu, 23 Dec 2010 12:19:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 23, 2010 at 11:58:00AM +0100, Andreas Oberritter wrote:

>this would create fsck.ext3.e2fsprogs -> e2fsck.ext3.e2fsprogs.ext3
>etc., which is not what we want. Also, PR needs to be incremented,
>because the links didn't appear in the current package.
>
>Would you mind if I pushed the following changeset instead?
>
>http://git.opendreambox.org/?p=obi/openembedded.git;a=commitdiff;h=d87d337f2d2693f3859de64a8b09c5b4b362abdd

Sounds good.


