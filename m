Received: from mail-qy0-f196.google.com ([209.85.221.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O25FA-0004Pc-NB
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Apr 2010 18:15:16 +0200
Received: by qyk34 with SMTP id 34so443834qyk.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=cnwvdHuez37SvIBE4bqcVW3mzR+GAz60St1WKUzTkGs=;
	b=t5Zok77UtopILsAgDfGn0L99d0FArO3ZRer50siA0qRMgvs0atwlgmAQ/klopeaswd
	wObgDCFBcsxNJ1LLGuVhbQmGqKfr22YEVSAuiAgx3cFZ8DaxsyR3XVHsK01WUqo73eWW
	zoxZRcvgboFGz6Bl5z0gPMNtXJVUQEwXmNvp4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=pxzH3ukUUeguG7n1bnbRfgBecZmXLwbU52xgyGW25guwssbh9DECumTK7XySlQsK1/
	8gZ+Yo1tEIG8JVhy8S5AN94aSKhX3ghcPkqDfeZu9DIBDSGalaOQTISueBbABnsQhlvP
	DV5bew36oyYFW51oQApmg5uNsaiUvOHm+rgzY=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.46.205 with HTTP; Wed, 14 Apr 2010 09:10:58 -0700 (PDT)
In-Reply-To: <lyy6gq184n.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1271237902-6295-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<lyy6gq184n.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 14 Apr 2010 09:10:58 -0700
X-Google-Sender-Auth: 0542940c06688221
Received: by 10.229.227.149 with SMTP id ja21mr6836343qcb.74.1271261478879; 
	Wed, 14 Apr 2010 09:11:18 -0700 (PDT)
Message-ID: <l2wb6ebd0a51004140910l805baeefj35a3d2300e17ee72@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.196
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] dbus: use $(LIBTOOL) to install 'dbus-daemon'
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
X-List-Received-Date: Wed, 14 Apr 2010 16:15:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 14, 2010 at 6:22 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Enrico Scholz <enrico.scholz@sigma-chemnitz.de> writes:
>
> > Depending on autotools/libtool version and configure flags, dbus-daemon
> > will be built sometimes below .libs/ and sometimes in base directory.
> >
> > Using 'libtool --mode=install' is a portable way to deal with this.
> >
> > Changing Makefile.am to use native automake methods to install this
> > files would be a better but more invasive fix.
>
> oops... forgot the
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

Looks reasonable.

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

