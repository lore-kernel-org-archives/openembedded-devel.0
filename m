Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LiBNm-0003iO-RG
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 18:41:18 +0100
Received: by yx-out-1718.google.com with SMTP id 36so251090yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=V2TFAdEcE3GusYkyDRFDC/YDJyRInWfWSc394IL+R+A=;
	b=VW8IJzdaN5AU+POhvNsI5V5ZztB34Ef4J4gj5v5FPt0WnV0JGBqK2tTwsRZnlnYVw+
	n+wVpKdIVR+73uXMWUU4WZ9Zzu6sBD7XD0OmPYw+5EmR4UdkFF3+xKT/erbnyNlkmeMC
	yNhQpRlSdMq+o9g7Vp3sFyfMJhLNKPfZr8isY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WgDX1qKB1AOs5lhTvX6A7ID/kjzRWH2hKtnklLN46q0BQ4egGTQYjNThpwGqzCLOYV
	KZizmgF0iFY4lyVNy26n6I/TpbmiF8xBW3Zv6U/9pdZ5XrPfohwXZ8eNHmZqh+SJIbrn
	jRP6G7EgfXwk7ffz2l5zQNkhxXkQTUiUxNGiY=
MIME-Version: 1.0
Received: by 10.142.221.11 with SMTP id t11mr701343wfg.238.1236966057913; Fri, 
	13 Mar 2009 10:40:57 -0700 (PDT)
In-Reply-To: <ac9c93b10903130815t10265676ld8e464ab460689dd@mail.gmail.com>
References: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
	<19c1b8a90903121037g5726bf99qadca1e5d95dcae7@mail.gmail.com>
	<ac9c93b10903121334j3a6cfad8u8e4591ddecf80394@mail.gmail.com>
	<19c1b8a90903121458ufac02e7p878b6badfe29878@mail.gmail.com>
	<ac9c93b10903130815t10265676ld8e464ab460689dd@mail.gmail.com>
Date: Fri, 13 Mar 2009 10:40:57 -0700
Message-ID: <19c1b8a90903131040k5d7b1f40kfbfafbb787e45341@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: g++ lib problem
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
X-List-Received-Date: Fri, 13 Mar 2009 17:41:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 13, 2009 at 8:15 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2009/3/12 Khem Raj <raj.khem@gmail.com>:
> [...]
>>
>> I see it gets it from libm but g++ specifiies -lm for you where as gcc
>> does not. I think the problem is that ARM have same precision for
>> double and long double so glibc defines __NO_LONG_DOUBLE_MATH for ARM
>> as a result the prototypes for the *l functions are not emitted into
>> math.h. Although in glibc they are aliases for the corresponding
> [...]
>
> Khem,
>
> Thanks for the explanation.
> Should we change the glibc package to resolve this?
>

hmmm IMO I think you should fix the application to not ask for long
double functions on platforms where long double is
not different than double and fixing glibc could be ok too. Care for a patch :)
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


