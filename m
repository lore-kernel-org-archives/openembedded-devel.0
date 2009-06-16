Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MGT9j-0000aA-2q
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 09:32:31 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MGSzj-0001DY-Ln
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 08:22:11 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BA30CC78-BC16-4681-A750-C964E6E32CE1@mac.com>
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
	<522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
	<c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
	<A53836B7-5B08-42CA-A09B-EABF97DC52D0@mac.com>
	<1245088339.29153.39.camel@lenovo.internal.reciva.com>
	<4A3695E3.9070500@balister.org>
	<1245091999.29153.48.camel@lenovo.internal.reciva.com>
	<BA30CC78-BC16-4681-A750-C964E6E32CE1@mac.com>
Date: Tue, 16 Jun 2009 08:22:10 +0100
Message-Id: <1245136930.29153.86.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Tue, 16 Jun 2009 07:32:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-16 at 07:25 +0400, Elvis Dowson wrote:
> Hi Phil,
> 		
> On Jun 15, 2009, at 10:53 PM, Phil Blundell wrote:
> 
> >
> > Right now, I think the only way is to do it by steam, something like:
> >
> > PACKAGES =+ "libfann libdoublefann libfixedfann libfloatfann"
> > FILES_libfann = "${libdir}/libfann${SOLIBS}"
> > FILES_libdoublefan = "${libdir}/libdoublefan${SOLIBS}"
> > ...
> 
> I did as you suggested but get the following errors:
> 
>   -------------------
> ERROR: libfann is listed in PACKAGES multiple times, this leads to  
> packaging errors.
> ERROR: Please fix the metadata/report this as bug to OE bugtracker.
> ERROR: -------------------
> 

If your recipe itself is named "libfann" then it will appear in PACKAGES
automatically (as ${PN}); you don't need to add it explicitly.

p.




