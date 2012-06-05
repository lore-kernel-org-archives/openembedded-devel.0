Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SbpR5-0006ST-15
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 10:48:19 +0200
Received: from [192.168.1.113]
	(cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com [86.26.12.172])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 691546005E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2012 09:20:58 +0100 (BST)
Message-ID: <4FCDC55D.8080105@communistcode.co.uk>
Date: Tue, 05 Jun 2012 09:37:49 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <loom.20120605T035239-388@post.gmane.org>
In-Reply-To: <loom.20120605T035239-388@post.gmane.org>
Subject: Re: unable to build any package using bitbake command
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
X-List-Received-Date: Tue, 05 Jun 2012 08:48:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2012 03:02, prasad wrote:
> Hi,
> i am trying to build bsp-5.0 for an picochip using openembedded
> if i use any bitbake commands like
> #bitbake helloworld;bitbake nano;etc...
> am getting the below error
>
> ERROR: Error evaluating '${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)),
> '${MACHINE}', 'BASE_PACKAGE_ARCH')}'
> Traceback (most recent call last):
>    File "/home/svprasad/oe/bitbake/lib/bb/data_smart.py", line 117, in expandWithRefs
>      s = __expand_python_regexp__.sub(varparse.python_sub, s)
>    File "/home/svprasad/oe/bitbake/lib/bb/data_smart.py", line 69, in python_sub
>      codeobj = compile(code.strip(), self.varname or "<expansion>", "eval")
>    File "MACHINE_ARCH", line 1
>      oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE
>                                                                ^
> SyntaxError: EOL while scanning string literal
>
> ERROR: Error parsing
> /home/svprasad/oe/openembedded/recipes/squeezeclient/squeezeslave_svn.bb: EOL
> while scanning string literal (MACHINE_ARCH, line 1)
> ERROR: Command execution failed: Exited with 1
>
> Even i Google,i got the issue but i did not get any proper solution.
> can you help me what might be the wrong.
>
>
> Thanks
> prasad
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Can you paste your local.conf please.


