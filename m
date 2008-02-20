Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRpNa-00077F-Sz
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2008 14:53:01 +0100
Received: by ug-out-1314.google.com with SMTP id i24so4116505ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2008 05:52:01 -0800 (PST)
Received: by 10.67.22.2 with SMTP id z2mr2557554ugi.1.1203515521413;
	Wed, 20 Feb 2008 05:52:01 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id e1sm9103614ugf.34.2008.02.20.05.51.59
	(version=SSLv3 cipher=OTHER); Wed, 20 Feb 2008 05:52:00 -0800 (PST)
Date: Wed, 20 Feb 2008 15:53:39 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Stanislav Brabec <utx@penguin.cz>
Message-ID: <20080220155339.67aed5d4@widy.localdomain>
In-Reply-To: <1203502545.6860.13.camel@hammer.suse.cz>
References: <E1JRbhB-0000nu-DN@linuxtogo.org>
	<20080220015817.1e33f547@widy.localdomain>
	<20080220020418.1e4dda5a@widy.localdomain>
	<1203502545.6860.13.camel@hammer.suse.cz>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.175
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev - Ignore false toggle signals (work-around for OE#3390).
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2008 13:53:01 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 20 Feb 2008 11:15:45 +0100
Stanislav Brabec <utx@penguin.cz> wrote:

> Paul Sokolovsky wrote:
> 
> > > On Wed, 20 Feb 2008 00:16:17 +0100
> > > "utx commit" <openembedded-commits@lists.openembedded.org> wrote:
> > > 
> > > > - Ignore false toggle signals (work-around for OE#3390).
> > > > - Fixed default ALSA state for SL-Cxx00 (OE#2617).
> > > > - Do not alter incorrect mixer levels by zaurus-mixer-callback.
> > > > - Allow to disable rotation by touch ~/.norot.
> > > > - Fixed detection of panel_user.
> > > > 
> > > > Author: utx@openembedded.org
> > > 
> > > Stanislav, congratulations on getting commit access to OE!
> > > There're few guidelines for developers at
> > > http://www.openembedded.org/wiki/Policies . In particular,
> > > adhering to http://www.openembedded.org/wiki/CommitPolicy allows
> > > for easy peer review and per-package commit search.
> 
> I seen bad formatting in http://monotone.openembedded.org/ and
> gathered bad format of the message. Further messages will be correct
> (I hope).
> 
> My current fixes were done long time ago and ported several times, so
> I no more had one patch per particular change. All future changes will
> follow the rule "each change as separate changeset".
> 
> Note that the policy is missing "Closing bugs policy". Bug was
> reported against Angstrom, now it is fixed in OE.dev. Should the bug
> be closed now, or after backporting the fix to stable Angstrom?

The idea of Angstrom Release bugs (rooted at
http://bugs.openembedded.org/show_bug.cgi?id=1573 ) is to provide list
of known issues to the end user. End user sees only release images and
feeds. So, if bug is fixed in source, but corresponding package hasn't
made to feeds, then per above idea (hopefully pretty obvious and
no-nonsense), the bug should not be closed.

It practice that means that developers should annotate the bug with
"pushed to .dev", "RFCed for merging to stable", "pushed to stable",
and ultimately, "package in feed, closing".

There're possibly other ways to make process more explicit, for
example, there're FIXED and CLOSED status in bugzilla, so it could be
FIXED when fix committed to main branch, and closed once fix is
confirmed to have solved the issue on user system. But CLOSED is not
used in existing OE bug process, and I'm in no authority to propose it
specifically for Angstrom - even the workflow above is pretty complex,
not really followed much and used to raise misunderstandings with other
bug maintainers.

> 
> -- 
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


