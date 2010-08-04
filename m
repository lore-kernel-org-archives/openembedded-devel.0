Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OghAx-00024W-Kl
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 18:50:49 +0200
Received: by fxm12 with SMTP id 12so2574170fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=d3uDXHJV53g2QQMuReIHp8mOeq0T+htxH9mFKAcie8w=;
	b=E2bOb9RrZgC30ha0g6BC4hY+2zhJNsBauENbxov9uQX4QhCu4NpZQ5+5YbP1O1tiRh
	Usc5LCPTSngIfYQS9oajkKX4WPlT4zEdUcK4q8Kby71XYsWN9gJ4dQSiF8TA5aqvbn2N
	9uYXf/GqaZesXNxuPbgD+p6os/+6RdkMqsGBY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZL+8uwkE6ZEAKNtk36hHz8sTrHZvmb6LL/kkmHHofRrvewVdM+wKQDgi0eNnE4pnJb
	FG6Ynv6Z2YRT4saoriR5DPr+A+039QXt4MWvbnYG7QGUYHUcPXjtlX4C8RHqEwFAMisC
	zbDSDwwYpUgFXa2Th0p7IelSSx5StsaUHd3NE=
Received: by 10.223.122.146 with SMTP id l18mr9214105far.82.1280940637746;
	Wed, 04 Aug 2010 09:50:37 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id p2sm3073615fak.22.2010.08.04.09.50.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 09:50:36 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OghAk-0007CK-7S; Wed, 04 Aug 2010 18:50:30 +0200
Date: Wed, 4 Aug 2010 18:50:30 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804165030.GG28187@mx.loc>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 16:50:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

i'm seeing this:
ERROR: This recipe recipes/libidl/libidl_0.8.3.bb) has a
do_stage_prepend or do_stage_append and do_stage now doesn't exist.
Please rename this to do_stage()

given that only preferred-om-2008-versions.inc pins this to a specific
version (0.8.10) i'd remove the "broken" version and .2 too, while at
it:
$ git rm recipes/libidl/libidl*0.8.{2,3}.bb && git commit -s -m 'libidl:
Remove old versions' recipes/libidl/


