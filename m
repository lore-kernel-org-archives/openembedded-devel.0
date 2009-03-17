Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ljckr-0005Xq-TW
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 18:07:54 +0100
Received: by wf-out-1314.google.com with SMTP id 25so84487wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NcCWfwDU8Ora2sfgkkpDQ+JanXwCFNOddwBbif+peRo=;
	b=m95upVG3PuQjVMHybn5mMfYMALNnga5g3BwNGNwzfN5gpNqAn8qPKZdEUPhlv/YbID
	pcQyBsnlPqJTwyYkPG44zGc3aeopqWrjMuTefJul6M+tLVHFiFCy/VJPMk/MHboTCNFe
	OW2Foo7XZi2o6FeYrPwzzOEuQeOGNp3Lr31qM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BiYijqKMBj2Z6uDjJ3i6limDOOGVp8J7WgzwXmb77wXa6sbPcZjcq9VWQnS37PYHXl
	9X+cOLNlqy3EG+w3gS8CHEgD1cnY1qPtFHOg34nzK92mGpdxMVmFbiXJBzmao23a48ee
	L6qMr+e/frJD9qTJvJt8e32vM0hckpA6ukZGQ=
MIME-Version: 1.0
Received: by 10.142.13.14 with SMTP id 14mr88092wfm.153.1237309580137; Tue, 17 
	Mar 2009 10:06:20 -0700 (PDT)
In-Reply-To: <200903171407.38051.marcin@juszkiewicz.com.pl>
References: <1237294358.6587.68.camel@northpole>
	<200903171407.38051.marcin@juszkiewicz.com.pl>
Date: Tue, 17 Mar 2009 10:06:20 -0700
Message-ID: <19c1b8a90903171006p66eae72bga1d83d9e2c949f20@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.200.170
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TARGET_ARCH should be a weak assignment no x86.conf
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
X-List-Received-Date: Tue, 17 Mar 2009 17:08:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2009 at 6:07 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Dnia wtorek, 17 marca 2009 o 13:52:38 Jader H. Silva napisa=C5=82(a):
>> In conf/machine/x86.conf TARGET_ARCH is assigned as i486:
>
>> # i386 doesn't work with NTPL, see
>> http://ecos.sourceware.org/ml/libc-ports/2006-03/msg00030.html
>> TARGET_ARCH =3D "i486"
>
>> But according to url page text, it should be i486 or greater, and I
>> would like to compile my target for i586.
>
> Use "i586-generic" as MACHINE maybe? I think that we can consider
> renaming "x86" to "i486-generic" to clarify.

good point.

Thx

-Khem


