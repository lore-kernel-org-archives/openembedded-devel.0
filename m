Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OFMdk-0004Gn-19
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 09:27:28 +0200
Received: by iwn2 with SMTP id 2so788304iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 00:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HjojESnFnY2FMOgyPDFhKqF+F/9qV5rvqbsL7wWR5Dw=;
	b=SEqXi/l5plLG7xUkVc6MPgbYq55m2Vn+zEBOgOrhhR4KR9gTmBDjbuaeqxUD8mQkWs
	YVFQsJQi+0B3kEHv71GL7SAk9RLApqOjAlVgaOwIn8LvQv3N1XP45ZDASfPNjGXkSHZw
	u228vANxjX/jsL54GhilGL7afNha8egs3oXEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aYhPX88m2UtnJNqIN99CWxQfSvgfDm5OOOPhO8dTUU1U7eevsMvdz8MLTYmomJ/Q66
	lG1Jd2QYA5XHZiL8Fmlu+/5PdvHRraNcFGI8d7nJU5IKeLd5pBand2T2TlqA3urLi5WL
	lOtEnKmSZy+3URT5mFxfUnP8sqN843tFXTL54=
MIME-Version: 1.0
Received: by 10.231.150.16 with SMTP id w16mr1258456ibv.42.1274426606403; Fri, 
	21 May 2010 00:23:26 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Fri, 21 May 2010 00:23:26 -0700 (PDT)
In-Reply-To: <20100521002516.GC29183@gmail.com>
References: <20100521002808.946c76aa.ospite@studenti.unina.it>
	<20100521002516.GC29183@gmail.com>
Date: Fri, 21 May 2010 00:23:26 -0700
Message-ID: <AANLkTimU5JQEFE8fUjjcUyNNONU3LbODV4YI6CH-1UKd@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils-cross-sdk_cvs.bb fails in do_install
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
X-List-Received-Date: Fri, 21 May 2010 07:27:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 20, 2010 at 5:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (21/05/10 00:28), Antonio Ospite wrote:
>> Hi,
>>
>> as per subject binutils-cross-sdk_cvs.bb fails to build for
>> DISTRO=minimal this prevents meta-toolchain to be build from scratch as
>> well.
>>
>> http://tinderbox.openembedded.org/builds/71564/
>>
>> Any hints?
>
> Does it happen with 2.20 as well ?
>

To answer myself. It does not fail with 2.20. It should be fixed now
with commit id 9bd07cffd22f65cb9b7b6f3d0c59939de5da8fb3 please retry.


Thx
-Khem


