Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oe0HK-0005to-Kg
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 08:38:11 +0200
Received: by bwz10 with SMTP id 10so3955472bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=GsNmSByzlNcGox08ZCqlRjgktsYK0XrgXSKJilDoXWc=;
	b=hFOBx6b7mPT5qWV9riqvW9KAN81MKeMnACQZI7nlLTW0Mc3VxmI5pJMWtkHOnendF+
	eJ720xVYUsFSzExB1WrcZrp2ujhAZoPXJ1gA99LTk3Ut/3xohM6a4GjmVyfPdXhtok0D
	rMdZ45dUF0Uyp5bEZXIJASYHC6HdwzmQyL5Yc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=gAUuq8/SCIv5rzThz7AG5ALYxUEMhDLEKy46s8aWwLI940arj7HkU3+LAQZsjUig7t
	1/uQ3+vvEG5TNjk8ircMgsb/7Bu/U0HgXiSSp4er618WhMlIqJWJ0ZsFosq7YzPOsj4U
	cTfTuvNksi4IGQk9TgGCoJPyeZ2tP1pA6dK08=
MIME-Version: 1.0
Received: by 10.204.126.92 with SMTP id b28mr7622131bks.47.1280299072355; Tue, 
	27 Jul 2010 23:37:52 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 27 Jul 2010 23:37:52 -0700 (PDT)
Date: Wed, 28 Jul 2010 08:37:52 +0200
Message-ID: <AANLkTin-WKHX0m7yU7pLGFV=g2X6kwcCdYEEUJ541SKq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [RFC] recipe owners
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
X-List-Received-Date: Wed, 28 Jul 2010 06:38:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/27 Chris Larson <clarson@kergoth.com>

> On Tue, Jul 27, 2010 at 3:19 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
> > PS: I think part of the problem is that most recipes do not have a
> > well-defined owner who is responsible for maintaining them. I know we use
> > to
> > have them  mentioned in the recipes. That had some issues, but at least
> it
> > was more clear who felt responsible for what, and it was also more clear
> > who
> > to bother to fix a recipe (and it was more clear which recipes are
> orphaned
> > or become orphaned when the maintainer leaves).
>
>
> I very strongly agree with this, but there have been issues with it in the
> past, due to people leaving the project, vacations, hiatus, they become a
> bottleneck.  But conceptually, maintainership seems like a very good idea
> to
> me.  If I considered myself the maintainer of a set of recipes, I'd do my
> best to ensure that they're always buildable and the recipes are always up
> with current conventions.  *shrug*
>

Chris, thanks for your reply.
I've turned this into a separate thread.

I'm well aware of the issues that caused us to leave recipe owners (and move
to the MAINTAINERS file).
However for lots of recipes it is now completely in limbo who maintains them
(if anyone).
As such the current solution seems to be less than the solution with
maintainer(s) per recipe.

Wrt the issues you mention: I understand this. It is unavoidable that people
e.g. leave, so we could take that into account.
Some ideas to tackle this:
 - still allow others to do small changes even if the maintainer cannot be
contacted (this is what to some  (this is similar to what we have in our
current commit policy:

 * It's fine to fix a recipe you don't maintain, but its polite to talk to
   any else actively maintaining that recipe. Try to contact the maintainer
   or, if no maintainer is listed, send a note to the OE developer mailing list.

- if people maintain a recipe but they become non-responsive without known
cause (e.g. no holidays, known issues, business trips, ...) the recipe
becomes orphaned and someone can step up to become the new maintainer (I
assume that someone is interested in the recipe, otherwise the orphanage of
the recipe would probably not be noticed). Btw: it is quite ok for me if a
recipe has >1 maintainer (and for core recipes I would even encourage that).
We can define some terms to quantify non-responsiveness if needed (e.g. not
responding to ML messages concerning your recipes for 3 weeks)

What do others feel about this ?

Frans (who prefers to have a recipe that he knows is maintained and looked
after above a recipe of a more questionable ownership).

