Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1McNCr-0000zd-3P
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 19:38:19 +0200
Received: by qw-out-1920.google.com with SMTP id 4so668820qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2009 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PIrAn8WzWJJT9cCOTjYsX28E9gmLO8HPoqSYjf9EP7Y=;
	b=TlmQhvGyj9EzvpmkvJEmesEFBuHBdIvxfgLvfH28zsrgO/bdZlEF5iiJuFaTapDESE
	2MRVHX6jrIs82BdkDelczBUjAFkb9lsRlGIfeaP6winZpwDyxdmc4aRFB/JkA4c5Tpy/
	Ot/Bq4EFoSQL6H5o5S3wT8X5zlPdzx+J+O7EY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ai+/xdtqaFSPghk/Uki7GjB/BIsx4UIlopBwBWKiXYuDGAL8MFah2kn2ocG91b3uW+
	a+WRkPu/x2s5AKqMKjmW077befgbcc42ioyUWXpZoE/inG5fPgQDtppHJN/927/CUGOu
	LBPKFKwWVT7XM6AfT9522Blk33ewBOv79cMA8=
MIME-Version: 1.0
Received: by 10.229.112.139 with SMTP id w11mr1523523qcp.8.1250356891551; Sat, 
	15 Aug 2009 10:21:31 -0700 (PDT)
In-Reply-To: <20090815022703.GH14883@smtp.west.cox.net>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
Date: Sat, 15 Aug 2009 10:21:31 -0700
Message-ID: <19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Sat, 15 Aug 2009 17:38:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Aug 14, 2009 at 7:27 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Fri, Aug 14, 2009 at 02:51:38PM -0700, Khem Raj wrote:
>
>> Hi
>>
>> I would like to add minimal-eglibc and micro-eglibc distros on same
>> lines as -uclibc one's
>>
>> Any objections ?
>
> minimal-uclibc and micro-uclibc should go away and just pickup from LIBC
> being passed in / set.

Ideally yes but there are other things like libintl libiconv etc which
needs special handling
for uclibc. So having uclibc counterparts is good.

But I think for micro and minimal I propose that we should chose
eglibc. It fits in better
IMO

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


