Received: from qw-out-1920.google.com ([74.125.92.150])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nu5aq-0000aH-GM
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 16:00:33 +0100
Received: by qw-out-1920.google.com with SMTP id 4so579097qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=LowyFTA47cxDTouHoEoBx0kH7FYVLAoxlCu2g+yBkjE=;
	b=qdzgPobqqIed6762XGEZdjB0qgJmV6DuQB34Ae0ADP77QUatDGacMWqKjHKb/PmmeI
	PZ6YoXIleqV9JC8KRUI5xF6i3nSv0lrNwx/WnVAlAOBznhLIFrcMGXWYadPaQcxwml8q
	4cRwrEVyWMaHiYRtYQEHJc6q67Q97CjhjlNH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=HxNOVcSg0ytC6dyrd/PyJsjnSQc9d7f+SQhOVYLDguhHyPzt22a5lGMSKhtvq60k4Q
	VCm24kmngNWMukosD/lSYZA6vTHhqa39KPwXEg9gmhcJ0Wk7b55GeUGbDm3ukOHHBQP9
	G5lwxm/1vrTEuJL9XsLnLCUilhFzW4VJPAiI8=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.88.193 with SMTP id b1mr683824qcm.27.1269356245166; Tue, 
	23 Mar 2010 07:57:25 -0700 (PDT)
In-Reply-To: <ac9c93b11003230232y2b556dc3t19813973d7c01b46@mail.gmail.com>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com> 
	<ac9c93b11003230232y2b556dc3t19813973d7c01b46@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 07:57:05 -0700
X-Google-Sender-Auth: 287ef44c0c375352
Message-ID: <b6ebd0a51003230757q85a75d9jba8f43adc9a4eb35@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.150
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 15:00:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 23, 2010 at 2:32 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Chris, while this is a nice idea it conflicts with having checksums in
> the recipe, as that makes the recipes unique.
> Unless of course there is (or we create) a way to have multiple
> checksums in a recipe and pick the one that is for the version we are
> building.
>

See the gist for nano that I linked in the email, I set it up so that works.
 SRC_URI_<pv> flags are automatically transferred to SRC_URI via an
anonymous python function.  I have a checksums.inc that sets them all.

Then again I feel it is in most cases better to move forward. E.g. for
> your nano example: why would people want to build say nano 1.0.2 if
> there is also a working 1.0.6 recipe (or even a 2.2.3 one or whatever
> version it is at). I feel it is better to spent time to
> fix/improve/add/repair the latest version than spend time fixing old
> code.
> (generally speaking that is)
>

Well, in part I agree, and in part I disagree.  This is why I started this
thread about the worth of the feature.  For companies and the like, keeping
old versions around indefinitely is a good thing, and while I know many will
argue that they can keep their recipes for it around, that just encourages
deviation from OE, and believe me, I know how much of a pain it is for a
company to stay in sync with OE :)

Thanks for the comments.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

