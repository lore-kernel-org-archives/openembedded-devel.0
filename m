Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UVcrp-0004tr-D4
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 09:14:49 +0200
Received: by mail-pa0-f45.google.com with SMTP id lf10so2329959pab.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=amTrcrxso0H3RM2hiP/eZJ0Cl3dJk4qnakoUJC8eEcU=;
	b=PHa4taBo0SQWbV7wYDFx9XHv6TDU7lmCSskLJPimymSjOqfru73/HS/zr7kwF6YW55
	59EoZC/kM6ZtT6YZSAbqkj6OMx0rmmmizcrPnziqL850TImnqD39eBrSVc980gC9Tx88
	9NTEnC26rU/J9/gVFAuHo3ZZDJFfMYPwCMZtovN9o4a5GiuJRueLWr7OQcyCsDEgMIL6
	M33PCtoJDKugw35EoDufkpCDxLHtAv3FpCi7fETF4V8L+erggHbHIlzltcWBKz6Ek/LL
	ynlSLudIHGn4uJ4wTwhUTrERsEWyV1STXKUC4UvzdEX0OXsx0CGlqiKjF2cFQauHhGPx
	ZctA==
X-Received: by 10.68.195.103 with SMTP id id7mr56607533pbc.56.1366959424341;
	Thu, 25 Apr 2013 23:57:04 -0700 (PDT)
Received: from sa-nc-common-173.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	kd7sm10466735pbb.34.2013.04.25.23.57.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 23:57:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANyK_8csDRyi9wzB4SwyxYOYEp6Kq0DZX6rY_2uiRLvrfobgJA@mail.gmail.com>
Date: Thu, 25 Apr 2013 23:57:04 -0700
Message-Id: <492859D0-8332-487F-86AD-B5DEE58FB624@gmail.com>
References: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
	<20130416111424.GJ10628@jama.dyndns-home.com>
	<CANyK_8cWf21+4CgXwJLE4-nxYGZwhXdpkQEW4MtfaQ5t=QdXMA@mail.gmail.com>
	<CANyK_8ft6aY8KFArMc35eKAZGYET5O++VpErsgWOrOZ9=r8vbA@mail.gmail.com>
	<20130418105310.GN26007@jama>
	<CANyK_8csDRyi9wzB4SwyxYOYEp6Kq0DZX6rY_2uiRLvrfobgJA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-oe] vim 7.3
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
X-List-Received-Date: Fri, 26 Apr 2013 07:14:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 18, 2013, at 4:54 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

>> No AUTOREV in meta-oe, but it's fine to add both
>> vim_7.3.905.bb and vim_hg.bb if hg versions have negative
>> DEFAULT_PREFERENCE and SRCREV that you can confirm is working (you =
can change
>> it to AUTOREV later in your local.conf if you want).
>>=20
>=20
> Pretty much every commit to the default branch of vim is released as a
> new version (hence .905) so I'll just stick with the single
> vim_7.3.905.bb file.

Just call the recipe vim_7.3.bb
and adjust PV accordingly=20=


