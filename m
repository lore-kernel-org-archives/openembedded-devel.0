Received: from dd12300.kasserver.com ([85.13.134.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <info@itPenguin.de>) id 1RSYig-00053k-HW
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 19:35:54 +0100
Received: from server.itpinguin.de (unknown [95.210.227.252])
	by dd12300.kasserver.com (Postfix) with ESMTPSA id 357CE4208A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 19:19:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by server.itpinguin.de (Postfix) with ESMTP id B8158176083
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 19:19:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at itpinguin.de
Received: from server.itpinguin.de ([127.0.0.1])
	by localhost (server.itpinguin.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cj+v6cxHCwlM
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 19:19:19 +0100 (CET)
Received: from [192.168.100.2] (troubadix.itpinguin.de [192.168.100.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.itpinguin.de (Postfix) with ESMTPS id 0F378118279
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 19:19:19 +0100 (CET)
Message-ID: <4ECA9626.900@itPenguin.de>
Date: Mon, 21 Nov 2011 19:19:18 +0100
From: info <info@itPenguin.de>
Organization: itPenguin GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Problem bitbaking angstrom-x-image
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
X-List-Received-Date: Mon, 21 Nov 2011 18:35:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I managed to create several images for my beagle board, so my 
configuration seems to work.

When bitbaking angstrom-x-image I get these error messages:

| config.status: creating cups/pstoraster
| + mkdir obj
| mkdir: cannot create directory `obj': File exists
NOTE: package gs-9.01-r0: task do_configure: Failed
ERROR: Function 'do_configure' failed (see 
/project/heizung/develop/openembedded/build/tmp/work/armv7a-angstrom-linux-gnueabi/gs-9.01-r0/temp/log.do_configure.15504 
for further information)
ERROR: Task 2462 
(/project/heizung/develop/openembedded/openembedded/recipes/gs/gs_9.01.bb, 
do_configure) failed with exit code '1'
ERROR: 
'/project/heizung/develop/openembedded/openembedded/recipes/gs/gs_9.01.bb' 
failed

Is this a problem of the ghostscript package when creating the directory 
obj?
Is there something I can do, to fix it?

Some contents of my local.conf:
MACHINE = "beagleboard"
DISTRO = "angstrom-2010.x"

Any help is welcome,
Roland


