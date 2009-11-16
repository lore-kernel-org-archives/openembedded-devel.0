Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NA14s-00009T-Gy
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 13:53:09 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAGCmZWO022027 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 12:48:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1c2fyvqPvbYt
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 12:48:35 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAGCmVKY022012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 12:48:33 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911160718570.23278@localhost>
References: <alpine.LFD.2.00.0911160718570.23278@localhost>
Date: Mon, 16 Nov 2009 12:47:10 +0000
Message-Id: <1258375630.16625.5.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: "UnboundLocalError: local variable 'os' referenced before	assignment"
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
X-List-Received-Date: Mon, 16 Nov 2009 12:53:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-16 at 07:23 -0500, Robert P. J. Day wrote:
> weirdly, a fully-pulled dev git repo is now failing to build a
> number of packages for the same reason:
> 
> ERROR: Exception:<type 'exceptions.UnboundLocalError'> Message:local
> variable 'os' referenced before assignment
> 
>   the build is still running but, so far, the following packages have
> failed for that reason:
> 
>   * gimp/gegl_svn.bb
>   * gnome-mplayer/gnome-mplayer_svn.bb
>   * gnome/gnome-bluetooth_2.27.4.bb
>   * networkmanager/network-manager-applet_0.7.1.997.bb
> 
>   i can report back with more detail once the build is done.  it's
> getting close to completion.

I've pushed a fix for that.

Cheers,

Richard



