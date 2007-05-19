Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HpT4z-0004hM-A3
	for openembedded-devel@openembedded.org; Sat, 19 May 2007 19:51:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4JHoKQ6000682
	for <openembedded-devel@openembedded.org>;
	Sat, 19 May 2007 18:50:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32673-07 for <openembedded-devel@openembedded.org>;
	Sat, 19 May 2007 18:50:16 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4JHoFEY000670
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 19 May 2007 18:50:15 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4644B4D1.5010803@klever.net>
References: <4644ABCB.6080202@openhardware.net>
	<4644B0D2.8020409@dominion.kabel.utwente.nl>
	<4644B4D1.5010803@klever.net>
Date: Sat, 19 May 2007 18:50:15 +0100
Message-Id: <1179597015.5852.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Sat, 19 May 2007 17:51:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-05-11 at 20:24 +0200, Michael Krelin wrote:
> There's also an option of asking Tom to bitbake -DDD and send it to
> zecke, because I couldn't find time to try BB 1.6 for him again. And let
> him apply the patch that fixes this problem:
> 
> Index: lib/bb/parse/parse_py/BBHandler.py
> ===================================================================
> --- lib/bb/parse/parse_py/BBHandler.py  (revision 817)
> +++ lib/bb/parse/parse_py/BBHandler.py  (working copy)
> @@ -66,7 +66,9 @@
>          if not file in __inherit_cache.split():
>              debug(2, "BB %s:%d: inheriting %s" % (fn, lineno, file))
>              __inherit_cache += " %s" % file
> +            data.setVar('__inherit_cache', __inherit_cache, d)
>              include(fn, file, d)
> +            __inherit_cache = data.getVar('__inherit_cache', d) or ""
>      data.setVar('__inherit_cache', __inherit_cache, d)

Thanks for this, I've merged into bitbake 1.9, 1.8 and 1.6 branches as
they all had this issue!

Cheers,

Richard




