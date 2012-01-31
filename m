Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsJ8u-0004eU-G6
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 20:13:24 +0100
Received: by lahc1 with SMTP id c1so210880lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 11:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=KgzxIkU18tinta3D/4xUy8Ixsdt1x+V7m9RZba0v/kc=;
	b=Xz0K7B9OtxJefKgtw45IZZhkUn659JAifIM2K9d8SoEL6A8z2NbGP+3/X04pGhjN0y
	vTAKOhBwqMI46Lr6lk9fBMVPG1U/erI3X7bPJ9rrmb5e+n2Pc4zqZuHn62d+7mxXoa3X
	RhC5kaGkVGl+pLx1Yb8UxquPoKU0S8s8+okzA=
MIME-Version: 1.0
Received: by 10.152.146.163 with SMTP id td3mr11658818lab.6.1328036730489;
	Tue, 31 Jan 2012 11:05:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Tue, 31 Jan 2012 11:05:30 -0800 (PST)
In-Reply-To: <CAEsOVNc+FnZf4hqDrHYE3AcjPO6wM3vFReQkbppJV9uqo=+tqQ@mail.gmail.com>
References: <1327952855-28040-1-git-send-email-tworaz666@gmail.com>
	<jg6sti$vjj$1@dough.gmane.org> <4F26FD7E.5040908@gmail.com>
	<jg87do$beo$1@dough.gmane.org>
	<CAEsOVNc+FnZf4hqDrHYE3AcjPO6wM3vFReQkbppJV9uqo=+tqQ@mail.gmail.com>
Date: Tue, 31 Jan 2012 17:05:30 -0200
X-Google-Sender-Auth: 5Ye12A_uqCi2pDtKz8G7UVB__ew
Message-ID: <CAP9ODKoymHm0ui4Vo004pau084s8CcZ7-BX71FugNUpcBhno8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 3/3] pidgin: Add gconf to RDEPENDS for libpurple.
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
X-List-Received-Date: Tue, 31 Jan 2012 19:13:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 31, 2012 at 14:53, McClintock Matthew-B29882 <
B29882@freescale.com> wrote:

> On Tue, Jan 31, 2012 at 2:06 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 30-01-12 21:28, Peter Tworek schreef:
> >> On 01/30/2012 09:00 PM, Koen Kooi wrote: Op 30-01-12 20:47, Peter Tworek
> >> schreef:
> >>>>> Without it postinst script for libpurple fails when gconf is not
> >>>>> installed: //var/lib/opkg/info/libpurple.postinst: line 8:
> >>>>> gconftool-2: command not found
> >> Why is gconf.bbclass failing to do that?
> >>> As far as I understand it only adds gconf to DEPENDS. If a package
> >>> contents are not linked with libgconf-2 (libpurple only needs
> >>> gconftool-2) gconf won't be pulled in as a runtime dependency.
> >
> > That means it's a bug in gconf.bbclass and needs to get fixed there.
>
> Really? Do you really want to automatically add gconf deps to the
> misc. packages added by a recipe?


If it uses gconf it needs to rdepends on it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

