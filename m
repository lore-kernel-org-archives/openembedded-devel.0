Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OscA7-0004zV-VJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 15:55:08 +0200
Received: by wwi14 with SMTP id 14so3881540wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ke0dG+HT9UTVjfYkMj+AULZ6w5yb7TfmySktvEnsEZE=;
	b=KIzJN3tMsB+hdMnpaxmuerXAzx2TiVSo83PJ8iAA4V4RKSaDu/c+7xA/E3fM2s/rVC
	ZmVeVrSxn4IdAxwDFVlMZAqwcI7XLYfeffRVBLlSC4OEA3lGuroYNkb+xggzQH3yu2UU
	Vj0P65nHFyDjBZY3wYQWqxQcptSsG6s+ZeqwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=xterKp4W8xWxOhmKhl+Rr9Z2lGeVXM3HasLHBZtf+SKuLVdtz9Sz46tbfWlxU3jQ6t
	RsptqIE9mAJQfEdhQqhJRiOXXMVKuHvD+sxVhY44SKX+er1gB8CInLp0Oe5+94br3VYS
	k2GEZaLk6eKdJUlpVt/r2jgfIZc7AwVBhq1Do=
Received: by 10.216.1.208 with SMTP id 58mr3824042wed.22.1283781268267; Mon,
	06 Sep 2010 06:54:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Mon, 6 Sep 2010 06:54:08 -0700 (PDT)
In-Reply-To: <AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
	<20100906035002.GB5320@gmail.com>
	<AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 6 Sep 2010 06:54:08 -0700
X-Google-Sender-Auth: YSa4RuQ8fKcNQQbmhWr6LbBdR5I
Message-ID: <AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Mon, 06 Sep 2010 13:55:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 6, 2010 at 12:41 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/9/6 Khem Raj <raj.khem@gmail.com>:
> > On (19/08/10 21:14), Frans Meulenbroeks wrote:
> >> 2010/8/19 Chris Larson <clarson@kergoth.com>:
> >> > On Thu, Aug 19, 2010 at 4:29 AM, Frans Meulenbroeks <
> >> > fransmeulenbroeks@gmail.com> wrote:
> >> >
> >> >> Hi,
> >> >>
> >> >> Found this in our reicpes:
> >> >>
> >> >> dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
> >> >>
> >> >
> >> > This prepends to do_install_virtclass-native, which will then replace
> >> > do_install when the overrides are applied.  This is prepending to a
> variable
> >> > which overrides, as opposed to the other, which is a conditional
> prepend.
> >> >  The two are quite different.  It's unlikely that this is what they
> >> > intended.  Far more likely that it should be changed to
> >> > _prepend_virtclass-native.
> >>
> >> I have no idea what is intended and I have no dbus knowledge, so can't
> fix this.
> >> I'll leave it to someone else to resolve this.
> >
> > I think the correct fix is as Chris suggested. Please go ahead and fix
> it.
> >
>
> Well I am a little bit hesitating as I am by no means an expert on the
> dbus recipe.
>
> The other question that immediately popped up is:
> If the code is wrong and no-one noticed, is it actually needed?
>
> The code is:
> do_install_virtclass-native_prepend() {
>         install -d ${D}${datadir}/dbus
>        install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
> }
>
> Actually if the standard do_install needs to be changed, it generally
> raises some alarms with me.
> Why would we need to install something that the package normally does
> not install?
> (of course this could be a bug in the package, but then I would prefer
> a patch that we also try to push upstream).
>

Agreed, that is odd.  If it's something that dbus using things might need,
why is it only prepended for the native version, and as you say, why is it
not installed by the upstream install target.  I'd do a git blame and figure
out who added that and ask them :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

