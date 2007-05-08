Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HlPTV-0005U6-75
	for openembedded-devel@openembedded.org; Tue, 08 May 2007 15:11:29 +0200
Received: by py-out-1112.google.com with SMTP id a78so1417230pyh
	for <openembedded-devel@openembedded.org>;
	Tue, 08 May 2007 06:11:01 -0700 (PDT)
Received: by 10.35.41.14 with SMTP id t14mr13218333pyj.1178629860684;
	Tue, 08 May 2007 06:11:00 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id c1sm7025684nzd.2007.05.08.06.10.59;
	Tue, 08 May 2007 06:11:00 -0700 (PDT)
Date: Tue, 8 May 2007 16:11:03 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <127969848.20070508161103@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1178198199.6312.30.camel@localhost.localdomain>
References: <35653307.20070503154732@gmail.com>
	<1178198199.6312.30.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [ALERT] Security vulnerability with recent OE bitbake.conf changes
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
X-List-Received-Date: Tue, 08 May 2007 13:11:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Thursday, May 3, 2007, 4:16:39 PM, you wrote:

[]

> So we need to find the real problem and fix that, probably somewhere in
> patch.bbclass an error code isn't being propagated at a guess.

        Ok, so here we go: http://bugs.openembedded.org/show_bug.cgi?id=2274

> NOTE: Applying patch 'include-linux-types.patch'
> sh: line 1: gnome-terminal: command not found
> ERROR: Cannot proceed with manual patch resolution - 'gnome-terminal --disable-factory -t "$TERMWINDOWTITLE" -x bash --rcfile $TERMRCFILE' not found. Check TERMCMDRUN variable.
> ERROR: Error in executing: /home/pfalcon/linux-ppc/org.openembedded.dev/packages/dosfstools/dosfstools_2.11.bb
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function

Should be clear enough and helpful to whoever may enable manual mode,
but don't have a required terminal app.

> I will also hint at the use of PATCH_RESOLVER = "noop" which means the
> user gets the old behaviour of patch failure aborts the build with no
> help from any resolver. It should have always been the default but
> wasn't. I'm not sure what the current default is but we can change it to
> that if its not.

        Ok, so please review patches above, and let's make these all
changes ;-).

> Cheers,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



