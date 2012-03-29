Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SDDVH-00065A-N2
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 13:26:56 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1DC1DF8121B; Thu, 29 Mar 2012 05:17:54 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id EEBA4F81219;
	Thu, 29 Mar 2012 05:17:52 -0600 (MDT)
Message-ID: <4F7444E0.400@mlbassoc.com>
Date: Thu, 29 Mar 2012 05:17:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Where are my patches going?
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
X-List-Received-Date: Thu, 29 Mar 2012 11:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

A number of times when I've sent patches to the list via 'git send-email',
they seem to never arrive.  How can I figure out where they are going?

For example, a short time ago I sent a pair of patches - here's the
log as printed by 'git send-email'

============================================================================================================================
$ git send-email --to openembedded-devel@lists.openembedded.org -cc=gary@mlbassoc.com --subject-prefix=meta-oe origin/master
/tmp/ENcQFw9ulr/0001-python-twisted-update-to-latest-upstream-version.patch
/tmp/ENcQFw9ulr/0002-python-zopeinterface-update-to-latest-upstream-versi.patch
Who should the emails appear to be from? [Gary Thomas <gary@mlbassoc.com>]
Emails will be sent from: Gary Thomas <gary@mlbassoc.com>
Message-ID to be used as In-Reply-To for the first email?
(mbox) Adding cc: Gary Thomas <gary@mlbassoc.com> from line 'From: Gary Thomas <gary@mlbassoc.com>'
(body) Adding cc: Gary Thomas <gary@mlbassoc.com> from line 'Signed-off-by: Gary Thomas <gary@mlbassoc.com>'

From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Cc: gary@mlbassoc.com
Subject: [meta-oe 1/2] python-twisted: update to latest upstream version
Date: Thu, 29 Mar 2012 04:57:29 -0600
Message-Id: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6

     The Cc list above has been expanded by additional
     addresses found in the patch commit message. By default
     send-email prompts before sending whenever this occurs.
     This behavior is controlled by the sendemail.confirm
     configuration setting.

     For additional information, run 'git send-email --help'.
     To retain the current behavior, but squelch this message,
     run 'git config --global sendemail.confirm auto'.

Send this email? ([y]es|[n]o|[q]uit|[a]ll): a
OK. Log says:
Sendmail: /usr/sbin/sendmail -i openembedded-devel@lists.openembedded.org gary@mlbassoc.com
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Cc: gary@mlbassoc.com
Subject: [meta-oe 1/2] python-twisted: update to latest upstream version
Date: Thu, 29 Mar 2012 04:57:29 -0600
Message-Id: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6

Result: OK
In git 1.7.0, the default has changed to --no-chain-reply-to
Set sendemail.chainreplyto configuration variable to true if
you want to keep --chain-reply-to as your default.
(mbox) Adding cc: Gary Thomas <gary@mlbassoc.com> from line 'From: Gary Thomas <gary@mlbassoc.com>'
(body) Adding cc: Gary Thomas <gary@mlbassoc.com> from line 'Signed-off-by: Gary Thomas <gary@mlbassoc.com>'
OK. Log says:
Sendmail: /usr/sbin/sendmail -i openembedded-devel@lists.openembedded.org gary@mlbassoc.com
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Cc: gary@mlbassoc.com
Subject: [meta-oe 2/2] python-zopeinterface: update to latest upstream version
Date: Thu, 29 Mar 2012 04:57:30 -0600
Message-Id: <1333018650-987-2-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
References: <1333018650-987-1-git-send-email-gary@mlbassoc.com>

Result: OK
============================================================================================================================

Any ideas where these messages went or how I make sure my posts
are making it to the list?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


