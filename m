Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L1eAv-0007C3-Ci
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 10:44:13 +0100
Received: from 89-168-188-212.dynamic.dsl.as9105.com ([89.168.188.212]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L1e8f-0004Tk-Jf
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 09:41:54 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <51e438da0811160131oef7f710je53bb8a81a839a29@mail.gmail.com>
References: <51e438da0811160131oef7f710je53bb8a81a839a29@mail.gmail.com>
Date: Sun, 16 Nov 2008 09:41:45 +0000
Message-Id: <1226828505.23391.83.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Solving CROSS COMPILE Badness in mythtv package
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
X-List-Received-Date: Sun, 16 Nov 2008 09:44:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-11-16 at 15:01 +0530, Holla wrote:
> Hi,
> 
> While debugging the badness problem in  "epia/i586/Angstrom-2008.1"
> noticed that the config.mak in the mythtv package  has the
> following :
> 
> 
> CONFIG_INCLUDEPATH=
> /home/wspace/oedabba/build/tmp/staging/i586-angstrom-linux/usr/include
> /usr/X11R6/include

That mention of /usr/X11R6/include is certainly not right.  I guess you
need to debug the configure process to figure out why this is being
added.  FWIW, this does not happen for my mythtv builds on epia so it
would seem to be some quirk of your setup.

p.




