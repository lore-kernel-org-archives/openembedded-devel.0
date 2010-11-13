Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1PH7n0-0001Cq-94
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 05:32:38 +0100
Received: from [192.168.1.178] (95.232.144.102) by smtp208.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A27160A0022BB for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 05:31:32 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1289596756.2595.0.camel@gnutoo-laptop>
References: <1289596368-4717-1-git-send-email-GNUtoo@no-log.org>
	<1289596756.2595.0.camel@gnutoo-laptop>
Date: Sat, 13 Nov 2010 05:31:31 +0100
Message-ID: <1289622691.9445.1.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.104
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-x11 1.2.14 : fix alsa detection
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
X-List-Received-Date: Sat, 13 Nov 2010 04:32:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-11-12 at 22:19 +0100, Denis 'GNUtoo' Carikli wrote:
> On Fri, 2010-11-12 at 22:12 +0100, Denis 'GNUtoo' Carikli wrote:
> > hi,
> > 
> > Here's a patch that fixes alsa detection with libsdl-x11 1.2.14
> > 
> > on irc(#oe on Freenode) khem asked me to send a patch for that so he could review it.
> > 
> > Here it is.
> I don't know what happened, it seem that the patch didn't reach the
> mailing list even if git-send-email said:
> >Result: 250 OK
> 
> Denis.
here's the third try which failed too:

gnutoo@gnutoo-laptop:~/embedded/oe/org.openembedded.dev$ git send-email
0001-libsdl-x11-1.2.14-removing-libtool-update.patch-fixe.patch
0001-libsdl-x11-1.2.14-removing-libtool-update.patch-fixe.patch
Who should the emails appear to be from? [Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org>] 
Emails will be sent from: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID to be used as In-Reply-To for the first email?
<1289596756.2595.0.camel@gnutoo-laptop>
(mbox) Adding cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org> from line
'From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>'
(body) Adding cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org> from line
'Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>'

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Subject: [PATCH] libsdl-x11 1.2.14: removing libtool-update.patch fixes
alsa detection
Date: Sat, 13 Nov 2010 05:20:10 +0100
Message-Id: <1289622010-12683-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1289596756.2595.0.camel@gnutoo-laptop>
References: <1289596756.2595.0.camel@gnutoo-laptop>

    The Cc list above has been expanded by additional
    addresses found in the patch commit message. By default
    send-email prompts before sending whenever this occurs.
    This behavior is controlled by the sendemail.confirm
    configuration setting.

    For additional information, run 'git send-email --help'.
    To retain the current behavior, but squelch this message,
    run 'git config --global sendemail.confirm auto'.

Send this email? ([y]es|[n]o|[q]uit|[a]ll): y
Password: 
invalid user ID or password
gnutoo@gnutoo-laptop:~/embedded/oe/org.openembedded.dev$ git send-email
0001-libsdl-x11-1.2.14-removing-libtool-update.patch-fixe.patch
0001-libsdl-x11-1.2.14-removing-libtool-update.patch-fixe.patch
Who should the emails appear to be from? [Denis 'GNUtoo' Carikli
<GNUtoo@no-log.org>] 
Emails will be sent from: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID to be used as In-Reply-To for the first email?
<1289622010-12683-1-git-send-email-GNUtoo@no-log.org>
(mbox) Adding cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org> from line
'From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>'
(body) Adding cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org> from line
'Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>'

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Subject: [PATCH] libsdl-x11 1.2.14: removing libtool-update.patch fixes
alsa detection
Date: Sat, 13 Nov 2010 05:20:37 +0100
Message-Id: <1289622037-12746-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1289622010-12683-1-git-send-email-GNUtoo@no-log.org>
References: <1289622010-12683-1-git-send-email-GNUtoo@no-log.org>

    The Cc list above has been expanded by additional
    addresses found in the patch commit message. By default
    send-email prompts before sending whenever this occurs.
    This behavior is controlled by the sendemail.confirm
    configuration setting.

    For additional information, run 'git send-email --help'.
    To retain the current behavior, but squelch this message,
    run 'git config --global sendemail.confirm auto'.

Send this email? ([y]es|[n]o|[q]uit|[a]ll): y
Password: 
OK. Log says:
Server: out.alice.it
MAIL FROM:<GNUtoo@no-log.org>
RCPT TO:<openembedded-devel@lists.openembedded.org>
RCPT TO:<GNUtoo@no-log.org>
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Subject: [PATCH] libsdl-x11 1.2.14: removing libtool-update.patch fixes
alsa detection
Date: Sat, 13 Nov 2010 05:20:37 +0100
Message-Id: <1289622037-12746-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1289622010-12683-1-git-send-email-GNUtoo@no-log.org>
References: <1289622010-12683-1-git-send-email-GNUtoo@no-log.org>

Result: 250 OK

In git 1.7.0, the default has changed to --no-chain-reply-to
Set sendemail.chainreplyto configuration variable to true if
you want to keep --chain-reply-to as your default.

Denis.



