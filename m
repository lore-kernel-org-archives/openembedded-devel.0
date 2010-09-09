Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OthkY-0005rp-Gc
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:05:15 +0200
Received: by wye20 with SMTP id 20so1487103wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=sOmZGEvgrFgETw4eKyAXcSME7bZAzo4oGgNVaJHclT0=;
	b=WWKdliRHU7wiKgjmEpUbncU4VE3psF59gg76sQ9Y9jZFI5plcE/oH7hK09O/FIaQq9
	MqmB/lLWeLJDXPbSbx3CX/bgAcmPoDASRhRz/6u+05hU3JOteYdDv+8zRUkv2+/7Vrb+
	ObEU/X0ujTQQln22y79mB1SSAFhTD/2+5cNzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=DO08+dK6IAhGO5LKcq45lmQE6kq3gds04aOxO/CXnBgL4mFQrt0Wb6JoqZoroidAsI
	aNAZkDHUrFNrkwFyitnIxY0edamqGp1JEXPBt8BfLUhewyytXQi1zl6dcWBo/gzroCgj
	RLcAvgXpHowNu/ivXmz91Hso0C+sP7feHc970=
Received: by 10.227.145.69 with SMTP id c5mr195051wbv.168.1284041071995; Thu,
	09 Sep 2010 07:04:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Thu, 9 Sep 2010 07:04:11 -0700 (PDT)
In-Reply-To: <AANLkTi=GypXSJV_8VDUQ9dO5oYKSJPtAzUOhvGAquLyd@mail.gmail.com>
References: <AANLkTi=GypXSJV_8VDUQ9dO5oYKSJPtAzUOhvGAquLyd@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 9 Sep 2010 07:04:11 -0700
X-Google-Sender-Auth: _vDUO2VXPzKP05hd6uf1zALamsQ
Message-ID: <AANLkTiktxuLopxPbjsfMZHsGVW2LmXRgAaTC2Ta=_Qz4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: double _'s in names
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
X-List-Received-Date: Thu, 09 Sep 2010 14:05:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 9, 2010 at 1:25 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> I noticed that we have some recipes with double underscores in the name.
> Not sure how that will parse wrt PN_PV.bb
>

It'll parse the third component as the PR, which would then likely be
overridden by an explicit PR set in the recipe.  See the default definitions
of PN, PV, and PR in bitbake.conf (~line 178).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

