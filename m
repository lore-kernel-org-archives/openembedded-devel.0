Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NS5wm-0007Vx-4a
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 10:43:31 +0100
Received: from 89-168-180-155.dynamic.dsl.as9105.com ([89.168.180.155]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NS5uo-0002bs-Gm
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 09:41:26 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262678000.5798.9.camel@dejunliu-desktop>
References: <1262678000.5798.9.camel@dejunliu-desktop>
Date: Tue, 05 Jan 2010 09:41:23 +0000
Message-ID: <1262684483.2553.157.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x11-image can't start up
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
X-List-Received-Date: Tue, 05 Jan 2010 09:43:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-01-05 at 04:53 -0300, Dejun.Liu wrote:
> Hi,
> 
> I have build angstrom x11-image and test it with Qemu,
> 
> But Qemu failed to start up.
> 
> i dig the reason find that system have no more inodes to use.
[...]
> so does anyone know how to fix it in OE?

Check your IMAGE_CMD,  You didn't mention what filesystem you are using,
but I'm guessing it's probably ext2.  In that case, I think you need to
add a suitable -N or -i option to genext2fs.

p.




