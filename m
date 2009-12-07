Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHfYg-0005Ca-SJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 16:31:34 +0100
Received: by fxm8 with SMTP id 8so3518373fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=l7otsCxQ12s6wW/rqxsmR7odIVwSeliCVzHmzpFU7+E=;
	b=toxMakj3ftDE8swCDUu+5Gx+U2majXPwxLZ1VuwQbGO156NaVFnEx2guM2oRGrEYAO
	4CkNi3RdB7oJUolXpjEN1QPpBjoyTdg+ClGbhjLpYuxYWulNEHnRIKeY1hEpEYaSEbrH
	X5FmbzV3dh+feb5cJgEA7mkmXUNT52J/VGkwo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Zi6R9EJPQ0nX7Eq9MMa0n26PxW+RjXM1ten54bHPtm69AVW7AAo3/ZL8Vzw5G3z3H/
	8vrSHm4Jlai5kU68Frdj9ftN3DLZVsAJg8XKop9a0gbASCrsSopY6JgSUVyNHW+FlFDE
	IDXe2HOX/G5KJcsrw0S7cuJcLuwNSqO482WBc=
MIME-Version: 1.0
Received: by 10.239.168.144 with SMTP id k16mr725126hbe.103.1260199790956; 
	Mon, 07 Dec 2009 07:29:50 -0800 (PST)
In-Reply-To: <hfim16$osr$4@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<hfim16$osr$4@ger.gmane.org>
Date: Mon, 7 Dec 2009 16:29:50 +0100
Message-ID: <c384c5ea0912070729t757d99ccu255061064443ce2f@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] uclibc{, -cross}{, -initial}_nios2-0.9.2{7, 9}.bb: 	nios2 fork.
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
X-List-Received-Date: Mon, 07 Dec 2009 15:31:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Koen,

On Mon, Dec 7, 2009 at 11:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 06-12-09 23:44, Leon Woestenberg wrote:
>>
>> uclibc with nios2 support from a community maintained fork in GIT.
>>
>> This fork might actually be pushed back upstream by this community
>> (TODO: check this and switch to upstream uclibc if so).
>>
>> Tested-by: Walter Goossens<walter.goossens@axon.tv>
>> Tested-by: Leon Woestenberg<leon@sidebranch.com>
>> Signed-off-by: Leon Woestenberg<leon@sidebranch.com>
>> ---
>> =A0recipes/uclibc/uclibc-initial_nios2-0.9.27.bb =A0 =A0 =A0| =A0 32 +++=
+
>
> That's bogus. Change that to 0.9.27-nios2 or put nios2 in PR, but don't
> screw up uclibc versioning.
>

Argh. That's how I started!

Then I consulted the TSC^W IRC channel and "nios2-<version>" was
suggested instead.


Regards,
--=20
Leon


