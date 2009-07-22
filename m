Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MTR5W-0008V3-1Z
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 03:57:46 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1265284qwc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Jul 2009 18:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to:cc
	:content-type:content-transfer-encoding;
	bh=q66eMwdTIIya6mK1W139Ck6qjPLYh/jfiy5s4zFuAVM=;
	b=qbJLS0frOKJmN4FfzbN7eQKYyopYjPMsWlxl/H6Y+HWxjNfIUwDTLDa97I6AqcPqGX
	ulLfCP/vAjc0QciSkkFuiznMhN5be5qUYocu50FDJ9n90qjiHw/w1d3+A8O3l+Dy21UP
	MYAXbWMMWEcN0cus5zZdK8gmnkWaiB7Cbac4s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=IBYnI8dgfXZhnybGLcWGXWYDWwHav809V2+VdpaWm9GFY2iZOEnRhd78mr6innu04h
	837egm56Q8y+AQ7wE7nFVYmQqZ7MLO3DM3UdmA3msmNTBhMnqjqrU/M27HJqDtPhkons
	NSfP1TV+IFt6vz9o0e6ttrDCd2tfrnQqttupI=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.220.46.20 with SMTP id h20mr290125vcf.55.1248227020066; Tue, 
	21 Jul 2009 18:43:40 -0700 (PDT)
In-Reply-To: <4A66482B.6010304@cbnco.com>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<1248212992.26475.35.camel@dax.rpnet.com> 
	<4A66482B.6010304@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Jul 2009 18:43:20 -0700
X-Google-Sender-Auth: 881096f18d16fe32
Message-ID: <b6ebd0a50907211843w2f5d0c64w3e01630c947f6227@mail.gmail.com>
To: Michael Smith <msmith@cbnco.com>
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Wed, 22 Jul 2009 01:57:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Jul 21, 2009 at 3:58 PM, Michael Smith<msmith@cbnco.com> wrote:
> BTW, is there any chance of getting Bitbake officially moved to a Git
> repo? I think a few people are working out of git-svn trees, or subdirs
> inside larger git trees, but it takes some gymnastics to merge between
> them as Git doesn't know they're related.

I'm working on that now, Mike.  I have my current version at
http://github.com/kergoth/BitBake/ -
git://github.com/kergoth/BitBake.git.  It is 1) old bkcvs history, 2)
pre-reorg layout on the svn, 3) post-reorg layout on the svn, with the
OE metadata history mostly ripped out, as well as the old test recipes
and stuff, so its down to just bitbake.  There are still some minor
annoyances in commit log message formatting, but those are difficult
to fix automatically, and are generally cosmetic, so I think I won't
bother with those.  If this repo seems sane to people, we can see
about getting it onto the OE git server.

-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


