Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MNjDF-0001hy-Pe
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jul 2009 10:06:09 +0200
Received: from 88-110-39-246.dynamic.dsl.as9105.com ([88.110.39.246]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MNj1E-0001Fm-No
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jul 2009 08:53:44 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A51A88D.8020107@gmail.com>
References: <4A51A88D.8020107@gmail.com>
Date: Mon, 06 Jul 2009 08:53:43 +0100
Message-Id: <1246866823.16040.102.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Xserver file generation
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
X-List-Received-Date: Mon, 06 Jul 2009 08:06:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-07-06 at 09:32 +0200, Marco Cavallini wrote:
> At last my questions and doubts are the following:
> 1. Is it correct to consider xserver-xcommon the recipe responsible for
> creating such file?
> 2. How would be created the Xserver file?
> 3. WHich patches flow is involved into its creation?
> 
> 
> The file I get on the target contains the following :
> http://pastebin.com/m42ba5037

That file does look like the one from xserver-common.  (There's also a
competing version of Xserver in xserver-kdrive-common; I don't think
this is what you have, but "opkg search" would tell you for sure.)

I'm not quite sure I understand your questions 2 and 3.  Xserver is just
copied from the source directory into the output package; it isn't
really "created" inside OE.  As for the patches, I don't know offhand
which ones are applied but again, there is nothing special about the
Xserver file; OE will use the same rules as for everything else.

What's the actual problem that you're trying to solve here?

p.




