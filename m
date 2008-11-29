Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1L6UI9-0003nv-KJ; Sat, 29 Nov 2008 19:11:41 +0100
Received: from 79-71-239-31.dynamic.dsl.as9105.com ([79.71.239.31]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1L6UF1-0000hq-F8; Sat, 29 Nov 2008 18:08:27 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ggrstm$eh8$1@ger.gmane.org>
References: <ggrstm$eh8$1@ger.gmane.org>
Date: Sat, 29 Nov 2008 18:08:24 +0000
Message-Id: <1227982104.23391.314.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: adduser question
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
X-List-Received-Date: Sat, 29 Nov 2008 18:11:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-11-29 at 18:08 +0100, Koen Kooi wrote:
> adduser --system adds UIDs <100 to /etc/passwd, which 'update-passwd' 
> will blow away, since they aren't in /usr/share/base-passwd/passwd.master
> 
> Is this intended behaviour, and if not, how should it get fixed?

Whether or not to use passwd.master and update-passwd is clearly a
distribution choice.  Any distro which does want to use a
centrally-administered master password file should, presumably, also
configure adduser with an appropriate system UID range (for example,
100-999).  Depending on what implementation of adduser you are using,
this might just be a case of adjusting adduser.conf or it might involve
a recompile.

For distros which don't desire to use passwd.master, the right solution
is simply to refrain from installing or running update-passwd.  In this
case it doesn't matter what UID range adduser is set up for.

p.




