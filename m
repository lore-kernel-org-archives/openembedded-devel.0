Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <slapinid@gmail.com>) id 1HZTyh-0000dC-IH
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2007 17:34:23 +0200
Received: by ug-out-1314.google.com with SMTP id e2so964492ugf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2007 08:34:23 -0700 (PDT)
Received: by 10.67.30.6 with SMTP id h6mr2284855ugj.1175787262934;
	Thu, 05 Apr 2007 08:34:22 -0700 (PDT)
Received: from ?192.168.6.144? ( [62.152.84.97])
	by mx.google.com with ESMTP id z34sm3905466ikz.2007.04.05.08.34.21;
	Thu, 05 Apr 2007 08:34:22 -0700 (PDT)
Message-ID: <461516E2.1000505@gmail.com>
Date: Thu, 05 Apr 2007 19:33:54 +0400
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070307)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1597775703.20070405182752@gmail.com>
In-Reply-To: <1597775703.20070405182752@gmail.com>
Subject: Re: [RFC] Adding sanity to OE startup process
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
X-List-Received-Date: Thu, 05 Apr 2007 15:34:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   So, to start with, I'd like to propose to make it possible for boot
> process to log to syslog. I have following in mind:
> 
> 1. Make a convention that boot/service scripts should use "$echo"
> instead of "echo" to do output.
> 2. Have default define of "echo=echo" for this.
I think some function should suffice.
aliasing is possible too.
Function could be more flexible solution.


> 3. Turn /etc/init.d/syslogd into /etc/init.d/syslogd.sh so it was
> sourced by /etc/init.d/rc and could export new value for the rest of
> scripts.
I don't see why.

> 5. Using syslogd for boot messages capture is of course optional.
I don't see why.
We can log to multiple places.


All the best,
S.



