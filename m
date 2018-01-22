Return-Path: <cshored@thecshore.com>
Received: from smtp113.iad3a.emailsrvr.com (smtp113.iad3a.emailsrvr.com
	[173.203.187.113])
	by mail.openembedded.org (Postfix) with ESMTP id B628F71A32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 07:17:49 +0000 (UTC)
Received: from smtp23.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
	by smtp23.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	D508C25232 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 02:17:50 -0500 (EST)
X-Auth-ID: highvolume@thecshore.com
Received: by smtp23.relay.iad3a.emailsrvr.com (Authenticated sender:
	highvolume-AT-thecshore.com) with ESMTPSA id AB94B25234
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 02:17:50 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thecshore.com;
	s=20170504; t=1516605470;
	bh=620yhlNAJbUn18ezzp/UpklzO5BWpjF8gfKdaFfB6HI=;
	h=From:Subject:To:Date:From;
	b=pdOo/SXvfmeZkftTodLrufyKny78sRql3PbRZucu/G3VhQm5iRvepvwQwYRqvfzL8
	6Wh4ypNNnKXL/PHf8tx+tPo5In/STFR0AAjX9Uetz2WQMXdi/ApsjfsbGCh6VE80C5
	s+Ac7dFlVTjaJJJNzmdoCEgNTCscPcnMOdPEHHV4=
X-Sender-Id: highvolume@thecshore.com
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Mon, 22 Jan 2018 02:17:50 -0500
From: "Daniel F. Dickinson" <cshored@thecshore.com>
To: openembedded-devel@lists.openembedded.org
References: <35308e99-f447-3e17-f652-be4f981c19fa@thecshore.com>
	<CAMKF1spvbf1D8v_1j1O5TjMD8+aSdi40+sZW7+vALQ4PUcNQdw@mail.gmail.com>
	<1f226dab-70ca-1ccb-0655-3612434fd89d@thecshore.com>
Message-ID: <c3fb06c9-b801-27e8-3091-ca0776589c49@thecshore.com>
Date: Mon, 22 Jan 2018 02:17:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1f226dab-70ca-1ccb-0655-3612434fd89d@thecshore.com>
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
X-List-Received-Date: Mon, 22 Jan 2018 07:17:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 22/01/18 12:36 AM, Daniel F. Dickinson wrote:
[snip]
>> Probably weakly define a global openwrt version e.g. OPENWRT_VERSION
>> in layer.conf
>> have two versions of recipes one for master and another one for
>> release. OPENWRT_VERSION
>> then can be overridden in local.conf if someone does not want to use
>> release version.
>> defining PREFERRED_VERSION for every recipe in layer.conf in 
>> meta-openwrt.
>>
[snip]
> Are there some examples of this kind of thing I could look at?  I'm not 
> terribly familiar with OpenEmbedded yet (enough to do some work, but 
> still lots to learn).

Actually I think I should be okay, I found 
https://www.openembedded.org/wiki/Versioning_Policy which cleared up 
some of what you said (I didn't understand why two versions).  Also you 
sentence was a bit mangled, but I guess you mean set PREFERRED_VERSION 
to OPENWRT_VERSION for the openwrt packages, and when you override 
OPENWRT_VERSION you automatically get e.g master for the full set of 
openwrt packages by default.

Regards,

Daniel

-- 
https://www.thecshore.com

