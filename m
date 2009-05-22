Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M7bac-00047B-JD
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 22:43:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8591B4B7A59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 16:35:53 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21294-08 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 22 May 2009 16:35:53 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 64FD84A98D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 16:35:53 -0400 (EDT)
Message-ID: <4A170CA9.10402@cbnco.com>
Date: Fri, 22 May 2009 16:35:53 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <DEB73D04-3490-41E1-8C56-C41822C040D9@mvista.com>
In-Reply-To: <DEB73D04-3490-41E1-8C56-C41822C040D9@mvista.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: amend-recipes.inc
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
X-List-Received-Date: Fri, 22 May 2009 20:43:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chris,

This works for me. I can put multiple recipes dirs in my COLLECTIONS, 
set FILESPATHBASE to reference them all, and create a busybox/amend.inc 
under any of my COLLECTIONS dirs.

There is something strange going on: when I require amend-recipes.inc in 
my distro config, and the cache is rebuilt, I see deprecation warnings 
about base_set_filespath that weren't printing before. If I comment out 
the require line and let bb rebuild the cache, the warnings go away.

About 45 recipes are using base_set_filespath, including glibc, 
e2fsprogs-native, and many others. I don't see why the warnings don't 
show up normally if amend-recipes is not included. It looks to me like 
they would always print, but they don't.

My FILESPATHBASE is set to:

FILESPATHBASE =. "${@ \
         ':'.join([os.path.join(recipedir, \
                         os.path.basename(os.path.dirname( \
                                                 d.getVar('FILE', 1)))) 
\                for recipedir in d.getVar('COLLECTIONS', 1).split()])}:"

and COLLECTIONS is just a list of a few recipes directories, with 
oe/recipes last.

Mike

Christopher Larson wrote:
> I created a little .inc that can be loaded into a distro .conf.  It just 
> enables the ability to amend bits to a recipe from its filespath.  I 
> mentioned this in a previous email wrt managing overlays.  It's 
> incredibly simple, but I'd like a sanity check :)  It seems to work fine 
> in my local test builds.
> 
> python () {
>     import bb
>     amendfile = bb.which(d.getVar("FILESPATH", 1), "amend.inc")
>     if amendfile:
>         bb.parse.handle(amendfile, d, 1)
> }



