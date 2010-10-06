Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P3dEs-0002my-6e
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 01:17:35 +0200
Received: by gxk10 with SMTP id 10so47532gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 16:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kKY2t+B0Mxt455iJHABKjPJaZuHDvyqNf2035SQn8kY=;
	b=BhiB8S848N3deC403hNei+2/VECRRPlcw1+HWn8YrmFSHFwt+69T/Sd7isNzz4YQI7
	Sn7sQ5zqQrY+GhWg/podDIgt9VqSdkgq4njVVAqwgEhFmOAUf4N/a5TPayPcCR7VgGCG
	DOnZ5sS3/6z2nG+2oIO0DhwGl+v2q9eAc5I+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Y7qBaHXVguAf9Y3Vx3oEF+5vNzwr1YVyd42CPDb0/pV0kdyz4JKJzdl1QOT7Y0mFuT
	na5E72sGKe9TlDNBK23ZAVOIEGg7rvPDZ+UBVdy9ZA7xIMzjGHHv9YqZyY2ycSgPKwWR
	w4oCX7MKlk+1B2+T8iUeB6DXqutO7/FpYOZEk=
MIME-Version: 1.0
Received: by 10.151.7.3 with SMTP id k3mr48610ybi.190.1286407020856; Wed, 06
	Oct 2010 16:17:00 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Wed, 6 Oct 2010 16:17:00 -0700 (PDT)
In-Reply-To: <AANLkTim-ZeFpYmCU+tseSGo77AH+D5V_DBLC1MyCAy4Y@mail.gmail.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
	<4CA99206.5060001@eukrea.com>
	<AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
	<AANLkTi=wjXOWSjoiY0FqUQKU3Y+1hxWFQcvtD7HimFiv@mail.gmail.com>
	<4CAA29ED.9000501@eukrea.com>
	<AANLkTi=mh5OKhwL8qE7ZNwqwh5abjP3=w==oDNHrRbai@mail.gmail.com>
	<AANLkTim-ZeFpYmCU+tseSGo77AH+D5V_DBLC1MyCAy4Y@mail.gmail.com>
Date: Wed, 6 Oct 2010 16:17:00 -0700
Message-ID: <AANLkTiktqet4VLvPg5-wuXq6=kOr0979Fyw_OK_ek6EA@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Wed, 06 Oct 2010 23:17:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 6, 2010 at 3:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Oct 4, 2010 at 12:29 PM, J. L. <vwyodapink@gmail.com> wrote:
>> On Mon, Oct 4, 2010 at 12:24 PM, Eric B=E9nard <eric@eukrea.com> wrote:
>>> Le 04/10/2010 20:34, J. L. a =E9crit :
>>>>
>>>> udev151 builds for me without this fix and I am building with gcc
>>>> 4.5.. Just thought I would let you know
>>>>
>>> which machine / arch / distro are you building for ?
>>>
>>> Eric
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> gumstix overo angstrom 2010.x gcc 4.5
>
> and how old is your OE snapshot.
>
> -k
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Just did a pull right now and tried a rebuild and still is working for me


