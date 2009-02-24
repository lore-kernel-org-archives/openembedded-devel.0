Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Lc64s-0001W9-OP
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 23:48:38 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 872744BE76; Tue, 24 Feb 2009 23:45:34 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRWVFwAXS0=
Message-ID: <54520.AFRWVFwAXS0=.1235515534.squirrel@webmail.no-log.org>
In-Reply-To: <49A458A1.80308@opensimpad.org>
References: <200902131728.08634.openembedded@haerwu.biz>
	<49A458A1.80308@opensimpad.org>
Date: Tue, 24 Feb 2009 23:45:34 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 22:48:38 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> Marcin Juszkiewicz wrote:
>> Other was to use filename as key and add "url[0-xx]" fields which will
>> list alternative locations. This one looks better but still does not
>> solve situation when someone use DEBIAN_MIRROR which is not present in
>> checksums.ini file.
>>
>>
> What about using the hashes as identifier:
>
> Something like this:
>
> filename=3Dfoo-0.13.49.tar.bz2
> url[0-xx]
> generated_url[0-xx] //or only [0-xx]
> md5=3D5f7b88ebb2bcd7e8044328482d079661
> sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22=
af
>
> pseudo code:
> download source
> check_ok:=3Dfalse
>
> if SRC_URI exists in url/generated_url + filename
>     do normal check
> else
>     generate md5 and sha256 sums of the source
>     look up md5 and sha256 sum
>     if both exists in the same entity
>        if filename matches filename of SRC_URI
>           check_ok:=3Dtrue
>           add url to generated_urls
>
> best regards
> Bernhard Guillon
great idea...
but we also need to find out how to handle the commits of suchs generated=
s
urls?
because some developers forget to commit the checksums,and because they
could have differents repositories
Denis.



