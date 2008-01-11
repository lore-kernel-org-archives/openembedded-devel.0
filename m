Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JDFHf-0007YT-0I
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 09:30:39 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JDFHM-000619-Er
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 08:30:16 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 11 Jan 2008 08:30:16 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 11 Jan 2008 08:30:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 11 Jan 2008 09:30:08 +0100
Message-ID: <fm79ef$hak$1@ger.gmane.org>
References: <47871C71.5020800@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <47871C71.5020800@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: mtn disapprove
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
X-List-Received-Date: Fri, 11 Jan 2008 08:30:50 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
> however instead of collie-2.6.inc you mean zaurus-2.6.inc.

of course.  Sorry about the glitch.  I believe I have made the correct
change in 6794aa0dd1ca646be71cc57651a883ac99f55985, now.  Thanks for
spotting it.

While we are at it, let's try and clean the situation up a bit.

* Is there any reason not to let zaurus-2.6.inc do what it suggests to
  be doing and delegate all clamshell stuff to zaurus-clamshell.inc?
  poodle.conf already requires zaurus-2.6.inc despite not being a
  clamshell model.  Let's make the changes necessary so that collie
  can require it as well and then delete the double entry for the
  installkit code from collie-2.6.inc.
* I am pretty sure the poodle line in collie.conf is incorrect.
* poodle-2.6.inc seems to be unused, can it be dropped?

Koen, are these basically sane proposals?  If so, I would prepare an mtn
diff for inspection before committing.

Regards

Rolf



