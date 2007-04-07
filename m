Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HaJ0R-0005P9-FC
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Apr 2007 00:03:35 +0200
Received: from [91.64.161.147] (helo=[192.168.10.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HaJ0R-0000iF-1r
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Apr 2007 00:03:35 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <4617753E.409@dominion.kabel.utwente.nl>
References: <46176E51.2030608@dominion.kabel.utwente.nl>
	<CD2A5546-06FC-414A-9C74-FB640EBFC4A5@selfish.org>
	<4617753E.409@dominion.kabel.utwente.nl>
X-Gpgmail-State: !signed
Message-Id: <D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Sun, 8 Apr 2007 00:03:18 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.161.147
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
X-List-Received-Date: Sat, 07 Apr 2007 22:03:36 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 07.04.2007 um 12:41 schrieb Koen Kooi:

>> , is there a documentation
>> which tasks to add and link to unbreak rm_work (if it breaks).
>
> No idea, Marcin?


NOTE: package sjf2410-linux-native-20060807-r1_0: task do_rm_work:  
started
NOTE: package sjf2410-linux-native-20060807-r1_0: task do_rm_work:  
completed
NOTE: package sjf2410-linux-native-20060807-r1_0: task do_deploy:  
started
ERROR: function do_deploy failed
ERROR: log data follows (/home/friedrij/src/moko/mokomakefile/trunk/ 
build/tmp/work/i686-linux/sjf2410-linux-native-20060807-r1_0/temp/ 
log.do_deploy.27169)
| install: cannot stat `sjf2410': No such file or directory
NOTE: Task failed: /home/friedrij/src/moko/mokomakefile/trunk/build/ 
tmp/work/i686-linux/sjf2410-linux-native-20060807-r1_0/temp/ 
log.do_deploy.27169
NOTE: package sjf2410-linux-native-20060807-r1_0: task do_deploy: failed
ERROR: TaskFailed event exception, aborting
NOTE: package sjf2410-linux-native-20060807: failed
ERROR: Build of openmoko-devel-image faile


Wow, don't ask whom I paid for this... This is one of the reasons I  
believe that this functionality belongs into bitbake itself. It is  
the only way to reliable call a task after do_build!

RP do you have comments on that one?

z.




