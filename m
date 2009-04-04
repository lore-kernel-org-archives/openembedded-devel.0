Received: from [74.125.78.147] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lq7v2-0006DU-GI
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 17:36:30 +0200
Received: by ey-out-1920.google.com with SMTP id 4so354292eyg.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2009 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lqM8K8lMfWT/dhntv9hdVmp+VD3KOZNnChr5Gt5xI78=;
	b=P0iOIWNb7BygzDEXOnE7UAvGfB45rnk8BYUQ14oujXcNWokii8sCmudbQB/zT59cog
	c06u3JsdDJ7xAk/sgM8RHO4iQgmbbi+c/iH0ENgux41AZCDs2gNFA/dcT9DuxzG1nncj
	Iz40D9/dnYxQyiRPVdEx+moApcVxnjWWibCBU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cDzSeMoraPht/+V54TKXyZ9NuXgVpj/1xXGqypx6Pfb49URmPKcGi7muXwsSfSMMHO
	0BK/NhKU8PQgVxfF+9X1fBYQSEwtECR/CBxKKV1gQKXsIUnIjhsHxQJKq7TK9jVmzmu7
	GXZSpN1DmmTbTfUyXHnOnykkJrFuWzQwbFLzQ=
MIME-Version: 1.0
Received: by 10.210.34.5 with SMTP id h5mr1431027ebh.38.1238859230170; Sat, 04 
	Apr 2009 08:33:50 -0700 (PDT)
In-Reply-To: <gr7j3f$oh2$1@ger.gmane.org>
References: <gr794f$si$3@ger.gmane.org>
	<ac9c93b10904040501h74232b6ei82628e3ec167b6ba@mail.gmail.com>
	<gr7j3f$oh2$1@ger.gmane.org>
Date: Sat, 4 Apr 2009 17:33:50 +0200
Message-ID: <ac9c93b10904040833r5962a2c2h9c6570df5adc68d1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork now has an 'applied' flag
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
X-List-Received-Date: Sat, 04 Apr 2009 15:36:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ah ok.

Is my understanding proper that if it is a small patch or if I add a
package, I can just commit, and if it affects kernel or build tools
or so that I post (unless probalby when it is trivial like adding a
kernel module)

FM

2009/4/4 Koen Kooi <k.kooi@student.utwente.nl>:
> On 04-04-09 14:01, Frans Meulenbroeks wrote:
>>
>> Probably a stupid question, but is there some info on what patchwork
>> is and how to use it?
>
> The OE patchwork is located at http://patchwork.openembedded.org/ and
> collects all patches and follow-up comments to them posted to this
> mailinglist.
>
> The really neat thing is the 'mbox' option, which scans the replies to the
> patch for signed-off-by and acked-by lines and puts those in the patch.
>
> What I do nowadays:
>
> wget http://patchwork.openembedded.org/patch/$1/mbox/ -O pw-am-$1.patch
> git am < pw-am-$1.patch
> rm pw-am-$1.patch
>
> Now, if only git-send-email wouldn't strip the commit message...
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


