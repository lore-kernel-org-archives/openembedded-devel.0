Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 47B1C73EFD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:58:23 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so117867800pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=hcnrUav9pmB6KLXHMtZZun/ebz6FCKFMV0rlpQpEE/Y=;
	b=m5p3P3jVHWMrpaZvPVUooHpbaPpD+Q2atHocQlUkxWX8SnnWU14f5SfB5ZStTUTNoz
	aq8onZJQMgPbpSBH815KT/rnzdNK46HYwzGCOrinOPFvn5rqhwHZamYKZDgsJhdL37X4
	oZWS2mIPeLyewW9GDG1H8TKth4GVDnle/DT4M1EtPRbjSwTxy0n3a+RCz0/unu72Vb4p
	k0K4W8aGiaMB9I3QnVgKpowKh4ZXXGo8WIZP682IH+VpQ2dq1PF4iDXaAGzyaDMSTr8V
	ci+mPoSPAlpv3sV11yG2k/bQd53oLIHc8OQwqn/ePD+//F33X3+b8cUROnHjThvEoaK8
	KSjQ==
X-Received: by 10.66.249.101 with SMTP id yt5mr21881361pac.116.1431374305240; 
	Mon, 11 May 2015 12:58:25 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:d9ea:b13c:f1c:2b5d?
	([2601:c:a700:3ba7:d9ea:b13c:f1c:2b5d])
	by mx.google.com with ESMTPSA id
	qm2sm13921713pdb.57.2015.05.11.12.58.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 12:58:24 -0700 (PDT)
Message-ID: <555109D8.2010200@gmail.com>
Date: Mon, 11 May 2015 12:58:16 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>	<20150511090952.GF2400@jama>	<CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>	<20150511190027.GK2400@jama>	<CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
	<CAMKF1sr2r0mH+Oxp9K+nuBa4vrwYQn4ib_M2--AHgLAZidt1fQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr2r0mH+Oxp9K+nuBa4vrwYQn4ib_M2--AHgLAZidt1fQ@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 19:58:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2015 12:46 PM, Khem Raj wrote:
> On Mon, May 11, 2015 at 12:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, May 11, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> RDEPENDS adds dependency only between do_package tasks for build time
>>> dependency you need do_configure depending on do_populate_sysroot
>>
>> its do_build which will depend on do_package_write task in case of RDEPENDS
>> and do_package_write task will then recurse further to build it.
>
> backtracking on warning
>
> WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a
> build dependency? [build-deps]

for me the warning went away with the current change but I guess I 
didn't poke it enough.
>
> its confusing to me. It says 'rdepends' but then expects it in
> build-dependency and not build-rdep or somesuch


>
> but lets say it depends on buildtime then I agree adding it to third
> place is needed and may be adding to 4th place too
> if shlib is not detecting it.
>

I will change it to both places.

thanks for the feedback.

- armin

