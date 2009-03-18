Received: from [65.182.109.70] (helo=mta1.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1Ljxdi-0001pu-Ux
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 16:25:30 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta1.brinkster.com (Postfix) with ESMTP id 7DA19396409
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:24:08 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta1.brinkster.com ([127.0.0.1])
	by localhost (mta1.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3S2aSbSSqCkf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:24:04 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta1.brinkster.com (Postfix) with ESMTP id 03FB2395A17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 11:24:02 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2009 15:23:48 -0000
Message-ID: <01c401c9a7dd$8a20b4a0$9e621de0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Acmn3YiCin2OBxB+Qgm4MHx0gIC3pg==
X-SA-Exim-Connect-IP: 65.182.109.70
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,MSGID_MULTIPLE_AT,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Loss of all package history following the recipe rename.
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
X-List-Received-Date: Wed, 18 Mar 2009 15:25:35 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

People,

Am I right in assuming that the decision to drop history for all packages
was really an unintentional side effect of this change? 

Unless I am going totally nuts the ONLY history for a given package now is
the 'git mv' commit.

i.e. on GIT HEAD

git log recipes/abiword/abiword-plugins_2.5.2.bb
commit 709c4d66e0b107ca606941b988bad717c0b45d9b
Author: Denys Dmytriyenko <denis@denix.org>
<snip, only the only commit logged>

On an old tree I keep for reference.

git log packages/abiword/abiword-plugins_2.5.2.bb
<snip, page after page of commits logged>

I just checked and the behavior of 'git mv' and it seems it's really just
'git rm && git add' under the hood, a few local experiments seem to confirm
that is the by design behavior (seems totally insane for a source control
system to do that however :-o) and after the 'git rm' the history is toast
as your then creating a new object with the same content as the removed one
:(.

I am not sure what we can do about this without resorting to a revert but it
looks like we may wish to look into something like 'git-filter-branch' (and
several other tools) to redo the move with something like the history
intact. 

That said, 'git-filter-branch' is a little scary and is proving to be more
then I really planned to be messing with on a sunny afternoon and I am not
totally sure if it will even do what is needed.

Does anyone have any other ideas or comment? Or have I completely lost the
plot and there is not really any problem other then in my local trees?

Regards,

John

--

> What is a grue?

The grue is a sinister, lurking presence in the dark places of the earth.
Its favourite diet is adventurers, but its insatiable appetite is tempered
by its fear of light. No grue has ever been seen by the light of day, and
few have survived its fearsome jaws to tell the tale.





