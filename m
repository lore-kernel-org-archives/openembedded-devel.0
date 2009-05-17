Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M5hIz-0004IK-AG
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 16:25:33 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M5hC3-000626-FU
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 15:18:23 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A1017FB.2000204@balister.org>
References: <4A1014BA.50905@nospam.arcornews.de>
	<4A1017FB.2000204@balister.org>
Date: Sun, 17 May 2009 15:18:21 +0100
Message-Id: <1242569901.4226.28.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] rw for Lynn Lin
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
X-List-Received-Date: Sun, 17 May 2009 14:25:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-17 at 09:58 -0400, Philip Balister wrote:
> PS: I know this is getting posted twice ... I am checking the both 
> lists.oe.org and oe.org and receiving email.

Yeah, this is a longstanding misfeature of the way this mailing list is
set up and it is a little bit annoying.  What happens is that you can
post to either oe-devel@lists.oe.org, or oe-devel@oe.org, but mailman
always adds Reply-to: oe-devel@lists.oe.org irrespective of which
address was used for posting.  If you hit "Reply to all" on an email
which has different things in To: and Reply-to:, most MUAs will send a
copy of the reply to both places; Mailman doesn't seem to be de-duping
them, which means that we get both showing up on the list.

There are a few different ways to fix it but all of them would require
tweaks to the server configuration:

1. Just turn off the aliasing on the @oe.org address and make everybody
use the @lists.oe.org one.  This would be a bit unfriendly but it's
probably the least administrative effort.

2. Configure Mailman to not add Reply-to at all, and rely on users
always hitting "Reply to all".  This is the best solution if you belong
to the "reply-to considered harmful" school of thought, and/or can live
with some replies accidentally getting sent to just the original poster
and not the whole list.

2. Configure the mail system on lists.oe.org to rewrite oe-devel@oe.org
-> oe-devel@lists.oe.org on all incoming posts so that the To: and
Reply-to: headers are consistent with each other.  If the replying MUA
only sees a single address there then it will only send one copy even
with "reply to all".  This is probably the best solution if you want to
keep the Reply-to header.

4. Configure the lists.oe.org mail system to spot these dupes (which
have the same Message-ID) and drop all but the first copy.

p.




