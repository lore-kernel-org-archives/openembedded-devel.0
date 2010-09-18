Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ox09b-0007yq-TE
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 18:20:45 +0200
Received: by iwn2 with SMTP id 2so2906641iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=XWNRJ8xVJnZzfx04FNazIPBenQTdKFWJE5gc5HtTK+A=;
	b=eQho+of3UHftT+2Jo2uWROsTM1rOGZIbOmmLFfagugFfT+h3T6fZZwiK7xnFTtuarO
	dSG8IRm255XvxWQCm5LtdVMpcWcJ1lohucQLEqzfkBLb6K8mnr0VjK9Iqe4mXNlao7cN
	KyMZphP18HhPSLEwon5snlzDy73wGnTRbTOVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uErs4+tp5EQPG6DE5TH2R02pLZmMNqfzK87RNE3GxO9Fr57ZRxba9Z/LM3avDVeNrF
	BToFje7ZRqdh57ENuUQUgISrI+7uzIlTDGCCNTSml0YBwud6oJnsHNLqB7B6qH2lG9w6
	y/1uKa48cKGneBnA3sDc+SUo0r1On9iz2DiSw=
Received: by 10.231.130.145 with SMTP id t17mr6205019ibs.144.1284826790265;
	Sat, 18 Sep 2010 09:19:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Sat, 18 Sep 2010 09:19:30 -0700 (PDT)
In-Reply-To: <4C948C82.7070900@freyther.de>
References: <4C8CA9A2.7040701@freyther.de> <4C948C82.7070900@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Sep 2010 09:19:30 -0700
Message-ID: <AANLkTik91eRafYg6H5evF5RdFSSem4arcY-9+TzOW22Z@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fedora14 and glibc-initial
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
X-List-Received-Date: Sat, 18 Sep 2010 16:20:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 18, 2010 at 2:55 AM, Holger Freyther <holger+oe@freyther.de> wr=
ote:
> On 09/12/2010 06:21 PM, Holger Freyther wrote:
>> Hi,
>>
>> has anyone else tried to build glibc-initial with Fedora14/rawhide? I am
>> having a build issue. At first make install tries to copy something to
>> /usr/local/include/sys/limits.h and now it is complaining about the Make=
file
>> having mixed mode:
>>
>> Makefile:235: *** mixed implicit and normal rules. =C2=A0Stop.
>
>
> the first error vanished (maybe fixed upstream?), I have fixed the Makefi=
le
> error in glibc-2.9 and busybox-1.13.2 and now...
>
> Is anyone else having build issues with procps?
>

is F14 using 3.82 make ? may be not many have moved to make 3.82
yet.

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


