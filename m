Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1STzRK-000603-Qi
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 19:52:10 +0200
Received: by yenl13 with SMTP id l13so3937027yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7DwG6jTYcqOEapRCmbW5joPVChiR0uc5DIeSsf4iazY=;
	b=kH7IJQ9RqBw1kqyaGNr5CBbGZ1zS2Nec1/7/YcJcrllkjESEiBa4+ZI++fckA2bbKY
	Zn9tm9dam00YYrOtWuGqUqSniogyaH1B0dH4cjGvkYaNC7s2NrruHcxg9MdejBSw1Hi7
	+WrbzMLQuEAACMuI6C97OVFCk8/ofMmJfc9SQE2YBgm1jOK6nukHx/W/oWqbUjgRrbJB
	mmx+dYLdNxCnQkbeQHye/qwPDeScQXLzd5QBF53Yzmw9klfb0VnshSGvXap0t5IAk+fP
	WGPqE4OZ5c0GTj7PV+nuM8FBgylS/sDiS5Vf0WUOMv1YRGyLPX0A5A+Y82AzBWL9Ngym
	Qb2w==
MIME-Version: 1.0
Received: by 10.50.94.200 with SMTP id de8mr4776062igb.21.1337017331206; Mon,
	14 May 2012 10:42:11 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Mon, 14 May 2012 10:42:11 -0700 (PDT)
In-Reply-To: <CADZ6=au=JZVMD9_PNbcbSmv6JzxtZWeQD6suneG=fk9Ks4pHCg@mail.gmail.com>
References: <CADZ6=auhe9BbFPd-F-QNLcTksuWzZdY8tUb31P2JVm38LDjCsw@mail.gmail.com>
	<CAF6bG8cN5ecwtehSBxy5M1JvR+Fbo_=q7mm7O+AJcz-9ZU79yw@mail.gmail.com>
	<CADZ6=au=JZVMD9_PNbcbSmv6JzxtZWeQD6suneG=fk9Ks4pHCg@mail.gmail.com>
Date: Mon, 14 May 2012 20:42:11 +0300
Message-ID: <CAF6bG8fEnVNtkEO9iHtrpB822w-SNWzTd-4WSTr_SgNqNpHTtg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: New kmod {libdir} breaks udev, systemd build
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
X-List-Received-Date: Mon, 14 May 2012 17:52:11 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2012 20:23, Thilo Fromm <fromm@dresearch-fe.de> wrote:
>
> openembedded-core only features udev-164 (vs. -182 in meta-oe). -164
> in oe-core does not use libkmod, so there's no issue with libkmod in
> oe-core. It's no surprise that it "worked for you", you were building
> anicent tools.

 I know. I were asking why versions are setup like this. If -182 makes
more sensible default, why it's not one in -core. My main point was
that seemingly unrelated change to build xterm to my image (requiring
meta-oe layer) caused *default* udev version to change (I'm not
setting PREFERRED_VERSION anywhere). Shouldn't -core versions be the
default ones, that one may override?


 - ML


