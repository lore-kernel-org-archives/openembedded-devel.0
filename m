Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0Jiu-00084z-82
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 22:27:40 +0100
Received: by bkwq11 with SMTP id q11so568473bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 13:19:19 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.8.129 as permitted sender) client-ip=10.112.8.129; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.8.129 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.8.129])
	by 10.112.8.129 with SMTP id r1mr12095099lba.38.1329945559863 (num_hops
	= 1); Wed, 22 Feb 2012 13:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=UTYDCONT3RYUW0rV6Oot9ita44HZvHG46q5eWg5ATH8=;
	b=ijeE++j7AygfFsoArgSlKIi7ks7HLEyltXQ2/yilWKFrixG4toTTgBnebvPeyRtYU+
	S3vsb+UEi7jjEmgP2+aFiuEBWAKVor7+YX6D0pEWUjlhzER6VXyDkvpYtAk8godl4QsY
	M6MXyCtIY9cF6FVPq2DtClF/Ywj5DFNkrP8Og=
Received: by 10.112.8.129 with SMTP id r1mr10174072lba.38.1329945559650; Wed,
	22 Feb 2012 13:19:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Wed, 22 Feb 2012 13:18:43 -0800 (PST)
In-Reply-To: <CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2012 13:18:43 -0800
Message-ID: <CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc-cross-initial patching fails
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
X-List-Received-Date: Wed, 22 Feb 2012 21:27:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 12:15 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>> Applying patch gcc45-no-add-needed.patch
>> patching file gcc/config/alpha/elf.h
>> patching file gcc/config/ia64/linux.h
>> patching file gcc/config/linux.h
>> Hunk #1 succeeded at 89 (offset -12 lines).
>> patching file gcc/config/rs6000/sysv4.h
>> Hunk #1 FAILED at 908.
>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
>> ERROR: Function failed: patch_do_patch
>> ERROR: Logfile of failure stored in:
>> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/te=
mp/log.do_patch.5367
>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Faile=
d
>> ERROR: Task 2829
>> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-=
devtools/gcc/gcc-cross-initial_4.5.bb,
>> do_patch) failed with exit code '1'
>>
>> git log does not help me much - =C2=A0what goes wrong?
>
> Which actual patch is it failing on? Is there a conflict between
> oe-core and meta-oe patch set against gcc?

gcc45-no-add-needed.patch is the patch in question. I dont see
anything wrong with it.
Can you do bitbake -ccleanall gcc-cross-initial and redo bitbake
gcc-cross-initial -cpatch ?


