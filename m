Return-Path: <prvs=919dac7a6=Richard.Leitner@skidata.com>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Apr 2016 14:09:13 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 2959E76DE1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 14:09:13 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DOAQDMFSJX/0oKEKxehQ63YIIPAQ2BdoYPAoFfFAEBAQEBAQGBAQuEQQEBAQMBIw8BRRELDQsCAgUWCwICCQMCAQIBNRAGDQgCF4gHsiORFQEBCCB8hSWES4c9glYFmBCBVZV8F4VAjzAeAQGCeIE3h1N/AQEB
X-IPAS-Result: A2DOAQDMFSJX/0oKEKxehQ63YIIPAQ2BdoYPAoFfFAEBAQEBAQGBAQuEQQEBAQMBIw8BRRELDQsCAgUWCwICCQMCAQIBNRAGDQgCF4gHsiORFQEBCCB8hSWES4c9glYFmBCBVZV8F4VAjzAeAQGCeIE3h1N/AQEB
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1461846639-9563-1-git-send-email-richard.leitner@skidata.com>
	<1461847944.3302.20.camel@linux.intel.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <57221751.8030803@skidata.com>
Date: Thu, 28 Apr 2016 15:59:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1461847944.3302.20.camel@linux.intel.com>
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Subject: Re: [meta-networking][PATCH][jethro] samba: fix smbd and nmbd paths in sysv initscript
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
X-List-Received-Date: Thu, 28 Apr 2016 14:09:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 04/28/2016 02:52 PM, Joshua G Lock wrote:
> On Thu, 2016-04-28 at 14:30 +0200, Richard Leitner wrote:
>> For the jethro branch.
> 
> Any idea whether this change is required in the master branch?

Yes. The Samba 4.4.2 recipe is also using the script from
packaging/LSB/samba.sh, which is the same as in 4.1.12.

> 
>> The sysv initscript provided by samba assumes smbd and nmbd are
>> installed in /opt/samba/bin/. In our case both binaries are installed
>> to
>> /usr/sbin/ by default. Therefore fix these paths.
> 
> Rather than hard-code these in a patch, which is equally broken for
> people who don't use the default sbindir, it would make more sense to
> sed ${sbindir} into the init file in a do_install_append ().

Ok, you're right, that is definitely a better solution.
I'll prepare a patch for master and jethro.

regards,
Richard

