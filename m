Received: from [209.85.217.225] (helo=mail-gx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M7JG3-0007Oc-0Z
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 03:09:15 +0200
Received: by gxk25 with SMTP id 25so1107603gxk.12
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 18:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=hTEt7OtG7za0GocKH5QkOCphhwG4v9Br8AsypP6n2sM=;
	b=gwa/ZQ5c0SP9XygcMB2U5KDz6pbiLEDOqJ3BcA8EAfWY1Crl8TVPNyGfW3JnHNsQgi
	Uwm9Mn2FESX1rHjvFahKLMSylwEfRPZQdEoCJFY2ehieNkSHtnYq/6wTrr7e4m1rxUvt
	el2EqvjHyUE4az6K5GOb8VF2/MQMMzfEACFnA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ZmOtq681WoNQa/KuJu0y/G77HSLa5oob8u7oPhiM01kBuD/9I6g80G66132dvZbLm2
	EjtQW93Ohgl/+F3VIvVIqsAT1N87C8FNY1aHoMzSFkTGn5MHn3bgcYgWUUtfALRZ0Xea
	1r3Mxi6nAeEF/7mVODNGDQC3eT3xQpVuNfFs4=
MIME-Version: 1.0
Received: by 10.90.90.4 with SMTP id n4mr2618922agb.46.1242952839294; Thu, 21 
	May 2009 17:40:39 -0700 (PDT)
In-Reply-To: <4A15EED8.7040709@dls.net>
References: <c384c5ea0905211455i5ba72709jc0b985cf097e9e3f@mail.gmail.com>
	<4A15EED8.7040709@dls.net>
Date: Fri, 22 May 2009 02:40:39 +0200
Message-ID: <c384c5ea0905211740w5f3c46f5g6c96919f8774636@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: mwester@dls.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: madwifi: Aggressive revert of my aggresive fix :-)
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
X-List-Received-Date: Fri, 22 May 2009 01:09:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Mike,

On Fri, May 22, 2009 at 2:16 AM, Mike Westerhof (mwester)
<mwester@dls.net> wrote:
> Leon Woestenberg wrote:
>
> So, you want _me_ to revert _my_ fix (after it was broken by someone
> else), and then spend my time sorting through the maze of Makefile
>

Sorry, I meant to write "revert locally" in my request: "Please revert
 your commit _locally_ (i.e. unsetting LDFLAGS) and see which part of
madwifi needs LDFLAGS unset.", but never mind;

In my goal to make the recipe work again for other machines after the
GNU_HASH / LDFLAGS check (I tested powerpc and x86),  I thereby broke
it for the initial combo it was written for (slugos). I should have
tested that combo for sure.

Mea culpa and excuse me for breaking it for you.

I largely agree with your points, especially after your email explanation.

Regards,
-- 
Leon


