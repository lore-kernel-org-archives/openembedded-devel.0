Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GitDc-0007z3-8q
	for openembedded-devel@openembedded.org; Sat, 11 Nov 2006 14:48:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kABDkbo1022692
	for <openembedded-devel@openembedded.org>; Sat, 11 Nov 2006 13:46:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22573-02 for <openembedded-devel@openembedded.org>;
	Sat, 11 Nov 2006 13:46:35 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kABDkV3s022681
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 11 Nov 2006 13:46:32 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <455476DC.1030201@adtelecom.es>
References: <455476DC.1030201@adtelecom.es>
Date: Sat, 11 Nov 2006 13:46:30 +0000
Message-Id: <1163252790.5558.3.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Use of library glibc 2.4 for ARM
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
X-List-Received-Date: Sat, 11 Nov 2006 13:48:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-11-10 at 12:55 +0000, Joaquim Duran wrote:
> Dear all,
> 
> Few days ago, a commit had been done to allow the compilation of glibc 
> 3.4 for arm processors. However, the lines in .bb file that doesn't 
> allow its compilation in ARM processors are included in the file. The 
> lines are included bellow:
> 
> #add the hosts that are confirmed to be working to COMPATIBLE_HOSTi
> COMPATIBLE_HOST = '(i.86.*-linux|sh.*-linux)'
> DEFAULT_PREFERENCE_arm = "-1"
> 
> These lines could be updated or the library has still some issues to be 
> compiled in an ARM processor?

I committed the change  but haven't have a chance to test it yet. Feel
free to enable, test and report back :)

I added it at the time as I had the patch handy and didn't want to
forget about it. It couldn't make the situation worse and only affects
arm builds.

Regards,

Richard




