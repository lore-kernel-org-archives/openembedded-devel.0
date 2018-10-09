Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id DF0A0745AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 05:06:18 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 10ABB1C001F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 18:06:18 +1300 (NZDT)
To: openembedded-devel@lists.openembedded.org
References: <20181009045520.32013-1-douglas.royds@taitradio.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <61910e8d-fdb7-1cc8-8b25-f60a4e120548@taitradio.com>
Date: Tue, 9 Oct 2018 18:06:17 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181009045520.32013-1-douglas.royds@taitradio.com>
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
X-List-Received-Date: Tue, 09 Oct 2018 05:06:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Is this a good idea? We need to replace the WHOWHERE value with 
something fixed, so I've opted for the SOURCE_DATE_EPOCH. If you're not 
trying to do a reproducible build, it won't be set, so the existing 
WHOWHERE string will apply.

I'll wait for other opinions before submitting this upstream.


On 09/10/18 17:55, Douglas Royds wrote:

> Upstream-Status: Pending
> ...
> +-WHOWHERE="$USER@`uname -n`:`pwd`"
> ++WHOWHERE="${SOURCE_DATE_EPOCH:-$USER@`uname -n`:`pwd`}"



