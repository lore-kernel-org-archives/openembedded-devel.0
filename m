Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1T5nV6-0008A0-Ih
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 02:48:20 +0200
Received: by iaky10 with SMTP id y10so7228303iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2012 17:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=1h0NLiJE2iTXMo0xIGXXYst5aCvgOPYeUkkZHIC4fII=;
	b=A+05dDsU7qbuxq6a+GptMpaZhV66bFeYgVNrSqwxj5kNPB1KOqFyN3lvqRgSA+CRJ9
	huF8KzkCOLn3rdBwQ7AwEtVkWYoTZaigEhbeI/uLX7cDyzWsY3EaiDTwaU6ixCgCCMc3
	KK3vlzQbFzOCYLno7wIy+2IUcbWUS4GcW1JAJIWn512rdX0Gr9GEtTExm6N44TVLfMQT
	jeQ7BSASi/a3cNDcYe+2tWAoBoqtmvyiz7rmvgCPMZVwZLh3il04IA3gNdBGiOPLgxxD
	FRJi/9LwC6XEnBEs6HZ3c+kE5nL4zMQ6q2VDVp0KzgI21tWB24YMJl44i8iiMcOtFkt5
	pxcg==
MIME-Version: 1.0
Received: by 10.50.220.194 with SMTP id py2mr8565508igc.15.1346027769260; Sun,
	26 Aug 2012 17:36:09 -0700 (PDT)
Received: by 10.50.60.34 with HTTP; Sun, 26 Aug 2012 17:36:09 -0700 (PDT)
In-Reply-To: <k19thr$cur$1@ger.gmane.org>
References: <1345831918-15547-1-git-send-email-joe.macdonald@windriver.com>
	<k19thr$cur$1@ger.gmane.org>
Date: Sun, 26 Aug 2012 20:36:09 -0400
Message-ID: <CANBf+V1fO_Wp2OT5doyRuxvbGuAQRANoLvoAGPr5r83bsUeh2Q@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQl4YkFbLUEgD1NhfThSV2Go6+sNx+TOTQ/cTL1V8aBxZOGQzwdX3sSsLZS+SBdOwWULDxKs
Subject: Re: [meta-oe][PATCH v2] meta-networking: add layer
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
X-List-Received-Date: Mon, 27 Aug 2012 00:48:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 25, 2012 at 3:06 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 24-08-12 20:11, Joe MacDonald schreef:
>> A home for networking-related packages.  This includes protocol support,
>> servers / daemons and utilities.
>>
>> Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com> ---
>
>> --- /dev/null +++ b/meta-networking/README @@ -0,0 +1,16 @@
>> +meta-networking +=============== + +This layer is intended to be a
>> central point for networking-related +packages and configuration.  It
>> should be useful directly on top of +oe-core and compliments
>> meta-openembedded.  It should be primarily useful +to the following
>> groups: + +      - Anyone building a small networking device (eg. a home
>> router / +        bridge / switch). + +      - Anyone wanting to add
>> network services to their device (eg. +        anything that might
>> benefit from a small ftp/tftp server) + +Please see the MAINTAINERS file
>> for information on contacting the +maintainers of this layer, as well as
>> instructions for submitting patches.
>
> This is missing the dependency info, e.g.
>
> This layer depends on:
>
> URI: git://git.openembedded.org/openembedded-core
> branch: master
> revision: HEAD

You're right.  Fixed in v3.

-J.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQOHl7MkyGM64RGpERAnR4AKCNIGWmim0yh0aPwUv0bF7yy4LRrgCdHvGi
> Z0LeQSFZXzfX6wchkLC8zHY=
> =thVi
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Joe MacDonald
:wq


