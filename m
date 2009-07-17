Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MRiys-0005KE-R6
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 10:39:51 +0200
Received: by rv-out-0708.google.com with SMTP id l33so154189rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2009 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=JB86/Lk6lA0trnp2GuClZ4UxuQFSKmsQZK3cCBgqtlg=;
	b=AUDrLU/dwEOLd4q8QzNHbyIsMPL2mTmP4zM8OiVK9w3YeSSrO1VV4Ed/kSfSAnITNl
	pvcIWPultvgHpy4ps8Esvbed7xq0RpUS5X9B5CmOMHi1MT+jzsiSnBb2p9Ee7KiulOQJ
	lamNga1WTb8lRSdT7HIhD7NEzB7h+rC3b1CKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Z4zbHwS//Y1S7KESQwF3HI/IljbApmJydgVKvS/FZQuqs+d09U1GpU27eiDOROqlDJ
	k+oEPtEQAcgkMhvGOn9/rOh3H+8MPi8y0XsensLSAOUJRGMFbnhFj7WVoXYEETdLXVAD
	W/8Hbi6JzaDEtj/omXHg1Z10eoBXKwyR/9aYk=
Received: by 10.140.173.10 with SMTP id v10mr538824rve.35.1247819174916;
	Fri, 17 Jul 2009 01:26:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id g14sm4816458rvb.44.2009.07.17.01.26.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 17 Jul 2009 01:26:13 -0700 (PDT)
Date: Fri, 17 Jul 2009 01:26:10 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090717082610.GC24991@gmail.com>
References: <1247779880-31274-1-git-send-email-raj.khem@gmail.com>
	<h3p932$3g5$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h3p932$3g5$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] util-linux-ng: Do not provide libblkid.
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
X-List-Received-Date: Fri, 17 Jul 2009 08:39:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/07/09 09:26), Koen Kooi wrote:
> On 16-07-09 23:31, Khem Raj wrote:
>> 	Currently we let utils-linux-ng provide
>> 	libblkid package which then ends up being
>> 	provided twice once from e2fsprogs-libs and
>> 	once from util-linux-ng. Future versions might
>> 	move libblkid and libuuid to utils-linux-ng
>> 	till then we will use e2fsprogs-libs provided one
>> 	on the system
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>
> NAK!!!! We need the new blkid for udev and friends, so you'll break  
> angstrom with this changes. The right way is to kill the e2fsprogs one.
>

I thought of doing this switch once util-linux-ng 2.16 is released(15th july it was) then
this library would come from util-linux-ng for older ones let it 
come from e2fsprogs-libs. It seems udev angstrom is using is quite latest. Anyway current
util-linux-ng recipes are broken too because they ask for this
library to be provided for all versions but it only appeared in
2.15 for first time.

so I think we wont be able to use any combination of util-linux-ng
and e2fsprogs-libs.

if a distro is using util-linux-ng older than 2.15 (nothing found in conf/ ) then it has to
get this library from e2fsprogs-libs. It there a way to say that in recipes or bitbake magic ?

If this looks viable that all distros use latest util-linux-ng 
then we can stop providing it from e2fsprogs-libs,
if someone wanted to use utils-linux-ng < 2.15 then he gets no libblkid

opinions ?

Thx

-Khem


