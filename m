Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PibXe-00045r-Va
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 00:46:19 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 94919CBBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 00:17:55 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArYSAH+LQU1T4zjzPGdsb2JhbAAMllWOJwEBAQE1vROFTwSLEoEV
X-IronPort-AV: E=Sophos;i="4.60,387,1291590000"; d="scan'208";a="1709901739"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 28 Jan 2011 00:17:55 +0100
Message-ID: <4D41FD22.2050803@atmel.com>
Date: Fri, 28 Jan 2011 00:17:54 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D4092E8.8040207@atmel.com> <ihqdm4$jaj$1@dough.gmane.org>
In-Reply-To: <ihqdm4$jaj$1@dough.gmane.org>
Subject: Re: Patching from a file containing a compressed directory	(<directory>.tar.bz2)
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
X-List-Received-Date: Thu, 27 Jan 2011 23:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-01-27 01:19, Koen Kooi skrev:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 26-01-11 22:32, Ulf Samuelsson wrote:
>>      Trying to change the at91 linux recipes.
>>      The "experimental" patches to be added on top of the "maxim" patch
>>      can be downloaded from ftp://ftp.at91.com/ and that file
>>      is generated from a directory of patches, which should be applied
>>      in alphabetical order.
>>
>>      When the "obvious" SRC_URI  is used:
>>
>>      ftp://ftp.at91.com/<directory>.tar.bz2;apply=yes \
>>
>>       the files do not get applied in alphabetical order.
>>
>>      It looks to me like they get applied in reverse order,  but I did
>> not check carefully.
>>      I tried adding a "series" file, and recompress, but that failed as
>> well.
>>
>>      Any clue on how to get the patches applied in alphabetical order?
>>
>>      If the patches are in a subdirectory to the recipe, and applied
>> manually
>>      everything is OK, but that seems to be a shame to have to resort to
>> that.
> We don't want such behaviour, putting the patches in OE and adding them
> to SRC_URI is the only acceptable way to do this.

Well no, there is always an option to take the file,
"cat" all the files together to a single file,
which will result in the patches beeing applied in the correct order.

Less ugly than adding 94 patches and listing them in the recipe...

By "Manual", I mean:

do_apply_at91_exp_patch () {
     cd    ${S}
     for    f in `ls ../${PV}-at91-exp.4/*.patch` ; do
         cat $f    | patch -p1
     done
}

Why would that be a problem?

To me, maintaining this is much less work than maintaining a
SRC_URI statement.

Obviously, it would be better if the build system
had a defined order when applying patches from a file
containing multiple patches.


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNQLoEMkyGM64RGpERAo3fAJoDwcnY3HrWprnEOFzwcp1+VU/biQCfd0oZ
> dJ7RQ/b2cMdBSdP3NFQsx6M=
> =ZC5T
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



