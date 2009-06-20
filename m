Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI80T-0006sS-Mi
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 23:21:49 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00H1W2U8SQ80@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 14:11:00 -0700 (PDT)
Message-id: <19507E61-F1A3-4529-AF60-2CA97443E137@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245531580.29153.303.camel@lenovo.internal.reciva.com>
Date: Sun, 21 Jun 2009 01:10:40 +0400
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
	<3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
	<1245523070.29153.290.camel@lenovo.internal.reciva.com>
	<B7C10C35-361B-469B-975E-B80AA8B7ED6A@mac.com>
	<1245527560.29153.295.camel@lenovo.internal.reciva.com>
	<ADFDB08F-9C2B-4156-8FE2-48C9C53DA921@mac.com>
	<1245531580.29153.303.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 21:21:50 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		This is the best explanation I've had on an OE aspect in months. Now  
it makes perfect sense! I didn't know that it did exactly what the  
original makefile did.

Anyway, I've learnt a bit more about OE today!! Enough to get me  
starting on working on the main project!

Elvis

On Jun 21, 2009, at 12:59 AM, Phil Blundell wrote:

>>
>
> Not easily.  The autotools class just installs the headers whereever  
> the
> package's Makefile is set up to put them.  If the library's authors  
> have
> written their makefiles to dump the headers in /usr/include rather  
> than
> in a subdirectory, that's what will happen.  (This isn't at all
> uncommon, particularly for libraries with just one or two headers, and
> it isn't necessarily any cause for concern.)
>
> Plus, if this is where the package is set up to install its headers,
> that's probably where other distributions are going to put them and
> hence where other software is going to expect to find them.  So,
> although obviously you can write a custom do_stage method to put the
> headers somewhere else, it's not a good idea to do this unless you  
> have
> a particular reason to believe either that the library's authors were
> seriously misguided, or that the Makefile is malfunctioning for some
> reason and not putting the headers where they expected it would.
>



