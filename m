Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SAcAP-0001z3-Dr
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 08:10:37 +0100
Received: by bkcjg15 with SMTP id jg15so1636351bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 00:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=I1Tz/wg+JzvgFT0HweY0/Z0FjDgYw1MNKEfagfEGYE0=;
	b=ZFU8PTcvMqtE3xgwZ625t0kaz06aKCpM5RdtrxXfiSKvz9TVMo0DPmh20GnyDHZcKg
	CVsgP/kN1Z0bcPwMyUcrJf2xFRaPtw+FhFVpk/Qxm+I+cfNoaK7RBiRSaSRPoOx5/l36
	ES2TOWTy01P0v3smCIBhwT/VEC9cGX6rxNFBm3yPtyvVZK5W1YllxWHz8DZEDmF9gMwG
	I/+7tiV4UD7wHPtj0KyxJ9xy6FKClOcwiZ3CllQoLld/utV21NNpbWFdcSqOe2JJG85u
	Qees/+jI6N7SGahAy4lBVVNGcWWSFm+fcdCKASasEhrLX6MCA5isBlUY9eM/6x/keHgP
	hjbw==
Received: by 10.204.154.201 with SMTP id p9mr2555818bkw.125.1332399702705;
	Thu, 22 Mar 2012 00:01:42 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id jr13sm7756989bkb.14.2012.03.22.00.01.41
	(version=SSLv3 cipher=OTHER); Thu, 22 Mar 2012 00:01:42 -0700 (PDT)
Message-ID: <4F6ACE55.2070002@dresearch-fe.de>
Date: Thu, 22 Mar 2012 08:01:41 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <4F69AF4A.8050809@dresearch-fe.de>
	<1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
	<CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
	<CA+M6bXmJ9YWR74eEWj-0pNYVziCNb+8Ac-DKPNG1inPaELKAiA@mail.gmail.com>
In-Reply-To: <CA+M6bXmJ9YWR74eEWj-0pNYVziCNb+8Ac-DKPNG1inPaELKAiA@mail.gmail.com>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQmU8u52cg2byDA9eKeBcRcGumaItADL0of+CJJvIGb5O0qq5ZJStboEXZTz0Eh3bAfjkM8o
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Thu, 22 Mar 2012 07:10:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2012 15:46, Tom Rini wrote:
> On Wed, Mar 21, 2012 at 7:44 AM, Tom Rini <tom.rini@gmail.com> wrote:
>> On Wed, Mar 21, 2012 at 3:37 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>> libmatthew-java-0.7.1.tar.gz is no longer available at the original
>>> location.
>>>
>>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>>
>> NAK, please switch it to the snapshot.debian.org URL I provided so we
>> don't have to change this recipe at some point in the future again.
> 
> On third thought, lemme think about this.  I don't like pointing
> somewhere that might remove it, again, but I also don't like changing
> checksums for folks that already have it down.  So, unless someone
> else disagrees, we'll favor same checksums over retention and if
> fedoraproject removes it, we'll just point at the copy on the OE
> server.

So finally that's an ACK for my patch?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


