Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 94F6573D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:58:06 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so67635338igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2015 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=YrthIjAVEvI963Eg8K5ue9So9pG3dxI/1DYIVeKfx1U=;
	b=o2BsgDRSCIP5OnWnvej7o83TfmsYjwvSR243yuJ58OCLBa/I/+28vIxSg/g/3jNMPq
	027dHNPmswbW/FRL1WjDE9+tb8tQ/5thgmf3b6v9mGWT5D3+Pr4ouLylMbRE6qc5PPKQ
	A/toodj5bl7QSAHb7Y6JmraarIcYRBeJQJ7+Ln2SKKnsRZY8P+bxX6x7ZM/Y6Zf4b0C0
	17go1mv2bdco6QD4FGI5y780TjjijgpNx49W0Ia7yHhpxjf3M5rDAaM1rn4phzd8NRHW
	WO+ABj99o9c0v7syYOHr/rFGtmrnW/Am0nqRUY6H58gs5fh+tUtMfYun1EpXezQnk0rw
	amfg==
MIME-Version: 1.0
X-Received: by 10.107.33.21 with SMTP id h21mr22556394ioh.1.1429541887613;
	Mon, 20 Apr 2015 07:58:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 20 Apr 2015 07:58:07 -0700 (PDT)
In-Reply-To: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
Date: Mon, 20 Apr 2015 11:58:07 -0300
X-Google-Sender-Auth: pA3pbT0Thsc99puprzpU-CJS2iE
Message-ID: <CAP9ODKoV+SZYEaSEYWL2=8Pz49VrUjaRbMHsAb0-Y8v3H_8+NQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Sven Ebenfeld <sven.ebenfeld@gmail.com>
Subject: Re: [meta-java][PATCH v2 0/7] Update OpenJDK7 to IcedTea 2.5.4 und OpenJDK 7u75b13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Apr 2015 14:58:07 -0000
Content-Type: text/plain; charset=UTF-8

Hello Sven,

On Mon, Apr 13, 2015 at 4:27 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> There were some mistakes in my former recipes. This version fixes them.
> OpenJDK-7 did not depend on krb5 but excluded it in OECONF. Now I changed to
> depending on krb5 and not excluding it. I've tested building and running it
> against dizzy and master branches of oe-core, bitbake and meta-openembedded.
> Built with qemux86 and qemuarm. This release switches the HotSpot-Release to a
> newer one because of a segfault bug in the ARM Thumb2 JIT.

Did you see Khem comments about the patchset?

It would be interesting to get a new version addressing those so we
can merge it into master branch (currently it is hold in master-next).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

