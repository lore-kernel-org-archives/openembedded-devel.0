Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PoY8H-0002wc-4k
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 10:20:43 +0100
Received: by qwi2 with SMTP id 2so2354147qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Feb 2011 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TlZuPBzDzQiBU3hGZ/Tcf/K1Dps4DsQu66E6WhMNFvE=;
	b=NR7ju7IiXHYoW79OJg6rOnuOQRTb/madqxprHGwRNp1bfde7CJKyt54Hjg06Z11Elx
	UuwdAy/bq4/i0a4ycZx2DDR5afdmDyLjd6+wUEP0dawBdADb6kG5OUWc496gCZ1dgNoz
	CH6IrWYqnzrMHFDpuqIN8QzcbaonzB76MwAEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XoPx+yAGdcM8hP1KGLp7MQDREG9V3PItT5mMFN141xVE+AJfLZRhs2MofwsvdmsTWh
	2l6N11xFdBrh9Idsdu52mkSnRgmFO7hqsjvEKT8MEU6y+Q9emTGqcv8cshzLqdBHI1RS
	y6UzQbCuQaQkx0n5lnUlk2WOWQeeGcVF3QyS4=
MIME-Version: 1.0
Received: by 10.229.230.17 with SMTP id jk17mr1908394qcb.184.1297588772832;
	Sun, 13 Feb 2011 01:19:32 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Sun, 13 Feb 2011 01:19:32 -0800 (PST)
In-Reply-To: <20110213060646.GA19259@localhost.jama.net>
References: <1297538818-30102-1-git-send-email-filip.zyzniewski@gmail.com>
	<20110213060646.GA19259@localhost.jama.net>
Date: Sun, 13 Feb 2011 10:19:32 +0100
Message-ID: <AANLkTinHjooHBo-FQQH3ot2D+xhtMuAu96nUBdWs-48g@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] deb packages support: switch from /var/dpkg to /var/lib/dpkg
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
X-List-Received-Date: Sun, 13 Feb 2011 09:20:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/13/11, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Feb 12, 2011 at 08:26:58PM +0100, Filip Zyzniewski wrote:

> I'm not using dpkg with OE, so personally I don't care, but be aware
> that this change breaks upgrade path for every-package which is using
> u-a. You need another hack moving /var/dpkg/alternatives content to
> /var/lib/dpkg/alternatives, before first alternative is
> reinstalled/upgraded, otherwise it will use alternative with lower
> priority even when there is alternative with higher.


DPKG support was not functional until recently (my patches are an
attempt to get it back to working state), so I don't think there is
any distro/system I would break by these.

Is it still a concern in this case?

bye,
Filip Zyzniewski


