Return-Path: <linus.svensson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D079678225
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 11:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D2B0B18159
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:19:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hewXfVqVoJjb
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:19:03 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 122D0183A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:19:03 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B7551E096
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:19:02 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90C471E095
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:19:02 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:19:02 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 850891B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:19:02 +0200 (CEST)
Received: from [10.94.48.2] (10.0.5.60) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 16 Jun 2017 13:19:02 +0200
To: <openembedded-devel@lists.openembedded.org>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<20170605172321.12557-2-acfoltzer@galois.com>
From: Linus Svensson <linus.svensson@axis.com>
Message-ID: <d864b1f3-4db3-79ae-b0b9-3b2baee79a81@axis.com>
Date: Fri, 16 Jun 2017 13:19:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170605172321.12557-2-acfoltzer@galois.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH 2/3] meson: fix build/host confusion for bbclass
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
X-List-Received-Date: Fri, 16 Jun 2017 11:19:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2017 07:23 PM, Adam C. Foltzer wrote:
> Meson and Bitbake use different terminology for the build and host;
> this provides the correct build machine info to Meson.
What is the difference?

As far as I understand, bitbake and meson use the same terminology. 
meson is supposed to get the build machine info from the environment, 
not the cross file.

/Linus

