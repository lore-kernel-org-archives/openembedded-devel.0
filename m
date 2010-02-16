Received: from mail-px0-f173.google.com ([209.85.216.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NhOGt-0002RK-LM
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 15:19:30 +0100
Received: by pxi3 with SMTP id 3so2597544pxi.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 06:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=u5q6JaEmBv4lMu0UQElJHM5QHJcZB/Im18BH6BiJMEw=;
	b=JYEhXk/WIieL+wlbBYt5/9isS+vhNSCGkgLIHhgiHfBFVLwV4qzAtgQsoyKtOnBg/q
	DJWMXCd6tiG0RZ9RrScqrUOjy1YA4yAw1aVp8e4lLqfJR69Bcx6FIfcsCFy3DqKnMKsm
	AUJrUTv+kttKTUfhzdn0LS4R0Dm8Tp+qjiFQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Pjojtqlmzu+N84Pgi4xQP66ft0CrxM6u5lZqNlyqYsgVvHgHksyCYexgKpgDmU9jmV
	cTVxgp/0+CYiKnTb8xdfyBsQ+ZCEksVIdkRe1v5yMxCGhFmobCQSflR6i8ju02waFvet
	8ngED3RxDAl+zR8h/WKcl4bYw7Tkdl0z/9wEs=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.60.12 with SMTP id i12mr4346958wfa.66.1266329808120; Tue, 
	16 Feb 2010 06:16:48 -0800 (PST)
In-Reply-To: <1266320987.6436.135.camel@rex>
References: <1266316492.6436.127.camel@rex>
	<ac9c93b11002160258m2ddee8absd0510adad4179c6d@mail.gmail.com> 
	<1266320987.6436.135.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 16 Feb 2010 07:16:28 -0700
X-Google-Sender-Auth: 6cbfd2958ef8d159
Message-ID: <b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.173
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Tue, 16 Feb 2010 14:19:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 16, 2010 at 4:49 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2010-02-16 at 11:58 +0100, Frans Meulenbroeks wrote:
> > Sounds quite nice.
> > Didn't study the class code, but it would be nice if within layer.conf
> > I could use a relative path, which then is turned into an absolute
> > path when the layer.conf file is read
>
> This is what the LAYERDIR variable gives us.
>
> Having relative paths would lose all context outside the layer.conf
> file. We could hardcode a list of variables that needed to be processed
> and so on but LAYERDIR removes all that complexity whilst still letting
> you move things around.
>
> > That means layer.conf can become very standard wrt BBPATH etc. and you
> > can even move layers around.
>
> You should be able to do that with my proposal, the only file that would
> need changing is bblayers.conf, not the layers themselves.
>

Can you explain what the use case is for needing this much control?  I find
it unlikely that it would be problematic to simply add each layer as a full
path to a list of layers in a single file, and leave it at that (i.e.
bblayers.conf).  If site files aren't in the layer, they won't be used.  If
recipes aren't around, they won't be used.  It seems a bit silly if every
layer.conf ends up being a copy of every other layer.conf.  And this sort of
blind copying tends to lead to problems and cruft (just look at distros that
copy angstrom).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

