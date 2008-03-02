Received: from [64.233.184.228] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JVtJN-00039s-7z
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Mar 2008 19:53:30 +0100
Received: by wr-out-0506.google.com with SMTP id c30so16145670wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Mar 2008 10:52:17 -0800 (PST)
Received: by 10.100.254.18 with SMTP id b18mr26940113ani.21.1204483937375;
	Sun, 02 Mar 2008 10:52:17 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Sun, 2 Mar 2008 10:52:17 -0800 (PST)
Message-ID: <c384c5ea0803021052k551c89abq93ef572189760f6b@mail.gmail.com>
Date: Sun, 2 Mar 2008 19:52:17 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fqes5j$v3q$1@ger.gmane.org>
MIME-Version: 1.0
References: <c384c5ea0803020930s27303ee1q2719373db77fd8ba@mail.gmail.com>
	<fqes5j$v3q$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 64.233.184.228
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Multiple bitbake and a shared DL_DIR location - race conditions?
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
X-List-Received-Date: Sun, 02 Mar 2008 18:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

>  | I would like to allow the builds to overlap in time, at least make
>  | sure the builds are robust to this, but I doubt this is possible at
>  | all.
>  |
>  | Are there any race conditions with the current approach?
>  |
>  | I.e. what if two fetch tasks from concurrent instances of bitbake
>  | decide to download a package?
>
>  Isn't that what the .lock files are supposed to do? If you have multiple
>  bitbake threads (in one bitbake instance) it has to solve the same problem.
>
Maybe, I did not fully understand how the go() function in
"lib/bb/fetch/__init__.py" could handle this case:

Suppose at time T one bitbake instance #1 is downloading/fetching
package A, and bitbake instance #2 at time T would like to fetch the
same package, what will #2 do?

Will it wait for the lock to be released, then check?

Regards,
-- 
Leon


