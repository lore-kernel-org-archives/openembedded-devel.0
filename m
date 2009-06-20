Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MI6mg-0002uz-8G
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 22:03:30 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MI6cD-0008LU-9X
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 20:52:41 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <B7C10C35-361B-469B-975E-B80AA8B7ED6A@mac.com>
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
	<3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
	<1245523070.29153.290.camel@lenovo.internal.reciva.com>
	<B7C10C35-361B-469B-975E-B80AA8B7ED6A@mac.com>
Date: Sat, 20 Jun 2009 20:52:40 +0100
Message-Id: <1245527560.29153.295.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Sat, 20 Jun 2009 20:03:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-06-20 at 23:05 +0400, Elvis Dowson wrote:
> It however, does the build for the src, build and examples folder, as  
> seen in the logs, and then tries to find another src folder and fails.

Seems to be actually another "doc" folder that it can't find:

> | Making all in doc
> | /bin/sh: line 17: cd: doc: No such file or directory
> | make[2]: *** [all-recursive] Error 1

Does it help if you put an extra layer of quoting around the directory
list, i.e. oe_runmake SUBDIRS="'src doc examples'"?  Could also try just
oe_runmake SUBDIRS=src and see if it works like that.

p.





