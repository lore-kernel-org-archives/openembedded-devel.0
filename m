Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MTY7l-0000pK-4X
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 11:28:33 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MTXu5-00069M-Ac
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 09:14:25 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 22 Jul 2009 09:14:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Jul 2009 09:14:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Jul 2009 11:14:11 +0200
Message-ID: <h46l93$4ng$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
Sender: news <news@ger.gmane.org>
Subject: Buildsummary, where did it go?
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
X-List-Received-Date: Wed, 22 Jul 2009 09:28:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I just noticed that /etc/angstrom-version didn't have the git revision 
and branch any more, so I looked into base.bbclass and after 2 hours I 
did this:

-	branch = os.popen('cd %s; PATH=%s git symbolic-ref HEAD 2>/dev/null' % 
(path, d.getVar("BBPATH", 1))).read().rstrip()
+	branch = os.popen('cd %s; PATH=%s git symbolic-ref HEAD 2>/dev/null' % 
(path, d.getVar("PATH", 1))).read().rstrip()

-	rev = os.popen("cd %s; PATH=%s git show-ref HEAD 2>/dev/null" % (path, 
d.getVar("BBPATH", 1))).read().split(" ")[0].rstrip()
+	rev = os.popen("cd %s; PATH=%s git show-ref HEAD 2>/dev/null" % (path, 
d.getVar("PATH", 1))).read().split(" ")[0].rstrip()

That bug went largely unnoticed due to the build summary not being 
displayed anymore.

How do I get it back? I like it very much. Sadly the stable/2009 branch 
is missing it as well due to kergoths patches.

regards,

Koen



