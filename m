Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4888F60851
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:36:37 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ph11so39041544igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 07:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=DUib9txVw9AJd49Fj3PcxK939YyzjyQHqZI6VvHsbcU=;
	b=gQnJA8J9XrkUIW9mihPLfxlrkvv0Gch+ErWze7CvcYBXB6S137ARmdnAbMngPb3KTo
	0DJwgqSsSCWDoFcbvjXN7n/yK0KC4eBbL9hyVzdMJDUKIbhXOMqvNhg0Wzi7nXCk9E/1
	vPpbA5eZ/HS9XK95FYqsM1HHSYkp4fHCWJC35ALFoV3oiRqGN7ABqvhGYByBe085uJxu
	CPbzdfr5J/JIPUOvoUh9RJCO2arSHok1SBpYhFuEdW3WOuJ+p13dxHp/PK+vU9oo4GWv
	Cm8mIWzKCWBihX58k4I6vuPz9M0Wm5/J+UvA6BIml916YUNAWLqLQSRLv865L2g3Zhkx
	BXWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=DUib9txVw9AJd49Fj3PcxK939YyzjyQHqZI6VvHsbcU=;
	b=jfU9oKmlJOPKmLSwkRbEg2t2mDOLjhocf0Xe/QoLyXxQChMvpd3xqBsU3L+R8tNgW8
	F9M1uuP7wVbs7FVlHbIEqACVlHft0rHM4EbQzKJeZG74iYP4wpa2oZazQrH2xFqRNBqk
	3SeGewoNTSvbQ1pNR1DWvyO6wQlPru+DXR1sqlMIzUeZwcQ8BOkHjOz3VeWeSJfLf49T
	McvxUYZ1k+s8CWOpVv1EGoMhwIy1qnn/8UoeFmlJSquJxf9TuEZO1GtHyn/YHeZ57U6O
	EHJUUGE+qY08rApVULBApnIgm7aZjIrMawWH9ThpLp8MrEToFBKPTRR9p6CFbOvNV7tR
	4sfw==
X-Received: by 10.50.13.72 with SMTP id f8mr3784721igc.38.1450452998260; Fri,
	18 Dec 2015 07:36:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Fri, 18 Dec 2015 07:36:18 -0800 (PST)
In-Reply-To: <1BDA3F91DD18BA459E26B6B10F84A8D7010AB82D@DEMUMBX004.nsn-intra.net>
References: <1BDA3F91DD18BA459E26B6B10F84A8D7010AB82D@DEMUMBX004.nsn-intra.net>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 18 Dec 2015 08:36:18 -0700
X-Google-Sender-Auth: oitoNjWXSc4a7U1PGajuuxAMhuU
Message-ID: <CABcZAN=9hSvADBTzvW7jL7maFhTU5vLO=i1RO1-UzQFVG4fdng@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How to force recipe to be parsed eveey time - dynamic PV value
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
X-List-Received-Date: Fri, 18 Dec 2015 15:36:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 4:51 AM, Kubalski, Lukasz (EXT-Espotel -
PL/Wroclaw) <lukasz.kubalski.ext@nokia.com> wrote:

> I have problem that recipe is not always parsed.
> Is it way to force it? Like checksum/signature/stamp invalidation?
>
> Problem details:
>    I need to have my PV to be generated dynamically e.g like PV =
> "${@my_get_version_func(d)}"
>
> In such case recipe is not parsed every time (checksum doesn't change), PV
> is no reevaluated  and even my_get_version_func would return different
> value my image is not rebuilt.
>

By default, inline python is not expanded when included in the metadata
checksumming, it's left as is. If you want the result of the calculation to
be included, you can use vardepvalue:

    PV[vardepvalue] = "${PV}"
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

