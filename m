Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sqpd9-0004Ro-Ci
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 20:02:47 +0200
Received: by eaal1 with SMTP id l1so1523994eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 10:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=E105HhgGLSrq6xFycpJeDn29OwBXwRItGDYEtGIFLms=;
	b=gLSrWAFs6JNjzYrsiVx5RAdbv4K6kT87FdnYQbQVIPI3MaeH2ZapPPwfQQj5b/E1ai
	vja7QL7wtHUtdQmoc/D4lsgqg9K4xidqEyTqaMbnxk58WgRGYu5Hs6Ox9nvqbD2cMvlq
	9XtiOHoqmnCS4F/6oIja7Uf0ogee73OyHddT3G7adn7/2LDbTp3TchnZtjWS4FZwkVW2
	A4DVyZAoy0Gfa6Zgo23v3l4S8fohe+MHxGddA2d+HftGADsCJ8NDwyedgWz98QKKUKYL
	yD9rRFq0l3WSKZkE/Gok20/eUJ+klPbIlnpyrq8JSwQYLvZK0W7RYW8fLgdOLL+bQ5sZ
	6KJg==
Received: by 10.14.214.65 with SMTP id b41mr10310567eep.33.1342461089042; Mon,
	16 Jul 2012 10:51:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 16 Jul 2012 10:50:58 -0700 (PDT)
In-Reply-To: <20120716174642.GK3729@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<1342460316-5489-3-git-send-email-raj.khem@gmail.com>
	<20120716174642.GK3729@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jul 2012 10:50:58 -0700
Message-ID: <CAMKF1so4v-Sjm6sgHY4U_d7CwwwGp4DfQc0CSOq75n2kFwYvvA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][PATCH 3/3] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Mon, 16 Jul 2012 18:02:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 16, 2012 at 10:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jul 16, 2012 at 10:38:36AM -0700, Khem Raj wrote:
>> This class is angstrom specific so lets move it to more
>> appropriate layer
>
> This is also used by SHR, that's why I've asked Koen to move blacklist
> from meta-angstrom to meta-oe before
> http://git.openembedded.org/meta-openembedded/commit/?id=68c15845d087df0a6f66c58a9fd80548a9bb3a59
>

OK, OE-Core also has blacklist implementation. Have you given a
thought to use it ?

> Cheers,
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/classes/blacklist.bbclass |   20 --------------------
>>  1 file changed, 20 deletions(-)
>>  delete mode 100644 meta-oe/classes/blacklist.bbclass
>>
>> diff --git a/meta-oe/classes/blacklist.bbclass b/meta-oe/classes/blacklist.bbclass
>> deleted file mode 100644
>> index 7bf4a73..0000000
>> --- a/meta-oe/classes/blacklist.bbclass
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -# anonymous support class from angstrom
>> -#
>> -# Features:
>> -#
>> -# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah = "message"
>> -#
>> -
>> -python () {
>> -    import bb
>> -
>> -    blacklist = bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
>> -    pkgnm = bb.data.getVar("PN", d, 1)
>> -    distro = bb.data.getVar("DISTRO", d, 1)
>> -
>> -    if blacklist:
>> -     bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
>> -        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
>> -
>> -}
>> -
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


