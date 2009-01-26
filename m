Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LRMsd-0006E6-6M
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 09:31:39 +0100
Received: from 88-110-5-187.dynamic.dsl.as9105.com ([88.110.5.187]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LRMlP-0003zp-3V
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 08:24:11 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090126074953.GA26318@gmail.com>
References: <20090126074953.GA26318@gmail.com>
Date: Mon, 26 Jan 2009 08:24:10 +0000
Message-Id: <1232958250.4890.104.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: fix for strl functions in alsautils
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
X-List-Received-Date: Mon, 26 Jan 2009 08:31:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-01-25 at 23:49 -0800, Khem Raj wrote:
> * These funtions are provided by C libraries like uclibc
>         Declaring them static here causes static not static declaration
>         issues reported by gcc.
> [...]
> + #ifdef __GLIBC__
> +-static size_t strlcpy(char *dst, const char *src, size_t size)
> ++size_t strlcpy(char *dst, const char *src, size_t size)
> + {

Wouldn't it be better to change that "#ifdef __GLIBC__" to something
more appropriate?  With your change it looks like you will still get
useless copies of these functions in the resulting binaries.

p.




