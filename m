Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KNvGw-0002mI-Hh
	for openembedded-devel@openembedded.org; Tue, 29 Jul 2008 21:54:14 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080729195232.IAEO29505.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jul 2008 15:52:32 -0400
Received: from localhost ([68.230.56.208]) by fed1rmimpo02.cox.net with bizsmtp
	id vvsZ1Z0014VZ64s04vsZ4Z; Tue, 29 Jul 2008 15:52:33 -0400
Date: Tue, 29 Jul 2008 12:52:32 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080729195232.GE2795@smtp.west.cox.net>
References: <1217340989.5482.10.camel@dax.rpnet.com> <488F6B5B.4090400@gmx.de>
	<873als8p2d.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <873als8p2d.fsf@neumann.lab.ossystems.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 29 Jul 2008 19:54:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 29, 2008 at 04:31:38PM -0300, Otavio Salvador wrote:
> Thomas Kunze <thommycheck@gmx.de> writes:
> 
> > Hi,
> >
> > just a minor question:
> > Can we have the sender for commit messages as it is in monotone?
> > e.g. "mickeyl commit" instead of  "OE GIT Trial"
> >
> > I find it very useful to be able to see who committed sth. with a
> > short look
> > into my mailbox.
> 
> You'll see the merge commit and the mail script could be changed to
> post the commiter id too I guess.

The following script is something I used to use years ago on the linux
kernel git commit lists and triggered from procmail:
#!/bin/sh

TMP=`mktemp /tmp/setfrom.XXXXXX`
cat > $TMP

## Old BitKeeper logic
from=`grep '^ChangeSet' $TMP | head -1 | awk '{print $NF}'`

## New git logic
author=`sed -n '/^author /p' < $TMP | head -n 1`
if [ ! -z "$author" ]; then
  from=`echo $author | sed 's/author \(.*>\).*/\1/'`
  date=`echo $author | sed 's/author.*> //'`
fi
if test -n "$from" -a -n "$date"; then
  formail -I "From: $from" -I "Date: `date -d "$date" -R`" < $TMP
else
  if test -n "$from"; then
    formail -I "From: $from" < $TMP
  else
    cat $TMP
  fi
fi

rm $TMP

-- 
Tom Rini


