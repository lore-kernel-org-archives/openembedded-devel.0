Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IKMUa-000055-Cn
	for openembedded-devel@openembedded.org; Mon, 13 Aug 2007 01:05:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7CN4tWm000672;
	Mon, 13 Aug 2007 00:04:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32724-09; Mon, 13 Aug 2007 00:04:51 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7CN4nw5000666
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 13 Aug 2007 00:04:50 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
In-Reply-To: <1186955418.6156.34.camel@localhost.localdomain>
References: <1186955418.6156.34.camel@localhost.localdomain>
Date: Mon, 13 Aug 2007 00:04:49 +0100
Message-Id: <1186959889.6156.37.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [Bitbake-dev] Override problems in bitbake trunk/1,8
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
X-List-Received-Date: Sun, 12 Aug 2007 23:05:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-08-12 at 22:50 +0100, Richard Purdie wrote:
> This is an expansion of the issue reported in
> http://bugs.openembedded.org/show_bug.cgi?id=2601
> 
[...]
> You get the expected:
> 
> GRREC="foo1 foo2 foo3"
> 
> but the ${PN} breaks things somewhere and gives:
> 
> FRREC_gtk+="foo1"
> 
> I suspect something is wrong in the overrides handling, maybe to do with
> expandKeys. Does anyone have any ideas?

I think this might be the fix:


Index: bb/data.py
===================================================================
--- bb/data.py	(revision 880)
+++ bb/data.py	(working copy)
@@ -288,6 +288,10 @@
             src = getVarFlag(key, i, readdata) or []
             dest.extend(src)
             setVarFlag(ekey, i, dest, alterdata)
+            
+            if key in alterdata._special_values[i]:
+                alterdata._special_values[i].remove(key)
+                alterdata._special_values[i].add(ekey)
 
         delVar(key, alterdata)
 



