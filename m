Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IvHaL-0001iD-N2
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 20:19:37 +0100
Received: by ug-out-1314.google.com with SMTP id m3so423314ugc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2007 11:17:15 -0800 (PST)
Received: by 10.66.249.8 with SMTP id w8mr1278516ugh.1195759035257;
	Thu, 22 Nov 2007 11:17:15 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id j3sm2262323ugd.2007.11.22.11.17.11
	(version=SSLv3 cipher=OTHER); Thu, 22 Nov 2007 11:17:13 -0800 (PST)
Date: Thu, 22 Nov 2007 20:51:41 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <759577088.20071122205141@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1195552013.6337.18.camel@localhost.localdomain>
References: <20071119224008.CD638401CA7@tinman.treke.net>
	<1195540585.11106.5.camel@localhost>
	<1195552013.6337.18.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Host dependency vs. -native packages balance
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
X-List-Received-Date: Thu, 22 Nov 2007 19:19:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, November 20, 2007, 11:46:53 AM, you wrote:

[]

> Dependencies needed from the host system are those listed in
> ASSUME_PROVIDED. If its not listed in ASSUME_PROVIDED, OE shouldn't need
> it. If it needs something not listed, that is a bug.

  Nice plan. So, I reformatted ASSUME_PROVIDED in bitbake.conf for
easier maintenance, and let's make sure it's up-to-date. And added
what I've spotted recently: linux-tp DEPENDS on bc-native for collie.

> Cheers,

> Richard

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



