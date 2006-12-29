Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H0GbS-0008Vj-FO
	for openembedded-devel@openembedded.org; Fri, 29 Dec 2006 13:12:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBTCCBXr005809
	for <openembedded-devel@openembedded.org>; Fri, 29 Dec 2006 12:12:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05716-01 for <openembedded-devel@openembedded.org>;
	Fri, 29 Dec 2006 12:12:08 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBTCC4QQ005800
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 29 Dec 2006 12:12:04 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20061229001129.GA5501@hezmatt.org>
References: <20061229001129.GA5501@hezmatt.org>
Date: Fri, 29 Dec 2006 12:12:03 +0000
Message-Id: <1167394324.5616.20.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: What's with the symlinks?
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
X-List-Received-Date: Fri, 29 Dec 2006 12:12:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-12-29 at 11:11 +1100, Matthew Palmer wrote:
> Everywhere I go while assembling my OE build tree, I see admonishments not
> to use a path that has symlinks in it.  For such a major problem, the only
> real information on the actual problem is a fairly cryptic entry in the FAQ,
> about a failure to build libtool-native.
> 
> Being an intensely curious kind of person, and not enjoying arbitrary
> limits, I'm very interested to know what the *real* reason behind being so
> strongly against the much-maligned symlink.  Can anyone enlighten me?

People have explained the reason but you can use paths with symlinks in
*if* you're careful. Basically, you need to ensure the environmental
variables you set use absolute paths without symlinks. My scripts for
setting up build environments make suitable use of "basedir" to ensure
that.

Also, you need to have the conf and tmp directories in the directory
without any symlinks so tmp cannot be a symlink. I'm not entirely sure
why that breaks things but it does.

We should probably patch bitbake to avoid these issues. Patches welcome!

Richard



