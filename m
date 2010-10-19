Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P8F4N-0007Fp-ED
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 18:29:50 +0200
Received: by wyb40 with SMTP id 40so2679565wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 09:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=rscdxTTTMk+XIAJW/g1AUKxdPq1QMI3YqNdgtJvVhyU=;
	b=bWM6z+Am1U0OaMH3m/A0w5z7bgBzjxad8wEnM5AG7gMN+IJqiYSwUp2ekLMl5DvJ/P
	k7We72SQ8ye8sDYmDdUlI7pcQUHNuFJ6cZg9FTf/gKhy0jDVmZ/LrGK8TZGnuIpY10It
	cFvGliQVJgkyKZFCprgDIfsdD3j/i6H3RmCVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=SUaNXTuM8K58MIUidID/KR9lZxteEfeIi6Wekk3e9KbneqnPEseZvnhgD6oDlBFrEj
	Fh7OFULlO5dWeyxKJ3Uw0LaT9xjiv++IJus3cL86AyjRw/zvRLRmb4F9Iv1heh9Nphbo
	pBDWMdVYSF9Yxkllf9QHdUSbT6B2gr+iXGY8g=
Received: by 10.227.129.69 with SMTP id n5mr6607964wbs.23.1287505751880; Tue,
	19 Oct 2010 09:29:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Tue, 19 Oct 2010 09:28:49 -0700 (PDT)
In-Reply-To: <AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
References: <1287218988-3946-1-git-send-email-ynezz@true.cz>
	<AANLkTi=_3DKvm3bbHuvdvQYOS9M3WDKaBjg2aON=kYWS@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 19 Oct 2010 09:28:49 -0700
X-Google-Sender-Auth: Asw-7s1tn5nXIlmI85qGjSkNvUQ
Message-ID: <AANLkTik89gs3KAkxrWJ56EyWSH9peBcgKMLbE65jE+xr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] oestats-client.bbclass: send USERDISTRO value
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
X-List-Received-Date: Tue, 19 Oct 2010 16:29:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2010 at 1:58 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/10/16 Petr =C5=A0tetiar <ynezz@true.cz>:
> > With this patch it's now possible to see the correct Angstrom distro
> version
> > in the Tinderbox. Now the distribution value is always 'angstrom', with
> this
> > patch it would be more detailed version 'angstrom-2008.1' for example.
> >
> > Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> > ---
> >  classes/oestats-client.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/classes/oestats-client.bbclass
> b/classes/oestats-client.bbclass
> > index 4415461..a98c9d1 100644
> > --- a/classes/oestats-client.bbclass
> > +++ b/classes/oestats-client.bbclass
> > @@ -77,7 +77,7 @@ def oestats_start(server, builder, d):
> >                        'metadata_branch':
> bb.data.getVar('METADATA_BRANCH', d, True),
> >                        'metadata_revision':
> bb.data.getVar('METADATA_REVISION', d, True),
> >                        'machine': bb.data.getVar('MACHINE', d, True),
> > -                       'distro': bb.data.getVar('DISTRO', d, True),
> > +                       'distro': bb.data.getVar('USERDISTRO', d, True)=
,
> >                })
> >                if re.match("^\d+$", data): id=3Ddata
> >        except:
> > --
> > 1.7.0.4
> >
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>

Acked-by: Chris Larson <chris_larson@mentor.com>

--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

