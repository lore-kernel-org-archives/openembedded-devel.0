Return-Path: <cshored@thecshore.com>
Received: from smtp97.ord1c.emailsrvr.com (smtp97.ord1c.emailsrvr.com
	[108.166.43.97])
	by mail.openembedded.org (Postfix) with ESMTP id E0AA578792
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 05:36:30 +0000 (UTC)
Received: from smtp5.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
	by smtp5.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id
	03A074015A for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 00:36:32 -0500 (EST)
Received: from smtp97.ord1d.emailsrvr.com (relay.ord1c.rsapps.net
	[172.28.255.120])
	by smtp5.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTPS id
	F2C1A40116 for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 00:36:31 -0500 (EST)
Received: from smtp21.relay.ord1d.emailsrvr.com (localhost [127.0.0.1])
	by smtp21.relay.ord1d.emailsrvr.com (SMTP Server) with ESMTP id
	01C3360087; Mon, 22 Jan 2018 00:36:31 -0500 (EST)
X-Auth-ID: highvolume@thecshore.com
Received: by smtp21.relay.ord1d.emailsrvr.com (Authenticated sender:
	highvolume-AT-thecshore.com) with ESMTPSA id A5B3F60065; 
	Mon, 22 Jan 2018 00:36:30 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thecshore.com;
	s=20170504; t=1516599390;
	bh=SG45SRJDblzb3KJHtfOrMgOHcKrYt9BzGUZ8LK/OFW4=;
	h=Subject:To:From:Date:From;
	b=pclDujqz8H/Dz4dthwTt6RPTzX8vRi7ITH8HzpKEW2zUuTE7iLrxBAs4auelH+pxp
	ttKlFGxdY/k106NCv1NA98zmCdtGpar2OgOQ1kn1FrMHzdM+hqwgmfRM1EJVcKbZiN
	GU1TBYd5uWhAnzY/HRjLKJgiYIJs7TRvDASOX+kg=
X-Sender-Id: highvolume@thecshore.com
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Mon, 22 Jan 2018 00:36:30 -0500
To: Khem Raj <raj.khem@gmail.com>
References: <35308e99-f447-3e17-f652-be4f981c19fa@thecshore.com>
	<CAMKF1spvbf1D8v_1j1O5TjMD8+aSdi40+sZW7+vALQ4PUcNQdw@mail.gmail.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <1f226dab-70ca-1ccb-0655-3612434fd89d@thecshore.com>
Date: Mon, 22 Jan 2018 00:36:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1spvbf1D8v_1j1O5TjMD8+aSdi40+sZW7+vALQ4PUcNQdw@mail.gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt] PV for git versions for 17.01.4 upstream release, git for master?
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
X-List-Received-Date: Mon, 22 Jan 2018 05:36:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 21/01/18 11:53 PM, Khem Raj wrote:
> On Sun, Jan 21, 2018 at 6:06 PM, Daniel F. Dickinson
> <cshored@thecshore.com> wrote:
>> Hi,
>>
>> Wondering thoughts on using a package version with the git revisions of
>> openwrt recipes that are in current stable (17.01.4) and using _git version
>> for tracking upstream master?  Also in that case would it be necessary to
>> use PREFERRED_VERSION for in e.g. openwrt.bbclass, or it a versioned recipe
>> preferred to a git one, unless overridden?
>>
> 
> Probably weakly define a global openwrt version e.g. OPENWRT_VERSION
> in layer.conf
> have two versions of recipes one for master and another one for
> release. OPENWRT_VERSION
> then can be overridden in local.conf if someone does not want to use
> release version.
> defining PREFERRED_VERSION for every recipe in layer.conf in meta-openwrt.
> 
>> Openwrt doesn't cut tarball releases of the sources that I am aware of, and
>> only some of the code is on github; there's a lot at git.openwrt.org.
>>
>> (Oh and for those not in the loop, Openwrt and LEDE have re-merged; for
>> those really not in the loop Openwrt was forked into LEDE project for
>> a while).
>> --
>> https://www.thecshore.com

Are there some examples of this kind of thing I could look at?  I'm not 
terribly familiar with OpenEmbedded yet (enough to do some work, but 
still lots to learn).

Regards,

Daniel

--
https://www.thecshore.com

