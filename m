Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1MBx8N-0008Gv-4X; Wed, 03 Jun 2009 22:32:27 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1MBwzd-0000ks-5a; Wed, 03 Jun 2009 21:23:25 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A26ACDA.2060806@kernelconcepts.de>
References: <4A26ACDA.2060806@kernelconcepts.de>
Date: Wed, 03 Jun 2009 21:23:22 +0100
Message-Id: <1244060602.5049.64.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [RFC] gtk+ and gdk-pixbuf
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
X-List-Received-Date: Wed, 03 Jun 2009 20:32:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-03 at 19:03 +0200, Florian Boor wrote:
> looking at the recipes of GTK+ and gdk-pixbuf I get the impression these should
> conflict with each other.
> I would like to make the changes soon to avoid that more people run into
> problems with this. I have seen several reports of issues that are likely to be
> caused by a gtk vs. gdk-pixbuf build conflict.

Yeah, it does look like they would clobber each other.  Although
gdk-pixbuf used to be a separate library in gtk1 days, the gdk-pixbuf
recipe that we have in OE right now just builds the library that's
bundled with GTK+.  I guess the standalone gdk-pixbuf recipe was added
to eliminate the requirement for building X and the whole other
dependency stack that GTK requires if you just want the pixbuf
functions. 

Adding PROVIDES = "gdk-pixbuf" to gtk would probably clear it up.  I
don't think bitbake really understands conflicts so that's probably as
good as it gets.

p.




