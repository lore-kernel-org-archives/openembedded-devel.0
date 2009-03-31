Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Lof2r-0008Bj-KX
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 16:34:30 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1695652yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=6Ih28KVQ0w8UyUOQ0nbAYwUFUEtVKMlX+p8qcvi8CxA=;
	b=pjtekjO3FkO/oTE//+65dVaL7GGgpLBg0ZBunr1jgPASt37ujDN21ySfJwT/JDaC1r
	7TtRw5yPnZrru9d2G/XW+lBRafWzJ/cxNX/Ro4U/gyT2ZpJat3sGBPiveRrNpbX0Hcri
	hfamKNuneUDsqVCiRWSChWHE7jDb30iAdIPQ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Av2Bdb1JEdQlGe6fvpEDPyeSXznhmQRsDZMOReDA1NBDEbUugz7vNfb3S/sgbLUfHQ
	ZLBumbdyAoYSGjOJXbxIj13j1cZPY39EuZuRUZwPsMen5TZCMZCxdmJOyNpOTfTkrGy7
	Io1yyPuEDIDSwj7A12vOa6Zfsjf4hTKQf3Frg=
MIME-Version: 1.0
Received: by 10.90.80.13 with SMTP id d13mr2504071agb.120.1238509936673; Tue, 
	31 Mar 2009 07:32:16 -0700 (PDT)
In-Reply-To: <gqsqh4$iur$1@ger.gmane.org>
References: <20090331090529.GA10532@rhein.zuhause.netz>
	<gqsqh4$iur$1@ger.gmane.org>
Date: Tue, 31 Mar 2009 16:32:16 +0200
Message-ID: <c384c5ea0903310732n21a9e349lf250fb15887bba50@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: update for liboil
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
X-List-Received-Date: Tue, 31 Mar 2009 14:34:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Tue, Mar 31, 2009 at 12:16 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 31-03-09 11:05, Henning Heinold wrote:

>> sorry for the to early checkin of liboil update.
>>
>> Attached is the patch for review, because its delete the older versions
>
> Are the older versions causing any harm?
>
And, are you sure the new version does not introduce regressions?

I think we should always keep a few versions around, so that there is
a "sliding time window" over a few releases to pick from.
(This might be a proposal for the recipe checklist).

There might always be other valid reasons around to keep old, but
stable packages releases, for example:

- a busybox that just works.
- older util-linux that has nfs support versus newer ones that have not, etc.

Regards,
-- 
Leon


