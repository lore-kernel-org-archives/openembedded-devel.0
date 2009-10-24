Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1N1hiJ-0006Wi-EZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 16:35:31 +0200
Received: from 88-109-185-146.dynamic.dsl.as9105.com ([88.109.185.146]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1N1hh5-0006pd-PC
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 15:34:13 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1256393623.4307.1@zaurus>
References: <1256393623.4307.1@zaurus>
Date: Sat, 24 Oct 2009 15:33:57 +0100
Message-ID: <1256394837.15214.57.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 14:35:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2009-10-24 at 16:13 +0200, Stanislav Brabec wrote:
> gcc may need special care and double thinking. But I guess that the  
> logic: "Do you want to compile static binaries? Install gcc-static." is  
> valid here as well.

That logic does indeed make sense, though I think on most DISTROs there
would be nothing useful to put in gcc-static.  You could relegate
libgcc.a there if your gcc configuration had --shared-libgcc as default,
but I don't think many/any DISTROs are doing that at present.  (I've
been considering it for micro but I haven't had time to actually make
the change.)

p.




