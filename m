Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qozml-0004c4-TY
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 17:24:36 +0200
Received: by gwb11 with SMTP id 11so58111gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 08:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=6Gkp50ua1ZZmhBT2TbP04n3c6ic0jgDPnMyVnEdD2fk=;
	b=EK2NFETSQNmUBZTZjae94jbsp/WOVxhQrshNtoj72Ia25iz/bJBgwdxBlaw+ccICOA
	17WSjfUcGUwjNdP04DmggONTHKvJ3TD5nbtpxA4Us2d4wewEBLi3sEa4QqWAF6O620Pj
	ZPno7ED0H0J8yWftyBBSCJUpZKmLX1CQpMM/M=
Received: by 10.142.44.7 with SMTP id r7mr939710wfr.122.1312471211372;
	Thu, 04 Aug 2011 08:20:11 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o6sm2328520pbj.18.2011.08.04.08.20.09
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 08:20:09 -0700 (PDT)
Message-ID: <4E3AB8A7.7050303@gmail.com>
Date: Thu, 04 Aug 2011 08:20:07 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312440823-27671-1-git-send-email-raj.khem@gmail.com>
	<j1din4$v7t$1@dough.gmane.org>
In-Reply-To: <j1din4$v7t$1@dough.gmane.org>
Subject: Re: [meta-oe][PATCH] systemd: Link with librt explicitly on uclibc
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
X-List-Received-Date: Thu, 04 Aug 2011 15:24:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 12:45 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 04-08-11 08:53, Khem Raj schreef:
>> Latest systemd has started to use mq_* functions which are found on librt in uclibc.
>
> I'm testing v33 + buildfix (http://cgit.freedesktop.org/systemd/commit/?id=612e58b45b84eda7e1f2a82fdfc006f1ae421cb5) right now, can you resubmit after that went in?
>

ok. I will rebase and resend

>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>  --- meta-oe/recipes-core/systemd/systemd_git.bb |    2 ++ 1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb index af4a9ae..fd9bfbd 100644 --- a/meta-oe/recipes-core/systemd/systemd_git.bb +++ b/meta-oe/recipes-core/systemd/systemd_git.bb @@ -29,6 +29,8 @@ UCLIBCPATCHES_libc-uclibc =
>> "file://paper-over-mkostemp.patch \ file://format-replace-m-uclibc.patch \"
>>
>> +LDFLAGS_libc-uclibc_append = " -lrt" + S = "${WORKDIR}/git"
>>
>> SYSTEMDDISTRO ?= "debian"
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOOk4jMkyGM64RGpERAvTWAJ9nKbzS/bkAoUfbu+jzHSZQ7lCAZgCfR3rY
> Knrm/e7PSQQZoTdXqKXJBQk=
> =dJ5W
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



