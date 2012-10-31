Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TTXga-0000iX-QF
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:46:20 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 31 Oct 2012 05:32:42 -0700
Received: by mail-ia0-f197.google.com with SMTP id j5so2352703iaf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=a0I+t73+7P8Jl0AyC+I1/cMmBXPoIW0mMTCWfg6EA+U=;
	b=LAoWlq3sYvGejHQ0kiQpEmh3qgxtHKjcbjS5HMhKciy2ke4sALuaOmD7p5T0TnYXNt
	BIgbBsH1m8Sm+2kQvuokug4nNFz4P/Wj7xn82WCsT41RHsxG+0k795qpVsozE+G/1Tsa
	Rsm7K/0ZB3btR0FEFtRU/G0qD1JYWNCk/Mu5EIK9TIIxtW1RtanvB1JVqGFqBR6FkNrk
	nzWXWlu9cLSBPaQt7bf9oiKdpR5LJaadSFSxnf5syBtQ4SUZ31/H/oJny8VNjo8+qQWn
	gq22hj9DU+3FZms4NcqJ2w2oildORqH9qUYJGX6lFl/yOsc9jpgzMsEUCuv2+urZIlwP
	1fTg==
Received: by 10.182.5.168 with SMTP id t8mr30359118obt.32.1351686762158;
	Wed, 31 Oct 2012 05:32:42 -0700 (PDT)
Received: by 10.182.5.168 with SMTP id t8mr30359115obt.32.1351686762098; Wed,
	31 Oct 2012 05:32:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Wed, 31 Oct 2012 05:32:21 -0700 (PDT)
In-Reply-To: <1351685961.13864.101.camel@phil-desktop>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com> <1351685486.13864.97.camel@phil-desktop>
	<50911500.6010207@gmail.com> <1351685961.13864.101.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Oct 2012 12:32:21 +0000
Message-ID: <CAJTo0LbM+HTA7T=F4EW7Aca=XJUbyZqemE_KBQ53aPFUopuMcg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkIsGni8qrVja4++GmJRqYzXnSmK73gXzwUrBr12fVtzou7FKeu1aktSt6UHqApkCPxSqQv7Fu+YVDPSNKZ+qQ5jdv5tcZzuj1qaNj0XzdUsjjK+zme8PC8yuHjUcnAXZpXKRZXrVtr7QOjCsNOk3sGXdITkz9zQu0rrFmWI7N7uTsGte7Fa8F3KHT8MpszvXaVyCWu
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 12:46:21 -0000
Content-Type: text/plain; charset=UTF-8

On 31 October 2012 12:19, Phil Blundell <philb@gnu.org> wrote:
> a) Make it be a DISTRO setting, punt this problem to the distribution,
> and let them figure out what to do about it.

IMHO, that's the best idea.  Distributions can easily register vendor
zones, which is fairly trivial (eg Guacamayo has a zone registered[1]
already).

If we created a Yocto-wide zone it would be for non-commercial use
only, which might get tricky to convey to everyone using Yocto.  By
punting this to the distributions, the people who created the zone are
in closer communication with the people who might be using the zone
commercially.

Ross

[1] https://github.com/Guacamayo/meta-guacamayo/blob/master/meta-guacamayo/recipes-connectivity/connman/guacamayo/settings


