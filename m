Received: from [209.85.219.20] (helo=mail-ew0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LMkTR-0003mn-CS
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 15:42:33 +0100
Received: by ewy13 with SMTP id 13so36414ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2009 06:36:00 -0800 (PST)
Received: by 10.210.59.14 with SMTP id h14mr11248182eba.81.1231857360453;
	Tue, 13 Jan 2009 06:36:00 -0800 (PST)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id u14sm1132586gvf.26.2009.01.13.06.35.59
	(version=SSLv3 cipher=RC4-MD5); Tue, 13 Jan 2009 06:35:59 -0800 (PST)
Message-ID: <496CA6CE.4070607@xora.org.uk>
Date: Tue, 13 Jan 2009 14:35:58 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <496C9495.40003@gmx.net> <gki5if$jm$1@ger.gmane.org>
In-Reply-To: <gki5if$jm$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
Subject: Re: RFC: allow subdir for SRC_URI entries
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
X-List-Received-Date: Tue, 13 Jan 2009 14:42:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 13-01-09 14:18, Robert Schuster wrote:
>> Hi folks,
>> I desperately need this patch. ;)
>>
>> It allows one to specify ";subdir=<DIR>" in SRC_URI entries. Having the
>> effect that the respective file is either unpacked or copied into that
>> very directory which is treated as:
>>
>> ${WORKDIR}/<DIR>
>>
>> It is not really ${WORKDIR} but the cwd when do_unpack is run. In most
>> cases this is ${WORKDIR}. If it is something else the recipe writer will
>> have a reason for that.
>>
>> With this patch we can finally deal easily with tarbombs.
>
> I have another use case:
>
> Multiple git:// uris in SRC_URI.
>
> When building ffmpeg from git you need to checkout libswscale from git
> as well and move it in ${S}, which breaks since *every* git repo is
> put in WORKDIR/git
>
> While speaking about the git fetcher:
>
> foo_2.0+git.bb: git://foo/bar;branch=pm
> foo_2.1+git.bb: git://foo/bar;branch=master
>
> That will trigger a russian roulette which branch it's going to fetch
> or unpack, you can end up with 2.1+git trying to checkout the pm branch.
For this maybe we should make name= format used when we use
SRCREV_FORMAT more generic?

Graeme



