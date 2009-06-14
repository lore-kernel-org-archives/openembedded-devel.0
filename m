Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MFmvW-0006mE-At
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 12:27:02 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MFmlj-0006Sn-21
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 11:16:55 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <64d5b90a0906140156k1a1f6eeei6c1c51e327f64b04@mail.gmail.com>
References: <64d5b90a0906140156k1a1f6eeei6c1c51e327f64b04@mail.gmail.com>
Date: Sun, 14 Jun 2009 11:16:53 +0100
Message-Id: <1244974613.29153.24.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: OpenSSL recipe Patch: Include the files not being shipped	in any package
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
X-List-Received-Date: Sun, 14 Jun 2009 10:27:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-14 at 14:26 +0530, Kirtika Ruchandani wrote:
> Hello,
> 
> I have added a line to the recipe to include the openssl.cnf and ca.sh/ca.pl
> files in the ${PN}.
> Patch attached herewith for openssl_0.9.8j.bb

Thanks for the patch.  Is this applicable to other openssl versions too?
If so, it might be better to put your change in openssl.inc rather than
in the version specific file.

p.




