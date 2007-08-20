Received: from [209.85.198.187] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1INEWo-0001fO-Tl
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2007 23:11:15 +0200
Received: by rv-out-0910.google.com with SMTP id c24so1008867rvf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2007 14:10:17 -0700 (PDT)
Received: by 10.141.209.7 with SMTP id l7mr2982272rvq.1187644217760;
	Mon, 20 Aug 2007 14:10:17 -0700 (PDT)
Received: from sweta-singhs-computer.local ( [71.146.5.204])
	by mx.google.com with ESMTPS id l31sm1818053rvb.2007.08.20.14.10.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Aug 2007 14:10:17 -0700 (PDT)
Message-ID: <46CA0337.9050709@gmail.com>
Date: Mon, 20 Aug 2007 14:10:15 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0708201339j44462d85o286bbb548b256aec@mail.gmail.com>
In-Reply-To: <c384c5ea0708201339j44462d85o286bbb548b256aec@mail.gmail.com>
X-Enigmail-Version: 0.95.3
Subject: Re: Add Intel Core 2 machine support (prescott and nocona)
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
X-List-Received-Date: Mon, 20 Aug 2007 21:11:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg wrote:
> Hello,
> 
> I would like to add support for Intel's Core 2 processors, in both 32
> and 64 bit mode.
> 
> I am wondering what namespace to use for the PACKAGE ARCHs?
> 
> Given all the options[*], I think "x86-prescott" and "x86_64-nocona"
> are suitable:
> 
> x86_64-prescott= x86_32-core = x86_32-core2
> x86_64-nocona = x86_64-core2
> 
> The naming is a bit to long to suite my taste, maybe prescott and
> nocona are enough?
> 
> I would like some input on this before I commit anything and pollute
> the namespace.
> 
> Regards,

I would suggest just add conf/machine/core2.conf and another
conf/machine/tune-core2.inc file to have the special gcc flags.  I would
not add it as a separate arch but stick with x86. To me it sounds more
confusing to have x86 and core separated out into two different basic
arches.

Just my 2 cents.

- -Khem

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGygM3HnJKy6V6em4RAnk4AJ0Xw4JlBqos/8xA60x59GkAbOYvhwCffGm+
AMhMc3UVpCmd1qTCmlVT570=
=ES0x
-----END PGP SIGNATURE-----


