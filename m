Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OLHfa-0005QF-Me
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 17:21:52 +0200
Received: by gwb20 with SMTP id 20so805952gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=2FNJ7p8FIEHPkTPkx3J7a7DnCCZ69Bk4j+dK9YJ1X/s=;
	b=uydyYo9LZOprcip0/cQTV2VNllxfAA1TQrlK41CG7cSGgfcrlRo3NS5zVCwvkuBcNy
	LnBze4xpH8HJPsVL4ggsUiTG5jpN99XwaSNH5Ib4vvD+CUZOiumLfOg4/QGbx5hr3clb
	D1vQqsGMG2U0e3/kkL4X5bardlnWlh+12FUh8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=pLo87nINvgirRRINkEVy5K+6sNDHeNvp0tip5D7yG8XfvEd2I52DpjJKw+FLL4VdRe
	S5215vXZhzYZNIEJQwxhf0ayR+Lj/Lma7fQeEjm5pmbjNuVibOj+gI9ROVMnIOxcIANb
	+aAgxSyfFHqG0mAGHaDDxihXEplhMu3+DtKZo=
Received: by 10.229.236.76 with SMTP id kj12mr1525860qcb.226.1275837450252; 
	Sun, 06 Jun 2010 08:17:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Sun, 6 Jun 2010 08:17:09 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1006060305430.2276@lynx>
References: <alpine.DEB.2.00.1006050226160.9902@lynx>
	<AANLkTik0GDc2e8Rmzi_MiUmnu5RS1Feje3NUb1AIG6Vc@mail.gmail.com> 
	<alpine.DEB.2.00.1006060305430.2276@lynx>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 6 Jun 2010 08:17:09 -0700
X-Google-Sender-Auth: cGr_pqp6MG4oD2QPio0DLk3BNqk
Message-ID: <AANLkTinX_bz83oncCBWdPHvL1l1l545Ye4ix3PRCmZjw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: trying to simplify the patch/apply/pnum/striplevel jungle
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
X-List-Received-Date: Sun, 06 Jun 2010 15:21:52 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 6, 2010 at 12:14 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Sat, 5 Jun 2010, Chris Larson wrote:
> ...
> > pnum works for compatibility reasons, but it will display a warning, with
> a
> > pointer to the new parameter to use instead.  But yes, that's correct, it
> > was just a rename for clarity.
> ...
>
> > Yep, that's all correct.  It seemed silly to not optimize for the common
> > case - .diff/.patch & -p 1, so now it does so.  'patch' parameter too,
> still
> > works for compatibility, and will display a warning.
> ...
>
>  so while i'm working on the tougher stuff, i can easily submit a
> cleanup patch or three according to the following simplifications
> (some of which might not even occur in the source anywhere, these are
> just general rules):
>
> * any occurrences of pnum=1 or striplevel=1 are superfluous and can be
>  deleted
>
> * any *other* occurrences of pnum= can be replaced by the equivalent
>  striplevel=
>
> * any *necessary* occurrences of patch=1 can be replaced by apply=yes
>
> * any *unnecessary* occurrences of patch=1 or apply=yes can be
>  removed; those would be cases where patching would automatically
>  happen, as in that previous example i gave:
>
> recipes/udev/udev_100.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> recipes/udev/udev_100.bb:           file://flags.patch;patch=1 \
> recipes/udev/udev_100.bb:
> file://mtd-exclude-persistent.patch;patch=1 \
> recipes/udev/udev_092.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> ...
>
>
>  does all that sound reasonable?  not profoundly deep, just a first
> stab at cleanup, and it would eventually be accompanied by updating
> the user manual to emphasize that.


Yep, that sounds fine to me.  I tried to do that with a number of sed
scripts in the initial commits, but either I missed a few or some snuck in
from merges and other commits after that went in :)  Both are likely,
really.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

