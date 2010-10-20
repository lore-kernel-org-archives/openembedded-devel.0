Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1P8Sjg-0002wn-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 09:05:22 +0200
Received: by eye27 with SMTP id 27so387609eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 00:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=aCPe5eTgCBGcW/ha+OfzKK9ktwo4jMuZDdukq3MFRa0=;
	b=vqunDzR0lHL02Q6vCju6Kg87b9nkCkqUXaiYmESHNYK03sdB3pddE60M/Q+3R+xqI6
	3byzWfTRVglWF0edeFWyj2I8PrKpV3GvbNY/oeTvucbZYKBCU06FfQ1ZAJYfIsAuMnpi
	Dz2LZhb7tIXqEb0D4xyPruSrcbjODIfgxkBfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=poPGBjCmP3Ev+3v8+xbTzzJr2GGthphCGhK4XFnEO47RFyhW+xKBZS390eGDhkPv9c
	kvjUem+quz96DKRHlGEOmeQaZNmM4K1K7vSTCpZOftz/fZIiheqHJVETw9xWrrCb3C5q
	iQ9PQVEYLnz8mzQ7RMkW7jGbs/crMBJ5BRr7w=
Received: by 10.213.4.205 with SMTP id 13mr180947ebs.70.1287558285327; Wed, 20
	Oct 2010 00:04:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.127.137 with HTTP; Wed, 20 Oct 2010 00:04:25 -0700 (PDT)
In-Reply-To: <AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
	<4CA99206.5060001@eukrea.com>
	<AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 20 Oct 2010 00:04:25 -0700
Message-ID: <AANLkTimt6JE5kNxyJ5oFyC5MxZAyqZbGYR_FjcED3AOk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Wed, 20 Oct 2010 07:05:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 4, 2010 at 11:23 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Now gcc 4.5 is default so people will hit it often. Can you commit
> this workaround
> for time being while gcc is being fixed to cure it with reference to
> upstream bug

Hi,

Just a FYI:
I ran into this bug while compiling udev.  Regrettably the quick fix
of CFLAGS_append caused my udev to choke on the configure step.
Instead, I applied the bugfix from here
https://code.launchpad.net/~cltang/gcc-linaro/fix-lp-653316 to
gcc-cross-4.5.  This was for a armv5te target build.

Udev appears to build nicely now :).

-Ash


