Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JWTK3-0002rO-Bk
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 10:20:39 +0100
Received: by an-out-0708.google.com with SMTP id b33so134405ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2008 01:19:06 -0800 (PST)
Received: by 10.100.132.2 with SMTP id f2mr2027412and.65.1204622346368;
	Tue, 04 Mar 2008 01:19:06 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Tue, 4 Mar 2008 01:19:06 -0800 (PST)
Message-ID: <c384c5ea0803040119u47de4827ib0b173cd09a39297@mail.gmail.com>
Date: Tue, 4 Mar 2008 10:19:06 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fqevf6$8tq$1@ger.gmane.org>
MIME-Version: 1.0
References: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
	<fqevf6$8tq$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.132.244
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: content addressable fetching of packages, through MD5SUM or SHA1SUM?
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
X-List-Received-Date: Tue, 04 Mar 2008 09:20:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

On Sun, Mar 2, 2008 at 8:33 PM, Koen Kooi
<koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
>
>  for archive in * ; do
>  ~   ln -sf $archive $(md5sum $archive)
>  ~   ln -sf $archive $(sha256sum $archive)
>  done
>
Neat, but this is a one-to-one mapping from a single hash to a single URI.

I meant an extra level of indirection, where

(md5sum,sha1sum) => table of URIs

I think this means the fetcher class must be changed so that it first
tries the proposed SRC_URI,
and then falls back to quering the above database for alternative URIs.

The neat thing would be to have a crawler, that Google's on the file
name for alternate locations,
fetches them, md5sums them, and inserts them into the URI table once
it matches the (md5sum,sha1sum).

>  That's the quick and dirty way :) If someone comes up with a script, I
>  can run in on the angstrom source mirror for people to test against.
>
In fact, your approach is how we track datasheets here :-)

Regards,
-- 
Leon


