Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3fQP-0004Wy-4t
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 03:37:38 +0200
Received: by iwn38 with SMTP id 38so9349iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 18:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+4rVyZU5VGY2KVq4LVg/gLBPfpxVqEaV1MTat+QWXx0=;
	b=Lxc7LW4nHzxHBcJKMHS1ILa975IWaznvIFAbpm7EiycG6HNBl26V29BVuF2OilLtMG
	euKnZJL5zYMY9lE22OYOLbUwf6nzE+3L3o/aFRxcgRsePPnagNTGBoyA1WInzSnnV+FA
	BRL+sSADSJNrcvmPnhVh2BunDNFaqwnB+mSUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Tmof+L8VxZqqXDLeNbs6pl2HzUC5HCrVlN6e1W0ddIta7g0uy+LeiWVxzN3rEyIbfp
	zuNRXwHNa862sllVMfq6FiaR3Q/bsET4+1xRFOZSBJg1yM1D2ZGaTeg81aaXKlWYrMw/
	7KJyKQ8KHd5g0wc8gloqmENsDncFFgUeYyu5E=
Received: by 10.231.15.203 with SMTP id l11mr35203iba.182.1286415310261; Wed,
	06 Oct 2010 18:35:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Wed, 6 Oct 2010 18:34:46 -0700 (PDT)
In-Reply-To: <AANLkTiktqet4VLvPg5-wuXq6=kOr0979Fyw_OK_ek6EA@mail.gmail.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
	<4CA99206.5060001@eukrea.com>
	<AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
	<AANLkTi=wjXOWSjoiY0FqUQKU3Y+1hxWFQcvtD7HimFiv@mail.gmail.com>
	<4CAA29ED.9000501@eukrea.com>
	<AANLkTi=mh5OKhwL8qE7ZNwqwh5abjP3=w==oDNHrRbai@mail.gmail.com>
	<AANLkTim-ZeFpYmCU+tseSGo77AH+D5V_DBLC1MyCAy4Y@mail.gmail.com>
	<AANLkTiktqet4VLvPg5-wuXq6=kOr0979Fyw_OK_ek6EA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Oct 2010 18:34:46 -0700
Message-ID: <AANLkTinH3Zer2OVg9frQneZHDYCwa-FpGi8mT9thHjvi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Thu, 07 Oct 2010 01:37:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 6, 2010 at 4:17 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Wed, Oct 6, 2010 at 3:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Oct 4, 2010 at 12:29 PM, J. L. <vwyodapink@gmail.com> wrote:
>>> On Mon, Oct 4, 2010 at 12:24 PM, Eric B=C3=A9nard <eric@eukrea.com> wro=
te:
>>>> Le 04/10/2010 20:34, J. L. a =C3=A9crit :
>>>>>
>>>>> udev151 builds for me without this fix and I am building with gcc
>>>>> 4.5.. Just thought I would let you know
>>>>>
>>>> which machine / arch / distro are you building for ?
>>>>
>>>> Eric
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> gumstix overo angstrom 2010.x gcc 4.5
>>
>> and how old is your OE snapshot.
>>
>> -k
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Just did a pull right now and tried a rebuild and still is working for me

what distro ?
We use -Os by default for many distros where it will work. but try using -O=
2
and see if it still works or not.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


