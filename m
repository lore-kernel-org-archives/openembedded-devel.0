Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Orncn-0001MS-Fu
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 09:57:23 +0200
Received: by qyk4 with SMTP id 4so2894496qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=VRyIGInaGu2LiuUNRmhF5YLJ1GiuFEIeT5MOvDWtfHk=;
	b=gUPTjDMEzhjW54ol81GvpPA4ExisvL0HSejz8HW0dv0LCMuXKwizCNIY9Rv0iRamIa
	b6k6Ne6IczxbEXs4jxRFcdfYVTgPwcc8+xf4tdho/X7Cn4h9/kZLeWvXcieSt1cO9w9N
	rqm26la20O3ugzwiI5+lBGn7O+/axcOXn8ywg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eOMJrwqTGDEFZuKIfIoDqvsXw5VzvaAMFtZxyQXaq12RJGrYcWneqwlHJDAV/j6BSn
	XdaKJVltrILm8tM1KSx3fKtTPOR5UdMxpgASQKhzA2sIYjVCQpx8QN3qYfCHQRJuQSp2
	FbXe67pRE6SWOKNpZWPg4NLlGmAH22IjUYUSQ=
MIME-Version: 1.0
Received: by 10.229.52.26 with SMTP id f26mr1080135qcg.244.1283587002846; Sat,
	04 Sep 2010 00:56:42 -0700 (PDT)
Received: by 10.229.49.205 with HTTP; Sat, 4 Sep 2010 00:56:42 -0700 (PDT)
In-Reply-To: <AANLkTin9pQfGPRHfp5kro__vknb_Wn+Qb-Zh9Hfn-vSH@mail.gmail.com>
References: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
	<1283523286-30999-2-git-send-email-michael.lippautz@gmail.com>
	<AANLkTin9pQfGPRHfp5kro__vknb_Wn+Qb-Zh9Hfn-vSH@mail.gmail.com>
Date: Sat, 4 Sep 2010 09:56:42 +0200
Message-ID: <AANLkTimmcz6jgqVnQmA21OAdUPCu4TqeCPO20hVSd-BQ@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] x-load/igep0020.conf: Unbreak x-load for igep0020 machine.
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
X-List-Received-Date: Sat, 04 Sep 2010 07:57:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/3 Khem Raj <raj.khem@gmail.com>:
>
> looks ok but why is it needed to remove ldflags
>

LDFLAGS have been wrapped with -Wl,... arguments to allow passing into gcc.

Unfortunatelly ld fails when passing the flags to it. Can I access the raw flags
somehow. (ld can produce an link the x-load without LDFLAGS though).

Michael


