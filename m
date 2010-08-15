Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkegO-0002We-7b
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 16:59:33 +0200
Received: by iwn38 with SMTP id 38so707796iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Aug 2010 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=GxMbUv4ghJQqsPdxzN2Jmh9dhXr0UZ1xhv2vJy15nu8=;
	b=Tl94qLmBFa6iPqOCh4n5G9QyRYJLHAX8pR40lHsSppjhY5ZFsW81KMsm4xhYVcIOq5
	66dlc7PJHLdUlLQU/cRRv/x7TMg8KYqW5Qf3Dqz2uxIZgKGSDeipZ20EYQsUU8KDbq+N
	h4Nx8miAdA0S3dw0F4oTOflULdUMj5ekkZk1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Rn7XbJnOhWQWh5yxSNUUFByKq6cGsveNnhfy4a/rZcaGMyV7q7lIOvaHYIrfjN+av8
	sjE9XTe4meaesHdeazIU2eMrE6/PBHfbu0sVJ1xufADmBomlA16mPCG5PTkCPgFi912O
	VNsextmUZPCzy0T6Ztn2fTFU7L06Zgtfnwckg=
MIME-Version: 1.0
Received: by 10.231.145.16 with SMTP id b16mr4160712ibv.198.1281884357470;
	Sun, 15 Aug 2010 07:59:17 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sun, 15 Aug 2010 07:59:17 -0700 (PDT)
Date: Sun, 15 Aug 2010 16:59:17 +0200
Message-ID: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: cleaning recipes
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
X-List-Received-Date: Sun, 15 Aug 2010 14:59:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

As some of you might have noticed I've been cleaning up our
recipes.during the last week or so.
As I had some time at hand this weekend, lots of cleaning has been done.
I did my very best to stay within the guidelines of the TSC (as
described in http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/020047.html),
but it is quite possible that at some point I made a mistake or so.
If so, let me know and I'll repair things and/or revert the commit. (I
feel if you make a mess you should also clean it yourself).

Rationale for doing so is that it makes the tasks as listed in
http://wiki.openembedded.org/index.php/OpenEmbeddedJanitors simpler
(because less recipes need to be looked at).

As it stands the job is not done. I've mainly peeked at all recipes
that had more than 10 versions.

I did not touch core directories like gcc, glibc/uclibc/eglibc,
binutils, although I feel some pruging of old stuff would be useful
there. E.g. is there still a use for gcc 4.1.0 ? )
Then again these are typically well maintained and looked after, so
there are probably hardly any issues that would require cleanup.

I also stayed away from core recipes like linux and u-boot (although I
can imagine some version scould be deprecated. Also the policy on when
to create a different recipe and when to modify an existing one is
vague at best.
Some harmonisation would be nice.

Then there are the opie dirs: bluelightning told me he would look into
this and expire the older versions.

X related stuff was also left untouched JaMa told me he was looking into that.

And I skipped the ti dir. I would propose the ti people look into it.
E.g. is there a need for 12 ti-xdctools recipes, 5 of wihch are pinned
(and yeah, I understand that these probably are closely linked to a
codec engine version, still 12 seems from a process point of view
quite a lot)

Anyway, if there are issues because of this action, or if you feel
removal of a recipe was not in accordance with the TSC guidelines, let
me know and I'll repair.

Have fun!
Frans


