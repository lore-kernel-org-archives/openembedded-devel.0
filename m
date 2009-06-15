Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MGGVw-0002lp-Nb
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 20:02:36 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MGGM1-0003cw-1Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 18:52:21 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A53836B7-5B08-42CA-A09B-EABF97DC52D0@mac.com>
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
	<522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
	<c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
	<A53836B7-5B08-42CA-A09B-EABF97DC52D0@mac.com>
Date: Mon, 15 Jun 2009 18:52:19 +0100
Message-Id: <1245088339.29153.39.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Help required to create recipe for FANN library
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
X-List-Received-Date: Mon, 15 Jun 2009 18:02:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-15 at 21:34 +0400, Elvis Dowson wrote:
> Hi,
> 	When building the FANN library, I get the following message:
> 
> NOTE: Multiple libraries (libfann.so.2, libdoublefann.so.2,  
> libfixedfann.so.2, libfloatfann.so.2) found and LEAD_SONAME not defined
> 
> What is the use of the LEAD_SONAME?

You should probably ignore LEAD_SONAME; this mechanism seemed like a
good idea at the time but with hindsight it was not such a clever plan.
The right way to fix this warning is to put each of the libraries in its
own output package.

p.




