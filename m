Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1M3heB-0002xD-CY
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 04:23:11 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1950428ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 19:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1XScPo6WoMzQ7Mh1vb+/r5lxJWJLXfqvCN0uaHL+quQ=;
	b=u5eapIKv+J2NDh7+TYbM1JYGqPcyEpQ192LHlN7Kt9D95R0mEPsTyPWxCMkyWOlOcO
	WXXIoW4zdblKd3kCr+lofEMOawtwch2Weu4aAItbu2JQmJ14VdfGA1w9YhABVuPAH7mv
	kxKXIQS9nTOfk2WonmWB/oDCqXjlKOB7rO7+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Xv3j5iA5X2nCyfw6/lJEEvb8yuV41nt0zpC3FrCKWN9JpRJs5yDJD4LRbK7r9miV4I
	OKZ7b/Wf8n/sf0IaItv708Nj4/Ez3u34Wp3JWXuPljxfniUvaujjFfVKKRLJruetiIoQ
	jLf/g88lmedDYLVbKk95LrlLHEcNXhUPnXakU=
MIME-Version: 1.0
Received: by 10.100.128.18 with SMTP id a18mr16194564and.12.1242094596424; 
	Mon, 11 May 2009 19:16:36 -0700 (PDT)
In-Reply-To: <20090510181751.GY7973@smtp.west.cox.net>
References: <1241977541-6297-1-git-send-email-raj.khem@gmail.com>
	<20090510181751.GY7973@smtp.west.cox.net>
Date: Mon, 11 May 2009 19:16:36 -0700
Message-ID: <19c1b8a90905111916ke091869q93756283d7c6347a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python-native_2.6.1.bb: Configure with --with-zlib
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
X-List-Received-Date: Tue, 12 May 2009 02:23:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, May 10, 2009 at 11:17 AM, Tom Rini <trini@embeddedalley.com> wrote:
> On Sun, May 10, 2009 at 10:45:41AM -0700, Khem Raj wrote:
> [snip]
>> I built python native with --with-zlib option and it worked fine.
>>
>> Is the below patch ok ?
>
> IMHO, you need to add zlib-native to the deps (if it it's not already
> there).

indeed I will try it out.

>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


