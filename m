Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 649B370149
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 18:28:10 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c189so9997704pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 11:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=9KenOizVoq+VDPFXPHwaTJBSdk4fpSlZi2Nj7g8MqeQ=;
	b=VRQKucd8XbHJoyQngne1t6nWSs/IWCNaRAypslwwvU7Lw4ioO7DopvU0io6scZMg+9
	OLlKNQBVe29he6rbr32wM3WsPwT0xKHznv4LyIFVdV7jFmOnKnVuwElFUD2v6NjmSPw7
	BmaunUGwjIPSh8hNbg3rPJPcwCmI9elxsNcoHzLqgDp+zl2d3Zty07sgGZJO7H42uYRP
	eedbW32ISotYyT+1P2MUqunL/379gjS77BMRQRbgZSdFr9nTsL/V7B37y/ei0OZdjhYt
	4ChRCUZSxpl85oKaBI3yzq4zZQQmrB9viyGN1pkDT8X8dmkr0X47OcqmgaLk9GFUDzk7
	FRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9KenOizVoq+VDPFXPHwaTJBSdk4fpSlZi2Nj7g8MqeQ=;
	b=K8sQAhQhl2dK4nIVMoP1ypEmOWbB3whfFpSh1xUhFZEVRx/FPal6UQJ5vo34hSv9up
	xqqoaOVxBXUIz+z07sVo9PFvc2aF9JSGBwoAAtHOi/GZHreBmd5Lh/Zo/+6y3E28gz30
	2qicnKZCd66/9XFGs6ogYE6g95akIXvOyfbpHTyfnqtncCP0ur29v72MSMhf49WYG81P
	WPengE9B6gN4uC1ge6BaWonIFhwc3NhRFBBYW0erYQY1AeNN57en4L03AMG1wEf7XVw0
	KcFse3F6w9mdmkK54veAdIwVZ8TaTDN9fm8Cj0ojkB/NETQRqdD6BKYrVhKSpd07wweq
	w20w==
X-Gm-Message-State: AOPr4FVBN6JiDzzbQwZ6pmrcyOPP6icNDIGr2BKFE48nlJ1yJafvuQy62GFOK/U8jm5urQ==
X-Received: by 10.98.73.142 with SMTP id r14mr5777127pfi.140.1461695290802;
	Tue, 26 Apr 2016 11:28:10 -0700 (PDT)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	v1sm148355pfv.92.2016.04.26.11.28.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 11:28:09 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1461600749-19432-1-git-send-email-akuster808@gmail.com>
	<20160426142643.GC2559@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <571FB333.8010203@gmail.com>
Date: Tue, 26 Apr 2016 11:28:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160426142643.GC2559@jama>
Subject: Re: [meta-networking][PATCH] samba: fix QA warnings.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2016 18:28:15 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 04/26/2016 07:26 AM, Martin Jansa wrote:
> On Mon, Apr 25, 2016 at 09:12:29AM -0700, Armin Kuster wrote:
>> WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on libaio, but it isn't a build dependency, missing libaio in DEPENDS or PACKAGECONFIG? [build-deps]
>> WARNING: samba-4.4.2-r0 do_package_qa: QA Issue: samba rdepends on lttng-ust, but it isn't a build dependency, missing lttng-ust in DEPENDS or PACKAGECONFIG? [build-deps]
>>
> 
> We used to have PACKAGECONFIG for aio, maybe it's worth trying to fix it
> instead of adding libaio directly to DEPENDS?

correct. that option is no longer available. Removed in 4.4.0



> 
> Also there is still:
> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?

I think Joe is looking into this. He has some fixes not yet published.
> 
> and also new:
> WARN: samba: samba rdepends on libarchive, but it isn't a build dependency?

that is new to me too. Not sure if Joe has that addressed. I can resend
patch to deal with this.

thanks,
Armin


> 
> 
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
>> index 9358ca5..8ba2aeb 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
>> @@ -27,7 +27,7 @@ inherit systemd waf-samba cpan-base perlnative
>>  # remove default added RDEPENDS on perl
>>  RDEPENDS_${PN}_remove = "perl"
>>  
>> -DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 ctdb libbsd"
>> +DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 ctdb libbsd libaio"
>>  
>>  SYSVINITTYPE_linuxstdbase = "lsb"
>>  SYSVINITTYPE = "sysv"
>> @@ -54,6 +54,7 @@ PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
>>  PACKAGECONFIG[dmapi] = "--with-dmapi,--without-dmapi,dmapi"
>>  PACKAGECONFIG[zeroconf] = "--enable-avahi,--disable-avahi,avahi"
>>  PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
>> +PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
>>  
>>  SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
>>  SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
>> -- 
>> 2.3.5
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 

