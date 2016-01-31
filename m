Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id ABFA07717F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 17:27:35 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g73so135928271ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 09:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=0TXFkV16m4F5gPBixbq9XDv9v1N4D4bMk0y9yVJv6D4=;
	b=FRTgbMf4C8Na7qrIdpw4wqNGKptTLUvnU7a8I3vs6bbziT8xH9FxTq3PMYiavcIQGm
	jdMpPZGfQBuvA9oOH8d7KZYcyj8TJh/eX+iQAZJwOnZhjPrxaj25iC5ylL5ScMOvoigd
	zNns0rl4vznPiOCot4cBtx4dUd2N84ttj/ssjJwY6/ymV1Sjz0lb95EVKOAYvI6iZpLu
	jCdQ1nT9XRzVSFYZlvKF8txe7agLk0nd/fIB0jkG+oKEfbFWh6DaOzAEqd8raXFqlPP0
	Y71HGRM7vRtKpQVWFIck482lzmpkLSWHnHKmzit54GOUQ6E+wCMJviN9+CrAkc0uZ8UR
	tIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=0TXFkV16m4F5gPBixbq9XDv9v1N4D4bMk0y9yVJv6D4=;
	b=NsRIiKts9V6QKZGEaurSsTtA5tzivJZw8ZbdoOOtQ8RlrwZ469+9eFfZb0oUJrWu3I
	jcLTfKT4em14cRsRmt52qoakksHglI24cTaYTmjDtrDmc3E1gSaTdIt1Afmz8slAcADf
	7YvsDVzfloaGlg3CG/IjCAWdl6FRSW2r3808pRECTqm/ooTws5Kmetg/Omlh5cmBng8z
	yPtPtn3pmwrq+rO2t+Fe9bRlRXAx7ijJGNaEgNy/hsGGAvk/NCoyXDWiJY8sFwF7oKx2
	0wZmZlUo66DAy/QiKOufg3wAoM89Pp9CkBi3SeoQBIwD5F2lyl17OA/SPgOU8QhS+H9z
	UzWw==
X-Gm-Message-State: AG10YORAPZF912n+PmfpC3a8/qKB2SM+9zUtRNtWJrCGuzm5T01MoncDCqPZbdmnAoV8QvkhNhXObPVSNNne/A==
X-Received: by 10.107.165.14 with SMTP id o14mr18008835ioe.49.1454261256043;
	Sun, 31 Jan 2016 09:27:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Sun, 31 Jan 2016 09:27:06 -0800 (PST)
In-Reply-To: <005501d15c42$649442d0$2dbcc870$@gmail.com>
References: <1454254968-8596-1-git-send-email-sven.ebenfeld@gmail.com>
	<1454254968-8596-2-git-send-email-sven.ebenfeld@gmail.com>
	<CAMKF1sqD+vsprAKVV97YxXdbApfzkZCKKpdLQzZ40hqOoir=iQ@mail.gmail.com>
	<005501d15c42$649442d0$2dbcc870$@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jan 2016 09:27:06 -0800
Message-ID: <CAMKF1srcf=06JqF-3jUKjr7efGBpszffdfAM-8rAVS3e3T+ZGw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Jan 2016 17:27:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 31, 2016 at 8:13 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Khem Raj
>> Sent: Sunday, January 31, 2016 5:02 PM
>> To: openembeded-devel <openembedded-
>> devel@lists.openembedded.org>
>> Subject: Re: [oe] [meta-oe][PATCH v2] mongodb: 2.6.0 -> 3.3.0 and remove
>> from pnblacklist
>>
>> On Sun, Jan 31, 2016 at 7:42 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com>
>> wrote:
>> > -DEPENDS = "openssl libpcre boost libpcap"
>> > -# Mongo uses tcmalloc on x86_64, which is provided by gperftools
>> > -DEPENDS_append_x86-64 = " gperftools"
>> > +DEPENDS = "openssl libpcre libpcap zlib"
>>
>> why is gperftools dep dropped ?
>
> gperftools dependency is added by PACKAGECONFIG[tcmalloc] if the parameters
> require it.

ah yes I see, thanks

