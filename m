Return-Path: <jan.kiszka@siemens.com>
X-Greylist: delayed 516 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 May 2017 05:43:16 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB606FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 05:43:16 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v4A5Ybji021964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 07:34:37 +0200
Received: from md1f2u6c.ww002.siemens.net ([146.254.78.60])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v4A5YaOw024095
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 07:34:36 +0200
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e9ec2489-e51f-222b-a4e0-2f537eff1e7d@siemens.com>
Date: Wed, 10 May 2017 07:34:36 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Subject: meta-java: Building openjre-8 on a non-gcc-6 host
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
X-List-Received-Date: Wed, 10 May 2017 05:43:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

seems like the current cross rules for openjre-8 at least break if the
host compiler < gcc-6: -fno-lifetime-dse gets injected based on the
cross compiler version, which is 6, but is also used for the few native
pieces of that build.

Any suggestions how to fix that properly? I had to temporarily redirect
my default gcc from 4.8 to gcc-6.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

