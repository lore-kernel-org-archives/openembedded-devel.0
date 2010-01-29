Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Narzl-0006Wj-Hj
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 15:38:52 +0100
Received: by pzk30 with SMTP id 30so1528841pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=cPPep+B3muQy/34jJWq8NwaYWjCH4f3H+SoRb27LTLI=;
	b=p8A1CxuUWXnohjV6kqKN3NCzyM3bdQBiwxZKKFO2QHVndNvSEZb2uKr6fEJis8ZjMN
	1sbzHr+cS2aBdRj0MG+naczwbVlapPjV+xvXIN4GtddEIyU6csF0GIrmS1F28u8xYuZh
	YKa4NH5GxAi8YlTDHOrr8m8IIufCY8OGDCKxs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=gDhHruyFqHJkoFU3HxqHmJeLRh9vog+5G48nOT65MZwLL1JfUSJfhDbfAbzdiP/6Av
	q/ETQO7QFWjsHvKg/y7kwnetoszhNY9725KOB8p/gWMPNbfdGW/jUllRyKSab5AEysqd
	On6MMRbGzFSbTlaOQjB9KN8G6BWyYraqi6azA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.151.23 with SMTP id y23mr615211wfd.269.1264775785111; Fri, 
	29 Jan 2010 06:36:25 -0800 (PST)
In-Reply-To: <hjud6i$77n$1@ger.gmane.org>
References: <1264759676-23841-1-git-send-email-michael.lippautz@gmail.com> 
	<hjud6i$77n$1@ger.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 29 Jan 2010 07:36:05 -0700
X-Google-Sender-Auth: 70392c3f002733ea
Message-ID: <b6ebd0a51001290636m11f0e72o7ab2f24918944e31@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] libdbd-sqlite-perl: New recipe for SQLite DBI interface driver
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
X-List-Received-Date: Fri, 29 Jan 2010 14:38:52 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 29, 2010 at 3:27 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 29-01-10 11:07, Michael Lippautz wrote:
> > ---
> >  recipes/perl/libdbd-sqlite-perl_1.29.bb |   29
> +++++++++++++++++++++++++++++
> >  1 files changed, 29 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/perl/libdbd-sqlite-perl_1.29.bb
> >
> > diff --git a/recipes/perl/libdbd-sqlite-perl_1.29.bb b/recipes/perl/
> libdbd-sqlite-perl_1.29.bb
> > new file mode 100644
> > index 0000000..10fe73a
> > --- /dev/null
> > +++ b/recipes/perl/libdbd-sqlite-perl_1.29.bb
> > @@ -0,0 +1,29 @@
> > +DESCRIPTION = "PERL database interface driver for the SQLite database."
> > +SECTION = "libs"
> > +LICENSE = "Artistic|GPL"
> > +DEPENDS = "libdbi-perl-native"
> > +RDEPENDS = "libdbi-perl \
>
> That should be RDEPENDS_${PN}
>
> We did have a script somewhere to check for things like that, does
> anyone know where that went?
>

Here's one option:

INHERIT += "recipe_sanity"
bitbake -c recipe_sanity libdbd-sqlite-perl
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

