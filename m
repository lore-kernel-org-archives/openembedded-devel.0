Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mdarland@pager.net>) id 1KDSlb-0003U5-MT
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jul 2008 01:26:39 +0200
X-ASG-Debug-ID: 1214868221-683000720000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 184B4E0FD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 18:23:41 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id ai9eXCxhAfaYMrHh for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 18:23:41 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.43] ([192.168.1.43]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 30 Jun 2008 18:22:37 -0500
From: Matt Darland <mdarland@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] opkg and libgnutls linkage
Date: Mon, 30 Jun 2008 18:20:14 -0500
User-Agent: KMail/1.9.9
References: <200806301708.02305.mdarland@pager.net>
In-Reply-To: <200806301708.02305.mdarland@pager.net>
MIME-Version: 1.0
Message-Id: <200806301820.14349.mdarland@pager.net>
X-OriginalArrivalTime: 30 Jun 2008 23:22:38.0000 (UTC)
	FILETIME=[2F4F3300:01C8DB08]
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1214868221
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: opkg and libgnutls linkage
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 30 Jun 2008 23:26:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 30 June 2008 05:08:01 pm Matt Darland wrote:
> When I install opkg-nogpg and try to run it on my target system I get the
> error
>
> "opkg: error while loading shared libraries: libgnutls.so.26: cannot open
> shared object file: No such file or directory"
>
> It appears that there is a libgnutls.so.13 installed on my system, but I
> can't seem to figure out where a '26' might be....
>
> Any insight?
>
> ---
> Thanks

It looks like curl is linking against the gnutls on my build machine. It 
happens that my build machine is an i686 and my target machine is an i586. 
The staging/i686-linux/usr/bin/i586-linux/libgnutls-config seems to be 
returning the version in my /usr/lib. Upon further investigation I noticed 
this message when build gnutls.

NOTE: package gnutls-1.6.3-r6: task do_package: started
NOTE: Couldn't find shared library provider for libgnutls.so.26
NOTE: Couldn't find shared library provider for libgnutls.so.26
NOTE: Couldn't find shared library provider for libgnutls.so.26
NOTE: Couldn't find shared library provider for libgnutls.so.26
NOTE: Couldn't find shared library provider for libgnutls.so.26
NOTE: Couldn't find shared library provider for libgnutls.so.26

Any ideas on how to fix this?

----
Thanks


