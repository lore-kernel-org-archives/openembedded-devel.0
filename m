Received: from [209.85.128.185] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQg8z-0001Hm-Sx
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Feb 2008 10:49:12 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1535988fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2008 01:48:39 -0800 (PST)
Received: by 10.78.162.4 with SMTP id k4mr6697323hue.71.1203241719191;
	Sun, 17 Feb 2008 01:48:39 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id d24sm1146622nfh.29.2008.02.17.01.48.37
	(version=SSLv3 cipher=OTHER); Sun, 17 Feb 2008 01:48:37 -0800 (PST)
Date: Sun, 17 Feb 2008 11:48:46 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20080217114846.0352fd91@widy.localdomain>
In-Reply-To: <E1JQfDo-0001p4-TE@linuxtogo.org>
References: <E1JQfDo-0001p4-TE@linuxtogo.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.185
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev h5000: ship all kernel-modules and at76_usb
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
X-List-Received-Date: Sun, 17 Feb 2008 09:49:12 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 17 Feb 2008 09:50:04 +0100
"koen commit" <openembedded-commits@lists.openembedded.org> wrote:

> h5000: ship all kernel-modules and at76_usb
> 
> Author: koen@openembedded.org
> Branch: org.openembedded.dev
> Revision: 6448d171f98047531cbca187171b0d2bdd62a261
> ViewMTN:
> http://monotone.openembedded.org/revision/info/6448d171f98047531cbca187171b0d2bdd62a261
> Files: 1
> conf/machine/h5000.conf
> Diffs:
> 
> +# Ship complete set of modules ('kernel-modules') for easier debug
> purposes 
> -MACHINE_EXTRA_RRECOMMENDS = " kernel-module-h5400-lcd \
> +MACHINE_EXTRA_RRECOMMENDS = " kernel-modules \
[]

I hope that when debug purposes will finish, this will be removed,
because it's not good at all, as more and more modules are being
enabled, and there're already quite a few megs of them. Plus even just
having some modules around will cause them load, taking away memory and
potentially changing behavior (e.g., dropbear pulls ipv6 taking 200Kb+).

P.S. For debugging purposes, there's devimage-image. It does include
kernel-images for every machine. It also offers kind of clean room for
testing, booting into raw shell with pristine overall kernel
environment, but having most (the aim - as much as possible) needed
tools at fingertips.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


