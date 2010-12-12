Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PRvJO-0001t7-ND
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 00:26:39 +0100
Received: by wyb40 with SMTP id 40so5523344wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 15:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DyLc53iHjiVHOWDz1fSHsDf1b/zo4/vXHAWGPqS5QLY=;
	b=RhBzYQULydydldNYnB7qcmD27INFezQlKCAFYny+AZkY8FXt+zWqgJW2kua4Yva9uS
	9S/5SSBM6kp31k0x7w2q7oewKLRrX6GwHRgLskLZEyYPb3Yxq4TJQ9JfIJeHWlkQsWOx
	FCMsIWzi5Nj3PBqZ1JOpSV/9GRdq7jVJUDGdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XgH0YJ25VOTNATaAi8NBQvA84aXYpLJe0EPg9Sl2p7K9UTaLqYWeZ7vPDMiU9jQokS
	R+LgyQo4CmwHeB5ARz0uaqAdzIANrhg7mQmmxjPrZk4MByt+PdD2jvPSohtZQyZrH+6k
	7jPaF/QvdZ5cBSa5U133F08awWc94cdcL/Kv4=
MIME-Version: 1.0
Received: by 10.227.196.78 with SMTP id ef14mr1236648wbb.165.1292196302809;
	Sun, 12 Dec 2010 15:25:02 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Sun, 12 Dec 2010 15:25:02 -0800 (PST)
In-Reply-To: <AANLkTi=LseZRJ6e2907nGsPeLz=H8ZfDpmWjaPqM=0FK@mail.gmail.com>
References: <AANLkTi=20woN1TEygXwHwgoOm3_OPp+GLU6JMNpAq3eV@mail.gmail.com>
	<AANLkTi=LseZRJ6e2907nGsPeLz=H8ZfDpmWjaPqM=0FK@mail.gmail.com>
Date: Mon, 13 Dec 2010 09:55:02 +1030
Message-ID: <AANLkTi=UT-4d=NqVwEgWfh39Ygjp4=xH-vSyTuCA5xXR@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: js compilation oddity
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
X-List-Received-Date: Sun, 12 Dec 2010 23:26:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 December 2010 09:07, Graham Gower <graham.gower@gmail.com> wrote:
> On 12 December 2010 22:36, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> When compiling js (for beagleboard/minimal) I got this:
>>
>> | k_cos.c: In function =EF=BF=BD=EF=BF=BD=EF=BF=BD__kernel_cos=EF=BF=BD=
=EF=BF=BD=EF=BF=BD:
>> | k_cos.c:125:21: warning: =EF=BF=BD=EF=BF=BD=EF=BF=BDqx=EF=BF=BD=EF=BF=
=BD=EF=BF=BD may be used uninitialized in this function
>> | Assembler messages:
>> | Fatal error: can't create Linux_All_DBG.OBJ/k_cos.o: No such file or d=
irectory
>> | make[1]: *** [Linux_All_DBG.OBJ/k_cos.o] Error 1
>>
>> Full log at:
>> http://tinderbox.openembedded.net/public/logs/task/13169490.txt
>>
>> bitbake -cclean js; bitbake js
>> resulted in a proper build; so apparently this is not reproducible.
>>
>> Anyone an idea ?
>>
>> Frans
>
> Unicode function names? Would that alter compilation depending on the
> locale of the build system?

Well I checked the c99 draft and indeed universal characters are
allowed (section 6.4.3).

But I looked at k_cos.c and these characters are not there. I assume
you have local modifications. What happens when you remove them?

-Graham


