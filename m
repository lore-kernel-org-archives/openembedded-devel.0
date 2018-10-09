Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 1A8EF79830
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 05:08:15 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 9D1781C001F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 18:08:16 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
References: <20181009045520.32013-1-douglas.royds@taitradio.com>
	<61910e8d-fdb7-1cc8-8b25-f60a4e120548@taitradio.com>
Message-ID: <45739d8a-aa30-027e-adda-43726f106399@taitradio.com>
Date: Tue, 9 Oct 2018 18:08:16 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <61910e8d-fdb7-1cc8-8b25-f60a4e120548@taitradio.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] openldap: Reproducibility: Remove user, hostname, pwd from version string
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
X-List-Received-Date: Tue, 09 Oct 2018 05:08:16 -0000
Content-Language: en-GB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Debian have set this string to their own Debian-specific value:

    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=833179

    WHOWHERE="$(dpkg-vendor --query vendor) package version
    $(dpkg-parsechangelog -SVersion)"


