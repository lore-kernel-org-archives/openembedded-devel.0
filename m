Received: from smtpauth13.prod.mesa1.secureserver.net ([64.202.165.37])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PZYpw-0003Kc-J2
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 02:03:49 +0100
Received: (qmail 23261 invoked from network); 3 Jan 2011 01:03:26 -0000
Received: from unknown (209.242.7.132)
	by smtpauth13.prod.mesa1.secureserver.net (64.202.165.37) with ESMTP;
	03 Jan 2011 01:03:26 -0000
Message-ID: <4D212058.5050001@mwester.net>
Date: Sun, 02 Jan 2011 19:03:20 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D20968B.4030004@mwester.net> <ifqdd0$7cl$1@dough.gmane.org>
In-Reply-To: <ifqdd0$7cl$1@dough.gmane.org>
Subject: Re: [PATCH] e2fsprogs.inc - break shared libs into separate packages
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
X-List-Received-Date: Mon, 03 Jan 2011 01:03:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/2/2011 11:41 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 02-01-11 16:15, Mike Westerhof wrote:
>> Break the two shared libraries (libe2p and libext2fs) out of the general e2fsprogs
>> package and into their own packages.  This avoids pulling in unwanted executables
>> when a distro only desires the basic tools (such as e2fsck and/or mke2fs).
>>
>> Signed-off-by: Mike Westerhof <mike@mwester.net>
> 
> Recipes with e2fsprogs in DEPENDS will need a PR bump as well, since
> they might link to these libs as well. This will result in missing
> libraries when using package feeds.

Ok, I can do that.  But I'm not sure I understand why this is the case.
 OE detects the dependencies on the shared libs, and automagically adds
the necessary dependencies to the opkg control file.  Hence, if opkg on
a device updates "e2fsprogs", it will see that the new version of
"e2fsprogs" depends on the two new libraries, and it should pull those
in from the feeds as well.

Perhaps a use-case that will fail will help me understand, and
consequently, help me put together a more-correct patch.

Thanks,
-Mike (mwester)


> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFNILjgMkyGM64RGpERAl63AJ9d+oy10QAFluRD89/YB6g9ircOuwCfXljo
> L2xm9I2E6/rkDke1UFvCG9c=
> =Xptt
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 



