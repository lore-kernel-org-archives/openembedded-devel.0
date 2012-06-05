Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SbjNo-0000p0-0q for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 04:20:32 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SbjDg-0006OL-JF for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 04:10:05 +0200
Received: from 175.116.182.68 ([175.116.182.68])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 04:10:04 +0200
Received: from welcome9676 by 175.116.182.68 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 04:10:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: prasad <welcome9676@gmail.com>
Date: Tue, 5 Jun 2012 02:02:55 +0000 (UTC)
Message-ID: <loom.20120605T035239-388@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 175.116.182.68 (Mozilla/5.0 (X11; Ubuntu; Linux i686;
	rv:12.0) Gecko/20100101 Firefox/12.0)
Subject: unable to build any package using bitbake command
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
X-List-Received-Date: Tue, 05 Jun 2012 02:20:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
i am trying to build bsp-5.0 for an picochip using openembedded
if i use any bitbake commands like 
#bitbake helloworld;bitbake nano;etc...
am getting the below error

ERROR: Error evaluating '${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)),
'${MACHINE}', 'BASE_PACKAGE_ARCH')}'
Traceback (most recent call last):
  File "/home/svprasad/oe/bitbake/lib/bb/data_smart.py", line 117, in expandWithRefs
    s = __expand_python_regexp__.sub(varparse.python_sub, s)
  File "/home/svprasad/oe/bitbake/lib/bb/data_smart.py", line 69, in python_sub
    codeobj = compile(code.strip(), self.varname or "<expansion>", "eval")
  File "MACHINE_ARCH", line 1
    oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE
                                                              ^
SyntaxError: EOL while scanning string literal

ERROR: Error parsing
/home/svprasad/oe/openembedded/recipes/squeezeclient/squeezeslave_svn.bb: EOL
while scanning string literal (MACHINE_ARCH, line 1)
ERROR: Command execution failed: Exited with 1

Even i Google,i got the issue but i did not get any proper solution.
can you help me what might be the wrong.


Thanks
prasad






