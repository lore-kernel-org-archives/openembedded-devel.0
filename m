Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYfZx-00071j-KA
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 13:59:08 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 38AE11B10C02;
	Sat, 23 Jan 2010 12:55:38 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 13:56:29 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <201001230943.24210.holger+oe@freyther.de>
	<hjejrf$m65$1@ger.gmane.org>
In-Reply-To: <hjejrf$m65$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001231356.29728.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 12:59:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 11:42:56 Koen Kooi wrote:

> > 1.) Cherry pick from the branch
> > 2.) Send updated patches, close the reports on patchwork...
> 
> I think people that apply those patches to oe.dev should fix up the
> commit message as well. The stack Khem pushed this week is just awfull.

Right... cherry-pick and use git commit --amend afterwards



> 
> I guess we should flag patches with bad commit messages as 'rejected' in
> pw ASAP. We can weed out most of them by reject anything that lacks a
> ':' in the subject line.

that is a difficult decision. E.g.  of course we should handle patches that have 
a good commit message faster than patches that are of lower quality. But then 
again just rejecting a patch is also bad, e.g. maybe the contributor just 
didn't know better and needs a helpful hand?

I was going through them older stuff, e.g. someone sending a patch against a 
package but not as part of a fix to the recipe... So the contributor did his 
homework, he looked for similiar build errors and found a patch, it is low 
hanging fruit to fix that in OE.


The bottom line is. People don't send us "bad" patches to piss us off, they try 
to contribute and we should help them to be useful contributors.

z.


