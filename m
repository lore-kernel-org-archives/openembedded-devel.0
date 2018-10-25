Return-Path: <krussell7711@gmail.com>
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
	[209.85.222.43])
	by mail.openembedded.org (Postfix) with ESMTP id 59048745D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 13:47:01 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id g10so2424524uak.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2018 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZutHF793MqsnOCxmercORJdALqu5p+CLakphcZbbRfA=;
	b=qHyCTQhAivC/ioFCEHBUlKMxLav1zLN2R+WipzPcE4le5rLAQVWAj0xnrTXqMmx7H3
	jUe9YqiykpnfV40QPnDO1/2dhdCrMKWE6lRMpMBHRQMYUD52pbIovzfwUGiIYVIbwE1N
	SLff64xSGUqJxM0EB0p1dn9iv8m5nTQ7TOpkX8l+4PrB+W4vlNdhDKjmvc3Ql0OKnqJJ
	KW0kYIwFRfsk8De7iB6QqGrgFOdnzPWmfUIXWwyjQJ62tUKVDgMROYk0Ml3blKRMk03W
	lW1nmwhg7RQdCiWaIAFOvINu8TuGPB/9gG83HCpcS/Pm/9Zop6tPVYs5o0Dq24u6HVFJ
	FM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZutHF793MqsnOCxmercORJdALqu5p+CLakphcZbbRfA=;
	b=c5tzXUxfwSqnUAg/7wevBHuc0NEmttSB7U2JWBtxKuel/bmUiy5KIIigU/J3b+17Md
	re5iGqdaxh1q9mydHI0Edb4rmgqJwfWMyFo5IbN0nSqIIc1E8FO3gyCS0WqDwwF0pdVe
	Faqd/bk8YWbvYIwv1C71cirXD6ZMbSJJAtShG120zppN/1ENCwTb0LMuDbdLqKmkFWXn
	Rw/NXtNpzvgYYZ1VRXFWTt6akkaKdAbKk1ve6ds5+jR6xxu7KwqEEssW9lOO+VFJ1NiZ
	3luILZK0rYwuon/8FbUfrisvdWHHuO5SYBkbSk6f0Q2moZlcht7ombX53nGbFDXhjfO6
	NWEw==
X-Gm-Message-State: AGRZ1gIMHusUXWw3OjzWlm/5B08TFtHvjF6VzZoMB4wKnNs3Qe4nzRqr
	u58bsUHnHWSbjW1HYcKzOvcstOPLiI3nChheea2O2BBY
X-Google-Smtp-Source: AJdET5eMmSh4ZBGG0B8cJQuuepadKj1F12Dxh2FTWwAC56UEg7ryobMNraUH7YEjt2x8U4DDm5OhYZhuvRQ9qZCdtzU=
X-Received: by 2002:ab0:15c5:: with SMTP id j5mr670733uae.50.1540475221722;
	Thu, 25 Oct 2018 06:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFrQVPNLu4KJWK3hLWVC7yjq7aLmb9a1c066hTC5BHj_=qdZZg@mail.gmail.com>
	<ba624040-6e9d-3fc2-d239-9eea5e15273e@skidata.com>
In-Reply-To: <ba624040-6e9d-3fc2-d239-9eea5e15273e@skidata.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Thu, 25 Oct 2018 09:46:50 -0400
Message-ID: <CAFrQVPOGaOJO7rBHeeFgQ_yz2TgbqxM_vcwMiSN3v3NF4fJOag@mail.gmail.com>
To: richard.leitner@skidata.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-java configuration
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
X-List-Received-Date: Thu, 25 Oct 2018 13:47:01 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for your reply.

On Thu, Oct 25, 2018 at 9:09 AM Richard Leitner <richard.leitner@skidata.com>
wrote:

> > A few years ago, it looked like
> > there was an attempt to allow openjdk-8-native to provide
> > virtual/javac-native, but it has since been reverted.
>
> As I'm not into the meta-java stuff that long I do not know anything
> about it... Do you have any pointers to ML discussions?
>

Yes, I was specifically referring to
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=dfb21b449dd652b99bc4725796d143e8c9779cd6
.


> Yeah, ecj is needed for bootstrapping the jdk. For more details please
> take a look at docs/bootstrap-flow.txt.


Thanks!  I actually had missed that doc and was just looking at the README.


> AFAIK currently using openjdk-8-native seems like the only solution.
>
Nonetheless I'm open for any patches to enhance this behaviour ;-)
>

Ok, I will try to keep my eyes open for possibilities.  I didn't see any
documentation that described how to compile java code from other layers
using recent JDKs provided by meta-java, so I was looking for validation
that I was on the right track. :)  If I come up something I think would be
an enhancement, I'll send out a proposal.

Thanks again!
Kyle

