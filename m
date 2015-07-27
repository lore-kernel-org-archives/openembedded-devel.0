Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 36EE2762F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:55:44 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so57119437pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=8PnOLoP1eOAvWeXPEB60+u1Rzsnc9fZjC0aW3GVZ3GE=;
	b=0j9gMbL8J850mY2eLCWi0+Bs8tBwhpSFCOMmL6y9VJYE4LnqQBBVAgTlVRNGt9UEJk
	v4aZzAsQdjSB+OSgI6EMH5AA9ebvJHEjKFkCv33EXyYwxfHMqUXVGaqfipPVV9Oh0ZN/
	6gVYwhubl7VwxC0ATlZIKU55yFYN9xDC8pn3Fs0jfLQG4Afb1tmsQn908wFjOjh1BrNW
	DOXfW0mhlg935AS8Lk1uU4vrkwUY8bQ5pz7LkGSrvR3ZrQad7Z+/pZrmbOWlD7rpTwq1
	/aBDu9e3z1sRawK4v7yFxbHHJ8Z1BjsmI1jZkobVE7cchMzjGWyPJQg2s1YnQJ8ricfT
	Mv+A==
X-Received: by 10.70.34.207 with SMTP id b15mr71859300pdj.151.1438026944598;
	Mon, 27 Jul 2015 12:55:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:d937:fff9:4a46:5a09?
	([2601:202:4000:1239:d937:fff9:4a46:5a09])
	by smtp.googlemail.com with ESMTPSA id
	to5sm31154642pac.33.2015.07.27.12.55.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 12:55:43 -0700 (PDT)
Message-ID: <55B68CB2.2030605@gmail.com>
Date: Mon, 27 Jul 2015 12:55:30 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1437454485.git.akuster808@gmail.com>
	<20150727161655.GC307@jama>
In-Reply-To: <20150727161655.GC307@jama>
Cc: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/5] meta-oe Dizzy-next
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
X-List-Received-Date: Mon, 27 Jul 2015 19:55:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/27/2015 09:16 AM, Martin Jansa wrote:
> On Mon, Jul 20, 2015 at 09:56:35PM -0700, Armin Kuster wrote:
>> please consider these patches for meta-openembedded dizzy-next
>>
>> The following changes since commit 5b6f39ce325d490fc382d5d59c5b8b9d5fa38b38:
>>
>>    gsoap: fold .inc and -native into one recipe (2015-04-29 19:24:09 +0200)
>>
>> are available in the git repository at:
>>
>>    git://github.com/akuster/meta-openembedded akuster/dizzy-next
>>    https://github.com/akuster/meta-openembedded/tree/akuster/dizz-next
>
> Merged to dizzy-next.
>
> For some reason "y" is missing in your https github link, are you
> generating the cover manually?
>

That is weird. I used the scripts Poky provides. Its possible I deleted 
it when editing the cover letter?

thanks,
Armin
>> Hugo Vasconcelos Saldanha (1):
>>    libssh2: fix CVE-2015-1782
>>
>> Roy Li (2):
>>    mariadb: Security Advisory -CVE-2015-2305
>>    ipsec-tools: Security Advisory - CVE-2015-4047
>>
>> Stefan Agner (1):
>>    ptpd: disable libpcap detection via pcap-config
>>
>> Tudor Florea (1):
>>    fuse: fix for CVE-2015-3202 Privilege Escalation
>>
>>   ...fix_exec_environment_for_mount_and_umount.patch |  63 +++++++++++
>>   .../recipes-support/fuse/fuse_2.9.3.bb             |   1 +
>>   .../recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb         |   4 +-
>>   .../ipsec-tools/fix-CVE-2015-4047.patch            |  36 +++++++
>>   .../ipsec-tools/ipsec-tools_0.8.2.bb               |   1 +
>>   .../libssh2/libssh2-1.4.3/CVE-2015-1782.patch      | 115 +++++++++++++++++++++
>>   meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb   |   4 +-
>>   .../mysql/mariadb/fix-CVE-2015-2305.patch          |  43 ++++++++
>>   meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |   1 +
>>   9 files changed, 265 insertions(+), 3 deletions(-)
>>   create mode 100644 meta-filesystems/recipes-support/fuse/files/001-fix_exec_environment_for_mount_and_umount.patch
>>   create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/fix-CVE-2015-4047.patch
>>   create mode 100644 meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-2015-1782.patch
>>   create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch
>>
>> --
>> 1.9.1
>>
>

