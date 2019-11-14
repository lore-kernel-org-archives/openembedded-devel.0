Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABF57FA19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:38:31 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x21so8736450ior.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KOZSVzwOHThq0/y/ww28xZhhnuLl9YnRqtw9MxRhK3k=;
	b=cAKyy5EGncE8XflBU4hvLDQPjYLqnwwoDyv5tAdB4zm2y1a/EpYeSY9conaxLYVszy
	zojMzhS2KDdAnQZ9jDGN2L6p6KszDClb/Zy0r1aXtOsBbbp497aZr9RnIO4qsva9nAGX
	Yz6zxZkp8ZMV6Tt1qCmhXpNEgWYqZ8Sbgx9BAsGLPsiCZMF41igCrADhg8MfESr9k/hf
	ax/HwoiBTbS8tstl5Dg2deCygRYD7ugghoarM2CuiKHJQOdIGN/eLgpLVJdbr/ep4Fr7
	8QqIN1qH+V4tu7RPFzGy56KphpjGUIE7N4RnkrzAyrAZqK+F/540W1STDdWcpDQSM/+k
	/Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KOZSVzwOHThq0/y/ww28xZhhnuLl9YnRqtw9MxRhK3k=;
	b=HyWjsteve3I13ngNE/aE0HkgvrTxc6Or9oIdNdaev+0wLZs12Un0GiSTh28vCU1s5E
	VP3zpDybncDoCyMj8imXzh2V6T1nuGOtImOVyXRfJoKMLwAbAXdqzMCvp+txwXlrDIQK
	gwjzMksdZRW5QuzYNXysyJFvETi4Y7aTpP21bLy8AiE5HCpzkXrKnEkU5/KYg0FfMSB5
	LMKKqpp1+YtcblnNBIpr2T3xbN+kBSfo5Gr0jC/7wUXHZCnqhN9VEbD2ZIIamVdiNIDn
	nwAeLmZRFAXEcnCwsHo2Vqcuh7rCRx7MsNhKJB1b1r4wAumNfPyXnOoZ/2rZ44KuSrTp
	ikGw==
X-Gm-Message-State: APjAAAXIw/1NDyNUmHYuHG8KkeD1QZ1eMx2rGQ/ja32A4fVWbdAoAXv9
	fWYcJgPFAqsBRO2ekQVwQOCaDjqJKEdvvRBDsCI=
X-Google-Smtp-Source: APXvYqzNzBVeMCfKzvlC8thFEvDU+wIcfNBZ8ks6JcfE9hoMcvW7iPFx+emIItDtA+THSeicvVpqBJNZiKXj9ut04M0=
X-Received: by 2002:a02:730d:: with SMTP id y13mr9665224jab.124.1573771112350; 
	Thu, 14 Nov 2019 14:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-5-schnitzeltony@gmail.com>
	<CAMKF1sqekHs4t7b6pa=uN6_kCvS0eOJCaDupYXz5SjrnZvACbg@mail.gmail.com>
In-Reply-To: <CAMKF1sqekHs4t7b6pa=uN6_kCvS0eOJCaDupYXz5SjrnZvACbg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 14 Nov 2019 23:38:20 +0100
Message-ID: <CALbNGRR7UPfkK1mO-Pz1W=bX0b0Bqs+XAb1f0hDwizE9MM1dDw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 04/16] evolution-data-server: upgrade 3.26.6 -> 3.34.1 and rework
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
X-List-Received-Date: Thu, 14 Nov 2019 22:38:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 11:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> this patch was needed for musl build, and it was marked not upstream
> worthy, so I wonder
> if we drop it then will it fail musl build.
Thanks for review

Honestly: I don't remember exactly -  base of this patch was May this year...

But I think musl-patch did not apply any more and at that time I was a
good boy and tested musl (and in case I am still :)...

Whatever - could you give autobuilder a try because the story is
simple: A 'it works for me' is not enough. In case of fallout: I'll
take care - remember gnome related dances we had recently...

Andreas

