Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ks1Fv-0006pX-T7
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 22:21:36 +0200
Received: by qw-out-1920.google.com with SMTP id 5so576992qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 13:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=pMgsL8bGyKvWPz9T3cNOuk4r2zKyPa4B3fauvTqnGRA=;
	b=iN2Wy+fAGkSAxbB4Oo6BzMFofC2/y8qn/hP4n/KW1eGDHM57yWQzFqlInycsKhC4vb
	jo+jdV30aPPsILeNk9D4uyiis0dqm367vWgSZPorkRVzIBepB4UD20xk2E332r+O1zag
	3b/cChLBCOnhxf3O00pHbna9mRmVPDfOksRPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=K3RJo5dmr0a56bgztbVBS3LrDlrmcOM6hMcHfvqZCwx7EO+LUIP8R2Cm68bWGQDeEV
	M8LX1ik0ZdeGHMWGlaWCZKyGqzSe0LoZ57aCOIkIvaqqciNIT3cE14E3g2kAt5HBUJ4F
	T3gL8MsuJ5CdvdgF0pBIcER6Z2A3ItHnPMjT0=
Received: by 10.214.115.9 with SMTP id n9mr11215221qac.84.1224534076335;
	Mon, 20 Oct 2008 13:21:16 -0700 (PDT)
Received: by 10.214.12.10 with HTTP; Mon, 20 Oct 2008 13:21:16 -0700 (PDT)
Message-ID: <c384c5ea0810201321l6a97e03cqef0bd74fa1b23c8b@mail.gmail.com>
Date: Mon, 20 Oct 2008 22:21:16 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gdfl94$866$1@ger.gmane.org>
MIME-Version: 1.0
References: <20081017131704.GA4334@jama>
	<200810172041.10116.openembedded@haerwu.biz>
	<20081018183016.GA4310@jama>
	<c384c5ea0810181249x4d700cdbw2e409eb1fecefaab@mail.gmail.com>
	<gdfl94$866$1@ger.gmane.org>
Subject: Re: checksums.ini - should check only against filename not uri_src
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
X-List-Received-Date: Mon, 20 Oct 2008 20:21:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sun, Oct 19, 2008 at 5:55 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 18-10-2008 21:49, Leon Woestenberg wrote:
>> On Sat, Oct 18, 2008 at 8:30 PM, Martin Jansa<Martin.Jansa@mk.cvut.cz>
>>
>> Note that I have written a package to help import, learn and
>> automatically google for missing packages, from which some ideas might
>> be ripped.
>
> Could we use it in OE as do_fetch error handler? If we know the sha256 sum
> of a package it is safe to pull it from a semi-random place on the net when
> debian cleans out their archive again.
>

Yes, I should probably make it come up with a random URL on each request.


Regards,
-- 
Leon


