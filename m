Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OOtVC-0003XG-UP
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 16:22:03 +0200
Received: by gyg10 with SMTP id 10so4279167gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=PZuz8w0rKv4fxDSX3YwApbx7doeF8IDH00FPNYCOipo=;
	b=aFuiWriCVs9x9N/00MUyFRQQH7YTJWB/gRdgRnJ7I+bd+kav8XFVSKTtOwpft7Ouce
	qNX4PiDQN3/ms61SKqSudWYUa74eR97tOKhNHmKPJ9gQES3GM4tZqDLdeQNxLzfcdX0v
	+8z+oWPvJ9fPiiAF9j6e5KjZHtQ5bbeYFv3uk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HQtWpHE6bldOg0rvoO9+/34UHX8/XssVNeoMGAPNhb02+vy1c1e8xY+8LEy6uMuM4t
	ICIUjGeQew17BlZWLp3AkhMyz7pw6ak4RnbM+KTM63bU+CjKDkKQF48v1OpnHQdD8lG9
	X6OQHZdFjyWMTJ6V2/d1d5W/1UhYPblLAchEk=
MIME-Version: 1.0
Received: by 10.150.47.33 with SMTP id u33mr10345336ybu.49.1276697851664; Wed, 
	16 Jun 2010 07:17:31 -0700 (PDT)
Received: by 10.231.17.130 with HTTP; Wed, 16 Jun 2010 07:17:31 -0700 (PDT)
In-Reply-To: <hvajqb$i26$1@dough.gmane.org>
References: <E1OOdAL-0005Tc-Dn@melo.openembedded.org>
	<hv9seb$ks1$1@dough.gmane.org> <hvajqb$i26$1@dough.gmane.org>
Date: Wed, 16 Jun 2010 07:17:31 -0700
Message-ID: <AANLkTimhpcqM6rx1oO0jUeoD3s4A8T0Q2pqXT5ln9cLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Khem Raj : gnu-config: Add recipe for git version.
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
X-List-Received-Date: Wed, 16 Jun 2010 14:22:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6/16/10, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 16-06-10 08:54, Dmitry Eremin-Solenikov wrote:
>> git version control wrote:
>>
>>> Module: openembedded.git
>>> Branch: org.openembedded.dev
>>> Commit: 473cd5f616190739550abd8bf71629a87036730b URL:
>>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=473cd5f616190739550abd8bf71629a87036730b
>>>
>>> Author: Khem Raj <raj.khem@gmail.com>
>>> Date:   Tue Jun 15 13:52:40 2010 -0700
>>>
>>> gnu-config: Add recipe for git version.
>>>
>>> * Rename gnu-config to files folder.
>>>
>>> Signed-off-by: Khem Raj
>>> <raj.khem@gmail.com>
>>
>> Unless I have git-native in ASSUME-PROVIDED, this breaks builds with:
>> ERROR: Unbuildable tasks were found.
>> These are usually caused by circular dependencies and any circular
>> dependency chains found will be printed below. Increase the debug level to
>> see a list of unbuildable tasks.
>
> I changed it to fetch a snapshot instead, dep loop gone. Hopefully Khem
> will learn from this and not but tons of stuff in ASSUME_PROVIDED on his
> machine anymore...

yes you crystal ball saw it I have git in ASSUME_PROVIDED but I would
not have hit this
error even if it was not there untill I did a build from scratch.
hmm thanks for fixing. But now I am curious how did the cvs recipe
work. suppose I dont
have cvs installed on my build machine wont that also end up in same
circular dep loop
or it is implicit that cvs should be always installed on your build  box for OE

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMGNKKMkyGM64RGpERAhdpAKCZ168m2LEhxCKeztxTHfxJij4pqwCfRfnT
> UXL1IuquynfLR31RcQ6i5t8=
> =qmMV
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


