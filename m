Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQkaC-0007HF-Re
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Feb 2008 15:33:39 +0100
Received: by py-out-1112.google.com with SMTP id y77so1298443pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2008 06:32:44 -0800 (PST)
Received: by 10.65.112.5 with SMTP id p5mr8200488qbm.64.1203258763950;
	Sun, 17 Feb 2008 06:32:43 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id 32sm13104136nfu.7.2008.02.17.06.32.41
	(version=SSLv3 cipher=OTHER); Sun, 17 Feb 2008 06:32:43 -0800 (PST)
Date: Sun, 17 Feb 2008 16:33:10 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20080217163310.6abf7a95@widy.localdomain>
In-Reply-To: <E1JQkAu-00025r-6H@linuxtogo.org>
References: <E1JQkAu-00025r-6H@linuxtogo.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.166.178
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev classes/kernel.bbclass: Remove usage of non-standard variables (DEPLOY_TO) and random renaming of output.
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
X-List-Received-Date: Sun, 17 Feb 2008 14:33:39 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 17 Feb 2008 15:07:24 +0100
"rpurdie commit" <openembedded-commits@lists.openembedded.org> wrote:

> classes/kernel.bbclass: Remove usage of non-standard variables
> (DEPLOY_TO) and random renaming of output.

Well, if it's not standard, let's make it standard. It's useful to make
robust interaction with external tools, now that we come to conclusion
bitbake can't do it itself. So, some tool would use it to ask OE to
deliver some result to the place expected by the tool, instead of
making tool dig in external OE structures, which are also subject to
change, also on per-distro (-user?) level.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


