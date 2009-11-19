Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NB7a4-00059R-OX
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 15:01:56 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NB7Yh-0002hG-6W
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:00:27 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NB7Yh-0003KQ-0c
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:00:27 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258637996-19441-1-git-send-email-Martin.Jansa@gmail.com>
References: <1258637996-19441-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 19 Nov 2009 14:00:23 +0000
Message-Id: <1258639223.23826.98.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] bitbake.conf: Fix OVERRIDES description (After pb's explanation)
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
X-List-Received-Date: Thu, 19 Nov 2009 14:01:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 14:39 +0100, Martin Jansa wrote:
> +# You can use combination ie you can use '<foo>_arm_ramses' to override both '<foo>' and '<foo>_arm'.

This part is not universally true: again, it depends on the order of the
things in ${OVERRIDES}.  The comment as written there is probably true
for the example OVERRIDES but it is a bit misleading in general.

In your particular case, where you had MACHINE before TARGET_ARCH in
overrides, it so happens that stacking up overrides in that fashion is
the easiest way to work around the (arguably wrong) ordering of your
overrides and get the result you were looking for.  But, if the order of
OVERRIDES had been reversed, this trick would cease to work.

To expand a bit on my irc description, what's going on here is the
following:

In your original case you had (effectively)

OVERRIDES = local:ramses:arm

FOO = "1"
FOO_arm = "2"
FOO_ramses = "3"

and bitbake processes the overrides left to right, so it first collapses
FOO_ramses onto FOO (giving FOO = "3") but then also collapses FOO_arm
onto the same variable, overwriting the value that was assigned by the
second override and leaving FOO = "2".

In your modified case you now have FOO_arm_ramses = "3".  In this case
what happens is that bitbake firstly applies the "ramses" overrides and
collapses FOO_arm_ramses onto FOO_arm, leaving FOO = "1" (unchanged thus
far) and FOO_arm = "3".  Then, it moves to processing the "arm"
overrides, collapsing FOO_arm onto FOO and giving you FOO = "3".

All of this stuff is somewhat dependent on internal implementation
details of bitbake and I am not sure to what extent it is safe to assume
that the behaviour will always remain the same.  That'd probably be an
issue that should be addressed in the bitbake user manual if it isn't
already.

p.





