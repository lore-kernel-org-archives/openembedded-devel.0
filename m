Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QRSlt-0005F5-6G
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 19:30:25 +0200
Received: by vws2 with SMTP id 2so3886731vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=sS7GWqziJ0CV1OmT5V7G5s8Abl2Xn6pU0odIhq2Sd9Y=;
	b=iijYVe+bG7RYEdYwZaTgGo3uCki+O2HcFdRnbJc5BzzcmCT+amfyhzz1R0O9Y22hiY
	+uGNI62GpX8Kuk/QXi/w7Xjk2qK8afMWuHpp3nrvX3VahlVg7sQhnIdpzX8fDbvr4+2q
	NeubyqdQBvL/qc+QvoyZ0rq8/LQ9fwIYdUZ2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=J19gd49sCNlb2wzpQ+KdpcdKYgskA2eQ556kyuv7wgYNXIVz1dH7WtOIUOQ1ES4Gb3
	JcHRrGQRXnWHxZzQxgWJI4TRzQsax3hwW8l+37kOBJJNHTdpg0mEdeaMxP4M7xDPZEmV
	XoaAJ5FOhuFUWca/Nu7G+XbV+LSU64nIfFhNU=
Received: by 10.52.106.166 with SMTP id gv6mr3846635vdb.275.1306862835058;
	Tue, 31 May 2011 10:27:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.101.134 with HTTP; Tue, 31 May 2011 10:26:55 -0700 (PDT)
In-Reply-To: <BANLkTiks=fC27YHTaNEbFwObRGO0U=cVeg@mail.gmail.com>
References: <1306848827.5488.18.camel@desktop.home>
	<BANLkTiks=fC27YHTaNEbFwObRGO0U=cVeg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 31 May 2011 10:26:55 -0700
X-Google-Sender-Auth: hNnrzc3YN5DU99NOcTxtY_L4yRo
Message-ID: <BANLkTinQC8bZ=3PJFDoGagcHAq4B75hbTA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core and mercurial
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
X-List-Received-Date: Tue, 31 May 2011 17:30:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 10:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
> =C2=A0Or
>> alternatively, should oe-core include the mercurial-native recipe to
>> cover this case? =C2=A0Discuss :-)
>>
>
> Well it can but usually OE does not need a captive version of mercurial
> so it can use the one installed on the build machine.

Which is what ASSUME_PROVIDED is for..
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


