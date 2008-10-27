Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KuO8N-0003vZ-Hd; Mon, 27 Oct 2008 10:11:35 +0100
Received: from 88-111-134-150.dynamic.dsl.as9105.com ([88.111.134.150]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KuO7Y-00056c-Sj; Mon, 27 Oct 2008 09:10:45 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ge211u$h4r$1@ger.gmane.org>
References: <ge211u$h4r$1@ger.gmane.org>
Date: Mon, 27 Oct 2008 09:10:42 +0000
Message-Id: <1225098642.4235.371.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: Reverting recent openmoko commit
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
X-List-Received-Date: Mon, 27 Oct 2008 09:11:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-10-26 at 16:06 +0100, Koen Kooi wrote:
> I'm going to revert all recent openmoko commits till these guys learn 
> how to write a commit message. You have been warned before.
> 
> In case you missed it, this wrong:
> 
> [foo] something

This seems like an absurd over-reaction to something that is, at most, a
trivial and merely technical breach of the checkin rules.  

Indeed, it is not even obvious that the original checkin breached any
rule at all.  Where exactly is this strict format for commit messages
documented?  The policy page at
http://wiki.openembedded.net/index.php/Commit_Policy doesn't seem to
make mention of this.  The closest I could find was, under "other tips
for making good commits":

* Have a clear commit message (example):
    - The first line of commit is a summary of the changes.
    - The first line should start with the name of the recipe the change affects.

and, as far as I can tell, the message that you quoted does indeed
comply with these two guidelines, i.e. it contains the name of the
recipe follows by a summary of the changes.  Nowhere on this page, or
any other policy page that I found on quick inspection, were any further
rules about what exactly constitutes an acceptable or unacceptable
message.  In any case, further down the page is stated that "the above
rules are not hard and fast rules": there is no indication that a
non-conformant checkin message should lead to summary reversion of your
changes.

The GitPhrasebook page does mention a more prescriptive format for
checkin messages, but there is no indication that this is normative or
forms a core part of OE policy.  (If it were, I would have expected to
see it on the Commit Policy page, and/or to carry the imprimatur of the
core team.)

All in all then, this whole episode appears rather like you have decided
to enforce some arbitrary (and perhaps self-invented) rule for its own
sake, rather than because there is actually an important point at issue.
If true, that seems like inappropriate behaviour and, frankly, not
something that is likely to enhance OE's reputation as a
professionally-maintained tool for users to build their systems around.

So, please explain in more detail why you felt it was necessary to
revert these changes without further discussion.  Was this a core team
decision or did you act unilaterally?

p.




