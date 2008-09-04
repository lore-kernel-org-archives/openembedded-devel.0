Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KbNaq-00081U-UN
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Sep 2008 00:46:25 +0200
Received: by rv-out-0708.google.com with SMTP id f25so195554rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2008 15:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=9TWJsbDl94TdfsPZzUrAw/1iE4Vvem5a4I5P+viYeJ4=;
	b=nvkt2xpvgwNfxS/thRJV+RDJgTzxkRSL4RTOR01Cmk2JHgbLJC/AU0zJTDQpARyXwE
	FXO4FOxVCWI2TzFmCw4lX2PW77Ajpl6SMy2XakZWnf+BQswfszDNhSdj3DyfHIEFal4u
	JTpMzhJ2+vWS3tw9vYrMwv9W5fFOdWmR2tR2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=XnOtC3KK7cRpAuXKWAGOUciwOQqRCCWmPSv9s0peCj7tdpyE1Ps22b77Rcom2kix7Z
	P9jW9CVm2BXluO+s+poO216j3iC1rK0ABoIJLXGETAGooiUBKa3Hvq8mjtGVCIzuxFys
	N4CsBeZ37RrCYpwX3mdzLKFu+lsOnC64aKT8Q=
Received: by 10.141.83.15 with SMTP id k15mr6068199rvl.289.1220568251738;
	Thu, 04 Sep 2008 15:44:11 -0700 (PDT)
Received: by 10.141.163.6 with HTTP; Thu, 4 Sep 2008 15:44:11 -0700 (PDT)
Message-ID: <c384c5ea0809041544j77faf959m3b899e619542cb42@mail.gmail.com>
Date: Fri, 5 Sep 2008 00:44:11 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1220564079.4641.67.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
References: <c384c5ea0809041338t15ff7146m42b94c3723410ce6@mail.gmail.com>
	<1220564079.4641.67.camel@lenovo.internal.reciva.com>
Subject: Re: PREFERRED_PROVIDER_x/y = "z" versus PREFERRED_PROVIDER += " x/y:z"
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
X-List-Received-Date: Thu, 04 Sep 2008 22:46:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Phil,

On Thu, Sep 4, 2008 at 11:34 PM, Phil Blundell <pb@reciva.com> wrote:
> On Thu, 2008-09-04 at 22:38 +0200, Leon Woestenberg wrote:
>> can someone explain the (subtle) differences between
>> PREFERRED_PROVIDER_x/y = "z"
>> PREFERRED_PROVIDER += " x/y:z"
>> ?
>
> As far as I remember, there's no real difference between those two
> things at the bitbake level.  I think the latter syntax came first, but
>
OK, I wonder if variables inside are handled identically in both cases?

PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

> Personally I would recommend that you always use the former syntax.  I
> can't think of any situation where the latter is necessary or desirable.
>
So, anyone objections if I change all occurences?

Regards,
-- 
Leon

* this question is intended to awaken those developers that know there
is a very subtle difference involved.


