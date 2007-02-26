Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HLden-0001NL-SW
	for openembedded-devel@openembedded.org; Mon, 26 Feb 2007 12:04:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1QB41JM027577;
	Mon, 26 Feb 2007 11:04:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26519-09; Mon, 26 Feb 2007 11:03:58 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1QB3tpU027564
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 26 Feb 2007 11:03:55 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45E16336.8060205@whitby.id.au>
References: <45E15E45.5060800@whitby.id.au>  <45E16336.8060205@whitby.id.au>
Date: Mon, 26 Feb 2007 11:03:55 +0000
Message-Id: <1172487835.5824.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openmoko-devel@lists.openmoko.org" <openmoko-devel@lists.openmoko.org>
Subject: Re: Should rm_work be moved after do_deploy, or is ${WORKDIR}	not available in do_deploy?
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
X-List-Received-Date: Mon, 26 Feb 2007 11:04:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-02-25 at 20:51 +1030, Rod Whitby wrote:
> Rod Whitby wrote:
> > A question for the OE core team representatives on the list:  Is
> > do_deploy prohibited from being able to get at things in ${WORKDIR}, or
> > should rm_work happen after do_deploy?
> 
> Never mind - it was simply the fact that do_deploy is badly placed in
> sjf2410-linux-native.bb, nothing to do with base OE or bitbake
> functionality.
> 
> Reported as
> http://bugzilla.openmoko.org/cgi-bin/bugzilla/show_bug.cgi?id=211
> and work-around added to MokoMakefile.
> 
> Sorry for the noise.

addtask deploy before do_build after do_compile

is actually correct as far as dependencies go but interacts badly with
rm_work.

This raises a long standing issue. do_rm_work should run as the last
task, just before do_build. Currently we have difficulty in inserting
that task into the task structure since the do_deploy isn't always
defined. The planned solution is to allow syntax like:

addtask rm_work after do_package do_deploy

and then lots of these tricky ordering issues can be solved in an easier
way. I've not remembered about this at the right time to implement it so
far though...

Cheers,

Richard




