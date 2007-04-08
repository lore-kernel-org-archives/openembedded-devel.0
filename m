Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Haa5X-0007T0-At
	for openembedded-devel@openembedded.org; Sun, 08 Apr 2007 18:17:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l38GHwEC019894
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 17:17:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19513-08 for <openembedded-devel@openembedded.org>;
	Sun,  8 Apr 2007 17:17:52 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l38GHmLL019882
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Apr 2007 17:17:49 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<CD2A5546-06FC-414A-9C74-FB640EBFC4A5@selfish.org>
	<4617753E.409@dominion.kabel.utwente.nl>
	<D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>
Date: Sun, 08 Apr 2007 17:17:48 +0100
Message-Id: <1176049069.5844.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Sun, 08 Apr 2007 16:17:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-04-08 at 00:03 +0200, Holger Freyther wrote:
> NOTE: package sjf2410-linux-native-20060807-r1_0: task do_rm_work:  
> started
> NOTE: package sjf2410-linux-native-20060807-r1_0: task do_rm_work:  
> completed
> NOTE: package sjf2410-linux-native-20060807-r1_0: task do_deploy:  
> started
> ERROR: function do_deploy failed
[...]
> Wow, don't ask whom I paid for this... This is one of the reasons I  
> believe that this functionality belongs into bitbake itself. It is  
> the only way to reliable call a task after do_build!
> 
> RP do you have comments on that one?

Even if you do this in bitbake itself, what happens if two tasks want to
run last before do_build? Which do you choose?

My thoughts are that we need to improve the way we specify tasks to be
able to specify this kind of relationship more accurately. Even the
form:

addtask rm_work before do_build after do_package_write do_deploy

where the tasks might not always exist might be enough to get things
working?

Cheers,

Richard






