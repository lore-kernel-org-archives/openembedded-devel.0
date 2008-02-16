Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQLK0-00078D-Mj
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2008 12:35:10 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1263024fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2008 03:34:45 -0800 (PST)
Received: by 10.78.175.14 with SMTP id x14mr5305734hue.12.1203161685274;
	Sat, 16 Feb 2008 03:34:45 -0800 (PST)
Received: from widy.localdomain ( [88.252.174.19])
	by mx.google.com with ESMTPS id i4sm3370028nfh.26.2008.02.16.03.34.42
	(version=SSLv3 cipher=OTHER); Sat, 16 Feb 2008 03:34:44 -0800 (PST)
Date: Sat, 16 Feb 2008 13:35:15 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080216133515.4ca3c8f1@widy.localdomain>
In-Reply-To: <fp627l$96i$1@ger.gmane.org>
References: <1203118816.8636.164.camel@dax.rpnet.com>
	<fp627l$96i$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.186
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: initramfs generation with OE
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
X-List-Received-Date: Sat, 16 Feb 2008 11:35:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 16 Feb 2008 08:09:41 +0100
Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

> Richard Purdie wrote:
> > how do we generate an initramfs with OE?
> 
> Sorry to jump in with another question that does not relate to solving
> the problem but me understanding the scope and importance of it.
> 
> Would the initramfs thing allow for example NFS boot over wifi?

Initramfs as technology allows that and anything else, and
initramfs-uniboot (packages/initrdscripts/) is intended to make that all
practically and easily achievable for realistic usecases. It is built
in modular fashion, allowing developer to select needed functionality
from available choices, and add needed functionality easily (again, at
least for realistic usecases).

For example, there's already module for NFS boot (it has implicit
support for USB net so far). So, to add NFS-over-WiFi functionality,
just a module which will up (load modules, configure ip) WiFi i/f needs
to be added.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


