Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id A5A157568E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:27:45 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so19237938wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 00:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YmPs/tIDnwPcBbsv1G5EJyHS/Le+qe4pldiQFky87mo=;
	b=EM0NzGzW5iyBxWLJpKyuS6bvmw1id/VY/dvIByPKZ/SWcqiwJgjafD66Mv8feZuh4s
	xTDpKsumhIc7Qm1zZ/DR8I3n+IXHstt+YueODzrRpFSKIo93agBozl5splqgipbwSjBp
	hSVEDVXYRKQO1Zpt34MYw02suOxcQbzlU5QU6NtTaxTL6w4jocGBAzUkmGiDoMagf/Qx
	WgPxAj0M1M2Nlox4Ybq3WngU4hE83awCObnBbco+u5arxUxSjqNXXUHsj8WOlQ+E96Vi
	odQ5SVT0/wbFU5kzInwqhtZVNVUBa5nWjykzawXaWIvNsVNO4HC1tI6P3/z9T2Z7oQ6n
	Dwkw==
X-Gm-Message-State: ALoCoQnLUJLjwYmTv3nVP5tLEeoMTVHbFlpwgs5/zdKmur9pv473GwQcloLTMMq9+7gmv8kJi8uw
X-Received: by 10.180.95.10 with SMTP id dg10mr14968806wib.41.1434526066097;
	Wed, 17 Jun 2015 00:27:46 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id yz3sm5268611wjc.19.2015.06.17.00.27.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 00:27:45 -0700 (PDT)
Message-ID: <5581216F.7080503@dresearch-fe.de>
Date: Wed, 17 Jun 2015 09:27:43 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <55802EE1.6040703@dresearch-fe.de>
	<3080821.5ZItofk0yx@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3080821.5ZItofk0yx@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] multiple git repos vs. AUTOREV?
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
X-List-Received-Date: Wed, 17 Jun 2015 07:27:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 16.06.2015 16:20, Paul Eggleton wrote:
> On Tuesday 16 June 2015 16:12:49 Steffen Sledz wrote:
>> For development purposes we use this method to build always from the HEAD
>> revision of a git repository.
>> ...
>> Now we like to do the same in one recipe which uses sources from two git
>> repos.
>> ...
> 
> I believe this should work:
> 
> -------------> snip <--------------
> SRCREV_FORMAT = "foo_bar"
> SRCREV_foo = "${AUTOREV}"
> SRCREV_bar = "${AUTOREV}"
> PV = "gitr${SRCPV}"
>  
> SRC_URI = " \
> 	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
>  	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
>  "
> -------------> snap <--------------

Thanx.

Now we have a similar but little different problem definition. We like to integrate the code of an own kernel driver into the current linux-boundary recipe. Because the driver is under development we like to use the HEAD revision of this repo. My first try was this bbappend.

-------------> snip <--------------
SRCREV_FORMAT_append += "_mydriver"
SRCREV_mydriver = "${AUTOREV}"
PV_append = "gitr${SRCPV}"

SRC_URI_append = " \
	git://github.com/.../mydriver.git;protocol=https;destsuffix=git.mydriver;name=mydriver \
"

...
-------------> snap <--------------

But this leads to an error.

ERROR: ExpansionError during parsing /.../meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb: Failure expanding variable pkg_postrm_kernel-devicetree: ExpansionError: Failure expanding variable KERNEL_PRIORITY, expression was ${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 +                        int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 +                        int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])} which triggered exception ValueError: invalid literal for int() with base 10: '53gitrAUTOINC'

Without the PV_append line everything builds well but the resulting package version does not contain a part for the additional repo version. :(

Any ideas on this one?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

