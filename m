Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LIrNP-0000YI-8d
	for openembedded-devel@openembedded.org; Fri, 02 Jan 2009 22:16:15 +0100
Received: by rv-out-0708.google.com with SMTP id k29so7561884rvb.0
	for <openembedded-devel@openembedded.org>;
	Fri, 02 Jan 2009 13:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=duQS/oimLCbGO9pBHwFPycoRQBmUIpul/5eBCBWUC4Q=;
	b=ugJUHPMjUyD79bfTXO17n74qH1RghL2Oc1cwHT6CzI8VvOcRR3ZSQo/ItWV+5wRzi2
	HxUkZe1lMDTUA+FBU0i9XNkiuEtBz3iBf9Y9XPALdUFV39UCYmLrE0Gg5DC+1zCB66ea
	shjTTFOEsbsulOk3nO7rR4camsbxggFbx03XE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=wSXHdz34pHXt7oXvI6CzUNzGZwBH2MjazZ+cJjLNDzJ5mIQ90JQFDph+HtR2n25bhq
	wGuNdlDB3x4Z01aEhXoHsqVDa954AIHiRMBsnFs6Nk0UC8w8pJzBXyruvtGEgS/H+O3i
	dW5oJ/i8QwwKLUmsd8vutAjvoT/AILVkEWwsA=
Received: by 10.140.132.4 with SMTP id f4mr6564614rvd.211.1230930630599;
	Fri, 02 Jan 2009 13:10:30 -0800 (PST)
Received: by 10.141.96.3 with HTTP; Fri, 2 Jan 2009 13:10:30 -0800 (PST)
Message-ID: <565965130901021310k674ea3f7x31e3938046687919@mail.gmail.com>
Date: Sat, 3 Jan 2009 05:10:30 +0800
From: "Tick Chen" <ticktock35@gmail.com>
To: opkg-devel@googlegroups.com
In-Reply-To: <495E5CB9.9050600@dls.net>
MIME-Version: 1.0
References: <1230617755.15416.11.camel@linux-yrgm.site>
	<565965130812300016v5dd07382j232434c91017dac4@mail.gmail.com>
	<495E5CB9.9050600@dls.net>
Cc: openembedded-devel@openembedded.org
Subject: =?UTF-8?B?UmU6IFtvcGtnLWRldmVsXSBSZTogb3BrZy9vcGtnLW5hdGl2ZV9zdm4uYmI6ICLvu79zdm4gY28gLXIgMTk0IGh0dHA6Ly9zdm4ub3Blbm1va28ub3JnL3RydW5rL3NyYy90YXJnZXQvL29wa2dAMTk0IiBmYWlscyE=?=
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
X-List-Received-Date: Fri, 02 Jan 2009 21:16:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Mwester,
  (sending to OE list)
  The old R4870 maps to R180 in new repository
R4838 maps to  R160.
Thanks for reporting issue, I will look into this.

Tick

2009/1/3 Mike (mwester) <mwester@dls.net>:
>
> Tick Chen wrote:
>> hi Ulf,
>>   Would you like to check your opkg.inc
>> It should point to svn://opkg.googlecode.com/svn;module=trunk;proto=http
>
> This change has caused quite a bit of disruption -- and at this moment,
> opkg is broken and there is no way to find a working version.
>
> The last "stable" version (as specified in the sane srcrevs file) was
> 4838.  I had tested (successfully) with 4870.
>
> If all the history was moved along in the move to the new upstream repo
> at googlecode, there is no tagging or even a README that would map any
> of the old (significant) version numbers to the new ones.
>
> The result is that I have no choice but to revert to the old repository
> and the known-good version numbers there in order to get opkg working
> correctly again -- even though it may very well be that the same sources
> are in the new repo, and that (if someone had provided tags or some
> mapping file) selecting a SRCREV would suffice to work around this
> instability. :(
>
> If someone can provide a mapping of either of the two SRCREVs listed
> above (4838 or 4870) to the new repo, then we can avoid having to revert
> that last opkg commit.
>
> Mike (mwester)
>
>
> BTW, the bug right now is displayed in the example below -- the code
> erroneously attempts to update the status file twice.  This has been
> reported.
>
> root@machine:~# opkg install tzdata
> Installing tzdata (2007k-r3.01) to root...
> Downloading
> http://xyz.thing.com/feeds/myfeed/tzdata_2007k-r3.01_armv5teb.ipk
> Configuring tzdata
> file_move: ERROR: failed to rename //usr/lib/opkg/status.tmp to
> //usr/lib/opkg/status: No such file or directory
> root@machine:~#
>
>
> --~--~---------~--~----~------------~-------~--~----~
> You received this message because you are subscribed to the Google Groups "opkg-devel" group.
> To post to this group, send email to opkg-devel@googlegroups.com
> To unsubscribe from this group, send email to opkg-devel+unsubscribe@googlegroups.com
> For more options, visit this group at http://groups.google.com/group/opkg-devel?hl=en
> -~----------~----~----~----~------~----~------~--~---
>
>


